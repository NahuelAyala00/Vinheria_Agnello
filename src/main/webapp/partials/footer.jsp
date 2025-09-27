<%@ page contentType="text/html;charset=UTF-8" language="java" %>

</main>

<!-- CSS do footer -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style-footer.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">

<!-- Footer -->
<footer class="footer-custom">
    <div class="container footer-grid"> <!-- Adicionei footer-grid -->
        <div class="footer-content"> <!-- Mudei row para footer-content -->

            <!-- Coluna Esquerda -->
            <div class="footer-left">
                <!-- Contato -->
                <div class="footer-section">
                    <h4 class="footer-title">Contato</h4>
                    <div class="footer-contact">
                        <div class="contact-item">
                            <i class="fas fa-map-marker-alt contact-icon"></i>
                            <span>Rua das Vinhas, 123 - Cidade do Vinho</span>
                        </div>
                        <div class="contact-item">
                            <i class="fas fa-phone contact-icon"></i>
                            <span>+55 (11) 1234-5678</span>
                        </div>
                        <div class="contact-item">
                            <i class="fas fa-envelope contact-icon"></i>
                            <span>contato@vinheria.com</span>
                        </div>
                    </div>
                </div>

                <!-- Redes sociais -->
                <div class="footer-section">
                    <h4 class="footer-title">Siga-nos</h4>
                    <div class="social-media">
                        <a class="social-link" href="https://www.facebook.com" target="_blank" rel="noopener">
                            <i class="fab fa-facebook-square"></i>
                        </a>
                        <a class="social-link" href="https://www.instagram.com" target="_blank" rel="noopener">
                            <i class="fab fa-instagram"></i>
                        </a>
                    </div>
                </div>

                <!-- Ícone de coração -->
                <div class="footer-love">
                    <i class="fas fa-heart"></i>
                </div>
            </div>

            <!-- Coluna Direita (Mapa) -->
            <div class="footer-right">
                <h4 class="footer-title">Localização</h4>
                <div class="footer-map">
                    <iframe
                        src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3656.8436844371417!2d-46.625742324751755!3d-23.574056962058588!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x94ce597abf1a28ff%3A0x1b02a58f85e6395e!2zRklBUCAtIEFjbGltYcOnw6Nv!5e0!3m2!1spt-BR!2sbr!4v1758942151135!5m2!1spt-BR!2sbr"
                        loading="lazy"
                        referrerpolicy="no-referrer-when-downgrade"
                        title="Mapa - Vinheria">
                    </iframe>
                </div>
            </div>
        </div> <!-- Fechamento do footer-content -->

        <!-- Copyright -->
        <div class="footer-bottom">
            <p>&copy; 2025 Vinheria Agnello. Todos os direitos reservados.</p>
        </div>
    </div>
</footer>