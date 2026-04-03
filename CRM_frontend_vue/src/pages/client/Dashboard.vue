<template>
  <div class="p-6">
    <h1 class="text-2xl font-bold mb-6">Dashboard Client</h1>
    
    <div class="bg-blue-500 text-white rounded-lg p-6 mb-8">
      <h2 class="text-xl">Bonjour {{ user?.name }} 👋</h2>
    </div>
    
    <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
      <div class="bg-white rounded-lg shadow p-6">
        <p class="text-gray-500">Factures</p>
        <p class="text-2xl font-bold">{{ stats.invoices?.total || 0 }}</p>
      </div>
      
      <div class="bg-white rounded-lg shadow p-6">
        <p class="text-gray-500">Tickets</p>
        <p class="text-2xl font-bold">{{ stats.tickets?.total || 0 }}</p>
      </div>
      
      <div class="bg-white rounded-lg shadow p-6">
        <p class="text-gray-500">Projets actifs</p>
        <p class="text-2xl font-bold">{{ stats.active_projects || 0 }}</p>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import { api } from '../../services/api'

const user = ref<any>(null)
const stats = ref<any>({})

onMounted(async () => {
  user.value = api.getUser()
  try {
    stats.value = await api.getDashboardStats()
  } catch (error) {
    console.error('Erreur:', error)
  }
})
</script>