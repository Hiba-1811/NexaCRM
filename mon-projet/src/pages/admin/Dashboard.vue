<template>
  <div class="dashboard">
    <div class="stats-grid">
      <div class="stat-card">
        <div class="stat-icon">👥</div>
        <div class="stat-info">
          <h3>Total Clients</h3>
          <p class="stat-number">{{ stats.totalClients }}</p>
          <span class="trend up">+12%</span>
        </div>
      </div>
      
      <div class="stat-card">
        <div class="stat-icon">💰</div>
        <div class="stat-info">
          <h3>Revenus</h3>
          <p class="stat-number">${{ formatNumber(stats.revenue) }}</p>
          <span class="trend up">+23%</span>
        </div>
      </div>
      
      <div class="stat-card">
        <div class="stat-icon">📁</div>
        <div class="stat-info">
          <h3>Projets Actifs</h3>
          <p class="stat-number">{{ stats.activeProjects }}</p>
          <span class="trend down">-5%</span>
        </div>
      </div>
      
      <div class="stat-card">
        <div class="stat-icon">✅</div>
        <div class="stat-info">
          <h3>Tâches Complétées</h3>
          <p class="stat-number">{{ stats.completedTasks }}</p>
          <span class="trend up">+8%</span>
        </div>
      </div>
    </div>
    
    <div class="charts-row">
      <div class="chart-card">
        <h3>Activité Récente</h3>
        <div class="activity-list">
          <div v-for="activity in recentActivities" :key="activity.id" class="activity-item">
            <div class="activity-icon">{{ activity.icon }}</div>
            <div class="activity-details">
              <p class="activity-text">{{ activity.text }}</p>
              <span class="activity-time">{{ formatTime(activity.time) }}</span>
            </div>
          </div>
        </div>
      </div>
      
      <div class="chart-card">
        <h3>Projets par Statut</h3>
        <div class="status-list">
          <div v-for="status in projectStatus" :key="status.name" class="status-item">
            <div class="status-header">
              <span>{{ status.name }}</span>
              <span>{{ status.count }}</span>
            </div>
            <div class="progress-bar">
              <div class="progress-fill" :style="{ width: status.percentage + '%', background: status.color }"></div>
            </div>
          </div>
        </div>
      </div>
    </div>
    
    <div class="recent-table">
      <h3>Derniers Clients</h3>
      <table class="data-table">
        <thead>
          <tr><th>Nom</th><th>Email</th><th>Projets</th><th>Status</th></tr>
        </thead>
        <tbody>
          <tr v-for="client in recentClients" :key="client.id">
            <td>{{ client.name }}</td>
            <td>{{ client.email }}</td>
            <td>{{ client.projectsCount }}</td>
            <td><span :class="'status-badge ' + client.status">{{ client.status }}</span></td>
          </tr>
        </tbody>
      </table>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref, onMounted } from 'vue'

const stats = ref({
  totalClients: 1247,
  revenue: 284500,
  activeProjects: 43,
  completedTasks: 892
})

const recentActivities = ref([
  { id: 1, icon: '👤', text: 'Nouveau client inscrit: Jean Dupont', time: new Date(Date.now() - 1000 * 60 * 5) },
  { id: 2, icon: '📁', text: 'Projet "Site Web" complété', time: new Date(Date.now() - 1000 * 60 * 30) },
  { id: 3, icon: '💰', text: 'Nouvelle facture #INV-2024-001', time: new Date(Date.now() - 1000 * 60 * 60) },
  { id: 4, icon: '✅', text: 'Tâche "Review code" terminée', time: new Date(Date.now() - 1000 * 60 * 120) },
  { id: 5, icon: '🎫', text: 'Nouveau ticket support #TKT-123', time: new Date(Date.now() - 1000 * 60 * 180) }
])

const projectStatus = ref([
  { name: 'En cours', count: 18, percentage: 42, color: '#3498db' },
  { name: 'Terminé', count: 15, percentage: 35, color: '#2ecc71' },
  { name: 'En attente', count: 7, percentage: 16, color: '#f39c12' },
  { name: 'Annulé', count: 3, percentage: 7, color: '#e74c3c' }
])

const recentClients = ref([
  { id: 1, name: 'Sophie Martin', email: 'sophie@email.com', projectsCount: 3, status: 'Actif' },
  { id: 2, name: 'Thomas Bernard', email: 'thomas@email.com', projectsCount: 2, status: 'Actif' },
  { id: 3, name: 'Julie Petit', email: 'julie@email.com', projectsCount: 1, status: 'Inactif' },
  { id: 4, name: 'Nicolas Robert', email: 'nicolas@email.com', projectsCount: 4, status: 'Actif' }
])

const formatNumber = (num: number) => {
  return num.toLocaleString()
}

const formatTime = (date: Date) => {
  const now = new Date()
  const diff = now.getTime() - date.getTime()
  const minutes = Math.floor(diff / 60000)
  const hours = Math.floor(minutes / 60)
  
  if (minutes < 60) return `Il y a ${minutes} min`
  if (hours < 24) return `Il y a ${hours} h`
  return `Il y a ${Math.floor(hours / 24)} j`
}

onMounted(() => {
  // Charger les données
})
</script>

<style scoped>
.dashboard {
  animation: fadeIn 0.5s;
}

.stats-grid {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(250px, 1fr));
  gap: 20px;
  margin-bottom: 30px;
}

.stat-card {
  background: white;
  padding: 20px;
  border-radius: 12px;
  display: flex;
  align-items: center;
  gap: 15px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
  transition: transform 0.3s, box-shadow 0.3s;
}

.stat-card:hover {
  transform: translateY(-5px);
  box-shadow: 0 5px 20px rgba(0, 0, 0, 0.1);
}

.stat-icon {
  font-size: 48px;
}

.stat-info {
  flex: 1;
}

.stat-info h3 {
  font-size: 14px;
  color: #666;
  margin-bottom: 5px;
}

.stat-number {
  font-size: 28px;
  font-weight: bold;
  color: #333;
  margin-bottom: 5px;
}

.trend {
  font-size: 12px;
  padding: 2px 8px;
  border-radius: 12px;
}

.trend.up {
  background: #d4edda;
  color: #155724;
}

.trend.down {
  background: #f8d7da;
  color: #721c24;
}

.charts-row {
  display: grid;
  grid-template-columns: repeat(auto-fit, minmax(400px, 1fr));
  gap: 20px;
  margin-bottom: 30px;
}

.chart-card, .recent-table {
  background: white;
  padding: 20px;
  border-radius: 12px;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.05);
}

.chart-card h3, .recent-table h3 {
  margin-bottom: 20px;
  color: #333;
}

.activity-list {
  display: flex;
  flex-direction: column;
  gap: 15px;
}

.activity-item {
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 10px;
  border-radius: 8px;
  transition: background 0.2s;
}

.activity-item:hover {
  background: #f8f9fa;
}

.activity-icon {
  font-size: 24px;
}

.activity-details {
  flex: 1;
}

.activity-text {
  color: #333;
  margin-bottom: 4px;
}

.activity-time {
  font-size: 12px;
  color: #999;
}

.status-list {
  display: flex;
  flex-direction: column;
  gap: 15px;
}

.status-header {
  display: flex;
  justify-content: space-between;
  margin-bottom: 5px;
  font-size: 14px;
}

.progress-bar {
  height: 8px;
  background: #e0e0e0;
  border-radius: 4px;
  overflow: hidden;
}

.progress-fill {
  height: 100%;
  border-radius: 4px;
  transition: width 0.3s;
}

.data-table {
  width: 100%;
  border-collapse: collapse;
}

.data-table th, .data-table td {
  padding: 12px;
  text-align: left;
  border-bottom: 1px solid #e0e0e0;
}

.data-table th {
  background: #f8f9fa;
  font-weight: 600;
  color: #666;
}

.status-badge {
  padding: 4px 12px;
  border-radius: 12px;
  font-size: 12px;
  font-weight: 600;
}

.status-badge.Actif {
  background: #d4edda;
  color: #155724;
}

.status-badge.Inactif {
  background: #f8d7da;
  color: #721c24;
}

@keyframes fadeIn {
  from {
    opacity: 0;
    transform: translateY(20px);
  }
  to {
    opacity: 1;
    transform: translateY(0);
  }
}
</style>