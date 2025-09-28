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
                    <li class="nav-item">
                        <a href="${pageContext.request.contextPath}/pages/login.jsp" class="nav-link">Login</a>
                    </li>
                </ul>
            </nav>

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
                <li class="mobile-nav-item">
                    <a href="${pageContext.request.contextPath}/pages/login.jsp" class="mobile-nav-link">Login</a>
                </li>
            </ul>
        </nav>
    </div>
</header>

<main class="conteudo">

<!-- Scripts JS do Bootstrap -->
<script src="${pageContext.request.contextPath}/js/bootstrap.bundle.min.js"></script>

<script>
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
</script>