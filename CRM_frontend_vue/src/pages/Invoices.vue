import { createRouter, createWebHistory } from "vue-router"
import Login from "../pages/Login.vue"
import Dashboard from "../pages/Dashboard.vue"
import Clients from "../pages/Clients.vue"
import Projects from "../pages/Projects.vue"
import Tasks from "../pages/Tasks.vue"
import Invoices from "../pages/Invoices.vue"
import { useAuthStore } from "../stores/authStore"

const routes = [
  { path: "/", name: "login", component: Login },
  { path: "/dashboard", name: "dashboard", component: Dashboard, meta: { requiresAuth: true } },
  { path: "/clients", name: "clients", component: Clients, meta: { requiresAuth: true } },
  { path: "/projects", name: "projects", component: Projects, meta: { requiresAuth: true } },
  { path: "/tasks", name: "tasks", component: Tasks, meta: { requiresAuth: true } },
  { path: "/invoices", name: "invoices", component: Invoices, meta: { requiresAuth: true } }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

router.beforeEach((to) => {
  const auth = useAuthStore()
  if (to.meta.requiresAuth && !auth.token) return "/"
  return true
})

export default router
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
          <li class="active"><span class="icon">🧾</span> Invoices</li>
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
          <h1>Invoices</h1>
          <p>Manage and track all your invoices</p>
        </div>
        <button class="btn-add" @click="openModal()">+ New Invoice</button>
      </header>

      <section class="content">

        <!-- Stats -->
        <div class="stats-row">
          <div class="stat-mini blue">
            <span class="stat-num">{{ invoices.length }}</span>
            <span class="stat-lbl">Total</span>
          </div>
          <div class="stat-mini green">
            <span class="stat-num">{{ invoices.filter(i => i.bill_status === 'paid').length }}</span>
            <span class="stat-lbl">Paid</span>
          </div>
          <div class="stat-mini yellow">
            <span class="stat-num">{{ invoices.filter(i => i.bill_status === 'sent').length }}</span>
            <span class="stat-lbl">Sent</span>
          </div>
          <div class="stat-mini red">
            <span class="stat-num">{{ invoices.filter(i => i.bill_status === 'overdue').length }}</span>
            <span class="stat-lbl">Overdue</span>
          </div>
          <div class="stat-mini purple">
            <span class="stat-num">{{ totalAmount }}</span>
            <span class="stat-lbl">Total Amount</span>
          </div>
        </div>

        <!-- Filters -->
        <div class="filters-bar">
          <input v-model="search" placeholder="🔍 Search invoices..." class="search-input" />
          <div class="filter-tabs">
            <button :class="['tab', statusFilter === '' ? 'active' : '']" @click="statusFilter = ''">All</button>
            <button :class="['tab', statusFilter === 'draft' ? 'active' : '']" @click="statusFilter = 'draft'">📝 Draft</button>
            <button :class="['tab', statusFilter === 'sent' ? 'active' : '']" @click="statusFilter = 'sent'">📤 Sent</button>
            <button :class="['tab', statusFilter === 'paid' ? 'active' : '']" @click="statusFilter = 'paid'">✅ Paid</button>
            <button :class="['tab', statusFilter === 'overdue' ? 'active' : '']" @click="statusFilter = 'overdue'">⚠️ Overdue</button>
          </div>
        </div>

        <!-- Table -->
        <div class="table-card">
          <table>
            <thead>
              <tr>
                <th>Invoice #</th>
                <th>Client</th>
                <th>Date</th>
                <th>Due Date</th>
                <th>Amount</th>
                <th>Status</th>
                <th>Actions</th>
              </tr>
            </thead>
            <tbody>
              <tr v-if="loading">
                <td colspan="7" class="loading">Loading...</td>
              </tr>
              <tr v-else-if="filteredInvoices.length === 0">
                <td colspan="7" class="loading">No invoices found</td>
              </tr>
              <tr v-for="invoice in filteredInvoices" :key="invoice.bill_invoiceid">
                <td>
                  <div class="invoice-num">
                    <div class="invoice-icon">🧾</div>
                    <b>#{{ invoice.bill_uniqueid || invoice.bill_invoiceid }}</b>
                  </div>
                </td>
                <td>{{ invoice.bill_clientid || '—' }}</td>
                <td>{{ formatDate(invoice.bill_date) }}</td>
                <td>
                  <span :class="isOverdue(invoice.bill_due_date) ? 'overdue-date' : ''">
                    {{ formatDate(invoice.bill_due_date) }}
                  </span>
                </td>
                <td>
                  <b class="amount">{{ formatAmount(invoice.bill_final_amount) }}</b>
                </td>
                <td>
                  <span :class="['badge', getStatusClass(invoice.bill_status)]">
                    {{ getStatusLabel(invoice.bill_status) }}
                  </span>
                </td>
                <td>
                  <div class="actions">
                    <button class="btn-edit" @click="openModal(invoice)">✏ Edit</button>
                    <button class="btn-delete" @click="deleteInvoice(invoice.bill_invoiceid)">🗑</button>
                  </div>
                </td>
              </tr>
            </tbody>
          </table>
        </div>

        <div class="pagination">
          <span class="page-info">Showing {{ filteredInvoices.length }} of {{ invoices.length }} invoices</span>
        </div>

      </section>
    </main>

    <!-- Modal -->
    <div v-if="showModal" class="modal-overlay" @click.self="showModal = false">
      <div class="modal">
        <div class="modal-header">
          <h3>{{ editingInvoice ? 'Edit Invoice' : 'New Invoice' }}</h3>
          <span @click="showModal = false" class="modal-close">✕</span>
        </div>
        <div class="modal-body">
          <div class="form-grid">
            <div class="input-group">
              <label>Invoice Date</label>
              <input v-model="form.bill_date" type="date" />
            </div>
            <div class="input-group">
              <label>Due Date</label>
              <input v-model="form.bill_due_date" type="date" />
            </div>
            <div class="input-group">
              <label>Subtotal</label>
              <input v-model="form.bill_subtotal" type="number" placeholder="0.00" />
            </div>
            <div class="input-group">
              <label>Final Amount</label>
              <input v-model="form.bill_final_amount" type="number" placeholder="0.00" />
            </div>
            <div class="input-group">
              <label>Status</label>
              <select v-model="form.bill_status">
                <option value="draft">📝 Draft</option>
                <option value="sent">📤 Sent</option>
                <option value="paid">✅ Paid</option>
                <option value="overdue">⚠️ Overdue</option>
                <option value="cancelled">🔴 Cancelled</option>
              </select>
            </div>
            <div class="input-group">
              <label>Discount Type</label>
              <select v-model="form.bill_discount_type">
                <option value="percent">Percent %</option>
                <option value="fixed">Fixed</option>
              </select>
            </div>
            <div class="input-group full">
              <label>Notes</label>
              <textarea v-model="form.bill_notes" placeholder="Invoice notes..."></textarea>
            </div>
            <div class="input-group full">
              <label>Terms</label>
              <textarea v-model="form.bill_terms" placeholder="Payment terms..."></textarea>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button class="btn-cancel" @click="showModal = false">Cancel</button>
          <button class="btn-save" @click="saveInvoice">
            {{ editingInvoice ? 'Update' : 'Create' }} Invoice
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
const invoices = ref([])
const loading = ref(true)
const search = ref("")
const statusFilter = ref("")
const showModal = ref(false)
const editingInvoice = ref(null)

const form = ref({
  bill_date: "",
  bill_due_date: "",
  bill_subtotal: 0,
  bill_final_amount: 0,
  bill_status: "draft",
  bill_discount_type: "percent",
  bill_notes: "",
  bill_terms: "",
})

const initials = computed(() => (auth.user?.email || "A")[0].toUpperCase())

const totalAmount = computed(() => {
  const total = invoices.value.reduce((sum, i) => sum + parseFloat(i.bill_final_amount || 0), 0)
  return total.toFixed(2) + ' TND'
})

const filteredInvoices = computed(() => {
  let list = invoices.value
  if (search.value) {
    const s = search.value.toLowerCase()
    list = list.filter(i =>
      (i.bill_uniqueid || "").toLowerCase().includes(s) ||
      String(i.bill_invoiceid).includes(s)
    )
  }
  if (statusFilter.value) {
    list = list.filter(i => i.bill_status === statusFilter.value)
  }
  return list
})

function getStatusClass(status) {
  if (status === 'paid') return 'badge-green'
  if (status === 'sent') return 'badge-blue'
  if (status === 'overdue') return 'badge-red'
  if (status === 'cancelled') return 'badge-gray'
  return 'badge-yellow'
}

function getStatusLabel(status) {
  if (status === 'paid') return '✅ Paid'
  if (status === 'sent') return '📤 Sent'
  if (status === 'overdue') return '⚠️ Overdue'
  if (status === 'cancelled') return '🔴 Cancelled'
  return '📝 Draft'
}

function formatDate(date) {
  if (!date) return '—'
  return new Date(date).toLocaleDateString('en-GB', { day: '2-digit', month: 'short', year: 'numeric' })
}

function formatAmount(amount) {
  if (!amount) return '0.00 TND'
  return parseFloat(amount).toFixed(2) + ' TND'
}

function isOverdue(dueDate) {
  if (!dueDate) return false
  return new Date(dueDate) < new Date()
}

onMounted(async () => {
  if (auth.token && !auth.user) await auth.fetchMe()
  await loadInvoices()
})

async function loadInvoices() {
  loading.value = true
  try {
    const res = await api.get("/invoices")
    invoices.value = res.data
  } catch (e) {
    console.error(e)
  } finally {
    loading.value = false
  }
}

function openModal(invoice = null) {
  editingInvoice.value = invoice
  if (invoice) {
    form.value = {
      bill_date: invoice.bill_date || "",
      bill_due_date: invoice.bill_due_date || "",
      bill_subtotal: invoice.bill_subtotal || 0,
      bill_final_amount: invoice.bill_final_amount || 0,
      bill_status: invoice.bill_status || "draft",
      bill_discount_type: invoice.bill_discount_type || "percent",
      bill_notes: invoice.bill_notes || "",
      bill_terms: invoice.bill_terms || "",
    }
  } else {
    form.value = {
      bill_date: "",
      bill_due_date: "",
      bill_subtotal: 0,
      bill_final_amount: 0,
      bill_status: "draft",
      bill_discount_type: "percent",
      bill_notes: "",
      bill_terms: "",
    }
  }
  showModal.value = true
}

async function saveInvoice() {
  try {
    if (editingInvoice.value) {
      await api.put(`/invoices/${editingInvoice.value.bill_invoiceid}`, form.value)
    } else {
      await api.post("/invoices", form.value)
    }
    showModal.value = false
    await loadInvoices()
  } catch (e) {
    console.error(e)
  }
}

async function deleteInvoice(id) {
  if (!confirm("Are you sure?")) return
  try {
    await api.delete(`/invoices/${id}`)
    await loadInvoices()
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
.stats-row { display: flex; gap: 16px; flex-wrap: wrap; }
.stat-mini { background: white; border-radius: 12px; padding: 16px 24px; display: flex; flex-direction: column; gap: 4px; box-shadow: 0 1px 4px rgba(0,0,0,0.06); min-width: 120px; }
.stat-mini.blue { border-left: 4px solid #2563eb; }
.stat-mini.green { border-left: 4px solid #22c55e; }
.stat-mini.yellow { border-left: 4px solid #f59e0b; }
.stat-mini.red { border-left: 4px solid #ef4444; }
.stat-mini.purple { border-left: 4px solid #8b5cf6; }
.stat-num { font-size: 20px; font-weight: 700; color: #0f172a; }
.stat-lbl { font-size: 12px; color: #94a3b8; }
.filters-bar { display: flex; gap: 12px; align-items: center; flex-wrap: wrap; }
.search-input { flex: 1; min-width: 200px; padding: 10px 16px; border: 1.5px solid #e2e8f0; border-radius: 10px; font-size: 14px; outline: none; }
.search-input:focus { border-color: #2563eb; }
.filter-tabs { display: flex; gap: 6px; flex-wrap: wrap; }
.tab { padding: 8px 14px; border: 1.5px solid #e2e8f0; border-radius: 8px; background: white; font-size: 13px; cursor: pointer; color: #64748b; transition: all 0.2s; }
.tab:hover { border-color: #2563eb; color: #2563eb; }
.tab.active { background: #2563eb; color: white; border-color: #2563eb; }
.table-card { background: white; border-radius: 14px; box-shadow: 0 1px 4px rgba(0,0,0,0.06); overflow: hidden; }
table { width: 100%; border-collapse: collapse; }
thead { background: #f8fafc; }
th { padding: 14px 20px; text-align: left; font-size: 12px; font-weight: 700; color: #64748b; text-transform: uppercase; letter-spacing: 0.5px; }
td { padding: 14px 20px; font-size: 14px; color: #374151; border-top: 1px solid #f1f5f9; }
.loading { text-align: center; color: #94a3b8; padding: 40px; }
.invoice-num { display: flex; align-items: center; gap: 10px; }
.invoice-icon { font-size: 18px; }
.amount { color: #0f172a; font-size: 15px; }
.overdue-date { color: #ef4444; font-weight: 600; }
.badge { padding: 4px 10px; border-radius: 20px; font-size: 12px; font-weight: 600; }
.badge-green { background: #dcfce7; color: #16a34a; }
.badge-blue { background: #dbeafe; color: #2563eb; }
.badge-red { background: #fff1f2; color: #ef4444; }
.badge-yellow { background: #fef9c3; color: #ca8a04; }
.badge-gray { background: #f1f5f9; color: #64748b; }
.actions { display: flex; gap: 8px; }
.btn-edit { padding: 6px 12px; background: #eff6ff; color: #2563eb; border: none; border-radius: 6px; font-size: 12px; cursor: pointer; }
.btn-edit:hover { background: #dbeafe; }
.btn-delete { padding: 6px 10px; background: #fff1f2; color: #ef4444; border: none; border-radius: 6px; font-size: 12px; cursor: pointer; }
.btn-delete:hover { background: #fecdd3; }
.pagination { display: flex; justify-content: flex-end; }
.page-info { font-size: 13px; color: #94a3b8; }
.modal-overlay { position: fixed; inset: 0; background: rgba(0,0,0,0.4); display: flex; align-items: center; justify-content: center; z-index: 100; }
.modal { background: white; border-radius: 16px; width: 560px; max-height: 90vh; overflow-y: auto; box-shadow: 0 20px 60px rgba(0,0,0,0.15); }
.modal-header { padding: 24px; border-bottom: 1px solid #e2e8f0; display: flex; justify-content: space-between; align-items: center; }
.modal-header h3 { font-size: 18px; font-weight: 700; color: #0f172a; }
.modal-close { cursor: pointer; color: #94a3b8; font-size: 18px; }
.modal-body { padding: 24px; display: flex; flex-direction: column; gap: 16px; }
.form-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 16px; }
.input-group { display: flex; flex-direction: column; gap: 6px; }
.input-group.full { grid-column: 1 / -1; }
.input-group label { font-size: 13px; font-weight: 600; color: #374151; }
.input-group input, .input-group select, .input-group textarea { padding: 10px 14px; border: 1.5px solid #e2e8f0; border-radius: 8px; font-size: 14px; outline: none; transition: border 0.2s; font-family: inherit; }
.input-group input:focus, .input-group select:focus, .input-group textarea:focus { border-color: #2563eb; }
.input-group textarea { resize: vertical; min-height: 80px; }
.modal-footer { padding: 20px 24px; border-top: 1px solid #e2e8f0; display: flex; justify-content: flex-end; gap: 12px; }
.btn-cancel { padding: 10px 20px; background: #f1f5f9; color: #64748b; border: none; border-radius: 8px; font-size: 14px; cursor: pointer; }
.btn-save { padding: 10px 20px; background: #2563eb; color: white; border: none; border-radius: 8px; font-size: 14px; font-weight: 600; cursor: pointer; }
.btn-save:hover { background: #1d4ed8; }
</style>