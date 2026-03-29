<template>
  <div class="dashboard">
<div class="topbar-right">
  <NotificationBell />
</div>
    <aside class="sidebar">
      <div class="sidebar-brand">
        <div class="logo-icon">N</div>
        <span>NexaCRM</span>
      </div>
      <nav class="sidebar-nav">
        <div class="nav-label">MAIN MENU</div>
        <ul>
          <li @click="router.push('/dashboard')"><span class="icon">⊞</span> Dashboard</li>
          <li @click="router.push('/clients')"><span class="icon">👥</span> Clients</li>
          <li @click="router.push('/projects')"><span class="icon">📁</span> Projects</li>
          <li @click="router.push('/tasks')"><span class="icon">✓</span> Tasks</li>
          <li @click="router.push('/invoices')"><span class="icon">🧾</span> Invoices</li>
          <li @click="router.push('/tickets')"><span class="icon">🎫</span> Tickets</li>
        </ul>
        <div class="nav-label" style="margin-top:16px">SETTINGS</div>
        <ul>
          <li class="active"><span class="icon">👤</span> Users</li>
        </ul>
      </nav>
      <div class="sidebar-footer">
        <div class="user-info">
          <div class="avatar">{{ initials }}</div>
          <div class="user-details">
            <span class="user-email">{{ auth.user?.email }}</span>
            <span class="user-role">Administrator</span>
          </div>
        </div>
        <div class="logout-btn" @click="handleLogout">⏻ Logout</div>
      </div>
    </aside>

    <main class="main">
      <header class="topbar">
        <div>
          <h1>Users Management</h1>
          <p>Add and manage team members</p>
        </div>
        <button class="btn-add" @click="openModal()">+ Add User</button>
      </header>

      <section class="content">

        <!-- Stats -->
        <div class="stats-row">
          <div class="stat-mini blue">
            <span class="stat-num">{{ users.length }}</span>
            <span class="stat-lbl">Total Users</span>
          </div>
          <div class="stat-mini green">
            <span class="stat-num">{{ users.filter(u => u.status === 'active').length }}</span>
            <span class="stat-lbl">Active</span>
          </div>
          <div class="stat-mini purple">
            <span class="stat-num">{{ users.filter(u => u.type === 'admin').length }}</span>
            <span class="stat-lbl">Admins</span>
          </div>
        </div>

        <!-- Search -->
        <div class="filters-bar">
          <input v-model="search" placeholder="🔍 Search users..." class="search-input" />
        </div>

        <!-- Table -->
        <div class="table-card">
          <table>
            <thead>
              <tr>
                <th>User</th>
                <th>Email</th>
                <th>Role</th>
                <th>Status</th>
                <th>Created</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
              <tr v-if="loading">
                <td colspan="6" class="loading">Loading...</td>
              </tr>
              <tr v-else-if="filteredUsers.length === 0">
                <td colspan="6" class="loading">No users found</td>
              </tr>
              <tr v-for="user in filteredUsers" :key="user.id">
                <td>
                  <div class="user-cell">
                    <div class="user-avatar">{{ getInitials(user) }}</div>
                    <div>
                      <b>{{ user.first_name }} {{ user.last_name }}</b>
                    </div>
                  </div>
                </td>
                <td>{{ user.email }}</td>
                <td>
                  <span :class="['badge', user.type === 'admin' ? 'badge-purple' : 'badge-blue']">
                    {{ user.type === 'admin' ? '👑 Admin' : '👤 Staff' }}
                  </span>
                </td>
                <td>
                  <span :class="['badge', user.status === 'active' ? 'badge-green' : 'badge-gray']">
                    {{ user.status === 'active' ? '🟢 Active' : '⚫ Inactive' }}
                  </span>
                </td>
                <td>{{ formatDate(user.created) }}</td>
                <td>
                  <div class="actions">
                    <button class="btn-edit" @click="openModal(user)">✏ Edit</button>
                    <button class="btn-delete" @click="deleteUser(user.id)">🗑</button>
                  </div>
                </td>
              </tr>
            </tbody>
          </table>
        </div>

      </section>
    </main>

    <!-- Modal -->
    <div v-if="showModal" class="modal-overlay" @click.self="showModal = false">
      <div class="modal">
        <div class="modal-header">
          <h3>{{ editingUser ? 'Edit User' : 'Add New User' }}</h3>
          <span @click="showModal = false" class="modal-close">✕</span>
        </div>
        <div class="modal-body">
          <div class="form-grid">
            <div class="input-group">
              <label>First Name *</label>
              <input v-model="form.first_name" placeholder="John" />
            </div>
            <div class="input-group">
              <label>Last Name *</label>
              <input v-model="form.last_name" placeholder="Doe" />
            </div>
            <div class="input-group">
              <label>Email *</label>
              <input v-model="form.email" type="email" placeholder="john@company.com" />
            </div>
            <div class="input-group">
              <label>{{ editingUser ? 'New Password (optional)' : 'Password *' }}</label>
              <input v-model="form.password" type="password" placeholder="••••••••" />
            </div>
            <div class="input-group">
              <label>Role</label>
              <select v-model="form.type">
                <option value="admin">👑 Admin</option>
                <option value="staff">👤 Staff</option>
              </select>
            </div>
            <div class="input-group">
              <label>Status</label>
              <select v-model="form.status">
                <option value="active">🟢 Active</option>
                <option value="inactive">⚫ Inactive</option>
              </select>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button class="btn-cancel" @click="showModal = false">Cancel</button>
          <button class="btn-save" @click="saveUser">
            {{ editingUser ? 'Update' : 'Add' }} User
          </button>
        </div>
      </div>
    </div>

  </div>
</template>

<script setup>
import { ref, computed, onMounted } from "vue"
import { useAuthStore } from "../stores/authStore"
import { useRouter } from "vue-router"
import api from "../services/api"

const auth = useAuthStore()
const router = useRouter()
const users = ref([])
const loading = ref(true)
const search = ref("")
const showModal = ref(false)
const editingUser = ref(null)

const form = ref({
  first_name: "",
  last_name: "",
  email: "",
  password: "",
  type: "staff",
  status: "active",
})

const initials = computed(() => (auth.user?.email || "A")[0].toUpperCase())

const filteredUsers = computed(() => {
  if (!search.value) return users.value
  const s = search.value.toLowerCase()
  return users.value.filter(u =>
    (u.first_name || "").toLowerCase().includes(s) ||
    (u.last_name || "").toLowerCase().includes(s) ||
    (u.email || "").toLowerCase().includes(s)
  )
})

function getInitials(user) {
  const f = (user.first_name || "")[0] || ""
  const l = (user.last_name || "")[0] || ""
  return (f + l).toUpperCase() || "U"
}

function formatDate(date) {
  if (!date) return '—'
  return new Date(date).toLocaleDateString('en-GB', { day: '2-digit', month: 'short', year: 'numeric' })
}

onMounted(async () => {
  if (auth.token && !auth.user) await auth.fetchMe()
  await loadUsers()
})

async function loadUsers() {
  loading.value = true
  try {
    const res = await api.get("/users")
    users.value = res.data
  } catch (e) {
    console.error(e)
  } finally {
    loading.value = false
  }
}

function openModal(user = null) {
  editingUser.value = user
  if (user) {
    form.value = {
      first_name: user.first_name || "",
      last_name: user.last_name || "",
      email: user.email || "",
      password: "",
      type: user.type || "staff",
      status: user.status || "active",
    }
  } else {
    form.value = {
      first_name: "",
      last_name: "",
      email: "",
      password: "",
      type: "staff",
      status: "active",
    }
  }
  showModal.value = true
}

async function saveUser() {
  try {
    if (editingUser.value) {
      await api.put(`/users/${editingUser.value.id}`, form.value)
    } else {
      await api.post("/users", form.value)
    }
    showModal.value = false
    await loadUsers()
  } catch (e) {
    console.error(e)
  }
}

async function deleteUser(id) {
  if (!confirm("Are you sure?")) return
  try {
    await api.delete(`/users/${id}`)
    await loadUsers()
  } catch (e) {
    console.error(e)
  }
}

async function handleLogout() {
  await auth.logout()
  router.push("/")
}
</script>

<style>
* { box-sizing: border-box; margin: 0; padding: 0; }
.dashboard { display: flex; height: 100vh; font-family: 'Inter', 'Segoe UI', sans-serif; background: #f1f5f9; }
.sidebar { width: 250px; background: #0f172a; color: white; display: flex; flex-direction: column; padding: 24px 16px; flex-shrink: 0; }
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
.main { flex: 1; overflow-y: auto; }
.topbar { background: white; padding: 20px 30px; border-bottom: 1px solid #e2e8f0; display: flex; justify-content: space-between; align-items: center; }
.topbar h1 { font-size: 22px; font-weight: 700; color: #0f172a; }
.topbar p { font-size: 13px; color: #94a3b8; margin-top: 2px; }
.btn-add { padding: 10px 20px; background: #2563eb; color: white; border: none; border-radius: 10px; font-size: 14px; font-weight: 600; cursor: pointer; }
.btn-add:hover { background: #1d4ed8; }
.content { padding: 24px 30px; display: flex; flex-direction: column; gap: 16px; }
.stats-row { display: flex; gap: 16px; }
.stat-mini { background: white; border-radius: 12px; padding: 16px 24px; display: flex; flex-direction: column; gap: 4px; box-shadow: 0 1px 4px rgba(0,0,0,0.06); min-width: 120px; }
.stat-mini.blue { border-left: 4px solid #2563eb; }
.stat-mini.green { border-left: 4px solid #22c55e; }
.stat-mini.purple { border-left: 4px solid #8b5cf6; }
.stat-num { font-size: 24px; font-weight: 700; color: #0f172a; }
.stat-lbl { font-size: 12px; color: #94a3b8; }
.filters-bar { display: flex; gap: 12px; }
.search-input { flex: 1; max-width: 360px; padding: 10px 16px; border: 1.5px solid #e2e8f0; border-radius: 10px; font-size: 14px; outline: none; }
.search-input:focus { border-color: #2563eb; }
.table-card { background: white; border-radius: 14px; box-shadow: 0 1px 4px rgba(0,0,0,0.06); overflow: hidden; }
table { width: 100%; border-collapse: collapse; }
thead { background: #f8fafc; }
th { padding: 14px 20px; text-align: left; font-size: 12px; font-weight: 700; color: #64748b; text-transform: uppercase; letter-spacing: 0.5px; }
td { padding: 14px 20px; font-size: 14px; color: #374151; border-top: 1px solid #f1f5f9; }
.loading { text-align: center; color: #94a3b8; padding: 40px; }
.user-cell { display: flex; align-items: center; gap: 12px; }
.user-avatar { width: 36px; height: 36px; background: #dbeafe; color: #2563eb; border-radius: 8px; display: flex; align-items: center; justify-content: center; font-weight: 700; font-size: 13px; flex-shrink: 0; }
.badge { padding: 4px 10px; border-radius: 20px; font-size: 12px; font-weight: 600; }
.badge-green { background: #dcfce7; color: #16a34a; }
.badge-gray { background: #f1f5f9; color: #64748b; }
.badge-purple { background: #ede9fe; color: #7c3aed; }
.badge-blue { background: #dbeafe; color: #2563eb; }
.actions { display: flex; gap: 8px; }
.btn-edit { padding: 6px 12px; background: #eff6ff; color: #2563eb; border: none; border-radius: 6px; font-size: 12px; cursor: pointer; }
.btn-edit:hover { background: #dbeafe; }
.btn-delete { padding: 6px 10px; background: #fff1f2; color: #ef4444; border: none; border-radius: 6px; font-size: 12px; cursor: pointer; }
.btn-delete:hover { background: #fecdd3; }
.modal-overlay { position: fixed; inset: 0; background: rgba(0,0,0,0.4); display: flex; align-items: center; justify-content: center; z-index: 100; }
.modal { background: white; border-radius: 16px; width: 520px; max-height: 90vh; overflow-y: auto; box-shadow: 0 20px 60px rgba(0,0,0,0.15); }
.modal-header { padding: 24px; border-bottom: 1px solid #e2e8f0; display: flex; justify-content: space-between; align-items: center; }
.modal-header h3 { font-size: 18px; font-weight: 700; color: #0f172a; }
.modal-close { cursor: pointer; color: #94a3b8; font-size: 18px; }
.modal-body { padding: 24px; }
.form-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 16px; }
.input-group { display: flex; flex-direction: column; gap: 6px; }
.input-group.full { grid-column: 1 / -1; }
.input-group label { font-size: 13px; font-weight: 600; color: #374151; }
.input-group input, .input-group select { padding: 10px 14px; border: 1.5px solid #e2e8f0; border-radius: 8px; font-size: 14px; outline: none; transition: border 0.2s; font-family: inherit; }
.input-group input:focus, .input-group select:focus { border-color: #2563eb; }
.modal-footer { padding: 20px 24px; border-top: 1px solid #e2e8f0; display: flex; justify-content: flex-end; gap: 12px; }
.btn-cancel { padding: 10px 20px; background: #f1f5f9; color: #64748b; border: none; border-radius: 8px; font-size: 14px; cursor: pointer; }
.btn-save { padding: 10px 20px; background: #2563eb; color: white; border: none; border-radius: 8px; font-size: 14px; font-weight: 600; cursor: pointer; }
.btn-save:hover { background: #1d4ed8; }
</style>