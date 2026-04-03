<template>
  <div class="p-6">
    <h1 class="text-2xl font-bold mb-6">Dashboard Staff</h1>
    
    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
      <div class="bg-white rounded-lg shadow p-6">
        <p class="text-gray-500">Mes Projets</p>
        <p class="text-2xl font-bold">{{ stats.my_projects || 0 }}</p>
      </div>
      
      <div class="bg-white rounded-lg shadow p-6">
        <p class="text-gray-500">Tâches en cours</p>
        <p class="text-2xl font-bold">{{ stats.pending_tasks || 0 }}</p>
      </div>
      
      <div class="bg-white rounded-lg shadow p-6">
        <p class="text-gray-500">Tickets</p>
        <p class="text-2xl font-bold">{{ stats.my_tickets || 0 }}</p>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { api } from '../../services/api'

const stats = ref<any>({})

onMounted(async () => {
  try {
    stats.value = await api.getDashboardStats()
  } catch (error) {
    console.error('Erreur:', error)
  }
})
</script>