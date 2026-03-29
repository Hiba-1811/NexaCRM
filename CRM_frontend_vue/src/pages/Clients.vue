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
          <li class="active"><span class="icon">👥</span> Clients</li>
          <li><span class="icon">📁</span> Projects</li>
          <li><span class="icon">✓</span> Tasks</li>
          <li><span class="icon">🧾</span> Invoices</li>
          <li><span class="icon">🎫</span> Tickets</li>
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
          <h1>Clients</h1>
          <p>Manage your client accounts</p>
        </div>
        <button class="btn-add" @click="openModal()">+ Add Client</button>
      </header>

      <section class="content">

        <!-- Stats -->
        <div class="stats-row">
          <div class="stat-mini">
            <span class="stat-num">{{ clients.length }}</span>
            <span class="stat-lbl">Total Clients</span>
          </div>
          <div class="stat-mini green">
            <span class="stat-num">{{ clients.filter(c => c.client_status === 'active').length }}</span>
            <span class="stat-lbl">Active</span>
          </div>
          <div class="stat-mini red">
            <span class="stat-num">{{ clients.filter(c => c.client_status === 'inactive').length }}</span>
            <span class="stat-lbl">Inactive</span>
          </div>
          <div class="stat-mini yellow">
            <span class="stat-num">{{ clients.filter(c => c.client_status === 'prospect').length }}</span>
            <span class="stat-lbl">Prospects</span>
          </div>
        </div>

        <!-- Filters -->
        <div class="filters-bar">
          <input v-model="search" placeholder="🔍 Search by name, phone, city..." class="search-input" />
          <div class="filter-tabs">
            <button :class="['tab', statusFilter === '' ? 'active' : '']" @click="statusFilter = ''">All</button>
            <button :class="['tab', statusFilter === 'active' ? 'active' : '']" @click="statusFilter = 'active'">🟢 Active</button>
            <button :class="['tab', statusFilter === 'inactive' ? 'active' : '']" @click="statusFilter = 'inactive'">🔴 Inactive</button>
            <button :class="['tab', statusFilter === 'prospect' ? 'active' : '']" @click="statusFilter = 'prospect'">🟡 Prospect</button>
          </div>
          <div class="sort-group">
            <select v-model="sortBy" class="sort-select">
              <option value="name">Sort: Name</option>
              <option value="date">Sort: Date</option>
              <option value="status">Sort: Status</option>
            </select>
          </div>
        </div>

        <!-- Table -->
        <div class="table-card">
          <table>
            <thead>
              <tr>
                <th>Company</th>
                <th>Phone</th>
                <th>City</th>
                <th>Country</th>
                <th>Status</th>
                <th>Quick Actions</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
              <tr v-if="loading">
                <td colspan="7" class="loading">Loading...</td>
              </tr>
              <tr v-else-if="filteredClients.length === 0">
                <td colspan="7" class="loading">No clients found</td>
              </tr>
              <tr v-for="client in filteredClients" :key="client.client_id">
                <td>
                  <div class="company-cell">
                    <div class="company-avatar">{{ (client.client_company_name || 'C')[0].toUpperCase() }}</div>
                    <div>
                      <b>{{ client.client_company_name }}</b>
                      <div class="website" v-if="client.client_website">{{ client.client_website }}</div>
                    </div>
                  </div>
                </td>
                <td>{{ client.client_phone || '—' }}</td>
                <td>{{ client.client_billing_city || '—' }}</td>
                <td>{{ client.client_billing_country || '—' }}</td>
                <td>
                  <span :class="['badge', getBadgeClass(client.client_status)]">
                    {{ getBadgeIcon(client.client_status) }} {{ client.client_status || 'active' }}
                  </span>
                </td>
                <td>
                  <div class="quick-actions">
                    <a v-if="client.client_phone" :href="`tel:${client.client_phone}`" class="qa-btn call" title="Call">📞</a>
                    <a v-if="client.client_phone" :href="`https://wa.me/${client.client_phone?.replace(/\D/g,'')}`" target="_blank" class="qa-btn whatsapp" title="WhatsApp">💬</a>
                    <a v-if="client.client_website" :href="client.client_website" target="_blank" class="qa-btn web" title="Website">🌐</a>
                  </div>
                </td>
                <td>
                  <div class="actions">
                    <button class="btn-edit" @click="openModal(client)">✏ Edit</button>
                    <button class="btn-delete" @click="deleteClient(client.client_id)">🗑</button>
                  </div>
                </td>
              </tr>
            </tbody>
          </table>
        </div>

        <!-- Pagination -->
        <div class="pagination">
          <span class="page-info">Showing {{ filteredClients.length }} of {{ clients.length }} clients</span>
        </div>

      </section>
    </main>

    <!-- Modal -->
    <div v-if="showModal" class="modal-overlay" @click.self="showModal = false">
      <div class="modal">
        <div class="modal-header">
          <h3>{{ editingClient ? 'Edit Client' : 'Add New Client' }}</h3>
          <span @click="showModal = false" class="modal-close">✕</span>
        </div>
        <div class="modal-body">
          <div class="form-grid">
            <div class="input-group">
              <label>Company Name *</label>
              <input v-model="form.client_company_name" placeholder="Acme Corp" />
            </div>
            <div class="input-group">
              <label>Phone</label>
              <input v-model="form.client_phone" placeholder="+216 XX XXX XXX" />
            </div>
            <div class="input-group">
              <label>Website</label>
              <input v-model="form.client_website" placeholder="https://..." />
            </div>
            <div class="input-group">
              <label>City</label>
              <input v-model="form.client_billing_city" placeholder="Tunis" />
            </div>
            <div class="input-group">
              <label>Country</label>
              <input v-model="form.client_billing_country" placeholder="Tunisia" />
            </div>
            <div class="input-group">
              <label>Status</label>
              <select v-model="form.client_status">
                <option value="active">🟢 Active</option>
                <option value="inactive">🔴 Inactive</option>
                <option value="prospect">🟡 Prospect</option>
              </select>
            </div>
          </div>
          <div class="input-group full">
            <label>Description</label>
            <textarea v-model="form.client_description" placeholder="Client description..."></textarea>
          </div>
        </div>
        <div class="modal-footer">
          <button class="btn-cancel" @click="showModal = false">Cancel</button>
          <button class="btn-save" @click="saveClient">
            {{ editingClient ? 'Update' : 'Create' }} Client
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
const clients = ref([])
const loading = ref(true)
const search = ref("")
const statusFilter = ref("")
const sortBy = ref("name")
const showModal = ref(false)
const editingClient = ref(null)

const form = ref({
  client_company_name: "",
  client_phone: "",
  client_website: "",
  client_billing_city: "",
  client_billing_country: "",
  client_status: "active",
  client_description: "",
})

const initials = computed(() => (auth.user?.email || "A")[0].toUpperCase())

const filteredClients = computed(() => {
  let list = clients.value

  if (search.value) {
    const s = search.value.toLowerCase()
    list = list.filter(c =>
      (c.client_company_name || "").toLowerCase().includes(s) ||
      (c.client_phone || "").toLowerCase().includes(s) ||
      (c.client_billing_city || "").toLowerCase().includes(s)
    )
  }

  if (statusFilter.value) {
    list = list.filter(c => c.client_status === statusFilter.value)
  }

  if (sortBy.value === "name") {
    list = [...list].sort((a, b) => (a.client_company_name || "").localeCompare(b.client_company_name || ""))
  } else if (sortBy.value === "date") {
    list = [...list].sort((a, b) => new Date(b.client_created) - new Date(a.client_created))
  } else if (sortBy.value === "status") {
    list = [...list].sort((a, b) => (a.client_status || "").localeCompare(b.client_status || ""))
  }

  return list
})

function getBadgeClass(status) {
  if (status === 'active') return 'badge-green'
  if (status === 'inactive') return 'badge-red'
  if (status === 'prospect') return 'badge-yellow'
  return 'badge-green'
}

function getBadgeIcon(status) {
  if (status === 'active') return '🟢'
  if (status === 'inactive') return '🔴'
  if (status === 'prospect') return '🟡'
  return '🟢'
}

onMounted(async () => {
  if (auth.token && !auth.user) await auth.fetchMe()
  await loadClients()
})

async function loadClients() {
  loading.value = true
  try {
    const res = await api.get("/clients")
    clients.value = res.data
  } catch (e) {
    console.error(e)
  } finally {
    loading.value = false
  }
}

function openModal(client = null) {
  editingClient.value = client
  if (client) {
    form.value = {
      client_company_name: client.client_company_name || "",
      client_phone: client.client_phone || "",
      client_website: client.client_website || "",
      client_billing_city: client.client_billing_city || "",
      client_billing_country: client.client_billing_country || "",
      client_status: client.client_status || "active",
      client_description: client.client_description || "",
    }
  } else {
    form.value = {
      client_company_name: "",
      client_phone: "",
      client_website: "",
      client_billing_city: "",
      client_billing_country: "",
      client_status: "active",
      client_description: "",
    }
  }
  showModal.value = true
}

async function saveClient() {
  try {
    if (editingClient.value) {
      await api.put(`/clients/${editingClient.value.client_id}`, form.value)
    } else {
      await api.post("/clients", form.value)
    }
    showModal.value = false
    await loadClients()
  } catch (e) {
    console.error(e)
  }
}

async function deleteClient(id) {
  if (!confirm("Are you sure?")) return
  try {
    await api.delete(`/clients/${id}`)
    await loadClients()
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

.dashboard {
  display: flex;
  height: 100vh;
  font-family: 'Inter', 'Segoe UI', sans-serif;
  background: #f1f5f9;
}

.sidebar {
  width: 250px;
  background: #0f172a;
  color: white;
  display: flex;
  flex-direction: column;
  padding: 24px 16px;
}

.sidebar-brand {
  display: flex;
  align-items: center;
  gap: 12px;
  padding: 0 8px;
  margin-bottom: 36px;
}

.logo-icon {
  width: 36px;
  height: 36px;
  background: #2563eb;
  color: white;
  font-size: 18px;
  font-weight: 900;
  border-radius: 8px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.sidebar-brand span { font-size: 18px; font-weight: 700; }
.nav-label { font-size: 10px; color: #475569; font-weight: 700; letter-spacing: 1px; padding: 0 8px; margin-bottom: 8px; }

.sidebar-nav ul { list-style: none; display: flex; flex-direction: column; gap: 4px; }

.sidebar-nav li {
  display: flex; align-items: center; gap: 10px;
  padding: 10px 12px; border-radius: 8px; cursor: pointer;
  font-size: 14px; color: #94a3b8; transition: all 0.2s;
}
.sidebar-nav li:hover { background: #1e293b; color: white; }
.sidebar-nav li.active { background: #2563eb; color: white; }
.icon { font-size: 16px; }

.sidebar-footer { margin-top: auto; display: flex; flex-direction: column; gap: 12px; }

.user-info {
  display: flex; align-items: center; gap: 10px;
  padding: 10px; background: #1e293b; border-radius: 10px;
}

.avatar {
  width: 34px; height: 34px; background: #2563eb;
  border-radius: 8px; display: flex; align-items: center;
  justify-content: center; font-weight: 700; font-size: 14px;
}

.user-details { display: flex; flex-direction: column; }
.user-email { font-size: 12px; color: #e2e8f0; max-width: 140px; overflow: hidden; text-overflow: ellipsis; white-space: nowrap; }
.user-role { font-size: 11px; color: #64748b; }

.logout-btn {
  padding: 10px; text-align: center; background: #1e293b;
  color: #94a3b8; border-radius: 8px; cursor: pointer; font-size: 13px; transition: all 0.2s;
}
.logout-btn:hover { background: #ef4444; color: white; }

.main { flex: 1; overflow-y: auto; }

.topbar {
  background: white; padding: 20px 30px;
  border-bottom: 1px solid #e2e8f0;
  display: flex; justify-content: space-between; align-items: center;
}
.topbar h1 { font-size: 22px; font-weight: 700; color: #0f172a; }
.topbar p { font-size: 13px; color: #94a3b8; margin-top: 2px; }

.btn-add {
  padding: 10px 20px; background: #2563eb; color: white;
  border: none; border-radius: 10px; font-size: 14px;
  font-weight: 600; cursor: pointer; transition: background 0.2s;
}
.btn-add:hover { background: #1d4ed8; }

.content { padding: 24px 30px; display: flex; flex-direction: column; gap: 16px; }

/* Stats */
.stats-row {
  display: flex; gap: 16px;
}

.stat-mini {
  background: white; border-radius: 12px; padding: 16px 24px;
  display: flex; flex-direction: column; gap: 4px;
  box-shadow: 0 1px 4px rgba(0,0,0,0.06); min-width: 120px;
  border-left: 4px solid #2563eb;
}
.stat-mini.green { border-left-color: #22c55e; }
.stat-mini.red { border-left-color: #ef4444; }
.stat-mini.yellow { border-left-color: #f59e0b; }

.stat-num { font-size: 24px; font-weight: 700; color: #0f172a; }
.stat-lbl { font-size: 12px; color: #94a3b8; }

/* Filters */
.filters-bar {
  display: flex; gap: 12px; align-items: center; flex-wrap: wrap;
}

.search-input {
  flex: 1; min-width: 200px; padding: 10px 16px;
  border: 1.5px solid #e2e8f0; border-radius: 10px;
  font-size: 14px; outline: none; transition: border 0.2s;
}
.search-input:focus { border-color: #2563eb; }

.filter-tabs { display: flex; gap: 6px; }

.tab {
  padding: 8px 14px; border: 1.5px solid #e2e8f0;
  border-radius: 8px; background: white; font-size: 13px;
  cursor: pointer; color: #64748b; transition: all 0.2s;
}
.tab:hover { border-color: #2563eb; color: #2563eb; }
.tab.active { background: #2563eb; color: white; border-color: #2563eb; }

.sort-select {
  padding: 9px 14px; border: 1.5px solid #e2e8f0;
  border-radius: 8px; font-size: 13px; outline: none;
  background: white; color: #374151; cursor: pointer;
}

/* Table */
.table-card {
  background: white; border-radius: 14px;
  box-shadow: 0 1px 4px rgba(0,0,0,0.06); overflow: hidden;
}

table { width: 100%; border-collapse: collapse; }
thead { background: #f8fafc; }
th {
  padding: 14px 20px; text-align: left; font-size: 12px;
  font-weight: 700; color: #64748b; text-transform: uppercase; letter-spacing: 0.5px;
}
td { padding: 14px 20px; font-size: 14px; color: #374151; border-top: 1px solid #f1f5f9; }

.loading { text-align: center; color: #94a3b8; padding: 40px; }

.company-cell { display: flex; align-items: center; gap: 12px; }

.company-avatar {
  width: 36px; height: 36px; background: #dbeafe;
  color: #2563eb; border-radius: 8px; display: flex;
  align-items: center; justify-content: center;
  font-weight: 700; font-size: 14px; flex-shrink: 0;
}

.website { font-size: 12px; color: #94a3b8; margin-top: 2px; }

.badge {
  padding: 4px 10px; border-radius: 20px;
  font-size: 12px; font-weight: 600;
}
.badge-green { background: #dcfce7; color: #16a34a; }
.badge-red { background: #fff1f2; color: #ef4444; }
.badge-yellow { background: #fef9c3; color: #ca8a04; }

/* Quick Actions */
.quick-actions { display: flex; gap: 6px; }
.qa-btn {
  width: 30px; height: 30px; border-radius: 6px;
  display: flex; align-items: center; justify-content: center;
  font-size: 14px; text-decoration: none; transition: transform 0.2s;
}
.qa-btn:hover { transform: scale(1.2); }
.qa-btn.call { background: #dbeafe; }
.qa-btn.whatsapp { background: #dcfce7; }
.qa-btn.web { background: #f1f5f9; }

.actions { display: flex; gap: 8px; }
.btn-edit {
  padding: 6px 12px; background: #eff6ff; color: #2563eb;
  border: none; border-radius: 6px; font-size: 12px; cursor: pointer;
}
.btn-edit:hover { background: #dbeafe; }
.btn-delete {
  padding: 6px 10px; background: #fff1f2; color: #ef4444;
  border: none; border-radius: 6px; font-size: 12px; cursor: pointer;
}
.btn-delete:hover { background: #fecdd3; }

/* Pagination */
.pagination {
  display: flex; justify-content: flex-end;
}
.page-info { font-size: 13px; color: #94a3b8; }

/* Modal */
.modal-overlay {
  position: fixed; inset: 0; background: rgba(0,0,0,0.4);
  display: flex; align-items: center; justify-content: center; z-index: 100;
}

.modal {
  background: white; border-radius: 16px; width: 560px;
  max-height: 90vh; overflow-y: auto;
  box-shadow: 0 20px 60px rgba(0,0,0,0.15);
}

.modal-header {
  padding: 24px; border-bottom: 1px solid #e2e8f0;
  display: flex; justify-content: space-between; align-items: center;
}
.modal-header h3 { font-size: 18px; font-weight: 700; color: #0f172a; }
.modal-close { cursor: pointer; color: #94a3b8; font-size: 18px; }
.modal-close:hover { color: #0f172a; }

.modal-body { padding: 24px; display: flex; flex-direction: column; gap: 16px; }
.form-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 16px; }
.input-group { display: flex; flex-direction: column; gap: 6px; }
.input-group.full { grid-column: 1 / -1; }
.input-group label { font-size: 13px; font-weight: 600; color: #374151; }

.input-group input,
.input-group select,
.input-group textarea {
  padding: 10px 14px; border: 1.5px solid #e2e8f0;
  border-radius: 8px; font-size: 14px; outline: none;
  transition: border 0.2s; font-family: inherit;
}
.input-group input:focus,
.input-group select:focus,
.input-group textarea:focus { border-color: #2563eb; }
.input-group textarea { resize: vertical; min-height: 80px; }

.modal-footer {
  padding: 20px 24px; border-top: 1px solid #e2e8f0;
  display: flex; justify-content: flex-end; gap: 12px;
}
.btn-cancel {
  padding: 10px 20px; background: #f1f5f9; color: #64748b;
  border: none; border-radius: 8px; font-size: 14px; cursor: pointer;
}
.btn-cancel:hover { background: #e2e8f0; }
.btn-save {
  padding: 10px 20px; background: #2563eb; color: white;
  border: none; border-radius: 8px; font-size: 14px; font-weight: 600; cursor: pointer;
}
.btn-save:hover { background: #1d4ed8; }
</style>