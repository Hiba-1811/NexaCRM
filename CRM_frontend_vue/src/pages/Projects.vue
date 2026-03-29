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
          <li class="active"><span class="icon">📁</span> Projects</li>
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
          <h1>Projects</h1>
          <p>Manage and track all your projects</p>
        </div>
        <button class="btn-add" @click="openModal()">+ New Project</button>
      </header>

      <section class="content">

        <!-- Stats -->
        <div class="stats-row">
          <div class="stat-mini blue">
            <span class="stat-num">{{ projects.length }}</span>
            <span class="stat-lbl">Total</span>
          </div>
          <div class="stat-mini green">
            <span class="stat-num">{{ projects.filter(p => p.project_status === 'open').length }}</span>
            <span class="stat-lbl">Open</span>
          </div>
          <div class="stat-mini yellow">
            <span class="stat-num">{{ projects.filter(p => p.project_status === 'in_progress').length }}</span>
            <span class="stat-lbl">In Progress</span>
          </div>
          <div class="stat-mini gray">
            <span class="stat-num">{{ projects.filter(p => p.project_status === 'finished').length }}</span>
            <span class="stat-lbl">Finished</span>
          </div>
        </div>

        <!-- Filters -->
        <div class="filters-bar">
          <input v-model="search" placeholder="🔍 Search projects..." class="search-input" />
          <div class="filter-tabs">
            <button :class="['tab', statusFilter === '' ? 'active' : '']" @click="statusFilter = ''">All</button>
            <button :class="['tab', statusFilter === 'open' ? 'active' : '']" @click="statusFilter = 'open'">🟢 Open</button>
            <button :class="['tab', statusFilter === 'in_progress' ? 'active' : '']" @click="statusFilter = 'in_progress'">🟡 In Progress</button>
            <button :class="['tab', statusFilter === 'finished' ? 'active' : '']" @click="statusFilter = 'finished'">✅ Finished</button>
            <button :class="['tab', statusFilter === 'cancelled' ? 'active' : '']" @click="statusFilter = 'cancelled'">🔴 Cancelled</button>
          </div>
        </div>

        <!-- Cards Grid -->
        <div v-if="loading" class="loading">Loading...</div>
        <div v-else-if="filteredProjects.length === 0" class="loading">No projects found</div>
        <div v-else class="projects-grid">
          <div v-for="project in filteredProjects" :key="project.project_id" class="project-card">
            <div class="project-card-header">
              <div class="project-icon">📁</div>
              <span :class="['badge', getStatusClass(project.project_status)]">
                {{ getStatusLabel(project.project_status) }}
              </span>
            </div>
            <div class="project-title">{{ project.project_title }}</div>
            <div class="project-desc">{{ project.project_description || 'No description' }}</div>
            <div class="project-dates">
              <span>📅 {{ formatDate(project.project_date_start) }}</span>
              <span>⏰ {{ formatDate(project.project_date_due) }}</span>
            </div>
            <div class="progress-section">
              <div class="progress-header">
                <span>Progress</span>
                <span>{{ project.project_progress || 0 }}%</span>
              </div>
              <div class="progress-bar">
                <div class="fill" :style="`width:${project.project_progress || 0}%`"
                  :class="getProgressColor(project.project_progress)"></div>
              </div>
            </div>
            <div class="project-actions">
              <button class="btn-edit" @click="openModal(project)">✏ Edit</button>
              <button class="btn-delete" @click="deleteProject(project.project_id)">🗑</button>
            </div>
          </div>
        </div>

      </section>
    </main>

    <!-- Modal -->
    <div v-if="showModal" class="modal-overlay" @click.self="showModal = false">
      <div class="modal">
        <div class="modal-header">
          <h3>{{ editingProject ? 'Edit Project' : 'New Project' }}</h3>
          <span @click="showModal = false" class="modal-close">✕</span>
        </div>
        <div class="modal-body">
          <div class="form-grid">
            <div class="input-group full">
              <label>Project Title *</label>
              <input v-model="form.project_title" placeholder="My Project" />
            </div>
            <div class="input-group">
              <label>Status</label>
              <select v-model="form.project_status">
                <option value="open">🟢 Open</option>
                <option value="in_progress">🟡 In Progress</option>
                <option value="finished">✅ Finished</option>
                <option value="cancelled">🔴 Cancelled</option>
              </select>
            </div>
            <div class="input-group">
              <label>Progress (%)</label>
              <input v-model="form.project_progress" type="number" min="0" max="100" placeholder="0" />
            </div>
            <div class="input-group">
              <label>Start Date</label>
              <input v-model="form.project_date_start" type="date" />
            </div>
            <div class="input-group">
              <label>Due Date</label>
              <input v-model="form.project_date_due" type="date" />
            </div>
            <div class="input-group full">
              <label>Description</label>
              <textarea v-model="form.project_description" placeholder="Project description..."></textarea>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button class="btn-cancel" @click="showModal = false">Cancel</button>
          <button class="btn-save" @click="saveProject">
            {{ editingProject ? 'Update' : 'Create' }} Project
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
const projects = ref([])
const loading = ref(true)
const search = ref("")
const statusFilter = ref("")
const showModal = ref(false)
const editingProject = ref(null)

const form = ref({
  project_title: "",
  project_status: "open",
  project_progress: 0,
  project_date_start: "",
  project_date_due: "",
  project_description: "",
})

const initials = computed(() => (auth.user?.email || "A")[0].toUpperCase())

const filteredProjects = computed(() => {
  let list = projects.value
  if (search.value) {
    const s = search.value.toLowerCase()
    list = list.filter(p => (p.project_title || "").toLowerCase().includes(s))
  }
  if (statusFilter.value) {
    list = list.filter(p => p.project_status === statusFilter.value)
  }
  return list
})

function getStatusClass(status) {
  if (status === 'open') return 'badge-green'
  if (status === 'in_progress') return 'badge-yellow'
  if (status === 'finished') return 'badge-blue'
  if (status === 'cancelled') return 'badge-red'
  return 'badge-green'
}

function getStatusLabel(status) {
  if (status === 'open') return '🟢 Open'
  if (status === 'in_progress') return '🟡 In Progress'
  if (status === 'finished') return '✅ Finished'
  if (status === 'cancelled') return '🔴 Cancelled'
  return status
}

function getProgressColor(progress) {
  if (progress >= 80) return 'green'
  if (progress >= 40) return 'blue'
  return 'yellow'
}

function formatDate(date) {
  if (!date) return '—'
  return new Date(date).toLocaleDateString('en-GB', { day: '2-digit', month: 'short', year: 'numeric' })
}

onMounted(async () => {
  if (auth.token && !auth.user) await auth.fetchMe()
  await loadProjects()
})

async function loadProjects() {
  loading.value = true
  try {
    const res = await api.get("/projects")
    projects.value = res.data
  } catch (e) {
    console.error(e)
  } finally {
    loading.value = false
  }
}

function openModal(project = null) {
  editingProject.value = project
  if (project) {
    form.value = {
      project_title: project.project_title || "",
      project_status: project.project_status || "open",
      project_progress: project.project_progress || 0,
      project_date_start: project.project_date_start || "",
      project_date_due: project.project_date_due || "",
      project_description: project.project_description || "",
    }
  } else {
    form.value = {
      project_title: "",
      project_status: "open",
      project_progress: 0,
      project_date_start: "",
      project_date_due: "",
      project_description: "",
    }
  }
  showModal.value = true
}

async function saveProject() {
  try {
    if (editingProject.value) {
      await api.put(`/projects/${editingProject.value.project_id}`, form.value)
    } else {
      await api.post("/projects", form.value)
    }
    showModal.value = false
    await loadProjects()
  } catch (e) {
    console.error(e)
  }
}

async function deleteProject(id) {
  if (!confirm("Are you sure?")) return
  try {
    await api.delete(`/projects/${id}`)
    await loadProjects()
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
  display: flex; height: 100vh;
  font-family: 'Inter', 'Segoe UI', sans-serif;
  background: #f1f5f9;
}

.sidebar {
  width: 250px; background: #0f172a; color: white;
  display: flex; flex-direction: column; padding: 24px 16px; flex-shrink: 0;
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

.main { flex: 1; overflow-y: auto; }
.topbar { background: white; padding: 20px 30px; border-bottom: 1px solid #e2e8f0; display: flex; justify-content: space-between; align-items: center; }
.topbar h1 { font-size: 22px; font-weight: 700; color: #0f172a; }
.topbar p { font-size: 13px; color: #94a3b8; margin-top: 2px; }

.btn-add { padding: 10px 20px; background: #2563eb; color: white; border: none; border-radius: 10px; font-size: 14px; font-weight: 600; cursor: pointer; transition: background 0.2s; }
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
.search-input { flex: 1; min-width: 200px; padding: 10px 16px; border: 1.5px solid #e2e8f0; border-radius: 10px; font-size: 14px; outline: none; transition: border 0.2s; }
.search-input:focus { border-color: #2563eb; }
.filter-tabs { display: flex; gap: 6px; }
.tab { padding: 8px 14px; border: 1.5px solid #e2e8f0; border-radius: 8px; background: white; font-size: 13px; cursor: pointer; color: #64748b; transition: all 0.2s; }
.tab:hover { border-color: #2563eb; color: #2563eb; }
.tab.active { background: #2563eb; color: white; border-color: #2563eb; }

.loading { text-align: center; color: #94a3b8; padding: 60px; font-size: 14px; }

.projects-grid { display: grid; grid-template-columns: repeat(3, 1fr); gap: 16px; }

.project-card { background: white; border-radius: 14px; padding: 20px; box-shadow: 0 1px 4px rgba(0,0,0,0.06); display: flex; flex-direction: column; gap: 12px; transition: all 0.2s; }
.project-card:hover { box-shadow: 0 4px 15px rgba(0,0,0,0.1); transform: translateY(-2px); }

.project-card-header { display: flex; justify-content: space-between; align-items: center; }
.project-icon { font-size: 24px; }

.badge { padding: 4px 10px; border-radius: 20px; font-size: 12px; font-weight: 600; }
.badge-green { background: #dcfce7; color: #16a34a; }
.badge-yellow { background: #fef9c3; color: #ca8a04; }
.badge-blue { background: #dbeafe; color: #2563eb; }
.badge-red { background: #fff1f2; color: #ef4444; }

.project-title { font-size: 16px; font-weight: 700; color: #0f172a; }
.project-desc { font-size: 13px; color: #94a3b8; line-height: 1.5; display: -webkit-box; -webkit-line-clamp: 2; -webkit-box-orient: vertical; overflow: hidden; }

.project-dates { display: flex; justify-content: space-between; font-size: 12px; color: #64748b; }

.progress-section { display: flex; flex-direction: column; gap: 6px; }
.progress-header { display: flex; justify-content: space-between; font-size: 12px; color: #64748b; }
.progress-bar { height: 6px; background: #f1f5f9; border-radius: 10px; overflow: hidden; }
.fill { height: 100%; border-radius: 10px; transition: width 0.5s; }
.fill.green { background: #22c55e; }
.fill.blue { background: #2563eb; }
.fill.yellow { background: #f59e0b; }

.project-actions { display: flex; gap: 8px; margin-top: 4px; }
.btn-edit { padding: 6px 12px; background: #eff6ff; color: #2563eb; border: none; border-radius: 6px; font-size: 12px; cursor: pointer; }
.btn-edit:hover { background: #dbeafe; }
.btn-delete { padding: 6px 10px; background: #fff1f2; color: #ef4444; border: none; border-radius: 6px; font-size: 12px; cursor: pointer; }
.btn-delete:hover { background: #fecdd3; }

/* Modal */
.modal-overlay { position: fixed; inset: 0; background: rgba(0,0,0,0.4); display: flex; align-items: center; justify-content: center; z-index: 100; }
.modal { background: white; border-radius: 16px; width: 560px; max-height: 90vh; overflow-y: auto; box-shadow: 0 20px 60px rgba(0,0,0,0.15); }
.modal-header { padding: 24px; border-bottom: 1px solid #e2e8f0; display: flex; justify-content: space-between; align-items: center; }
.modal-header h3 { font-size: 18px; font-weight: 700; color: #0f172a; }
.modal-close { cursor: pointer; color: #94a3b8; font-size: 18px; }
.modal-close:hover { color: #0f172a; }
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
.btn-cancel:hover { background: #e2e8f0; }
.btn-save { padding: 10px 20px; background: #2563eb; color: white; border: none; border-radius: 8px; font-size: 14px; font-weight: 600; cursor: pointer; }
.btn-save:hover { background: #1d4ed8; }
</style>