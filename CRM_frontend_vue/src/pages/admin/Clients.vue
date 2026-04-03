<template>
  <div class="clients-page">
    <div class="page-header">
      <div class="header-actions">
        <button @click="showAddModal = true" class="btn-primary">+ Nouveau Client</button>
        <div class="search-box">
          <input type="text" v-model="searchQuery" placeholder="Rechercher un client..." />
          <span class="search-icon">🔍</span>
        </div>
      </div>
    </div>

    <div v-if="loading" class="loading">Chargement...</div>
    <div v-else-if="error" class="error-msg">{{ error }}</div>

    <div v-else class="clients-table-container">
      <table class="clients-table">
        <thead>
          <tr>
            <th>ID</th>
            <th>Entreprise</th>
            <th>Téléphone</th>
            <th>Website</th>
            <th>Status</th>
            <th>Actions</th>
          </tr>
        </thead>
        <tbody>
          <tr v-for="client in filteredClients" :key="client.client_id">
            <td>#{{ client.client_id }}</td>
            <td>
              <div class="client-info">
                <div class="client-avatar">{{ getInitials(client.client_company_name) }}</div>
                <span>{{ client.client_company_name }}</span>
              </div>
            </td>
            <td>{{ client.client_phone || '-' }}</td>
            <td>{{ client.client_website || '-' }}</td>
            <td>
              <span :class="['status-badge', client.client_status]">
                {{ client.client_status }}
              </span>
            </td>
            <td>
              <div class="action-buttons">
                <button @click="editClient(client)" class="btn-icon" title="Modifier">✏️</button>
                <button @click="deleteClient(client.client_id)" class="btn-icon" title="Supprimer">🗑️</button>
              </div>
            </td>
          </tr>
          <tr v-if="filteredClients.length === 0">
            <td colspan="6" style="text-align:center; padding:30px; color:#999">Aucun client trouvé</td>
          </tr>
        </tbody>
      </table>
    </div>

    <!-- Modal -->
    <div v-if="showAddModal" class="modal" @click.self="closeModal">
      <div class="modal-content">
        <div class="modal-header">
          <h2>{{ editingClient ? 'Modifier le Client' : 'Ajouter un Client' }}</h2>
          <button @click="closeModal" class="close-btn">&times;</button>
        </div>
        <form @submit.prevent="saveClient" class="client-form">
          <div class="form-row">
            <div class="form-group">
              <label>Nom de l'entreprise *</label>
              <input type="text" v-model="clientForm.client_company_name" required />
            </div>
            <div class="form-group">
              <label>Téléphone</label>
              <input type="tel" v-model="clientForm.client_phone" />
            </div>
          </div>
          <div class="form-row">
            <div class="form-group">
              <label>Website</label>
              <input type="text" v-model="clientForm.client_website" />
            </div>
            <div class="form-group">
              <label>Status</label>
              <select v-model="clientForm.client_status">
                <option value="active">Actif</option>
                <option value="inactive">Inactif</option>
              </select>
            </div>
          </div>
          <div class="form-row">
            <div class="form-group">
              <label>Ville</label>
              <input type="text" v-model="clientForm.client_billing_city" />
            </div>
            <div class="form-group">
              <label>Pays</label>
              <input type="text" v-model="clientForm.client_billing_country" />
            </div>
          </div>
          <div class="form-group">
            <label>Description</label>
            <textarea v-model="clientForm.client_description" rows="3"></textarea>
          </div>
          <div class="modal-footer">
            <button type="button" @click="closeModal" class="btn-secondary">Annuler</button>
            <button type="submit" class="btn-primary" :disabled="saving">
              {{ saving ? 'Enregistrement...' : 'Enregistrer' }}
            </button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import axios from 'axios'

interface Client {
  client_id: number
  client_company_name: string
  client_phone: string
  client_website: string
  client_status: string
  client_billing_city: string
  client_billing_country: string
  client_description: string
}

const clients = ref<Client[]>([])
const searchQuery = ref('')
const showAddModal = ref(false)
const editingClient = ref<Client | null>(null)
const loading = ref(false)
const saving = ref(false)
const error = ref('')

const emptyForm = {
  client_company_name: '',
  client_phone: '',
  client_website: '',
  client_status: 'active',
  client_billing_city: '',
  client_billing_country: '',
  client_description: ''
}

const clientForm = ref({ ...emptyForm })

const filteredClients = computed(() => {
  if (!searchQuery.value) return clients.value
  const q = searchQuery.value.toLowerCase()
  return clients.value.filter(c =>
    c.client_company_name?.toLowerCase().includes(q) ||
    c.client_phone?.toLowerCase().includes(q)
  )
})

const getInitials = (name: string) => {
  if (!name) return '?'
  return name.split(' ').map(n => n[0]).join('').toUpperCase().slice(0, 2)
}

const fetchClients = async () => {
  loading.value = true
  error.value = ''
  try {
    const res = await axios.get('/clients')
    clients.value = res.data
  } catch (e) {
    error.value = 'Erreur lors du chargement des clients'
  } finally {
    loading.value = false
  }
}

const saveClient = async () => {
  saving.value = true
  try {
    if (editingClient.value) {
      await axios.put(`/clients/${editingClient.value.client_id}`, clientForm.value)
    } else {
      await axios.post('/clients', clientForm.value)
    }
    await fetchClients()
    closeModal()
  } catch (e) {
    alert('Erreur lors de l\'enregistrement')
  } finally {
    saving.value = false
  }
}

const editClient = (client: Client) => {
  editingClient.value = client
  clientForm.value = {
    client_company_name: client.client_company_name,
    client_phone: client.client_phone,
    client_website: client.client_website,
    client_status: client.client_status,
    client_billing_city: client.client_billing_city,
    client_billing_country: client.client_billing_country,
    client_description: client.client_description
  }
  showAddModal.value = true
}

const deleteClient = async (id: number) => {
  if (!confirm('Supprimer ce client ?')) return
  try {
    await axios.delete(`/clients/${id}`)
    await fetchClients()
  } catch (e) {
    alert('Erreur lors de la suppression')
  }
}

const closeModal = () => {
  showAddModal.value = false
  editingClient.value = null
  clientForm.value = { ...emptyForm }
}

onMounted(fetchClients)
</script>

<style scoped>
.clients-page { animation: fadeIn 0.5s; }
.page-header { margin-bottom: 30px; }
.header-actions { display: flex; justify-content: space-between; align-items: center; gap: 20px; }
.btn-primary { background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; padding: 10px 20px; border: none; border-radius: 8px; cursor: pointer; font-size: 14px; font-weight: 600; transition: transform 0.2s; }
.btn-primary:hover:not(:disabled) { transform: translateY(-2px); }
.btn-primary:disabled { opacity: 0.6; cursor: not-allowed; }
.btn-secondary { background: #6c757d; color: white; padding: 10px 20px; border: none; border-radius: 8px; cursor: pointer; font-size: 14px; font-weight: 600; }
.search-box { position: relative; }
.search-box input { padding: 10px 40px 10px 15px; border: 2px solid #e0e0e0; border-radius: 8px; width: 300px; font-size: 14px; transition: border-color 0.3s; }
.search-box input:focus { outline: none; border-color: #667eea; }
.search-icon { position: absolute; right: 12px; top: 50%; transform: translateY(-50%); }
.loading { text-align: center; padding: 50px; color: #667eea; font-size: 18px; }
.error-msg { text-align: center; padding: 50px; color: #e74c3c; }
.clients-table-container { background: white; border-radius: 12px; overflow-x: auto; box-shadow: 0 2px 10px rgba(0,0,0,0.05); }
.clients-table { width: 100%; border-collapse: collapse; }
.clients-table th, .clients-table td { padding: 15px; text-align: left; border-bottom: 1px solid #e0e0e0; }
.clients-table th { background: #f8f9fa; font-weight: 600; color: #666; font-size: 14px; }
.clients-table tr:hover { background: #f8f9fa; }
.client-info { display: flex; align-items: center; gap: 10px; }
.client-avatar { width: 32px; height: 32px; background: linear-gradient(135deg, #667eea 0%, #764ba2 100%); color: white; border-radius: 50%; display: flex; align-items: center; justify-content: center; font-size: 12px; font-weight: bold; }
.status-badge { padding: 4px 12px; border-radius: 12px; font-size: 12px; font-weight: 600; }
.status-badge.active { background: #d4edda; color: #155724; }
.status-badge.inactive { background: #f8d7da; color: #721c24; }
.action-buttons { display: flex; gap: 8px; }
.btn-icon { background: none; border: none; cursor: pointer; font-size: 18px; padding: 4px 8px; border-radius: 4px; transition: background 0.2s; }
.btn-icon:hover { background: #f0f0f0; }
.modal { position: fixed; top: 0; left: 0; right: 0; bottom: 0; background: rgba(0,0,0,0.5); display: flex; align-items: center; justify-content: center; z-index: 1000; }
.modal-content { background: white; border-radius: 12px; width: 90%; max-width: 600px; max-height: 90vh; overflow-y: auto; }
.modal-header { display: flex; justify-content: space-between; align-items: center; padding: 20px; border-bottom: 1px solid #e0e0e0; }
.modal-header h2 { font-size: 20px; color: #333; }
.close-btn { background: none; border: none; font-size: 28px; cursor: pointer; color: #999; }
.close-btn:hover { color: #333; }
.client-form { padding: 20px; }
.form-row { display: grid; grid-template-columns: 1fr 1fr; gap: 20px; margin-bottom: 20px; }
.form-group { display: flex; flex-direction: column; gap: 8px; margin-bottom: 15px; }
.form-group label { font-weight: 600; color: #333; font-size: 14px; }
.form-group input, .form-group select, .form-group textarea { padding: 10px; border: 2px solid #e0e0e0; border-radius: 8px; font-size: 14px; transition: border-color 0.3s; }
.form-group input:focus, .form-group select:focus, .form-group textarea:focus { outline: none; border-color: #667eea; }
.modal-footer { display: flex; justify-content: flex-end; gap: 10px; margin-top: 20px; padding-top: 20px; border-top: 1px solid #e0e0e0; }
@keyframes fadeIn { from { opacity: 0; } to { opacity: 1; } }
</style>
