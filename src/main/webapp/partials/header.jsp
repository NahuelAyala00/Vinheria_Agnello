<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Vinheria Agnello</title>

    <!-- Favicon - Logo na aba do navegador -->
    <link rel="icon" type="image/png" href="${pageContext.request.contextPath}/img/logo.png">

    <!-- CSS -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

    <!-- Font Awesome para ícones -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        /* Estilos para área do usuário */
        .user-area {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .user-info {
            display: none; /* Oculto por padrão */
            align-items: center;
            gap: 10px;
            color: #666;
            font-size: 0.9rem;
        }

        .user-info.logged-in {
            display: flex;
        }

        .user-email {
            max-width: 150px;
            overflow: hidden;
            text-overflow: ellipsis;
            white-space: nowrap;
        }

        .logout-btn {
            background: none;
            border: none;
            color: #666;
            cursor: pointer;
            padding: 5px;
            border-radius: 4px;
            transition: all 0.3s ease;
            font-size: 0.9rem;
        }

        .logout-btn:hover {
            color: #dc3545;
            background-color: rgba(220, 53, 69, 0.1);
        }

        .logout-btn i {
            margin-right: 5px;
        }

        /* Ajustes para mobile */
        @media (max-width: 768px) {
            .user-area {
                flex-direction: column;
                gap: 10px;
            }

            .user-email {
                max-width: 120px;
            }

            .logout-btn {
                font-size: 0.8rem;
                padding: 8px 12px;
            }
        }

        /* Estilo para quando não logado */
        .login-link {
            color: #666;
            text-decoration: none;
            padding: 5px 10px;
            border-radius: 4px;
            transition: all 0.3s ease;
        }

        .login-link:hover {
            color: #007bff;
            background-color: rgba(0, 123, 255, 0.1);
        }
    </style>
</head>
<body>
<!-- Header com design personalizado -->
<header class="header-custom">
    <div class="container">
        <div class="header-content">
            <!-- Logo -->
            <div class="logo-section">
                <a href="${pageContext.request.contextPath}/pages/index.jsp" class="logo-link">
                    <i class="fas fa-wine-glass logo-icon"></i>
                    <span class="logo-text">Vinheria Agnello</span>
                </a>
            </div>

            <!-- Menu Desktop -->
            <nav class="nav-menu">
                <ul class="nav-list">
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/pages/produto.jsp" class="nav-link">Produtos</a>
                    </li>
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/pages/carrinho.jsp" class="nav-link">Carrinho</a>
                    </li>
                </ul>
            </nav>

            <!-- Área do Usuário -->
            <div class="user-area">
                <!-- Exibido quando usuário está logado -->
                <div class="user-info" id="userInfo">
                    <i class="fas fa-user-circle"></i>
                    <span class="user-email" id="userEmail">user@email.com</span>
                    <button class="logout-btn" onclick="handleLogout()" title="Sair">
                        <i class="fas fa-sign-out-alt"></i>
                        <span class="d-none d-md-inline">Sair</span>
                    </button>
                </div>

                <!-- Exibido quando usuário NÃO está logado -->
                <div class="login-area" id="loginArea">
                    <a href="${pageContext.request.contextPath}/pages/login.jsp" class="login-link">
                        <i class="fas fa-sign-in-alt"></i> Login
                    </a>
                </div>
            </div>

            <!-- Menu Mobile Toggle -->
            <button class="mobile-menu-toggle" type="button" onclick="toggleMobileMenu()">
                <span class="hamburger-line"></span>
                <span class="hamburger-line"></span>
                <span class="hamburger-line"></span>
            </button>
        </div>

        <!-- Menu Mobile -->
        <nav class="mobile-menu" id="mobileMenu">
            <ul class="mobile-nav-list">
                <li class="mobile-nav-item">
                    <a href="${pageContext.request.contextPath}/pages/produto.jsp" class="mobile-nav-link">Produtos</a>
                </li>
                <li class="mobile-nav-item">
                    <a href="${pageContext.request.contextPath}/pages/carrinho.jsp" class="mobile-nav-link">Carrinho</a>
                </li>

                <!-- Menu mobile - área do usuário -->
                <li class="mobile-nav-item" id="mobileUserArea">
                    <!-- Será preenchido dinamicamente -->
                </li>
            </ul>
        </nav>
    </div>
</header>

<main class="conteudo">

<!-- Scripts JS do Bootstrap -->
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>

<script>
// FUNÇÃO DE LOGOUT (mesma do login.jsp)
function logout() {
    console.log('Fazendo logout...');

    // Limpa todos os dados da sessão
    sessionStorage.removeItem('access_token');
    sessionStorage.removeItem('usuario_id');
    sessionStorage.removeItem('user_email');

    // Limpa localStorage também (caso tenha algo)
    localStorage.removeItem('access_token');
    localStorage.removeItem('usuario_id');
    localStorage.removeItem('user_email');

    // Revoga o Google Sign-In se existir
    if (typeof google !== 'undefined' && google.accounts) {
        google.accounts.id.disableAutoSelect();
    }

    console.log('Usuário deslogado com sucesso');

    // Redireciona para login
    window.location.href = '${pageContext.request.contextPath}/pages/login.jsp?logout=success';
}

// Função para lidar com logout com confirmação
function handleLogout() {
    if (confirm('Tem certeza que deseja sair?')) {
        logout();
    }
}

// Verifica status de autenticação e atualiza o header
function updateHeaderAuth() {
    const token = sessionStorage.getItem('access_token');
    const userId = sessionStorage.getItem('usuario_id');
    const userEmail = sessionStorage.getItem('user_email');

    const userInfo = document.getElementById('userInfo');
    const loginArea = document.getElementById('loginArea');
    const userEmailSpan = document.getElementById('userEmail');
    const mobileUserArea = document.getElementById('mobileUserArea');

    if (token && userId) {
        // Usuário está logado
        userInfo.classList.add('logged-in');
        loginArea.style.display = 'none';

        // Exibe email do usuário (ou "Usuário" se não tiver email)
        if (userEmail) {
            userEmailSpan.textContent = userEmail;
        } else {
            userEmailSpan.textContent = 'Usuário';
        }

        // Menu mobile
        mobileUserArea.innerHTML = `
            <div style="padding: 10px; border-top: 1px solid #eee; margin-top: 10px;">
                <div style="display: flex; align-items: center; justify-content: space-between;">
                    <span style="color: #666; font-size: 0.9rem;">
                        <i class="fas fa-user-circle"></i> ${userEmail || 'Usuário'}
                    </span>
                    <button onclick="handleLogout()" style="background: none; border: none; color: #dc3545; cursor: pointer; padding: 5px;">
                        <i class="fas fa-sign-out-alt"></i> Sair
                    </button>
                </div>
            </div>
        `;

        console.log('Header atualizado: usuário logado');
    } else {
        // Usuário não está logado
        userInfo.classList.remove('logged-in');
        loginArea.style.display = 'block';

        // Menu mobile
        mobileUserArea.innerHTML = `
            <a href="${pageContext.request.contextPath}/pages/login.jsp" class="mobile-nav-link">
                <i class="fas fa-sign-in-alt"></i> Login
            </a>
        `;

        console.log('Header atualizado: usuário não logado');
    }
}

function toggleMobileMenu() {
    const mobileMenu = document.getElementById('mobileMenu');
    const toggle = document.querySelector('.mobile-menu-toggle');

    mobileMenu.classList.toggle('active');
    toggle.classList.toggle('active');
}

// Fecha menu mobile ao clicar em um link
document.querySelectorAll('.mobile-nav-link').forEach(link => {
    link.addEventListener('click', () => {
        const mobileMenu = document.getElementById('mobileMenu');
        const toggle = document.querySelector('.mobile-menu-toggle');

        mobileMenu.classList.remove('active');
        toggle.classList.remove('active');
    });
});

// Fecha menu mobile ao redimensionar tela
window.addEventListener('resize', () => {
    if (window.innerWidth > 768) {
        const mobileMenu = document.getElementById('mobileMenu');
        const toggle = document.querySelector('.mobile-menu-toggle');

        mobileMenu.classList.remove('active');
        toggle.classList.remove('active');
    }
});

// Inicialização
document.addEventListener('DOMContentLoaded', function() {
    // Atualiza o header baseado no status de autenticação
    updateHeaderAuth();

    // Verifica periodicamente se houve mudanças no login (caso o usuário faça login em outra aba)
    setInterval(updateHeaderAuth, 5000); // Verifica a cada 5 segundos
});

// Escuta mudanças no sessionStorage (se o usuário fizer login/logout em outra aba)
window.addEventListener('storage', function(e) {
    if (e.key === 'access_token' || e.key === 'usuario_id' || e.key === 'user_email') {
        updateHeaderAuth();
    }
});
</script></document_content>