<template>
  <div class="import-page">
    <!-- Header -->
    <div class="page-header">
      <div class="header-left">
        <button @click="$router.back()" class="btn-back">← Retour</button>
        <h1>Importer des clients</h1>
      </div>
      <button @click="downloadSample" class="btn-sample">⬇ Download Sample</button>
    </div>

    <!-- Sample Table -->
    <div class="card">
      <h3 class="card-title">Format du fichier CSV</h3>
      <div class="table-wrapper">
        <table class="sample-table">
          <thead>
            <tr>
              <th v-for="col in columns" :key="col.key">
                <span :class="col.required ? 'required-star' : ''">
                  {{ col.required ? '* ' : '' }}
                </span>{{ col.label }}
                <div class="col-type">Champ Client</div>
              </th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td v-for="col in columns" :key="col.key">{{ col.sample }}</td>
            </tr>
          </tbody>
        </table>
      </div>
    </div>

    <!-- Import Form -->
    <div class="card">
      <div class="form-section">
        <label class="field-label"><span class="req">*</span> Importer un fichier CSV</label>
        <div class="file-input-row">
          <label class="file-btn">
            Choisir un fichier
            <input type="file" accept=".csv" @change="onFileChange" style="display:none" />
          </label>
          <span class="file-name">{{ fileName || 'Aucun fichier choisi' }}</span>
        </div>
        <p v-if="fileError" class="field-error">{{ fileError }}</p>
      </div>

      <div class="form-section">
        <label class="field-label">Statut par défaut</label>
        <select v-model="defaultStatus" class="select-input">
          <option value="active">Actif</option>
          <option value="inactive">Inactif</option>
        </select>
      </div>

      <!-- Simulate Result -->
      <div v-if="simulateResult" class="simulate-box">
        <h4>Résultat de simulation</h4>
        <div class="simulate-stats">
          <div class="stat green">✅ {{ simulateResult.valid }} lignes valides</div>
          <div class="stat red" v-if="simulateResult.invalid > 0">❌ {{ simulateResult.invalid }} lignes invalides</div>
          <div class="stat orange" v-if="simulateResult.warnings.length > 0">⚠️ {{ simulateResult.warnings.length }} avertissements</div>
        </div>
        <ul v-if="simulateResult.warnings.length" class="warnings-list">
          <li v-for="(w, i) in simulateResult.warnings" :key="i">{{ w }}</li>
        </ul>
      </div>

      <!-- Import Result -->
      <div v-if="importResult" class="result-box" :class="importResult.success ? 'success' : 'error'">
        <div class="result-icon">{{ importResult.success ? '✅' : '❌' }}</div>
        <div>
          <strong>{{ importResult.message }}</strong>
          <ul v-if="importResult.errors && importResult.errors.length" class="error-list">
            <li v-for="(e, i) in importResult.errors.slice(0, 5)" :key="i">{{ e }}</li>
          </ul>
        </div>
      </div>

      <!-- Progress -->
      <div v-if="importing" class="progress-bar">
        <div class="progress-fill"></div>
        <span>Importation en cours...</span>
      </div>

      <!-- Actions -->
      <div class="actions-row">
        <button @click="importClients" class="btn-primary" :disabled="!selectedFile || importing">
          {{ importing ? 'Importation...' : 'Importer' }}
        </button>
        <button @click="simulate" class="btn-secondary" :disabled="!selectedFile || simulating">
          {{ simulating ? 'Simulation...' : 'Simuler l\'importation' }}
        </button>
        <button @click="reset" class="btn-reset">Réinitialiser</button>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import axios from '../../services/axios'

const columns = [
  { key: 'client_company_name', label: 'Company',          required: true,  sample: 'Acme Corp' },
  { key: 'client_phone',        label: 'Phonenumber',      required: false, sample: '+216 12 345 678' },
  { key: 'client_website',      label: 'Website',          required: false, sample: 'acme.com' },
  { key: 'client_status',       label: 'Status',           required: false, sample: 'active' },
  { key: 'client_description',  label: 'Description',      required: false, sample: 'Client VIP' },
  { key: 'client_vat',          label: 'Vat',              required: false, sample: 'TN12345' },
  { key: 'client_billing_city', label: 'City',             required: false, sample: 'Tunis' },
  { key: 'client_billing_country', label: 'Country',       required: false, sample: 'Tunisie' },
  { key: 'client_billing_zip',  label: 'Zip',              required: false, sample: '1000' },
  { key: 'client_billing_street', label: 'Street',         required: false, sample: 'Rue de la Liberté' },
]

const selectedFile   = ref<File | null>(null)
const fileName       = ref('')
const fileError      = ref('')
const defaultStatus  = ref('active')
const importing      = ref(false)
const simulating     = ref(false)
const importResult   = ref<any>(null)
const simulateResult = ref<any>(null)

const onFileChange = (e: Event) => {
  const file = (e.target as HTMLInputElement).files?.[0]
  if (!file) return
  if (!file.name.endsWith('.csv')) {
    fileError.value = 'Veuillez choisir un fichier .csv'
    return
  }
  selectedFile.value = file
  fileName.value = file.name
  fileError.value = ''
  importResult.value = null
  simulateResult.value = null
}

const buildFormData = () => {
  const fd = new FormData()
  fd.append('file', selectedFile.value!)
  fd.append('default_status', defaultStatus.value)
  return fd
}

const importClients = async () => {
  if (!selectedFile.value) return
  importing.value = true
  importResult.value = null
  try {
    const res = await axios.post('/clients/import', buildFormData(), {
      headers: { 'Content-Type': 'multipart/form-data' }
    })
    importResult.value = { success: true, message: res.data.message, errors: res.data.errors }
  } catch (e: any) {
    importResult.value = { success: false, message: e?.response?.data?.message || 'Erreur lors de l\'importation' }
  } finally {
    importing.value = false
  }
}

const simulate = async () => {
  if (!selectedFile.value) return
  simulating.value = true
  simulateResult.value = null
  try {
    // Parse CSV client-side pour simulation rapide
    const text = await selectedFile.value.text()
    const lines = text.trim().split('\n').filter(l => l.trim())
    const header = lines[0].split(',').map(h => h.trim())
    const dataLines = lines.slice(1)

    let valid = 0, invalid = 0
    const warnings: string[] = []

    dataLines.forEach((line, i) => {
      const cols = line.split(',')
      if (cols.length !== header.length) {
        invalid++
        warnings.push(`Ligne ${i + 2}: nombre de colonnes incorrect (${cols.length} au lieu de ${header.length})`)
        return
      }
      const row: any = {}
      header.forEach((h, j) => row[h] = cols[j]?.trim())
      if (!row['client_company_name']) {
        invalid++
        warnings.push(`Ligne ${i + 2}: 'client_company_name' est obligatoire`)
      } else {
        valid++
        if (!row['client_status']) warnings.push(`Ligne ${i + 2}: status manquant, sera défini à '${defaultStatus.value}'`)
      }
    })

    simulateResult.value = { valid, invalid, warnings }
  } catch (e) {
    simulateResult.value = { valid: 0, invalid: 0, warnings: ['Impossible de lire le fichier'] }
  } finally {
    simulating.value = false
  }
}

const reset = () => {
  selectedFile.value = null
  fileName.value = ''
  fileError.value = ''
  importResult.value = null
  simulateResult.value = null
}

const downloadSample = () => {
  const header = columns.map(c => c.key).join(',')
  const sample = columns.map(c => c.sample).join(',')
  const csv = `${header}\n${sample}\n`
  const blob = new Blob([csv], { type: 'text/csv' })
  const url = URL.createObjectURL(blob)
  const a = document.createElement('a')
  a.href = url
  a.download = 'sample_clients.csv'
  a.click()
  URL.revokeObjectURL(url)
}
</script>

<style scoped>
.import-page { animation: fadeIn 0.4s; max-width: 1100px; }
.page-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 24px; }
.header-left { display: flex; align-items: center; gap: 16px; }
.header-left h1 { font-size: 22px; font-weight: 700; color: #1a1a2e; margin: 0; }
.btn-back { background: none; border: none; color: #667eea; font-size: 14px; cursor: pointer; font-weight: 600; }
.btn-back:hover { text-decoration: underline; }
.btn-sample { background: white; border: 2px solid #667eea; color: #667eea; padding: 8px 18px; border-radius: 8px; cursor: pointer; font-size: 14px; font-weight: 600; transition: all 0.2s; }
.btn-sample:hover { background: #667eea; color: white; }
.card { background: white; border-radius: 12px; box-shadow: 0 2px 12px rgba(0,0,0,0.06); padding: 24px; margin-bottom: 20px; }
.card-title { font-size: 16px; font-weight: 700; color: #333; margin: 0 0 16px; }
.table-wrapper { overflow-x: auto; border-radius: 8px; border: 1px solid #e8e8e8; }
.sample-table { width: 100%; border-collapse: collapse; min-width: 900px; }
.sample-table th { background: #f8f9fa; padding: 12px 16px; text-align: left; font-size: 13px; font-weight: 600; color: #333; border-bottom: 2px solid #e8e8e8; white-space: nowrap; }
.sample-table td { padding: 12px 16px; font-size: 13px; color: #666; border-bottom: 1px solid #f0f0f0; white-space: nowrap; }
.sample-table tr:last-child td { border-bottom: none; }
.required-star { color: #e74c3c; font-weight: 700; }
.col-type { font-size: 11px; color: #667eea; font-weight: 500; margin-top: 2px; }
.form-section { margin-bottom: 20px; }
.field-label { display: block; font-size: 14px; font-weight: 600; color: #333; margin-bottom: 8px; }
.req { color: #e74c3c; margin-right: 2px; }
.file-input-row { display: flex; align-items: center; gap: 12px; }
.file-btn { background: #f8f9fa; border: 2px solid #ddd; padding: 8px 16px; border-radius: 6px; cursor: pointer; font-size: 13px; font-weight: 600; color: #333; transition: border-color 0.2s; }
.file-btn:hover { border-color: #667eea; }
.file-name { font-size: 13px; color: #666; }
.field-error { color: #e74c3c; font-size: 12px; margin-top: 6px; }
.select-input { padding: 10px 14px; border: 2px solid #e0e0e0; border-radius: 8px; font-size: 14px; width: 220px; }
.simulate-box { background: #f8f9ff; border: 1px solid #dde3ff; border-radius: 10px; padding: 16px; margin-bottom: 20px; }
.simulate-box h4 { margin: 0 0 12px; font-size: 14px; color: #333; }
.simulate-stats { display: flex; gap: 16px; flex-wrap: wrap; margin-bottom: 10px; }
.stat { font-size: 13px; font-weight: 600; padding: 6px 12px; border-radius: 6px; }
.stat.green { background: #d4edda; color: #155724; }
.stat.red { background: #f8d7da; color: #721c24; }
.stat.orange { background: #fff3cd; color: #856404; }
.warnings-list { margin: 0; padding-left: 18px; font-size: 12px; color: #856404; }
.warnings-list li { margin-bottom: 4px; }
.result-box { display: flex; align-items: flex-start; gap: 14px; padding: 16px; border-radius: 10px; margin-bottom: 20px; }
.result-box.success { background: #d4edda; border: 1px solid #b8dfc4; }
.result-box.error { background: #f8d7da; border: 1px solid #f0b8be; }
.result-icon { font-size: 24px; }
.error-list { margin: 6px 0 0; padding-left: 18px; font-size: 12px; }
.progress-bar { background: #e8e8e8; border-radius: 6px; height: 8px; overflow: hidden; margin-bottom: 20px; position: relative; }
.progress-fill { height: 100%; width: 60%; background: linear-gradient(135deg, #667eea, #764ba2); animation: progress 1.2s ease-in-out infinite alternate; border-radius: 6px; }
.actions-row { display: flex; gap: 12px; flex-wrap: wrap; padding-top: 10px; border-top: 1px solid #f0f0f0; }
.btn-primary { background: linear-gradient(135deg, #667eea, #764ba2); color: white; padding: 10px 24px; border: none; border-radius: 8px; cursor: pointer; font-size: 14px; font-weight: 600; transition: transform 0.2s; }
.btn-primary:hover:not(:disabled) { transform: translateY(-2px); }
.btn-primary:disabled { opacity: 0.6; cursor: not-allowed; }
.btn-secondary { background: #f8f9fa; border: 2px solid #ddd; color: #333; padding: 10px 24px; border-radius: 8px; cursor: pointer; font-size: 14px; font-weight: 600; transition: all 0.2s; }
.btn-secondary:hover:not(:disabled) { border-color: #667eea; color: #667eea; }
.btn-secondary:disabled { opacity: 0.6; cursor: not-allowed; }
.btn-reset { background: none; border: none; color: #999; cursor: pointer; font-size: 14px; padding: 10px; }
.btn-reset:hover { color: #e74c3c; }
@keyframes fadeIn { from { opacity: 0; transform: translateY(10px); } to { opacity: 1; transform: translateY(0); } }
@keyframes progress { from { width: 30%; } to { width: 80%; } }
</style>