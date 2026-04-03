import { defineStore } from 'pinia'
import { ref, computed } from 'vue'
import axios from 'axios'

axios.defaults.baseURL = import.meta.env.VITE_API_URL

interface User {
  id: number
  name: string
  email: string
  first_name: string
  last_name: string
  position: 'admin' | 'staff' | 'client'
}

export const useAuthStore = defineStore('auth', () => {
  const user = ref<User | null>(JSON.parse(localStorage.getItem('user') || 'null'))
  const token = ref<string | null>(localStorage.getItem('token'))
  const isLoading = ref(false)
  const isAuthenticated = computed(() => !!token.value && !!user.value)

  const setAuth = (newToken: string, newUser: User) => {
    token.value = newToken
    user.value = newUser
    localStorage.setItem('token', newToken)
    localStorage.setItem('user', JSON.stringify(newUser))
    axios.defaults.headers.common['Authorization'] = `Bearer ${newToken}`
  }

  const clearAuth = () => {
    token.value = null
    user.value = null
    localStorage.removeItem('token')
    localStorage.removeItem('user')
    delete axios.defaults.headers.common['Authorization']
  }

  const login = async (email: string, password: string) => {
    isLoading.value = true
    try {
      const response = await axios.post('/auth/login', { email, password })
      const { access_token, user: userData } = response.data
      const mappedUser = { ...userData, role: userData.position }
      setAuth(access_token, mappedUser)
      return { success: true, user: mappedUser }
    } catch (error: any) {
      return { success: false, error: error.response?.data?.message || 'Email ou mot de passe incorrect' }
    } finally {
      isLoading.value = false
    }
  }

  const logout = async () => {
    try {
      // await axios.post("/auth/logout")
    } finally {
      clearAuth()
    }
  }

  const checkAuth = () => {
    if (token.value) {
      axios.defaults.headers.common['Authorization'] = `Bearer ${token.value}`
    }
  }

  return { user, token, isLoading, isAuthenticated, login, logout, checkAuth }
})
