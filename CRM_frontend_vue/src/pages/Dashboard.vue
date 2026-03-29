<template>
  <div class="dashboard">

    <aside class="sidebar">
      <div class="sidebar-brand">
        <div class="logo-icon">N</div>
        <span>NexaCRM</span>
      </div>
      <nav class="sidebar-nav">
        <div class="nav-label">MAIN MENU</div>
        <ul>
          <li class="active"><span class="icon">⊞</span> Dashboard</li>
          <li @click="router.push('/clients')"><span class="icon">👥</span> Clients</li>
          <li @click="router.push('/projects')"><span class="icon">📁</span> Projects</li>
          <li @click="router.push('/tasks')"><span class="icon">✓</span> Tasks</li>
          <li @click="router.push('/invoices')"><span class="icon">🧾</span> Invoices</li>
          <li @click="router.push('/tickets')"><span class="icon">🎫</span> Tickets</li>
          <li @click="router.push('/users')"><span class="icon">👤</span> Users</li>
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
          <h1>Dashboard</h1>
          <p>Welcome back! Here's what's happening today.</p>
        </div>
        <div class="topbar-right">
          <div class="date-badge">📅 {{ currentDate }}</div>
          <NotificationBell />
        </div>
      </header>

      <section class="content">

        <!-- Stats Grid -->
        <div class="stats-grid">
          <div class="stat-card" style="border-top: 3px solid #2563eb">
            <div class="stat-icon blue">👥</div>
            <div class="stat-right">
              <span class="stat-value">{{ stats.clients?.total ?? '...' }}</span>
              <span class="stat-label">Total Clients</span>
              <div class="stat-sub">
                <span class="badge-sm green">{{ stats.clients?.active ?? 0 }} Active</span>
                <span class="badge-sm red">{{ stats.clients?.inactive ?? 0 }} Inactive</span>
              </div>
            </div>
          </div>
          <div class="stat-card" style="border-top: 3px solid #8b5cf6">
            <div class="stat-icon purple">📁</div>
            <div class="stat-right">
              <span class="stat-value">{{ stats.projects?.total ?? '...' }}</span>
              <span class="stat-label">Total Projects</span>
              <div class="stat-sub">
                <span class="badge-sm purple">{{ stats.projects?.open ?? 0 }} Open</span>
                <span class="badge-sm gray">{{ stats.projects?.finished ?? 0 }} Done</span>
              </div>
            </div>
          </div>
          <div class="stat-card" style="border-top: 3px solid #06b6d4">
            <div class="stat-icon cyan">✓</div>
            <div class="stat-right">
              <span class="stat-value">{{ stats.tasks?.total ?? '...' }}</span>
              <span class="stat-label">Total Tasks</span>
              <div class="stat-sub">
                <span class="badge-sm cyan">{{ stats.tasks?.in_progress ?? 0 }} In Progress</span>
                <span class="badge-sm green">{{ stats.tasks?.finished ?? 0 }} Done</span>
              </div>
            </div>
          </div>
          <div class="stat-card" style="border-top: 3px solid #22c55e">
            <div class="stat-icon green">💰</div>
            <div class="stat-right">
              <span class="stat-value">{{ stats.invoices?.total_revenue?.toFixed(0) ?? '0' }}</span>
              <span class="stat-label">Total Revenue (TND)</span>
              <div class="stat-sub">
                <span class="badge-sm green">{{ stats.invoices?.paid ?? 0 }} Paid</span>
                <span class="badge-sm yellow">{{ stats.invoices?.unpaid ?? 0 }} Unpaid</span>
              </div>
            </div>
          </div>
        </div>

        <!-- Quick Actions -->
        <div class="section-title">⚡ Quick Actions</div>
        <div class="quick-actions-grid">
          <div class="qa-card" @click="router.push('/clients')"><span class="qa-icon">👥</span><span>Add Client</span></div>
          <div class="qa-card" @click="router.push('/projects')"><span class="qa-icon">📁</span><span>New Project</span></div>
          <div class="qa-card" @click="router.push('/tasks')"><span class="qa-icon">✓</span><span>New Task</span></div>
          <div class="qa-card" @click="router.push('/invoices')"><span class="qa-icon">🧾</span><span>New Invoice</span></div>
          <div class="qa-card" @click="router.push('/tickets')"><span class="qa-icon">🎫</span><span>New Ticket</span></div>
          <div class="qa-card"><span class="qa-icon">📊</span><span>Reports</span></div>
        </div>

        <!-- Tasks Progress -->
        <div class="section-title">✓ Tasks Progress</div>
        <div class="tasks-progress-card">
          <div class="tp-item">
            <div class="tp-header">
              <span>🟢 Open</span>
              <span>{{ stats.tasks?.open ?? 0 }}</span>
            </div>
            <div class="progress-bar">
              <div class="fill blue" :style="`width:${taskPercent('open')}%`"></div>
            </div>
          </div>
          <div class="tp-item">
            <div class="tp-header">
              <span>🟡 In Progress</span>
              <span>{{ stats.tasks?.in_progress ?? 0 }}</span>
            </div>
            <div class="progress-bar">
              <div class="fill yellow" :style="`width:${taskPercent('in_progress')}%`"></div>
            </div>
          </div>
          <div class="tp-item">
            <div class="tp-header">
              <span>✅ Finished</span>
              <span>{{ stats.tasks?.finished ?? 0 }}</span>
            </div>
            <div class="progress-bar">
              <div class="fill green" :style="`width:${taskPercent('finished')}%`"></div>
            </div>
          </div>
        </div>

        <!-- Revenue Chart -->
        <div class="section-title">📈 Revenue (Last 6 Months)</div>
        <div class="revenue-card">
          <div class="chart-bars">
            <div v-for="item in stats.revenue_chart" :key="item.month" class="bar-group">
              <div class="bar-wrap">
                <div class="bar-value">{{ item.amount > 0 ? item.amount.toFixed(0) : '' }}</div>
                <div class="bar" :style="`height:${getBarHeight(item.amount)}px`"></div>
              </div>
              <span class="bar-label">{{ item.month.split(' ')[0] }}</span>
            </div>
          </div>
        </div>

        <div class="bottom-grid">

          <!-- Recent Invoices -->
          <div class="panel">
            <div class="panel-header">
              <span>🧾 Recent Invoices</span>
              <span class="panel-link" @click="router.push('/invoices')">View all →</span>
            </div>
            <div class="list-items">
              <div v-if="!stats.recent_invoices?.length" class="empty">No invoices yet</div>
              <div v-for="inv in stats.recent_invoices" :key="inv.bill_invoiceid" class="list-row">
                <div class="list-icon">🧾</div>
                <div class="list-info">
                  <b>#{{ inv.bill_uniqueid || inv.bill_invoiceid }}</b>
                  <span>{{ formatDate(inv.bill_date) }}</span>
                </div>
                <div class="list-right">
                  <b class="amount-text">{{ parseFloat(inv.bill_final_amount || 0).toFixed(2) }} TND</b>
                  <span :class="['badge-xs', getInvStatusClass(inv.bill_status)]">{{ inv.bill_status }}</span>
                </div>
              </div>
            </div>
          </div>

          <!-- Recent Tickets -->
          <div class="panel">
            <div class="panel-header">
              <span>🎫 Recent Tickets</span>
              <span class="panel-link" @click="router.push('/tickets')">View all →</span>
            </div>
            <div class="list-items">
              <div v-if="!stats.recent_tickets?.length" class="empty">No tickets yet</div>
              <div v-for="ticket in stats.recent_tickets" :key="ticket.ticket_id" class="list-row">
                <div class="list-icon">🎫</div>
                <div class="list-info">
                  <b>{{ ticket.ticket_subject }}</b>
                  <span>{{ formatDate(ticket.ticket_created) }}</span>
                </div>
                <div class="list-right">
                  <span :class="['badge-xs', getTicketStatusClass(ticket.ticket_status)]">
                    {{ getTicketStatusLabel(ticket.ticket_status) }}
                  </span>
                </div>
              </div>
            </div>
          </div>

          <!-- Upcoming Due Dates -->
          <div class="panel">
            <div class="panel-header">
              <span>⏰ Upcoming Due Dates</span>
            </div>
            <div class="list-items">
              <div v-if="!stats.upcoming?.length" class="empty">No upcoming deadlines 🎉</div>
              <div v-for="item in stats.upcoming" :key="item.title" class="list-row">
                <div class="list-icon">{{ item.icon }}</div>
                <div class="list-info">
                  <b>{{ item.title }}</b>
                  <span class="due-date" :class="isDueSoon(item.due) ? 'urgent' : ''">
                    Due: {{ formatDate(item.due) }}
                  </span>
                </div>
                <div class="list-right">
                  <span v-if="isDueSoon(item.due)" class="badge-xs red">⚠️ Soon</span>
                </div>
              </div>
            </div>
          </div>

          <!-- Clients Overview -->
          <div class="panel">
            <div class="panel-header">
              <span>📊 Clients Overview</span>
            </div>
            <div class="chart-container">
              <svg viewBox="0 0 120 120" width="150" height="150">
                <circle cx="60" cy="60" r="50" fill="none" stroke="#f1f5f9" stroke-width="20"/>
                <circle cx="60" cy="60" r="50" fill="none" stroke="#2563eb" stroke-width="20"
                  :stroke-dasharray="`${activePercent * 3.14} 314`"
                  stroke-dashoffset="78.5" transform="rotate(-90 60 60)"/>
                <circle cx="60" cy="60" r="50" fill="none" stroke="#ef4444" stroke-width="20"
                  :stroke-dasharray="`${inactivePercent * 3.14} 314`"
                  :stroke-dashoffset="`${78.5 - activePercent * 3.14}`" transform="rotate(-90 60 60)"/>
                <circle cx="60" cy="60" r="50" fill="none" stroke="#f59e0b" stroke-width="20"
                  :stroke-dasharray="`${prospectPercent * 3.14} 314`"
                  :stroke-dashoffset="`${78.5 - (activePercent + inactivePercent) * 3.14}`" transform="rotate(-90 60 60)"/>
                <text x="60" y="55" text-anchor="middle" font-size="16" font-weight="bold" fill="#0f172a">{{ stats.clients?.total ?? 0 }}</text>
                <text x="60" y="70" text-anchor="middle" font-size="8" fill="#94a3b8">Total</text>
              </svg>
              <div class="chart-legend">
                <div class="legend-item"><span class="legend-dot" style="background:#2563eb"></span><span>Active ({{ stats.clients?.active ?? 0 }})</span></div>
                <div class="legend-item"><span class="legend-dot" style="background:#ef4444"></span><span>Inactive ({{ stats.clients?.inactive ?? 0 }})</span></div>
                <div class="legend-item"><span class="legend-dot" style="background:#f59e0b"></span><span>Prospect ({{ stats.clients?.prospect ?? 0 }})</span></div>
              </div>
            </div>
          </div>

        </div>
      </section>
    </main>
  </div>
</template>

<script setup>
import { ref, computed, onMounted } from "vue"
import { useAuthStore } from "../stores/authStore"
import { useRouter } from "vue-router"
import api from "../services/api"
import NotificationBell from "../components/NotificationBell.vue"

const auth = useAuthStore()
const router = useRouter()
const stats = ref({})

const initials = computed(() => (auth.user?.email || "A")[0].toUpperCase())
const currentDate = computed(() => new Date().toLocaleDateString('en-US', { weekday: 'long', year: 'numeric', month: 'long', day: 'numeric' }))

const activePercent = computed(() => {
  const total = stats.value.clients?.total || 0
  if (!total) return 0
  return Math.round((stats.value.clients?.active / total) * 100)
})
const inactivePercent = computed(() => {
  const total = stats.value.clients?.total || 0
  if (!total) return 0
  return Math.round((stats.value.clients?.inactive / total) * 100)
})
const prospectPercent = computed(() => {
  const total = stats.value.clients?.total || 0
  if (!total) return 0
  return Math.round((stats.value.clients?.prospect / total) * 100)
})

function taskPercent(type) {
  const total = stats.value.tasks?.total || 0
  if (!total) return 0
  return Math.round((stats.value.tasks?.[type] / total) * 100)
}

function getBarHeight(amount) {
  const max = Math.max(...(stats.value.revenue_chart || []).map(r => r.amount), 1)
  return Math.round((amount / max) * 120)
}

function formatDate(date) {
  if (!date) return '—'
  return new Date(date).toLocaleDateString('en-GB', { day: '2-digit', month: 'short', year: 'numeric' })
}

function isDueSoon(date) {
  if (!date) return false
  const diff = new Date(date) - new Date()
  return diff > 0 && diff < 3 * 24 * 60 * 60 * 1000
}

function getInvStatusClass(status) {
  if (status === 'paid') return 'green'
  if (status === 'overdue') return 'red'
  if (status === 'sent') return 'blue'
  return 'yellow'
}

function getTicketStatusClass(status) {
  if (status === 1) return 'green'
  if (status === 2) return 'yellow'
  return 'gray'
}

function getTicketStatusLabel(status) {
  if (status === 1) return 'Open'
  if (status === 2) return 'In Progress'
  return 'Closed'
}

onMounted(async () => {
  if (auth.token && !auth.user) await auth.fetchMe()
  try {
    const res = await api.get("/dashboard/stats")
    stats.value = res.data
  } catch (e) {
    console.error(e)
  }
})

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
.topbar { background: white; padding: 20px 30px; border-bottom: 1px solid #e2e8f0; display: flex; justify-content: space-between; align-items: center; position: sticky; top: 0; z-index: 10; }
.topbar h1 { font-size: 22px; font-weight: 700; color: #0f172a; }
.topbar p { font-size: 13px; color: #94a3b8; margin-top: 2px; }
.topbar-right { display: flex; align-items: center; gap: 12px; }
.date-badge { font-size: 13px; color: #64748b; background: #f1f5f9; padding: 8px 14px; border-radius: 8px; }
.content { padding: 24px 30px; display: flex; flex-direction: column; gap: 20px; }

/* Stats */
.stats-grid { display: grid; grid-template-columns: repeat(4, 1fr); gap: 16px; }
.stat-card { background: white; border-radius: 14px; padding: 20px; display: flex; gap: 16px; box-shadow: 0 1px 4px rgba(0,0,0,0.06); }
.stat-icon { width: 48px; height: 48px; border-radius: 12px; display: flex; align-items: center; justify-content: center; font-size: 22px; flex-shrink: 0; }
.stat-icon.blue { background: #dbeafe; }
.stat-icon.purple { background: #ede9fe; }
.stat-icon.cyan { background: #cffafe; }
.stat-icon.green { background: #dcfce7; }
.stat-right { display: flex; flex-direction: column; gap: 4px; }
.stat-value { font-size: 26px; font-weight: 800; color: #0f172a; line-height: 1; }
.stat-label { font-size: 12px; color: #94a3b8; }
.stat-sub { display: flex; gap: 6px; margin-top: 4px; flex-wrap: wrap; }
.badge-sm { font-size: 11px; font-weight: 600; padding: 2px 8px; border-radius: 20px; }
.badge-sm.green { background: #dcfce7; color: #16a34a; }
.badge-sm.red { background: #fff1f2; color: #ef4444; }
.badge-sm.purple { background: #ede9fe; color: #7c3aed; }
.badge-sm.cyan { background: #cffafe; color: #0891b2; }
.badge-sm.yellow { background: #fef9c3; color: #ca8a04; }
.badge-sm.gray { background: #f1f5f9; color: #64748b; }

/* Quick Actions */
.section-title { font-size: 14px; font-weight: 700; color: #0f172a; }
.quick-actions-grid { display: grid; grid-template-columns: repeat(6, 1fr); gap: 12px; }
.qa-card { background: white; border-radius: 12px; padding: 16px 12px; display: flex; flex-direction: column; align-items: center; gap: 8px; cursor: pointer; font-size: 13px; color: #374151; font-weight: 500; box-shadow: 0 1px 4px rgba(0,0,0,0.06); transition: all 0.2s; text-align: center; }
.qa-card:hover { background: #2563eb; color: white; transform: translateY(-2px); }
.qa-icon { font-size: 22px; }

/* Tasks Progress */
.tasks-progress-card { background: white; border-radius: 14px; padding: 20px; box-shadow: 0 1px 4px rgba(0,0,0,0.06); display: flex; gap: 24px; }
.tp-item { flex: 1; display: flex; flex-direction: column; gap: 6px; }
.tp-header { display: flex; justify-content: space-between; font-size: 13px; color: #374151; font-weight: 600; }
.progress-bar { height: 8px; background: #f1f5f9; border-radius: 10px; overflow: hidden; }
.fill { height: 100%; border-radius: 10px; transition: width 0.5s ease; }
.fill.blue { background: #2563eb; }
.fill.yellow { background: #f59e0b; }
.fill.green { background: #22c55e; }
.fill.red { background: #ef4444; }

/* Revenue Chart */
.revenue-card { background: white; border-radius: 14px; padding: 24px; box-shadow: 0 1px 4px rgba(0,0,0,0.06); }
.chart-bars { display: flex; align-items: flex-end; gap: 16px; height: 160px; justify-content: center; }
.bar-group { display: flex; flex-direction: column; align-items: center; gap: 6px; flex: 1; }
.bar-wrap { display: flex; flex-direction: column; align-items: center; justify-content: flex-end; height: 130px; }
.bar-value { font-size: 10px; color: #64748b; margin-bottom: 4px; }
.bar { width: 32px; background: linear-gradient(to top, #2563eb, #60a5fa); border-radius: 6px 6px 0 0; min-height: 4px; transition: height 0.5s; }
.bar-label { font-size: 11px; color: #94a3b8; }

/* Bottom Grid */
.bottom-grid { display: grid; grid-template-columns: 1fr 1fr; gap: 16px; }
.panel { background: white; border-radius: 14px; padding: 20px; box-shadow: 0 1px 4px rgba(0,0,0,0.06); display: flex; flex-direction: column; gap: 12px; }
.panel-header { display: flex; justify-content: space-between; align-items: center; font-size: 14px; font-weight: 700; color: #0f172a; }
.panel-link { font-size: 13px; color: #2563eb; cursor: pointer; }
.panel-link:hover { text-decoration: underline; }

.list-items { display: flex; flex-direction: column; gap: 10px; }
.empty { text-align: center; color: #94a3b8; font-size: 13px; padding: 16px; }
.list-row { display: flex; align-items: center; gap: 10px; padding: 8px 0; border-bottom: 1px solid #f1f5f9; }
.list-icon { font-size: 18px; flex-shrink: 0; }
.list-info { flex: 1; display: flex; flex-direction: column; }
.list-info b { font-size: 13px; color: #0f172a; }
.list-info span { font-size: 11px; color: #94a3b8; }
.list-right { display: flex; flex-direction: column; align-items: flex-end; gap: 4px; }
.amount-text { font-size: 13px; font-weight: 700; color: #0f172a; }
.due-date { font-size: 11px; color: #94a3b8; }
.due-date.urgent { color: #ef4444; font-weight: 600; }

.badge-xs { font-size: 10px; font-weight: 600; padding: 2px 8px; border-radius: 20px; }
.badge-xs.green { background: #dcfce7; color: #16a34a; }
.badge-xs.yellow { background: #fef9c3; color: #ca8a04; }
.badge-xs.red { background: #fff1f2; color: #ef4444; }
.badge-xs.blue { background: #dbeafe; color: #2563eb; }
.badge-xs.gray { background: #f1f5f9; color: #64748b; }

/* Chart */
.chart-container { display: flex; align-items: center; gap: 24px; justify-content: center; }
.chart-legend { display: flex; flex-direction: column; gap: 10px; }
.legend-item { display: flex; align-items: center; gap: 8px; font-size: 13px; color: #374151; }
.legend-dot { width: 10px; height: 10px; border-radius: 50%; flex-shrink: 0; }
</style>