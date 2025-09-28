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
    <!-- Favicon -->
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/img/logo.png">
    <!-- Google Sign-In -->
    <script src="https://accounts.google.com/gsi/client" async defer></script>

    <style>
        body {
            min-height: 100vh;
            background-color: #f9fafb;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .auth-container {
            background: white;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 3px 3px 8px rgba(0,0,0,0.3);
            padding: 2rem;
            width: 100%;
            max-width: 400px;
            transition: transform 0.2s;
            margin: 0 auto;
            position: relative;
        }

        .auth-container:hover {
            transform: translateY(-5px);
        }

        .auth-header { text-align: center; margin-bottom: 2rem; }
        .auth-header h1 { font-size: 1.8rem; font-weight: bold; color: #1a1a1a; margin-bottom: 0.5rem; }
        .auth-header p { color: #666; font-size: 0.9rem; margin: 0; }

        .auth-tabs {
            display: flex;
            margin-bottom: 2rem;
            background-color: #f5f5f5;
            border-radius: 8px;
            padding: 4px;
        }

        .auth-tab {
            flex: 1;
            padding: 0.75rem 1rem;
            background: transparent;
            border: none;
            border-radius: 6px;
            font-size: 0.875rem;
            font-weight: 500;
            cursor: pointer;
            transition: all 0.2s;
            color: #666;
        }

        .auth-tab.active {
            background-color: white;
            color: #1a1a1a;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }

        .auth-form { display: none; }
        .auth-form.active { display: block; }

        .auth-form-group { margin-bottom: 1.5rem; }
        .auth-form-label { display: block; font-size: 0.875rem; font-weight: bold; color: #333; margin-bottom: 0.5rem; }
        .auth-input-container { position: relative; }
        .auth-input-icon { position: absolute; left: 0.75rem; top: 50%; transform: translateY(-50%); width: 1.25rem; height: 1.25rem; color: #666; z-index: 10; }
        .auth-form-input {
            width: 100%;
            padding: 0.75rem 0.75rem 0.75rem 2.5rem;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 1rem;
            outline: none;
            background: white;
        }
        .auth-form-input:focus {
            border-color: #1a1a1a;
            box-shadow: 0 0 0 2px rgba(26,26,26,0.1);
        }

        .auth-password-toggle {
            position: absolute;
            right: 0.75rem;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            cursor: pointer;
            color: #666;
            padding: 0.25rem;
            z-index: 10;
        }
        .auth-password-toggle:hover { color: #333; }

        .auth-btn-primary {
            width: 100%;
            background-color: #1a1a1a;
            color: white;
            border: none;
            border-radius: 8px;
            padding: 0.75rem 1rem;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.2s;
        }
        .auth-btn-primary:hover { background-color: #333; }
        .auth-btn-primary:disabled { background-color: #ccc; cursor: not-allowed; }

        .auth-forgot-password { text-align: center; margin-top: 1rem; }
        .auth-forgot-password a { color: #666; text-decoration: none; font-size: 0.875rem; }
        .auth-forgot-password a:hover { color: #1a1a1a; text-decoration: underline; }

        .auth-divider { margin: 1.5rem 0 1rem 0; text-align: center; position: relative; }
        .auth-divider::before { content: ''; position: absolute; top: 50%; left: 0; right: 0; height: 1px; background-color: #ccc; }
        .auth-divider span { background-color: white; padding: 0 1rem; color: #666; font-size: 0.875rem; }

        .google-signin-container {
            width: 100%;
            display: flex;
            justify-content: center;
            margin-top: 1rem;
        }

        .password-strength {
            margin-top: 0.5rem;
            font-size: 0.75rem;
        }

        .password-strength-bar {
            height: 3px;
            background-color: #e0e0e0;
            border-radius: 2px;
            margin-top: 0.25rem;
            overflow: hidden;
        }

        .password-strength-fill {
            height: 100%;
            transition: all 0.3s ease;
            border-radius: 2px;
        }

        .strength-weak { background-color: #ff4444; }
        .strength-medium { background-color: #ffaa00; }
        .strength-strong { background-color: #00aa00; }

        @media (max-width: 480px) {
            .auth-container { padding: 1.5rem; max-width: 350px; }
            body { padding: 10px; }
        }
    </style>
</head>
<body>
    <div class="auth-container">
        <!-- Header -->
        <div class="auth-header">
            <h1 id="authTitle">Entrar</h1>
            <p id="authSubtitle">Entre na sua conta para continuar</p>
        </div>

        <!-- Tabs -->
        <div class="auth-tabs">
            <button type="button" class="auth-tab active" onclick="switchTab('login')">Entrar</button>
            <button type="button" class="auth-tab" onclick="switchTab('register')">Criar Conta</button>
        </div>

        <!-- Login Form -->
        <form id="loginForm" class="auth-form active" onsubmit="return handleLogin(event)">
            <div class="auth-form-group">
                <label for="loginEmail" class="auth-form-label">Email</label>
                <div class="auth-input-container">
                    <svg class="auth-input-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 4.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"></path>
                    </svg>
                    <input type="email" id="loginEmail" name="email" class="auth-form-input" placeholder="seu@email.com" required>
                </div>
            </div>

            <div class="auth-form-group">
                <label for="loginPassword" class="auth-form-label">Senha</label>
                <div class="auth-input-container">
                    <svg class="auth-input-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"></path>
                    </svg>
                    <input type="password" id="loginPassword" name="password" class="auth-form-input" placeholder="••••••••" required>
                    <button type="button" class="auth-password-toggle" onclick="togglePassword('loginPassword')">👁️</button>
                </div>
            </div>

            <button type="submit" class="auth-btn-primary">Entrar</button>

            <div class="auth-forgot-password">
                <a href="#" onclick="forgotPassword()">Esqueceu sua senha?</a>
            </div>
        </form>

        <!-- Register Form -->
        <form id="registerForm" class="auth-form" onsubmit="return handleRegister(event)">
            <div class="auth-form-group">
                <label for="registerName" class="auth-form-label">Nome Completo</label>
                <div class="auth-input-container">
                    <svg class="auth-input-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M16 7a4 4 0 11-8 0 4 4 0 018 0zM12 14a7 7 0 00-7 7h14a7 7 0 00-7-7z"></path>
                    </svg>
                    <input type="text" id="registerName" name="name" class="auth-form-input" placeholder="Seu nome completo" required>
                </div>
            </div>

            <div class="auth-form-group">
                <label for="registerEmail" class="auth-form-label">Email</label>
                <div class="auth-input-container">
                    <svg class="auth-input-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M3 8l7.89 4.26a2 2 0 002.22 0L21 8M5 19h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v10a2 2 0 002 2z"></path>
                    </svg>
                    <input type="email" id="registerEmail" name="email" class="auth-form-input" placeholder="seu@email.com" required>
                </div>
            </div>

            <div class="auth-form-group">
                <label for="registerPassword" class="auth-form-label">Senha</label>
                <div class="auth-input-container">
                    <svg class="auth-input-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"></path>
                    </svg>
                    <input type="password" id="registerPassword" name="password" class="auth-form-input" placeholder="••••••••" required oninput="checkPasswordStrength(this.value)">
                    <button type="button" class="auth-password-toggle" onclick="togglePassword('registerPassword')">👁️</button>
                </div>
                <div class="password-strength">
                    <div class="password-strength-bar">
                        <div id="passwordStrengthFill" class="password-strength-fill" style="width: 0%;"></div>
                    </div>
                    <span id="passwordStrengthText">Digite uma senha</span>
                </div>
            </div>

            <div class="auth-form-group">
                <label for="confirmPassword" class="auth-form-label">Confirmar Senha</label>
                <div class="auth-input-container">
                    <svg class="auth-input-icon" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 15v2m-6 4h12a2 2 0 002-2v-6a2 2 0 00-2-2H6a2 2 0 00-2 2v6a2 2 0 002 2zm10-10V7a4 4 0 00-8 0v4h8z"></path>
                    </svg>
                    <input type="password" id="confirmPassword" name="confirmPassword" class="auth-form-input" placeholder="••••••••" required>
                    <button type="button" class="auth-password-toggle" onclick="togglePassword('confirmPassword')">👁️</button>
                </div>
            </div>

            <button type="submit" class="auth-btn-primary">Criar Conta</button>
        </form>

        <div class="auth-divider"><br><span>OU CONTINUE COM</span></div>

        <!-- Google Sign-In -->
        <div class="google-signin-container">
            <div id="g_id_onload"
                 data-client_id="210589865475-o09jvfs1i2o8hrfqhq2mstbn7pdc280r.apps.googleusercontent.com"
                 data-context="signin"
                 data-ux_mode="popup"
                 data-callback="handleGoogleSignIn"
                 data-auto_prompt="false">
            </div>

            <div class="g_id_signin"
                 data-type="standard"
                 data-shape="rectangular"
                 data-theme="outline"
                 data-text="signin_with"
                 data-size="large"
                 data-locale="pt-BR"
                 data-logo_alignment="left">
            </div>
        </div>
    </div>

    <!-- JavaScript -->
    <script>
        // Função para alternar entre abas
        function switchTab(tab) {
            const tabs = document.querySelectorAll('.auth-tab');
            const forms = document.querySelectorAll('.auth-form');
            const title = document.getElementById('authTitle');
            const subtitle = document.getElementById('authSubtitle');

            // Remove active de todas as abas e forms
            tabs.forEach(t => t.classList.remove('active'));
            forms.forEach(f => f.classList.remove('active'));

            if (tab === 'login') {
                document.querySelector('.auth-tab[onclick="switchTab(\'login\')"]').classList.add('active');
                document.getElementById('loginForm').classList.add('active');
                title.textContent = 'Entrar';
                subtitle.textContent = 'Entre na sua conta para continuar';
            } else {
                document.querySelector('.auth-tab[onclick="switchTab(\'register\')"]').classList.add('active');
                document.getElementById('registerForm').classList.add('active');
                title.textContent = 'Criar Conta';
                subtitle.textContent = 'Crie sua conta para começar';
            }
        }

        // Função para alternar visibilidade da senha
        function togglePassword(fieldId) {
            const field = document.getElementById(fieldId);
            const button = field.parentElement.querySelector('.auth-password-toggle');

            if (field.type === 'password') {
                field.type = 'text';
                button.textContent = '🙈';
            } else {
                field.type = 'password';
                button.textContent = '👁️';
            }
        }

        // Função para verificar força da senha
        function checkPasswordStrength(password) {
            const strengthFill = document.getElementById('passwordStrengthFill');
            const strengthText = document.getElementById('passwordStrengthText');

            let score = 0;

            if (password.length >= 8) score += 1;
            if (/[a-z]/.test(password)) score += 1;
            if (/[A-Z]/.test(password)) score += 1;
            if (/[0-9]/.test(password)) score += 1;
            if (/[^A-Za-z0-9]/.test(password)) score += 1;

            // Remove classes anteriores
            strengthFill.classList.remove('strength-weak', 'strength-medium', 'strength-strong');

            if (password.length === 0) {
                strengthFill.style.width = '0%';
                strengthText.textContent = 'Digite uma senha';
            } else if (score < 3) {
                strengthFill.style.width = '33%';
                strengthFill.classList.add('strength-weak');
                strengthText.textContent = 'Senha fraca';
            } else if (score < 5) {
                strengthFill.style.width = '66%';
                strengthFill.classList.add('strength-medium');
                strengthText.textContent = 'Senha média';
            } else {
                strengthFill.style.width = '100%';
                strengthFill.classList.add('strength-strong');
                strengthText.textContent = 'Senha forte';
            }
        }

        // Função para lidar com login tradicional
        async function handleLogin(event) {
            event.preventDefault();
            const formData = new FormData(event.target);
            const submitButton = event.target.querySelector('button[type="submit"]');

            // Desabilita o botão durante a requisição
            submitButton.disabled = true;
            submitButton.textContent = 'Entrando...';

            try {
                const response = await fetch('/usuarios/login', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({
                        email: formData.get('email'),
                        senha: formData.get('password')
                    })
                });

                const data = await response.json();

                if (response.ok) {
                    // Login bem-sucedido - salva token JWT
                    localStorage.setItem('access_token', data.access_token);
                    localStorage.setItem('usuario_id', data.usuario_id);
                    alert('Login realizado com sucesso!');
                    // Redirecionar para dashboard ou página principal
                    window.location.href = '/dashboard'; // Ajuste conforme necessário
                } else {
                    // Erro no login
                    alert(data.detail || 'Erro ao fazer login');
                }
            } catch (error) {
                console.error('Erro:', error);
                alert('Erro de conexão com o servidor. Verifique se sua API está rodando.');
            } finally {
                // Reabilita o botão
                submitButton.disabled = false;
                submitButton.textContent = 'Entrar';
            }

            return false;
        }

        // Função para lidar com registro
        async function handleRegister(event) {
            event.preventDefault();
            const formData = new FormData(event.target);
            const password = formData.get('password');
            const confirmPassword = formData.get('confirmPassword');
            const submitButton = event.target.querySelector('button[type="submit"]');

            // Validação de senhas
            if (password !== confirmPassword) {
                alert('As senhas não coincidem!');
                return false;
            }

            if (password.length < 8) {
                alert('A senha deve ter pelo menos 8 caracteres!');
                return false;
            }

            // Desabilita o botão durante a requisição
            submitButton.disabled = true;
            submitButton.textContent = 'Criando...';

            try {
                const response = await fetch('/usuarios/', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({
                        nome: formData.get('name'),
                        email: formData.get('email'),
                        senha: formData.get('password')
                    })
                });

                const data = await response.json();

                if (response.ok) {
                    // Registro bem-sucedido
                    alert('Conta criada com sucesso! Faça login para continuar.');
                    // Muda para aba de login
                    switchTab('login');
                    // Limpa o formulário
                    event.target.reset();
                    document.getElementById('passwordStrengthFill').style.width = '0%';
                    document.getElementById('passwordStrengthText').textContent = 'Digite uma senha';
                } else {
                    // Erro no registro
                    alert(data.detail || 'Erro ao criar conta');
                }
            } catch (error) {
                console.error('Erro:', error);
                alert('Erro de conexão com o servidor. Verifique se sua API está rodando.');
            } finally {
                // Reabilita o botão
                submitButton.disabled = false;
                submitButton.textContent = 'Criar Conta';
            }

            return false;
        }

        // Função para lidar com Google Sign-In
        async function handleGoogleSignIn(response) {
            console.log('Google Sign-In iniciado:', response);

            try {
                const result = await fetch('/usuarios/login/google', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                    },
                    body: JSON.stringify({
                        credential: response.credential
                    })
                });

                const data = await result.json();

                if (result.ok) {
                    // Login com Google bem-sucedido
                    localStorage.setItem('access_token', data.access_token);
                    localStorage.setItem('usuario_id', data.usuario_id);
                    alert('Login com Google realizado com sucesso!');
                    // Redirecionar para dashboard ou página principal
                    window.location.href = '/dashboard'; // Ajuste conforme necessário
                } else {
                    console.error('Erro no backend:', data);
                    alert(data.detail || 'Erro ao fazer login com Google');
                }
            } catch (error) {
                console.error('Erro no Google Sign-In:', error);
                alert('Erro de conexão com o servidor. Verifique se sua API está rodando.');
            }
        }

        // Função para esqueceu senha
        function forgotPassword() {
            alert('Funcionalidade de recuperação de senha será implementada em breve!');
        }

        // Inicialização
        window.onload = function() {
            console.log('✅ Página carregada com Google OAuth configurado');
            console.log('🔧 Client ID: 210589865475-o09jvfs1i2o8hrfqhq2mstbn7pdc280r.apps.googleusercontent.com');

            // Verificar se a biblioteca do Google foi carregada
            setTimeout(() => {
                if (typeof google !== 'undefined') {
                    console.log('✅ Google Sign-In library carregada!');
                } else {
                    console.warn('⚠️ Google Sign-In library não carregou. Verifique a conexão.');
                }
            }, 2000);
        };
    </script>

    <!-- JS externo (mantém compatibilidade) -->
    <script src="${pageContext.request.contextPath}/js/login.js"></script>
</body>
</html>