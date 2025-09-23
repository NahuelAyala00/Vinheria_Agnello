<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="partials/header.jsp" %>

<!-- Hero Section -->
<section class="hero-section">
    <div class="container">
        <div class="hero-content">
            <h1 class="hero-title">Bem-vindo à Loja de Vinhos</h1>
            <p class="hero-subtitle">Escolha o vinho perfeito para sua ocasião!</p>
        </div>
    </div>
</section>

<!-- Products Section -->
<section class="products-section">
    <div class="container">
        <div class="row">
                        <!-- Product Card 1 -->
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="product-card">
                    <!-- Imagem centralizada -->
                    <div class="product-image" style="display: flex; justify-content: center; margin-bottom: 15px;">
                        <img src="${pageContext.request.contextPath}/img/otronia_45_rugientes_pinot_noir.png"
                             class="img-fluid"
                             style="max-width: 120px; height: auto;"
                             alt="Vinho Reserva">
                    </div>

                    <div class="product-info">
                        <!-- Avaliações -->
                        <div class="product-rating" style="margin-bottom: 10px;">
                            <div class="stars" style="display: inline-block; margin-right: 5px;">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                            </div>
                            <span class="rating-count">(127 avaliações)</span>
                        </div>

                        <h3 class="product-title">Vinho Reserva</h3>
                        <p class="product-price">R$ 89,90</p>
                        <p class="product-description">
                            Um Pinot Noir elegante, perfeito para jantares especiais.
                            Notas de frutas vermelhas com final suave e equilibrado.
                        </p>
                        <button class="btn-product">
                            <i class="fas fa-shopping-cart"></i>
                            Ver mais
                        </button>
                    </div>
                </div>
            </div>
            <!-- Product Card 2 -->
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="product-card">
                    <!-- Imagem centralizada -->
                    <div class="product-image" style="display: flex; justify-content: center; margin-bottom: 15px;">
                        <img src="${pageContext.request.contextPath}/img/rute_89_reserve_malbec.png"
                             class="img-fluid"
                             style="max-width: 120px; height: auto;"
                             alt="Vinho Branco">
                    </div>

                    <div class="product-info">
                        <!-- Avaliações -->
                        <div class="product-rating" style="margin-bottom: 10px;">
                            <div class="stars" style="display: inline-block; margin-right: 5px;">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="far fa-star"></i>
                            </div>
                            <span class="rating-count">(89 avaliações)</span>
                        </div>

                        <h3 class="product-title">Vinho Branco Seco</h3>
                        <p class="product-price">R$ 59,90</p>
                        <p class="product-description">
                            Um Malbec suave, ideal para acompanhar massas e saladas.
                            Sabor fresco com notas cítricas marcantes.
                        </p>
                        <button class="btn-product">
                            <i class="fas fa-shopping-cart"></i>
                            Ver mais
                        </button>
                    </div>
                </div>
            </div>
            <!-- Product Card 3 -->
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="product-card">
                    <!-- Imagem centralizada -->
                    <div class="product-image" style="display: flex; justify-content: center; margin-bottom: 15px;">
                        <img src="${pageContext.request.contextPath}/img/torrevento_infinitum_primitivo_puglia_IGT.png"
                             class="img-fluid"
                             style="max-width: 120px; height: auto;"
                             alt="Vinho Primitivo">
                    </div>

                    <div class="product-info">
                        <div class="product-rating" style="margin-bottom: 10px;">
                            <div class="stars" style="display: inline-block; margin-right: 5px;">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                            </div>
                            <span class="rating-count">(203 avaliações)</span>
                        </div>

                        <h3 class="product-title">Vinho Primitivo Torrevento</h3>
                        <p class="product-price">R$ 79,90</p>
                        <p class="product-description">
                            Um Primitivo intenso, para apreciadores de vinhos encorpados.
                            Corpo robusto com taninos bem estruturados.
                        </p>
                        <button class="btn-product">
                            <i class="fas fa-shopping-cart"></i>
                            Ver mais
                        </button>
                    </div>
                </div>
            </div>

            <!-- Product Card 4 -->
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="product-card">
                    <div class="product-image" style="display: flex; justify-content: center; margin-bottom: 15px;">
                        <img src="${pageContext.request.contextPath}/img/garzon_reserva_tannat.png"
                             class="img-fluid"
                             style="max-width: 120px; height: auto;"
                             alt="Vinho Tannat">
                    </div>

                    <div class="product-info">
                        <div class="product-rating" style="margin-bottom: 10px;">
                            <div class="stars" style="display: inline-block; margin-right: 5px;">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="far fa-star"></i>
                            </div>
                            <span class="rating-count">(156 avaliações)</span>
                        </div>

                        <h3 class="product-title">Vinho Tannat Garzón</h3>
                        <p class="product-price">R$ 69,90</p>
                        <p class="product-description">
                            Um Tannat rico em sabor e aroma, ideal para carnes vermelhas.
                            Apresenta complexidade e elegância em cada gole.
                        </p>
                        <button class="btn-product">
                            <i class="fas fa-shopping-cart"></i>
                            Ver mais
                        </button>
                    </div>
                </div>
            </div>

            <!-- Product Card 5 -->
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="product-card">
                    <div class="product-image" style="display: flex; justify-content: center; margin-bottom: 15px;">
                        <img src="${pageContext.request.contextPath}/img/anza_rioja.png"
                             class="img-fluid"
                             style="max-width: 120px; height: auto;"
                             alt="Vinho Rioja">
                    </div>

                    <div class="product-info">
                        <div class="product-rating" style="margin-bottom: 10px;">
                            <div class="stars" style="display: inline-block; margin-right: 5px;">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                            </div>
                            <span class="rating-count">(312 avaliações)</span>
                        </div>

                        <h3 class="product-title">Vinho Anza Rioja</h3>
                        <p class="product-price">R$ 99,90</p>
                        <p class="product-description">
                            Rioja encorpado com notas frutadas, perfeito para celebrações.
                            Tradição espanhola com qualidade excepcional.
                        </p>
                        <button class="btn-product">
                            <i class="fas fa-shopping-cart"></i>
                            Ver mais
                        </button>
                    </div>
                </div>
            </div>

            <!-- Product Card 6 -->
            <div class="col-lg-4 col-md-6 mb-4">
                <div class="product-card">
                    <div class="product-image" style="display: flex; justify-content: center; margin-bottom: 15px;">
                        <img src="${pageContext.request.contextPath}/img/anza_rioja.png"
                             class="img-fluid"
                             style="max-width: 120px; height: auto;"
                             alt="Vinho Rioja">
                    </div>

                    <div class="product-info">
                        <div class="product-rating" style="margin-bottom: 10px;">
                            <div class="stars" style="display: inline-block; margin-right: 5px;">
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="fas fa-star"></i>
                                <i class="far fa-star"></i>
                            </div>
                            <span class="rating-count">(94 avaliações)</span>
                        </div>

                        <h3 class="product-title">Vinho Cabernet Premium</h3>
                        <p class="product-price">R$ 129,90</p>
                        <p class="product-description">
                            Cabernet Sauvignon premium com 3 anos de envelhecimento.
                            Complexidade aromática e sabor inesquecível.
                        </p>
                        <button class="btn-product">
                            <i class="fas fa-shopping-cart"></i>
                            Ver mais
                        </button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

<%@ include file="partials/footer.jsp" %>