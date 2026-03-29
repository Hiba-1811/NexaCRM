<template>
  <div class="login-page">
  <div class="topbar-right">
  <NotificationBell />
</div>

    <!-- Background decorations -->
    <div class="bg-circle circle-1"></div>
    <div class="bg-circle circle-2"></div>
    <div class="bg-circle circle-3"></div>

    <!-- Card -->
    <div class="login-card">

      <!-- Logo -->
      <div class="brand">
        <div class="logo">N</div>
        <span class="brand-name">NexaCRM</span>
      </div>

      <div class="card-header">
        <h2>Welcome back 👋</h2>
        <p>Sign in to your account to continue</p>
      </div>

      <div class="input-group">
        <label>Email Address</label>
        <div class="input-wrap">
          <span class="input-icon">✉️</span>
          <input
            v-model="email"
            type="email"
            placeholder="you@company.com"
            :class="{ 'input-error': errorField === 'email' }"
            @keyup.enter="handleLogin"
          />
        </div>
      </div>

      <div class="input-group">
        <label>Password</label>
        <div class="input-wrap">
          <span class="input-icon">🔒</span>
          <input
            v-model="password"
            :type="showPassword ? 'text' : 'password'"
            placeholder="••••••••"
            :class="{ 'input-error': errorField === 'password' }"
            @keyup.enter="handleLogin"
          />
          <span class="toggle-pass" @click="showPassword = !showPassword">
            {{ showPassword ? '🙈' : '👁️' }}
          </span>
        </div>
      </div>

      <div class="remember-row">
        <label class="checkbox-label">
          <input type="checkbox" v-model="remember" />
          <span>Remember me</span>
        </label>
        <a href="#" class="forgot">Forgot password?</a>
      </div>

      <button class="btn-login" @click="handleLogin" :disabled="auth.loading">
        <span v-if="!auth.loading">Sign In →</span>
        <span v-else>Signing in...</span>
      </button>

      <div v-if="error" class="error-msg">
        ⚠️ {{ error }}
      </div>

      <div class="card-footer">
        <span>Powered by</span>
        <b>NexaCRM v1.0</b>
      </div>

    </div>
  </div>
</template>

<script setup>
import { ref } from "vue"
import { useRouter } from "vue-router"
import { useAuthStore } from "../stores/authStore"

const router = useRouter()
const auth = useAuthStore()

const email = ref("")
const password = ref("")
const error = ref("")
const errorField = ref("")
const showPassword = ref(false)
const remember = ref(false)

async function handleLogin() {
  error.value = ""
  errorField.value = ""

  if (!email.value) {
    error.value = "Please enter your email"
    errorField.value = "email"
    return
  }
  if (!password.value) {
    error.value = "Please enter your password"
    errorField.value = "password"
    return
  }

  await auth.login(email.value, password.value)

  if (auth.error) {
    error.value = auth.error
  } else {
    router.push("/dashboard")
  }
}
</script>

<style>
* { box-sizing: border-box; margin: 0; padding: 0; }

.login-page {
  min-height: 100vh;
  background: linear-gradient(135deg, #0f172a 0%, #1e3a5f 60%, #2563eb 100%);
  display: flex;
  align-items: center;
  justify-content: center;
  font-family: 'Inter', 'Segoe UI', sans-serif;
  position: relative;
  overflow: hidden;
}

/* Background circles */
.bg-circle {
  position: absolute;
  border-radius: 50%;
  opacity: 0.12;
}

.circle-1 {
  width: 500px;
  height: 500px;
  background: #2563eb;
  top: -150px;
  right: -150px;
}

.circle-2 {
  width: 350px;
  height: 350px;
  background: #60a5fa;
  bottom: -100px;
  left: -100px;
}

.circle-3 {
  width: 200px;
  height: 200px;
  background: #93c5fd;
  top: 50%;
  left: 30%;
}

/* Card */
.login-card {
  position: relative;
  z-index: 1;
  background: white;
  padding: 48px;
  border-radius: 28px;
  width: 100%;
  max-width: 440px;
  box-shadow: 0 25px 60px rgba(0, 0, 0, 0.3);
  display: flex;
  flex-direction: column;
  gap: 22px;
}

.brand {
  display: flex;
  align-items: center;
  gap: 12px;
  justify-content: center;
}

.logo {
  width: 44px;
  height: 44px;
  background: #2563eb;
  color: white;
  font-size: 20px;
  font-weight: 900;
  border-radius: 12px;
  display: flex;
  align-items: center;
  justify-content: center;
}

.brand-name {
  font-size: 22px;
  font-weight: 800;
  color: #0f172a;
  letter-spacing: -0.3px;
}

.card-header {
  text-align: center;
}

.card-header h2 {
  font-size: 24px;
  font-weight: 700;
  color: #0f172a;
}

.card-header p {
  font-size: 14px;
  color: #94a3b8;
  margin-top: 6px;
}

.input-group {
  display: flex;
  flex-direction: column;
  gap: 7px;
}

.input-group label {
  font-size: 13px;
  font-weight: 600;
  color: #374151;
}

.input-wrap {
  position: relative;
  display: flex;
  align-items: center;
}

.input-icon {
  position: absolute;
  left: 280px;
  font-size: 15px;
  pointer-events: none;
}

.input-wrap input {
  width: 100%;
  padding: 13px 16px;
  border: 1.5px solid #e2e8f0;
  border-radius: 12px;
  font-size: 14px;
  color: #0f172a;
  outline: none;
  transition: all 0.2s;
  background: #f8fafc;
  font-family: inherit;
}

.input-wrap input:focus {
  border-color: #2563eb;
  background: white;
  box-shadow: 0 0 0 3px rgba(37, 99, 235, 0.08);
}

.input-wrap input.input-error {
  border-color: #ef4444;
  background: #fff1f2;
}

.toggle-pass {
  position: absolute;
  right: 14px;
  cursor: pointer;
  font-size: 16px;
  user-select: none;
}

.remember-row {
  display: flex;
  justify-content: space-between;
  align-items: center;
}

.checkbox-label {
  display: flex;
  align-items: center;
  gap: 8px;
  font-size: 13px;
  color: #64748b;
  cursor: pointer;
}

.forgot {
  font-size: 13px;
  color: #2563eb;
  text-decoration: none;
  font-weight: 500;
}
.forgot:hover { text-decoration: underline; }

.btn-login {
  width: 100%;
  padding: 14px;
  background: #2563eb;
  color: white;
  border: none;
  border-radius: 12px;
  font-size: 15px;
  font-weight: 700;
  cursor: pointer;
  transition: all 0.2s;
  font-family: inherit;
}

.btn-login:hover:not(:disabled) {
  background: #1d4ed8;
  transform: translateY(-1px);
  box-shadow: 0 6px 20px rgba(37, 99, 235, 0.35);
}

.btn-login:disabled {
  background: #93c5fd;
  cursor: not-allowed;
  transform: none;
}

.error-msg {
  background: #fff1f2;
  border: 1px solid #fecdd3;
  color: #ef4444;
  padding: 12px 16px;
  border-radius: 10px;
  font-size: 13px;
  text-align: center;
}

.card-footer {
  text-align: center;
  font-size: 12px;
  color: #cbd5e1;
  display: flex;
  justify-content: center;
  gap: 6px;
  padding-top: 4px;
  border-top: 1px solid #f1f5f9;
}

.card-footer b { color: #94a3b8; }
</style>