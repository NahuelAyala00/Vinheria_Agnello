<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
    <style>
        /* Força o body a ocupar toda a tela para centralização */
        body {
            min-height: 100vh !important;
            background-color: #f9fafb !important;
            display: flex !important;
            align-items: center !important;
            justify-content: center !important;
            padding: 20px !important;
        }

        /* Container específico para o login - sobrescreve Bootstrap se necessário */
        .login-container {
            background: white !important;
            border: 1px solid #ccc !important;
            border-radius: 10px !important;
            box-shadow: 3px 3px 8px rgba(0,0,0,0.3) !important;
            padding: 2rem !important;
            width: 100% !important;
            max-width: 400px !important;
            transition: transform 0.2s !important;
            margin: 0 auto !important;
            position: relative !important;
        }

        .login-container:hover {
            transform: translateY(-5px) !important;
        }

        /* Header específico do login - evita conflito com Bootstrap */
        .login-header {
            text-align: center !important;
            margin-bottom: 2rem !important;
        }

        .login-header h1 {
            font-size: 1.8rem !important;
            font-weight: bold !important;
            color: #1a1a1a !important;
            margin-bottom: 0.5rem !important;
        }

        .login-header p {
            color: #666 !important;
            font-size: 0.9rem !important;
            margin: 0 !important;
        }

        /* Sobrescreve form-group do Bootstrap se necessário */
        .login-form-group {
            margin-bottom: 1.5rem !important;
        }

        /* Label específico para não conflitar */
        .login-form-label {
            display: block !important;
            font-size: 0.875rem !important;
            font-weight: bold !important;
            color: #333 !important;
            margin-bottom: 0.5rem !important;
        }

        /* Input container */
        .login-input-container {
            position: relative !important;
        }

        .login-input-icon {
            position: absolute !important;
            left: 0.75rem !important;
            top: 50% !important;
            transform: translateY(-50%) !important;
            width: 1.25rem !important;
            height: 1.25rem !important;
            color: #666 !important;
            z-index: 10 !important;
        }

        /* Input específico - sobrescreve Bootstrap */
        .login-form-input {
            width: 100% !important;
            padding: 0.75rem 0.75rem 0.75rem 2.5rem !important;
            border: 1px solid #ccc !important;
            border-radius: 8px !important;
            font-size: 1rem !important;
            transition: all 0.3s !important;
            outline: none !important;
            font-family: Arial, sans-serif !important;
            background: white !important;
        }

        .login-form-input:focus {
            border-color: #1a1a1a !important;
            box-shadow: 0 0 0 2px rgba(26, 26, 26, 0.1) !important;
        }

        /* Toggle de senha */
        .login-password-toggle {
            position: absolute !important;
            right: 0.75rem !important;
            top: 50% !important;
            transform: translateY(-50%) !important;
            background: none !important;
            border: none !important;
            cursor: pointer !important;
            color: #666 !important;
            padding: 0.25rem !important;
            transition: color 0.3s !important;
            z-index: 10 !important;
        }

        .login-password-toggle:hover {
            color: #333 !important;
        }

        /* Botão principal - sobrescreve Bootstrap */
        .login-btn-primary {
            width: 100% !important;
            background-color: #1a1a1a !important;
            color: white !important;
            border: none !important;
            border-radius: 8px !important;
            padding: 0.75rem 1rem !important;
            font-size: 1rem !important;
            font-weight: bold !important;
            cursor: pointer !important;
            transition: all 0.3s !important;
            font-family: Arial, sans-serif !important;
            text-decoration: none !important;
        }

        .login-btn-primary:hover {
            background-color: #333 !important;
            transform: translateY(-2px) !important;
            box-shadow: 0 4px 8px rgba(0,0,0,0.2) !important;
            color: white !important;
        }

        .login-btn-primary:focus {
            outline: none !important;
            box-shadow: 0 0 0 2px rgba(26, 26, 26, 0.5) !important;
        }

        /* Link esqueceu senha */
        .login-forgot-password {
            text-align: center !important;
            margin-top: 1rem !important;
        }

        .login-forgot-password a {
            color: #666 !important;
            text-decoration: none !important;
            font-size: 0.875rem !important;
            font-weight: normal !important;
            transition: color 0.3s !important;
        }

        .login-forgot-password a:hover {
            color: #1a1a1a !important;
            text-decoration: underline !important;
        }

        /* Divisor */
        .login-divider {
            margin: 1.5rem 0 1rem 0 !important;
            position: relative !important;
            text-align: center !important;
        }

        .login-divider::before {
            content: '' !important;
            position: absolute !important;
            top: 50% !important;
            left: 0 !important;
            right: 0 !important;
            height: 1px !important;
            background-color: #ccc !important;
        }

        .login-divider span {
            background-color: white !important;
            padding: 0 1rem !important;
            color: #666 !important;
            font-size: 0.875rem !important;
        }

        /* Botão Google */
        .login-btn-google {
            width: 100% !important;
            background-color: white !important;
            color: #333 !important;
            border: 1px solid #ccc !important;
            border-radius: 8px !important;
            padding: 0.75rem 1rem !important;
            font-size: 1rem !important;
            font-weight: normal !important;
            cursor: pointer !important;
            transition: all 0.3s !important;
            display: flex !important;
            align-items: center !important;
            justify-content: center !important;
            gap: 0.75rem !important;
            font-family: Arial, sans-serif !important;
            text-decoration: none !important;
        }

        .login-btn-google:hover {
            background-color: #f5f5f5 !important;
            transform: translateY(-2px) !important;
            box-shadow: 0 4px 8px rgba(0,0,0,0.1) !important;
            color: #333 !important;
        }

        .login-btn-google:focus {
            outline: none !important;
            box-shadow: 0 0 0 2px rgba(0,0,0,0.2) !important;
        }

        .login-google-icon {
            width: 1.25rem !important;
            height: 1.25rem !important;
        }

        /* Classe auxiliar */
        .login-hidden {
            display: none !important;
        }

        /* Responsivo */
        @media (max-width: 480px) {
            .login-container {
                padding: 1.5rem !important;
                margin: 10px !important;
                max-width: 350px !important;
            }

            body {
                padding: 10px !important;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <!-- Header -->
        <div class="login-header">
            <h1>Entrar</h1>
            <p>Entre na sua conta para continuar</p>
        </div>

        <!-- Login Form -->
        <form action="login" method="post" onsubmit="return handleSubmit(event)">
            <!-- Email Field -->
            <div class="login-form-group">
                <label for="email" class="login-form-label">Email</label>
                <div class="login-input-container">
                    <svg class="login-input-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 4.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"></path>
                    </svg>
                    <input
                        type="email"
                        id="email"
                        name="email"
                        class="login-form-input"
                        placeholder="seu@email.com"
                        required>
                </div>
            </div>

            <!-- Password Field -->
            <div class="login-form-group">
                <label for="password" class="login-form-label">Senha</label>
                <div class="login-input-container">
                    <svg class="login-input-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"></path>
                    </svg>
                    <input
                        type="password"
                        id="password"
                        name="password"
                        class="login-form-input"
                        placeholder="••••••••"
                        required>
                    <button type="button" class="login-password-toggle" onclick="togglePassword()">
                        <svg id="eyeIcon" class="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24" width="20" height="20">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M15 12a3 3 0 11-6 0 3 3 0 016 0z"></path>
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M2.458 12C3.732 7.943 7.523 5 12 5c4.478 0 8.268 2.943 9.542 7-1.274 4.057-5.064 7-9.542 7-4.477 0-8.268-2.943-9.542-7z"></path>
                        </svg>
                        <svg id="eyeOffIcon" class="w-5 h-5 login-hidden" fill="none" stroke="currentColor" viewBox="0 0 24 24" width="20" height="20">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M13.875 18.825A10.05 10.05 0 0112 19c-4.478 0-8.268-2.943-9.543-7a9.97 9.97 0 011.563-3.029m5.858.908a3 3 0 114.243 4.243M9.878 9.878l4.242 4.242M9.878 9.878L3 3m6.878 6.878L21 21"></path>
                        </svg>
                    </button>
                </div>
            </div>

            <!-- Submit Button -->
            <button type="submit" class="login-btn-primary">
                Entrar
            </button>
        </form>

        <!-- Forgot Password -->
        <div class="login-forgot-password">
            <a href="#" onclick="forgotPassword()">Esqueceu sua senha?</a>
        </div>

        <!-- Divider -->
        <div class="login-divider">
        </br>
            <span>OU CONTINUE COM</span>
        </div>

        <!-- Google Login -->
        <button type="button" class="login-btn-google" onclick="googleLogin()">
            <svg class="login-google-icon" viewBox="0 0 24 24">
                <path fill="#4285F4" d="M22.56 12.25c0-.78-.07-1.53-.2-2.25H12v4.26h5.92c-.26 1.37-1.04 2.53-2.21 3.31v2.77h3.57c2.08-1.92 3.28-4.74 3.28-8.09z"/>
                <path fill="#34A853" d="M12 23c2.97 0 5.46-.98 7.28-2.66l-3.57-2.77c-.98.66-2.23 1.06-3.71 1.06-2.86 0-5.29-1.93-6.16-4.53H2.18v2.84C3.99 20.53 7.7 23 12 23z"/>
                <path fill="#FBBC05" d="M5.84 14.09c-.22-.66-.35-1.36-.35-2.09s.13-1.43.35-2.09V7.07H2.18C1.43 8.55 1 10.22 1 12s.43 3.45 1.18 4.93l2.85-2.22.81-.62z"/>
                <path fill="#EA4335" d="M12 5.38c1.62 0 3.06.56 4.21 1.64l3.15-3.15C17.45 2.09 14.97 1 12 1 7.7 1 3.99 3.47 2.18 7.07l3.66 2.84c.87-2.6 3.3-4.53 6.16-4.53z"/>
            </svg>
            Continuar com Google
        </button>
    </div>

    <script>
        function togglePassword() {
            const passwordInput = document.getElementById('password');
            const eyeIcon = document.getElementById('eyeIcon');
            const eyeOffIcon = document.getElementById('eyeOffIcon');

            if (passwordInput.type === 'password') {
                passwordInput.type = 'text';
                eyeIcon.classList.add('login-hidden');
                eyeOffIcon.classList.remove('login-hidden');
            } else {
                passwordInput.type = 'password';
                eyeIcon.classList.remove('login-hidden');
                eyeOffIcon.classList.add('login-hidden');
            }
        }

        function handleSubmit(event) {
            const email = document.getElementById('email').value;
            const password = document.getElementById('password').value;

            console.log('Login attempt:', { email, password });
            return true;
        }

        function forgotPassword() {
            console.log('Forgot password clicked');
            // Implementar redirecionamento para página de recuperação de senha
            // window.location.href = 'forgot-password.jsp';
        }

        function googleLogin() {
            console.log('Google login clicked');
            // Implementar lógica de login com Google
            // window.location.href = 'google-auth';
        }

        // Suporte a tecla Enter
        document.addEventListener('DOMContentLoaded', function() {
            const form = document.querySelector('form');
            const inputs = form.querySelectorAll('input');

            inputs.forEach(function(input) {
                input.addEventListener('keypress', function(e) {
                    if (e.key === 'Enter') {
                        form.submit();
                    }
                });
            });
        });
    </script>
</body>
</html>