<!-- src/components/Sidebar.vue -->
<template>
  <aside class="sidebar">
    <div class="sidebar-brand">
      <div class="logo-icon">N</div>
      <span>NexaCRM</span>
    </div>

    <nav class="sidebar-nav">
      <div class="nav-label">MAIN MENU</div>
      <ul>
        <!-- Admin Menu -->
        <template v-if="role === 'admin'">
          <li :class="{ active: isActive('/admin/dashboard') }" @click="go('/admin/dashboard')"><span class="icon">⊞</span> Dashboard</li>
          <li :class="{ active: isActive('/admin/clients') }" @click="go('/admin/clients')"><span class="icon">👥</span> Clients</li>
          <li :class="{ active: isActive('/admin/projects') }" @click="go('/admin/projects')"><span class="icon">📁</span> Projects</li>
          <li :class="{ active: isActive('/admin/tasks') }" @click="go('/admin/tasks')"><span class="icon">✓</span> Tasks</li>
          <li :class="{ active: isActive('/admin/invoices') }" @click="go('/admin/invoices')"><span class="icon">🧾</span> Invoices</li>
          <li :class="{ active: isActive('/admin/tickets') }" @click="go('/admin/tickets')"><span class="icon">🎫</span> Tickets</li>
          <li :class="{ active: isActive('/admin/users') }" @click="go('/admin/users')"><span class="icon">👤</span> Users</li>
        </template>

        <!-- Staff Menu -->
        <template v-else-if="role === 'staff'">
          <li :class="{ active: isActive('/staff/dashboard') }" @click="go('/staff/dashboard')"><span class="icon">⊞</span> Dashboard</li>
          <li :class="{ active: isActive('/staff/projects') }" @click="go('/staff/projects')"><span class="icon">📁</span> Projects</li>
          <li :class="{ active: isActive('/staff/tasks') }" @click="go('/staff/tasks')"><span class="icon">✓</span> Tasks</li>
          <li :class="{ active: isActive('/staff/tickets') }" @click="go('/staff/tickets')"><span class="icon">🎫</span> Tickets</li>
        </template>

        <!-- Client Menu -->
        <template v-else-if="role === 'client'">
          <li :class="{ active: isActive('/client/dashboard') }" @click="go('/client/dashboard')"><span class="icon">⊞</span> Dashboard</li>
          <li :class="{ active: isActive('/client/invoices') }" @click="go('/client/invoices')"><span class="icon">🧾</span> My Invoices</li>
          <li :class="{ active: isActive('/client/tickets') }" @click="go('/client/tickets')"><span class="icon">🎫</span> My Tickets</li>
        </template>
      </ul>
    </nav>

    <div class="sidebar-footer">
      <div class="user-info">
        <div class="avatar">{{ initials }}</div>
        <div class="user-details">
          <span class="user-email">{{ auth.user?.email }}</span>
          <span class="user-role">{{ roleLabel }}</span>
        </div>
      </div>
      <div class="logout-btn" @click="handleLogout">⏻ Logout</div>
    </div>
  </aside>
</template>

<script setup>
import { computed } from "vue"
import { useRouter, useRoute } from "vue-router"
import { useAuthStore } from "../stores/authStore"

const auth = useAuthStore()
const router = useRouter()
const route = useRoute()

const role = computed(() => auth.user?.type || "staff")

const initials = computed(() => (auth.user?.email || "A")[0].toUpperCase())

const roleLabel = computed(() => {
  if (role.value === "admin") return "Administrator"
  if (role.value === "staff") return "Staff Member"
  if (role.value === "client") return "Client"
  return "User"
})

function go(path) {
  router.push(path)
}

function isActive(path) {
  return route.path === path
}

async function handleLogout() {
  await auth.logout()
  router.push("/")
}
</script>

<style>
.sidebar {
  width: 250px;
  background: #0f172a;
  color: white;
  display: flex;
  flex-direction: column;
  padding: 24px 16px;
  flex-shrink: 0;
  height: 100vh;
}

.sidebar-brand { display: flex; align-items: center; gap: 12px; padding: 0 8px; margin-bottom: 36px; }
.logo-icon { width: 36px; height: 36px; background: #2563eb; color: white; font-size: 18px; font-weight: 900; border-radius: 8px; display: flex; align-items: center; justify-content: center; }
.sidebar-brand span { font-size: 18px; font-weight: 700; }
.nav-label { font-size: 10px; color: #475569; font-weight: 700; letter-spacing: 1px; padding: 0 8px; margin-bottom: 8px; }
.sidebar-nav ul { list-style: none; display: flex; flex-direction: column; gap: 4px; }
.sidebar-nav li { display: flex; align-items: center; gap: 10px; padding: 10px 12px; border-radius: 8px; cursor: pointer; font-size: 14px; color: #94a3b8; transition: all 0.2s; }
.sidebar-nav li:hover { background: #1e293b; color: white; }
.sidebar-nav li.active { background: #2563eb; color: white; }
.icon { font-size: 16px; }
.sidebar-footer { margin-top: auto; display: flex; flex-direction: column; gap: 12px; }
.user-info { display: flex; align-items: center; gap: 10px; padding: 10px; background: #1e293b; border-radius: 10px; }
.avatar { width: 34px; height: 34px; background: #2563eb; border-radius: 8px; display: flex; align-items: center; justify-content: center; font-weight: 700; font-size: 14px; }
.user-details { display: flex; flex-direction: column; }
.user-email { font-size: 12px; color: #e2e8f0; max-width: 140px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; }
.user-role { font-size: 11px; color: #64748b; }
.logout-btn { padding: 10px; text-align: center; background: #1e293b; color: #94a3b8; border-radius: 8px; cursor: pointer; font-size: 13px; transition: all 0.2s; }
.logout-btn:hover { background: #ef4444; color: white; }
</style>