import axios from './axios'

export const api = {
  async login(email: string, password: string) {
    const response = await axios.post('/auth/login', { email, password })
    const { access_token, token_type, user } = response.data
    
    localStorage.setItem('token', access_token)
    localStorage.setItem('token_type', token_type)
    localStorage.setItem('user', JSON.stringify(user))
    
    return user
  },
  
  logout() {
    localStorage.removeItem('token')
    localStorage.removeItem('token_type')
    localStorage.removeItem('user')
  },
  
  async getDashboardStats() {
    const response = await axios.get('/dashboard/stats')
    return response.data
  },
  
  getUser() {
    const user = localStorage.getItem('user')
    return user ? JSON.parse(user) : null
  }
}