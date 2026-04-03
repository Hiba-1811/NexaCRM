<template>
  <div class="page">
    <div class="page-header">
      <button @click="showModal = true" class="btn-primary">+ Nouveau Projet</button>
      <input v-model="search" placeholder="Rechercher..." class="search-input" />
    </div>
    <div v-if="loading" class="loading">Chargement...</div>
    <div v-else class="table-container">
      <table class="data-table">
        <thead><tr><th>ID</th><th>Nom</th><th>Client</th><th>Status</th><th>Deadline</th><th>Actions</th></tr></thead>
        <tbody>
          <tr v-for="p in filtered" :key="p.project_id">
            <td>#{{ p.project_id }}</td>
            <td>{{ p.project_name }}</td>
            <td>{{ p.project_clientid }}</td>
            <td><span :class="['badge', p.project_status]">{{ p.project_status }}</span></td>
            <td>{{ p.project_deadline }}</td>
            <td><button @click="del(p.project_id)" class="btn-icon">🗑️</button></td>
          </tr>
          <tr v-if="filtered.length===0"><td colspan="6" class="empty">Aucun projet</td></tr>
        </tbody>
      </table>
    </div>
    <div v-if="showModal" class="modal" @click.self="showModal=false">
      <div class="modal-content">
        <div class="modal-header"><h2>Nouveau Projet</h2><button @click="showModal=false" class="close-btn">&times;</button></div>
        <form @submit.prevent="save" class="form">
          <div class="form-group"><label>Nom *</label><input v-model="form.project_name" required /></div>
          <div class="form-group"><label>Description</label><textarea v-model="form.project_description" rows="3"></textarea></div>
          <div class="form-group"><label>Deadline</label><input type="date" v-model="form.project_deadline" /></div>
          <div class="form-group"><label>Status</label>
            <select v-model="form.project_status">
              <option value="active">Actif</option>
              <option value="completed">Terminé</option>
              <option value="on_hold">En attente</option>
            </select>
          </div>
          <div class="modal-footer">
            <button type="button" @click="showModal=false" class="btn-secondary">Annuler</button>
            <button type="submit" class="btn-primary">Enregistrer</button>
          </div>
        </form>
      </div>
    </div>
  </div>
</template>
<script setup lang="ts">
import { ref, computed, onMounted } from 'vue'
import axios from 'axios'
const items = ref([])
const search = ref('')
const loading = ref(false)
const showModal = ref(false)
const form = ref({ project_name: '', project_description: '', project_deadline: '', project_status: 'active' })
const filtered = computed(() => items.value.filter((p: any) => p.project_name?.toLowerCase().includes(search.value.toLowerCase())))
const fetch = async () => { loading.value = true; try { items.value = (await axios.get('/projects')).data } finally { loading.value = false } }
const save = async () => { await axios.post('/projects', form.value); await fetch(); showModal.value = false }
const del = async (id: number) => { if(confirm('Supprimer ?')) { await axios.delete(`/projects/${id}`); await fetch() } }
onMounted(fetch)
</script>
<style scoped>
.page { animation: fadeIn 0.5s; }
.page-header { display: flex; justify-content: space-between; align-items: center; margin-bottom: 20px; gap: 15px; }
.search-input { padding: 10px 15px; border: 2px solid #e0e0e0; border-radius: 8px; width: 280px; font-size: 14px; }
.search-input:focus { outline: none; border-color: #667eea; }
.btn-primary { background: linear-gradient(135deg, #667eea, #764ba2); color: white; padding: 10px 20px; border: none; border-radius: 8px; cursor: pointer; font-weight: 600; }
.btn-secondary { background: #6c757d; color: white; padding: 10px 20px; border: none; border-radius: 8px; cursor: pointer; }
.btn-icon { background: none; border: none; cursor: pointer; font-size: 18px; padding: 4px 8px; border-radius: 4px; }
.btn-icon:hover { background: #f0f0f0; }
.loading { text-align: center; padding: 50px; color: #667eea; }
.empty { text-align: center; padding: 30px; color: #999; }
.table-container { background: white; border-radius: 12px; overflow-x: auto; box-shadow: 0 2px 10px rgba(0,0,0,0.05); }
.data-table { width: 100%; border-collapse: collapse; }
.data-table th, .data-table td { padding: 15px; text-align: left; border-bottom: 1px solid #e0e0e0; }
.data-table th { background: #f8f9fa; font-weight: 600; color: #666; font-size: 14px; }
.data-table tr:hover { background: #f8f9fa; }
.badge { padding: 4px 12px; border-radius: 12px; font-size: 12px; font-weight: 600; }
.badge.active { background: #d4edda; color: #155724; }
.badge.completed { background: #cce5ff; color: #004085; }
.badge.on_hold { background: #fff3cd; color: #856404; }
.modal { position: fixed; top:0; left:0; right:0; bottom:0; background: rgba(0,0,0,0.5); display: flex; align-items: center; justify-content: center; z-index: 1000; }
.modal-content { background: white; border-radius: 12px; width: 90%; max-width: 500px; max-height: 90vh; overflow-y: auto; }
.modal-header { display: flex; justify-content: space-between; align-items: center; padding: 20px; border-bottom: 1px solid #e0e0e0; }
.close-btn { background: none; border: none; font-size: 28px; cursor: pointer; color: #999; }
.form { padding: 20px; }
.form-group { display: flex; flex-direction: column; gap: 8px; margin-bottom: 15px; }
.form-group label { font-weight: 600; color: #333; font-size: 14px; }
.form-group input, .form-group select, .form-group textarea { padding: 10px; border: 2px solid #e0e0e0; border-radius: 8px; font-size: 14px; }
.form-group input:focus, .form-group select:focus, .form-group textarea:focus { outline: none; border-color: #667eea; }
.modal-footer { display: flex; justify-content: flex-end; gap: 10px; padding-top: 15px; border-top: 1px solid #e0e0e0; }
@keyframes fadeIn { from { opacity: 0; } to { opacity: 1; } }
</style>
