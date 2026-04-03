import { createRouter, createWebHistory } from 'vue-router'
import { useAuthStore } from '../stores/authStore'

const routes = [
  {
    path: '/login',
    name: 'Login',
    component: () => import('../pages/Login.vue'),
    meta: { requiresGuest: true }
  },
  {
    path: '/admin',
    component: () => import('../layouts/AdminLayout.vue'),
    meta: { requiresAuth: true, role: 'admin' },
    children: [
      { path: '', redirect: '/admin/dashboard' },
      { path: 'dashboard', name: 'AdminDashboard', component: () => import('../pages/admin/Dashboard.vue') },
      { path: 'clients', name: 'AdminClients', component: () => import('../pages/admin/Clients.vue') },
      { path: 'leads', name: 'AdminLeads', component: () => import('../pages/admin/Leads.vue') },
      { path: 'projects', name: 'AdminProjects', component: () => import('../pages/admin/Projects.vue') },
      { path: 'tasks', name: 'AdminTasks', component: () => import('../pages/admin/Tasks.vue') },
      { path: 'invoices', name: 'AdminInvoices', component: () => import('../pages/admin/Invoices.vue') },
      { path: 'tickets', name: 'AdminTickets', component: () => import('../pages/admin/Tickets.vue') },
      { path: 'users', name: 'AdminUsers', component: () => import('../pages/admin/Users.vue') },
      { path: 'stats', name: 'AdminStats', component: () => import('../pages/admin/Stats.vue') }
    ]
  },
  {
    path: '/staff',
    component: () => import('../layouts/StaffLayout.vue'),
    meta: { requiresAuth: true, role: 'staff' },
    children: [
      { path: '', redirect: '/staff/dashboard' },
      { path: 'dashboard', name: 'StaffDashboard', component: () => import('../pages/staff/Dashboard.vue') },
      { path: 'clients', name: 'StaffClients', component: () => import('../pages/staff/Clients.vue') },
      { path: 'leads', name: 'StaffLeads', component: () => import('../pages/staff/Leads.vue') },
      { path: 'projects', name: 'StaffProjects', component: () => import('../pages/staff/Projects.vue') },
      { path: 'tasks', name: 'StaffTasks', component: () => import('../pages/staff/Tasks.vue') },
      { path: 'tickets', name: 'StaffTickets', component: () => import('../pages/staff/Tickets.vue') }
    ]
  },
  {
    path: '/client',
    component: () => import('../layouts/ClientLayout.vue'),
    meta: { requiresAuth: true, role: 'client' },
    children: [
      { path: '', redirect: '/client/dashboard' },
      { path: 'dashboard', name: 'ClientDashboard', component: () => import('../pages/client/Dashboard.vue') },
      { path: 'projects', name: 'ClientProjects', component: () => import('../pages/client/Projects.vue') },
      { path: 'commandes', name: 'ClientCommandes', component: () => import('../pages/client/Commandes.vue') },
      { path: 'invoices', name: 'ClientInvoices', component: () => import('../pages/client/Invoices.vue') },
      { path: 'tickets', name: 'ClientTickets', component: () => import('../pages/client/Tickets.vue') },
      { path: 'profile', name: 'ClientProfile', component: () => import('../pages/client/Profile.vue') }
    ]
  },
  {
    path: '/:pathMatch(.*)*',
    redirect: '/login'
  }
]

const router = createRouter({
  history: createWebHistory(),
  routes
})

router.beforeEach((to, from) => {
  const authStore = useAuthStore()
  const requiresAuth = to.meta.requiresAuth
  const requiredRole = to.meta.role
  const requiresGuest = to.meta.requiresGuest

  if (requiresAuth && !authStore.isAuthenticated) {
    return '/login'
  } else if (requiresAuth && requiredRole && authStore.user?.role !== requiredRole) {
    return `/${authStore.user?.role}/dashboard`
  } else if (requiresGuest && authStore.isAuthenticated) {
    return `/${authStore.user?.role}/dashboard`
  }
})

export default router