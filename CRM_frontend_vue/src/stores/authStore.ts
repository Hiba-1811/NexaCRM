import { defineStore } from "pinia"
import { ref, computed } from "vue"
import api from "../services/api"

export const useAuthStore = defineStore("auth", () => {

  const token = ref<string | null>(localStorage.getItem("token"))
  const user = ref<any | null>(null)
  const loading = ref(false)
  const error = ref<string | null>(null)

  const isAuthenticated = computed(() => !!token.value)

  async function login(email: string, password: string) {
    loading.value = true
    error.value = null
    try {
      const response = await api.post("/auth/login", { email, password })
     token.value = response.data.access_token
      user.value = response.data.user
      localStorage.setItem("token", response.data.token)
    } catch (err: any) {
      error.value = err.response?.data?.message || "Erreur de connexion"
    } finally {
      loading.value = false
    }
  }

  async function logout() {
    try {
      await api.post("/auth/logout")
    } finally {
      token.value = null
      user.value = null
      localStorage.removeItem("token")
    }
  }

  async function fetchMe() {
    try {
      const response = await api.get("/auth/me")
      user.value = response.data
    } catch {
      logout()
    }
  }

  return {
    token,
    user,
    loading,
    error,
    isAuthenticated,
    login,
    logout,
    fetchMe
  }

})