<template>
  <div class="admin-layout">
    <aside class="sidebar">
      <div class="logo">
        <h2>NEXACRM</h2>
        <span>Admin Panel</span>
      </div>
      <nav class="nav-menu">
        <router-link to="/admin/dashboard" class="nav-item">
          <span class="icon">📊</span>
          <span>Dashboard</span>
        </router-link>
        <router-link to="/admin/clients" class="nav-item">
          <span class="icon">👥</span>
          <span>Clients</span>
        </router-link>
        <router-link to="/admin/leads" class="nav-item">
          <span class="icon">🎯</span>
          <span>Leads</span>
        </router-link>
        <router-link to="/admin/projects" class="nav-item">
          <span class="icon">📁</span>
          <span>Projects</span>
        </router-link>
        <router-link to="/admin/tasks" class="nav-item">
          <span class="icon">✅</span>
          <span>Tasks</span>
        </router-link>
        <router-link to="/admin/invoices" class="nav-item">
          <span class="icon">💰</span>
          <span>Invoices</span>
        </router-link>
        <router-link to="/admin/tickets" class="nav-item">
          <span class="icon">🎫</span>
          <span>Tickets</span>
        </router-link>
        <router-link to="/admin/users" class="nav-item">
          <span class="icon">👤</span>
          <span>Users</span>
        </router-link>
        <router-link to="/admin/stats" class="nav-item">
          <span class="icon">📈</span>
          <span>Statistics</span>
        </router-link>
      </nav>
      <div class="sidebar-footer">
        <div class="user-info">
          <div class="avatar">A</div>
          <div class="user-details">
            <span class="name">{{ authStore.user?.name }}</span>
            <span class="role">Administrator</span>
          </div>
        </div>
        <button @click="handleLogout" class="logout-btn">
          <span>🚪</span>
          <span>Logout</span>
        </button>
      </div>
    </aside>
    <main class="main-content">
      <header class="header">
        <div class="header-left">
          <h1>{{ pageTitle }}</h1>
        </div>
        <div class="header-right">
          <div class="notifications">🔔</div>
          <div class="search">🔍</div>
        </div>
      </header>
      <div class="content">
        <router-view />
      </div>
    </main>
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue'
import { useRoute, useRouter } from 'vue-router'
import { useAuthStore } from '../stores/authStore'

const route = useRoute()
const router = useRouter()
const authStore = useAuthStore()

const pageTitle = computed(() => {
  const titles: Record<string, string> = {
    dashboard: 'Dashboard',
    clients: 'Gestion des Clients',
    leads: 'Gestion des Leads',
    projects: 'Gestion des Projets',
    tasks: 'Gestion des Tâches',
    invoices: 'Factures',
    tickets: 'Support Tickets',
    users: 'Utilisateurs',
    stats: 'Statistiques'
  }
  const path = route.path.split('/').pop() || 'dashboard'
  return titles[path] || 'NEXACRM'
})

const handleLogout = () => {
  authStore.logout()
  router.push('/login')
}
</script>

<style scoped>
.admin-layout {
  display: flex;
  min-height: 100vh;
}

.sidebar {
  width: 280px;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;
  display: flex;
  flex-direction: column;
  position: fixed;
  height: 100vh;
  left: 0;
  top: 0;
}

.logo {
  padding: 30px 24px;
  border-bottom: 1px solid rgba(255, 255, 255, 0.1);
}

.logo h2 {
  font-size: 24px;
  margin-bottom: 5px;
}

.logo span {
  font-size: 12px;
  opacity: 0.8;
}

.nav-menu {
  flex: 1;
  padding: 20px 0;
  overflow-y: auto;
}

.nav-item {
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 12px 24px;
  color: white;
  text-decoration: none;
  transition: all 0.3s;
  margin: 4px 12px;
  border-radius: 8px;
}

.nav-item:hover {
  background: rgba(255, 255, 255, 0.1);
  transform: translateX(5px);
}

.nav-item.router-link-active {
  background: rgba(255, 255, 255, 0.2);
  font-weight: 600;
}

.icon {
  font-size: 20px;
}

.sidebar-footer {
  padding: 20px;
  border-top: 1px solid rgba(255, 255, 255, 0.1);
}

.user-info {
  display: flex;
  align-items: center;
  gap: 12px;
  margin-bottom: 15px;
  padding: 10px;
  background: rgba(255, 255, 255, 0.1);
  border-radius: 8px;
}

.avatar {
  width: 40px;
  height: 40px;
  background: rgba(255, 255, 255, 0.2);
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  font-weight: bold;
}

.user-details {
  display: flex;
  flex-direction: column;
}

.name {
  font-weight: 600;
  font-size: 14px;
}

.role {
  font-size: 12px;
  opacity: 0.7;
}

.logout-btn {
  width: 100%;
  padding: 10px;
  background: rgba(255, 255, 255, 0.1);
  border: 1px solid rgba(255, 255, 255, 0.2);
  color: white;
  border-radius: 8px;
  display: flex;
  align-items: center;
  justify-content: center;
  gap: 8px;
  cursor: pointer;
  transition: all 0.3s;
}

.logout-btn:hover {
  background: rgba(255, 255, 255, 0.2);
}

.main-content {
  flex: 1;
  margin-left: 280px;
}

.header {
  background: white;
  padding: 20px 30px;
  display: flex;
  justify-content: space-between;
  align-items: center;
  box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.header-left h1 {
  font-size: 24px;
  color: #333;
}

.header-right {
  display: flex;
  gap: 20px;
  font-size: 20px;
}

.content {
  padding: 30px;
}
</style>