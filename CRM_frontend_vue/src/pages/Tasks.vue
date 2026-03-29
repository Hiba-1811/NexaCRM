import { createRouter, createWebHistory } from "vue-router"
import Login from "../pages/Login.vue"
import Dashboard from "../pages/Dashboard.vue"
import Clients from "../pages/Clients.vue"
import Projects from "../pages/Projects.vue"
import Tasks from "../pages/Tasks.vue"
import { useAuthStore } from "../stores/authStore"

const routes = [
  { path: "/", name: "login", component: Login },
  { path: "/dashboard", name: "dashboard", component: Dashboard, meta: { requiresAuth: true } },
  { path: "/clients", name: "clients", component: Clients, meta: { requiresAuth: true } },
  { path: "/projects", name: "projects", component: Projects, meta: { requiresAuth: true } },
  { path: "/tasks", name: "tasks", component: Tasks, meta: { requiresAuth: true } }
]

const router = createRouter({ history: createWebHistory(), routes })

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
          <li class="active"><span class="icon">✓</span> Tasks</li>
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
          <h1>Tasks</h1>
          <p>Manage and track all your tasks</p>
        </div>
        <button class="btn-add" @click="openModal()">+ New Task</button>
      </header>

      <section class="content">

        <!-- Stats -->
        <div class="stats-row">
          <div class="stat-mini blue">
            <span class="stat-num">{{ tasks.length }}</span>
            <span class="stat-lbl">Total</span>
          </div>
          <div class="stat-mini green">
            <span class="stat-num">{{ tasks.filter(t => t.task_status === 1).length }}</span>
            <span class="stat-lbl">Open</span>
          </div>
          <div class="stat-mini yellow">
            <span class="stat-num">{{ tasks.filter(t => t.task_status === 2).length }}</span>
            <span class="stat-lbl">In Progress</span>
          </div>
          <div class="stat-mini gray">
            <span class="stat-num">{{ tasks.filter(t => t.task_status === 3).length }}</span>
            <span class="stat-lbl">Finished</span>
          </div>
        </div>

        <!-- Filters -->
        <div class="filters-bar">
          <input v-model="search" placeholder="🔍 Search tasks..." class="search-input" />
          <div class="filter-tabs">
            <button :class="['tab', statusFilter === '' ? 'active' : '']" @click="statusFilter = ''">All</button>
            <button :class="['tab', statusFilter === '1' ? 'active' : '']" @click="statusFilter = '1'">🟢 Open</button>
            <button :class="['tab', statusFilter === '2' ? 'active' : '']" @click="statusFilter = '2'">🟡 In Progress</button>
            <button :class="['tab', statusFilter === '3' ? 'active' : '']" @click="statusFilter = '3'">✅ Finished</button>
            <button :class="['tab', statusFilter === '4' ? 'active' : '']" @click="statusFilter = '4'">🔴 Cancelled</button>
          </div>
          <select v-model="priorityFilter" class="sort-select">
            <option value="">All Priorities</option>
            <option value="1">🔴 High</option>
            <option value="2">🟡 Medium</option>
            <option value="3">🟢 Low</option>
          </select>
        </div>

        <!-- Kanban Board -->
        <div class="kanban-board">

          <!-- Open -->
          <div class="kanban-col">
            <div class="kanban-header open">
              <span>🟢 Open</span>
              <span class="col-count">{{ tasksByStatus(1).length }}</span>
            </div>
            <div class="kanban-cards">
              <div v-if="tasksByStatus(1).length === 0" class="kanban-empty">No tasks</div>
              <div v-for="task in tasksByStatus(1)" :key="task.task_id" class="task-card">
                <div class="task-card-top">
                  <span :class="['priority-badge', getPriorityClass(task.task_priority)]">
                    {{ getPriorityLabel(task.task_priority) }}
                  </span>
                  <div class="task-actions">
                    <button class="btn-icon" @click="openModal(task)">✏</button>
                    <button class="btn-icon red" @click="deleteTask(task.task_id)">🗑</button>
                  </div>
                </div>
                <div class="task-title">{{ task.task_title }}</div>
                <div class="task-desc">{{ task.task_description || '—' }}</div>
                <div class="task-footer">
                  <span class="task-date">⏰ {{ formatDate(task.task_date_due) }}</span>
                </div>
              </div>
            </div>
          </div>

          <!-- In Progress -->
          <div class="kanban-col">
            <div class="kanban-header inprogress">
              <span>🟡 In Progress</span>
              <span class="col-count">{{ tasksByStatus(2).length }}</span>
            </div>
            <div class="kanban-cards">
              <div v-if="tasksByStatus(2).length === 0" class="kanban-empty">No tasks</div>
              <div v-for="task in tasksByStatus(2)" :key="task.task_id" class="task-card">
                <div class="task-card-top">
                  <span :class="['priority-badge', getPriorityClass(task.task_priority)]">
                    {{ getPriorityLabel(task.task_priority) }}
                  </span>
                  <div class="task-actions">
                    <button class="btn-icon" @click="openModal(task)">✏</button>
                    <button class="btn-icon red" @click="deleteTask(task.task_id)">🗑</button>
                  </div>
                </div>
                <div class="task-title">{{ task.task_title }}</div>
                <div class="task-desc">{{ task.task_description || '—' }}</div>
                <div class="task-footer">
                  <span class="task-date">⏰ {{ formatDate(task.task_date_due) }}</span>
                </div>
              </div>
            </div>
          </div>

          <!-- Finished -->
          <div class="kanban-col">
            <div class="kanban-header finished">
              <span>✅ Finished</span>
              <span class="col-count">{{ tasksByStatus(3).length }}</span>
            </div>
            <div class="kanban-cards">
              <div v-if="tasksByStatus(3).length === 0" class="kanban-empty">No tasks</div>
              <div v-for="task in tasksByStatus(3)" :key="task.task_id" class="task-card done">
                <div class="task-card-top">
                  <span :class="['priority-badge', getPriorityClass(task.task_priority)]">
                    {{ getPriorityLabel(task.task_priority) }}
                  </span>
                  <div class="task-actions">
                    <button class="btn-icon" @click="openModal(task)">✏</button>
                    <button class="btn-icon red" @click="deleteTask(task.task_id)">🗑</button>
                  </div>
                </div>
                <div class="task-title done-text">{{ task.task_title }}</div>
                <div class="task-desc">{{ task.task_description || '—' }}</div>
                <div class="task-footer">
                  <span class="task-date">⏰ {{ formatDate(task.task_date_due) }}</span>
                </div>
              </div>
            </div>
          </div>

          <!-- Cancelled -->
          <div class="kanban-col">
            <div class="kanban-header cancelled">
              <span>🔴 Cancelled</span>
              <span class="col-count">{{ tasksByStatus(4).length }}</span>
            </div>
            <div class="kanban-cards">
              <div v-if="tasksByStatus(4).length === 0" class="kanban-empty">No tasks</div>
              <div v-for="task in tasksByStatus(4)" :key="task.task_id" class="task-card cancelled-card">
                <div class="task-card-top">
                  <span :class="['priority-badge', getPriorityClass(task.task_priority)]">
                    {{ getPriorityLabel(task.task_priority) }}
                  </span>
                  <div class="task-actions">
                    <button class="btn-icon" @click="openModal(task)">✏</button>
                    <button class="btn-icon red" @click="deleteTask(task.task_id)">🗑</button>
                  </div>
                </div>
                <div class="task-title">{{ task.task_title }}</div>
                <div class="task-desc">{{ task.task_description || '—' }}</div>
                <div class="task-footer">
                  <span class="task-date">⏰ {{ formatDate(task.task_date_due) }}</span>
                </div>
              </div>
            </div>
          </div>

        </div>
      </section>
    </main>

    <!-- Modal -->
    <div v-if="showModal" class="modal-overlay" @click.self="showModal = false">
      <div class="modal">
        <div class="modal-header">
          <h3>{{ editingTask ? 'Edit Task' : 'New Task' }}</h3>
          <span @click="showModal = false" class="modal-close">✕</span>
        </div>
        <div class="modal-body">
          <div class="form-grid">
            <div class="input-group full">
              <label>Task Title *</label>
              <input v-model="form.task_title" placeholder="Task title..." />
            </div>
            <div class="input-group">
              <label>Status</label>
              <select v-model="form.task_status">
                <option value="1">🟢 Open</option>
                <option value="2">🟡 In Progress</option>
                <option value="3">✅ Finished</option>
                <option value="4">🔴 Cancelled</option>
              </select>
            </div>
            <div class="input-group">
              <label>Priority</label>
              <select v-model="form.task_priority">
                <option value="1">🔴 High</option>
                <option value="2">🟡 Medium</option>
                <option value="3">🟢 Low</option>
              </select>
            </div>
            <div class="input-group">
              <label>Start Date</label>
              <input v-model="form.task_date_start" type="date" />
            </div>
            <div class="input-group">
              <label>Due Date</label>
              <input v-model="form.task_date_due" type="date" />
            </div>
            <div class="input-group full">
              <label>Description</label>
              <textarea v-model="form.task_description" placeholder="Task description..."></textarea>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button class="btn-cancel" @click="showModal = false">Cancel</button>
          <button class="btn-save" @click="saveTask">
            {{ editingTask ? 'Update' : 'Create' }} Task
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
const tasks = ref([])
const loading = ref(true)
const search = ref("")
const statusFilter = ref("")
const priorityFilter = ref("")
const showModal = ref(false)
const editingTask = ref(null)

const form = ref({
  task_title: "",
  task_status: 1,
  task_priority: 2,
  task_date_start: "",
  task_date_due: "",
  task_description: "",
})

const initials = computed(() => (auth.user?.email || "A")[0].toUpperCase())

function tasksByStatus(status) {
  let list = tasks.value.filter(t => t.task_status === status)
  if (search.value) {
    const s = search.value.toLowerCase()
    list = list.filter(t => (t.task_title || "").toLowerCase().includes(s))
  }
  if (priorityFilter.value) {
    list = list.filter(t => t.task_priority == priorityFilter.value)
  }
  return list
}

function getPriorityClass(priority) {
  if (priority === 1) return 'priority-high'
  if (priority === 2) return 'priority-medium'
  return 'priority-low'
}

function getPriorityLabel(priority) {
  if (priority === 1) return '🔴 High'
  if (priority === 2) return '🟡 Medium'
  return '🟢 Low'
}

function formatDate(date) {
  if (!date) return '—'
  return new Date(date).toLocaleDateString('en-GB', { day: '2-digit', month: 'short', year: 'numeric' })
}

onMounted(async () => {
  if (auth.token && !auth.user) await auth.fetchMe()
  await loadTasks()
})

async function loadTasks() {
  loading.value = true
  try {
    const res = await api.get("/tasks")
    tasks.value = res.data
  } catch (e) {
    console.error(e)
  } finally {
    loading.value = false
  }
}

function openModal(task = null) {
  editingTask.value = task
  if (task) {
    form.value = {
      task_title: task.task_title || "",
      task_status: task.task_status || 1,
      task_priority: task.task_priority || 2,
      task_date_start: task.task_date_start || "",
      task_date_due: task.task_date_due || "",
      task_description: task.task_description || "",
    }
  } else {
    form.value = {
      task_title: "",
      task_status: 1,
      task_priority: 2,
      task_date_start: "",
      task_date_due: "",
      task_description: "",
    }
  }
  showModal.value = true
}

async function saveTask() {
  try {
    if (editingTask.value) {
      await api.put(`/tasks/${editingTask.value.task_id}`, form.value)
    } else {
      await api.post("/tasks", form.value)
    }
    showModal.value = false
    await loadTasks()
  } catch (e) {
    console.error(e)
  }
}

async function deleteTask(id) {
  if (!confirm("Are you sure?")) return
  try {
    await api.delete(`/tasks/${id}`)
    await loadTasks()
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
.stat-mini.yellow { border-left: 4px solid #f59e0b; }
.stat-mini.gray { border-left: 4px solid #64748b; }
.stat-num { font-size: 24px; font-weight: 700; color: #0f172a; }
.stat-lbl { font-size: 12px; color: #94a3b8; }

.filters-bar { display: flex; gap: 12px; align-items: center; flex-wrap: wrap; }
.search-input { flex: 1; min-width: 200px; padding: 10px 16px; border: 1.5px solid #e2e8f0; border-radius: 10px; font-size: 14px; outline: none; }
.search-input:focus { border-color: #2563eb; }
.filter-tabs { display: flex; gap: 6px; }
.tab { padding: 8px 14px; border: 1.5px solid #e2e8f0; border-radius: 8px; background: white; font-size: 13px; cursor: pointer; color: #64748b; transition: all 0.2s; }
.tab:hover { border-color: #2563eb; color: #2563eb; }
.tab.active { background: #2563eb; color: white; border-color: #2563eb; }
.sort-select { padding: 9px 14px; border: 1.5px solid #e2e8f0; border-radius: 8px; font-size: 13px; outline: none; background: white; }

/* Kanban */
.kanban-board { display: grid; grid-template-columns: repeat(4, 1fr); gap: 16px; min-height: 400px; }

.kanban-col { background: #f8fafc; border-radius: 14px; padding: 16px; display: flex; flex-direction: column; gap: 12px; }

.kanban-header { display: flex; justify-content: space-between; align-items: center; font-size: 13px; font-weight: 700; padding: 8px 12px; border-radius: 8px; }
.kanban-header.open { background: #dcfce7; color: #16a34a; }
.kanban-header.inprogress { background: #fef9c3; color: #ca8a04; }
.kanban-header.finished { background: #dbeafe; color: #2563eb; }
.kanban-header.cancelled { background: #fff1f2; color: #ef4444; }

.col-count { background: white; padding: 2px 8px; border-radius: 20px; font-size: 12px; }

.kanban-cards { display: flex; flex-direction: column; gap: 10px; }
.kanban-empty { text-align: center; color: #94a3b8; font-size: 13px; padding: 20px; }

.task-card { background: white; border-radius: 10px; padding: 14px; box-shadow: 0 1px 4px rgba(0,0,0,0.06); display: flex; flex-direction: column; gap: 8px; transition: all 0.2s; }
.task-card:hover { box-shadow: 0 4px 12px rgba(0,0,0,0.1); }
.task-card.done { opacity: 0.7; }
.task-card.cancelled-card { opacity: 0.6; }

.task-card-top { display: flex; justify-content: space-between; align-items: center; }

.priority-badge { font-size: 11px; font-weight: 600; padding: 2px 8px; border-radius: 20px; }
.priority-high { background: #fff1f2; color: #ef4444; }
.priority-medium { background: #fef9c3; color: #ca8a04; }
.priority-low { background: #dcfce7; color: #16a34a; }

.task-actions { display: flex; gap: 4px; }
.btn-icon { width: 26px; height: 26px; border: none; border-radius: 6px; background: #f1f5f9; cursor: pointer; font-size: 12px; display: flex; align-items: center; justify-content: center; }
.btn-icon:hover { background: #e2e8f0; }
.btn-icon.red:hover { background: #fff1f2; }

.task-title { font-size: 13px; font-weight: 600; color: #0f172a; }
.task-title.done-text { text-decoration: line-through; color: #94a3b8; }
.task-desc { font-size: 12px; color: #94a3b8; line-height: 1.4; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden; }

.task-footer { display: flex; justify-content: flex-end; }
.task-date { font-size: 11px; color: #94a3b8; }

/* Modal */
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