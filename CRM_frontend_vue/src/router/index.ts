import { createRouter, createWebHistory } from "vue-router"
import Login from "../pages/Login.vue"
import Dashboard from "../pages/Dashboard.vue"
import Clients from "../pages/Clients.vue"
import Projects from "../pages/Projects.vue"
import Tasks from "../pages/Tasks.vue"
import Invoices from "../pages/Invoices.vue"
import Tickets from "../pages/Tickets.vue"
import Users from "../pages/Users.vue"
import { useAuthStore } from "../stores/authStore"

const routes = [
  { path: "/", name: "login", component: Login },
  { path: "/dashboard", name: "dashboard", component: Dashboard, meta: { requiresAuth: true } },
  { path: "/clients", name: "clients", component: Clients, meta: { requiresAuth: true } },
  { path: "/projects", name: "projects", component: Projects, meta: { requiresAuth: true } },
  { path: "/tasks", name: "tasks", component: Tasks, meta: { requiresAuth: true } },
  { path: "/invoices", name: "invoices", component: Invoices, meta: { requiresAuth: true } },
  { path: "/tickets", name: "tickets", component: Tickets, meta: { requiresAuth: true } },
  { path: "/users", name: "users", component: Users, meta: { requiresAuth: true } }
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