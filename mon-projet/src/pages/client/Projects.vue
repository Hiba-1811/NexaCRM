<template>
  <div class="projects-page">
    <h2>Mes Projets</h2>
    <div v-if="loading" class="loading">Chargement...</div>
    <div v-else-if="projects.length === 0" class="empty">Aucun projet trouvé</div>
    <div v-else class="projects-grid">
      <div v-for="project in projects" :key="project.id" class="project-card">
        <h3>{{ project.project_name }}</h3>
        <p>{{ project.project_description }}</p>
        <span :class="['status', project.project_status]">{{ project.project_status }}</span>
      </div>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'
import axios from 'axios'

const projects = ref([])
const loading = ref(false)

onMounted(async () => {
  loading.value = true
  try {
    const res = await axios.get('/projects')
    projects.value = res.data
  } catch (e) {
    console.error(e)
  } finally {
    loading.value = false
  }
})
</script>

<style scoped>
.projects-page { animation: fadeIn 0.5s; }
h2 { margin-bottom: 20px; color: #333; }
.loading { text-align: center; padding: 50px; color: #667eea; }
.empty { text-align: center; padding: 50px; color: #999; }
.projects-grid { display: grid; grid-template-columns: repeat(auto-fill, minmax(280px, 1fr)); gap: 20px; }
.project-card { background: white; border-radius: 12px; padding: 20px; box-shadow: 0 2px 10px rgba(0,0,0,0.05); }
.project-card h3 { margin-bottom: 10px; color: #333; }
.project-card p { color: #666; font-size: 14px; margin-bottom: 15px; }
.status { padding: 4px 12px; border-radius: 12px; font-size: 12px; font-weight: 600; }
.status.active { background: #d4edda; color: #155724; }
.status.completed { background: #cce5ff; color: #004085; }
@keyframes fadeIn { from { opacity: 0; } to { opacity: 1; } }
</style>
