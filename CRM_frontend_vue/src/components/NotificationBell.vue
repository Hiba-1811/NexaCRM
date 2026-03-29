<template>
  <div class="notif-wrapper">
    <div class="notif-btn" @click="togglePanel">
      🔔
      <span v-if="unread > 0" class="notif-badge">{{ unread }}</span>
    </div>

    <div v-if="showPanel" class="notif-panel">
      <div class="notif-header">
        <span>🔔 Notifications</span>
        <span class="mark-all" @click="markAllRead">Mark all read</span>
      </div>

      <div class="notif-list">
        <div v-if="notifications.length === 0" class="notif-empty">No notifications</div>
        <div
          v-for="notif in notifications"
          :key="notif.id"
          :class="['notif-item', !notif.is_read ? 'unread' : '']"
          @click="markRead(notif)"
        >
          <div class="notif-icon">{{ notif.icon }}</div>
          <div class="notif-content">
            <b>{{ notif.title }}</b>
            <p>{{ notif.message }}</p>
            <span class="notif-time">{{ formatTime(notif.created_at) }}</span>
          </div>
          <div v-if="!notif.is_read" class="unread-dot"></div>
        </div>
      </div>

      <div class="notif-footer" @click="showPanel = false">
        Close
      </div>
    </div>
  </div>
</template>

<script setup>
import { ref, onMounted, onUnmounted } from "vue"
import api from "../services/api"

const notifications = ref([])
const unread = ref(0)
const showPanel = ref(false)
let interval = null

async function loadNotifications() {
  try {
    const res = await api.get("/notifications")
    notifications.value = res.data.notifications
    unread.value = res.data.unread
  } catch (e) {
    console.error(e)
  }
}

async function markRead(notif) {
  if (notif.is_read) return
  try {
    await api.put(`/notifications/${notif.id}/read`)
    notif.is_read = true
    unread.value = Math.max(0, unread.value - 1)
  } catch (e) {
    console.error(e)
  }
}

async function markAllRead() {
  try {
    await api.put("/notifications/read-all")
    notifications.value.forEach(n => n.is_read = true)
    unread.value = 0
  } catch (e) {
    console.error(e)
  }
}

function togglePanel() {
  showPanel.value = !showPanel.value
}

function formatTime(date) {
  if (!date) return ''
  const d = new Date(date)
  const now = new Date()
  const diff = Math.floor((now - d) / 1000)
  if (diff < 60) return 'Just now'
  if (diff < 3600) return `${Math.floor(diff / 60)}m ago`
  if (diff < 86400) return `${Math.floor(diff / 3600)}h ago`
  return d.toLocaleDateString('en-GB', { day: '2-digit', month: 'short' })
}

onMounted(() => {
  loadNotifications()
  interval = setInterval(loadNotifications, 30000)
})

onUnmounted(() => {
  clearInterval(interval)
})
</script>

<style>
.notif-wrapper {
  position: relative;
}

.notif-btn {
  position: relative;
  width: 40px;
  height: 40px;
  background: #f1f5f9;
  border-radius: 10px;
  display: flex;
  align-items: center;
  justify-content: center;
  cursor: pointer;
  font-size: 18px;
  transition: background 0.2s;
}
.notif-btn:hover { background: #e2e8f0; }

.notif-badge {
  position: absolute;
  top: -4px;
  right: -4px;
  background: #ef4444;
  color: white;
  font-size: 10px;
  font-weight: 700;
  width: 18px;
  height: 18px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
}

.notif-panel {
  position: absolute;
  top: 50px;
  right: 0;
  width: 360px;
  background: white;
  border-radius: 16px;
  box-shadow: 0 10px 40px rgba(0,0,0,0.15);
  z-index: 1000;
  overflow: hidden;
}

.notif-header {
  padding: 16px 20px;
  border-bottom: 1px solid #f1f5f9;
  display: flex;
  justify-content: space-between;
  align-items: center;
  font-size: 14px;
  font-weight: 700;
  color: #0f172a;
}

.mark-all {
  font-size: 12px;
  color: #2563eb;
  cursor: pointer;
  font-weight: 500;
}
.mark-all:hover { text-decoration: underline; }

.notif-list {
  max-height: 360px;
  overflow-y: auto;
}

.notif-empty {
  padding: 40px;
  text-align: center;
  color: #94a3b8;
  font-size: 14px;
}

.notif-item {
  display: flex;
  align-items: flex-start;
  gap: 12px;
  padding: 14px 20px;
  cursor: pointer;
  transition: background 0.2s;
  border-bottom: 1px solid #f8fafc;
  position: relative;
}
.notif-item:hover { background: #f8fafc; }
.notif-item.unread { background: #eff6ff; }

.notif-icon {
  font-size: 20px;
  flex-shrink: 0;
  width: 36px;
  height: 36px;
  background: #f1f5f9;
  border-radius: 8px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.notif-content {
  flex: 1;
}
.notif-content b {
  font-size: 13px;
  color: #0f172a;
  display: block;
}
.notif-content p {
  font-size: 12px;
  color: #64748b;
  margin-top: 2px;
  line-height: 1.4;
}
.notif-time {
  font-size: 11px;
  color: #94a3b8;
  margin-top: 4px;
  display: block;
}

.unread-dot {
  width: 8px;
  height: 8px;
  background: #2563eb;
  border-radius: 50%;
  flex-shrink: 0;
  margin-top: 4px;
}

.notif-footer {
  padding: 12px 20px;
  text-align: center;
  font-size: 13px;
  color: #94a3b8;
  cursor: pointer;
  border-top: 1px solid #f1f5f9;
  transition: background 0.2s;
}
.notif-footer:hover { background: #f8fafc; color: #64748b; }
</style>