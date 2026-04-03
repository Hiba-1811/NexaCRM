<template>
  <div class="login-container">
    <div class="login-card">
      <div class="login-header">
        <h1>NEXACRM</h1>
        <p>Connectez-vous à votre compte</p>
      </div>
      <form @submit.prevent="handleLogin" class="login-form">
        <div class="form-group">
          <label>Email</label>
          <input type="email" v-model="email" placeholder="exemple@crm.com" required />
        </div>
        <div class="form-group">
          <label>Mot de passe</label>
          <input type="password" v-model="password" placeholder="••••••" required />
        </div>
        <button type="submit" :disabled="authStore.isLoading" class="login-btn">
          {{ authStore.isLoading ? 'Connexion...' : 'Se connecter' }}
        </button>
        <div v-if="error" class="error-message">{{ error }}</div>
      </form>
    </div>
  </div>
</template>

<script setup lang="ts">
import { ref } from 'vue'
import { useRouter } from 'vue-router'
import { useAuthStore } from '../stores/authStore'

const email = ref('')
const password = ref('')
const error = ref('')
const router = useRouter()
const authStore = useAuthStore()

const handleLogin = async () => {
  error.value = ''
  const result = await authStore.login(email.value, password.value)
  if (result.success && result.user) {
    router.push(`/${result.user.position}/dashboard`)
  } else {
    error.value = result.error || 'Erreur de connexion'
  }
}
</script>

<style scoped>
.login-container {
  min-height: 100vh;
  display: flex;
  align-items: center;
  justify-content: center;
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  padding: 20px;
}
.login-card {
  background: white;
  border-radius: 20px;
  padding: 40px;
  width: 100%;
  max-width: 450px;
  box-shadow: 0 20px 60px rgba(0,0,0,0.3);
}
.login-header {
  text-align: center;
  margin-bottom: 30px;
}
.login-header h1 {
  font-size: 32px;
  color: #667eea;
  margin-bottom: 10px;
}
.login-header p { color: #666; }
.login-form {
  display: flex;
  flex-direction: column;
  gap: 20px;
}
.form-group {
  display: flex;
  flex-direction: column;
  gap: 8px;
}
.form-group label {
  font-weight: 600;
  color: #333;
}
.form-group input {
  padding: 12px;
  border: 2px solid #e0e0e0;
  border-radius: 8px;
  font-size: 16px;
  transition: all 0.3s;
}
.form-group input:focus {
  outline: none;
  border-color: #667eea;
}
.login-btn {
  background: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
  color: white;
  padding: 12px;
  border: none;
  border-radius: 8px;
  font-size: 16px;
  font-weight: 600;
  cursor: pointer;
  transition: transform 0.2s;
}
.login-btn:hover:not(:disabled) { transform: translateY(-2px); }
.login-btn:disabled { opacity: 0.6; cursor: not-allowed; }
.error-message {
  background: #fee;
  color: #c33;
  padding: 10px;
  border-radius: 8px;
  text-align: center;
}
</style>
