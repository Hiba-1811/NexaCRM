import axios from "axios"
import { useAuthStore } from "../stores/authStore"

const api = axios.create({
baseURL: "http://192.168.1.100:8000/api",
  headers: {
    "Content-Type": "application/json",
  },
})

api.interceptors.request.use((config) => {
  const auth = useAuthStore()
  if (auth.token) {
    config.headers.Authorization = `Bearer ${auth.token}`
  }
  return config
})

api.interceptors.response.use(
  (response) => response,
  (error) => {
    if (error.response?.status === 401) {
      const auth = useAuthStore()
      if (auth.token) {
        auth.token = null
        localStorage.removeItem("token")
        window.location.href = "/"
      }
    }
    return Promise.reject(error)
  }
)

export default api