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

<!-- Loading -->
<div id="loading" class="text-center py-5">
    <div class="spinner-border text-danger" role="status">
        <span class="visually-hidden">Carregando...</span>
    </div>
    <p class="mt-2">Carregando vinhos...</p>
</div>

<!-- Products Section -->
<section class="products-section">
    <div class="container">
        <div class="row" id="vinhos-container">
            <!-- Os cards serão inseridos aqui via JavaScript -->
        </div>

        <!-- Mensagem de erro -->
        <div id="error-container" class="row" style="display: none;">
            <div class="col-12">
                <div class="alert alert-danger text-center">
                    <h4>Erro ao carregar vinhos</h4>
                    <p id="error-message">Verifique se o servidor está rodando.</p>
                    <button class="btn btn-outline-danger" onclick="carregarVinhos()">Tentar Novamente</button>
                </div>
            </div>
        </div>

        <!-- Mensagem quando não há vinhos -->
        <div id="no-wines" class="row" style="display: none;">
            <div class="col-12">
                <div class="alert alert-warning text-center">
                    <h4>Nenhum vinho encontrado</h4>
                    <p>Adicione alguns vinhos no backend para vê-los aqui.</p>
                </div>
            </div>
        </div>
    </div>
</section>


<%@ include file="partials/footer.jsp" %>

<script>
// Mapeamento de imagens para os vinhos
const imagensVinhos = {
    'Vinho Reserva': 'otronia_45_rugientes_pinot_noir.png',
    'Vinho Branco Seco': 'rute_89_reserve_malbec.png',
    'Vinho Primitivo Torrevento': 'torrevento_infinitum_primitivo_puglia_IGT.png',
    'Vinho Tannat Garzón': 'garzon_reserva_tannat.png',
    'Vinho Anza Rioja': 'anza_rioja.png',
    'Chambolle-musigny Vieilles Vignes': 'anza_rioja.png'
};

// Função para gerar estrelas baseado no preço (simulação)
function gerarEstrelas(preco) {
    let rating = 3; // Base
    if (preco > 100) rating = 5;
    else if (preco > 80) rating = 4.5;
    else if (preco > 60) rating = 4;
    else if (preco > 40) rating = 3.5;

    const fullStars = Math.floor(rating);
    const hasHalf = rating % 1 !== 0;
    let stars = '';

    for (let i = 0; i < fullStars; i++) {
        stars += '<i class="fas fa-star"></i>';
    }

    if (hasHalf) {
        stars += '<i class="fas fa-star-half-alt"></i>';
    }

    const emptyStars = 5 - fullStars - (hasHalf ? 1 : 0);
    for (let i = 0; i < emptyStars; i++) {
        stars += '<i class="far fa-star"></i>';
    }

    return stars;
}

// Função para mostrar/ocultar elementos
function mostrarElemento(id, mostrar) {
    document.getElementById(id).style.display = mostrar ? 'block' : 'none';
}

async function carregarVinhos() {
    console.log('Iniciando carregamento dos vinhos...');

    // Mostrar loading e ocultar outros elementos
    mostrarElemento('loading', true);
    mostrarElemento('error-container', false);
    mostrarElemento('no-wines', false);
    document.getElementById('vinhos-container').innerHTML = '';

    try {
        // Fazer requisição para API (removendo a barra do final)
        const response = await fetch('http://127.0.0.1:8000/vinhos', {
            method: 'GET',
            headers: {
                'Accept': 'application/json'
            }
        });

        console.log('Status da resposta:', response.status);

        if (!response.ok) {
            throw new Error(`Erro HTTP: ${response.status} - ${response.statusText}`);
        }

        const vinhos = await response.json();
        console.log('Vinhos recebidos:', vinhos);

        mostrarElemento('loading', false);

        const container = document.getElementById('vinhos-container');

        // Verificar se há vinhos
        if (!vinhos || vinhos.length === 0) {
            mostrarElemento('no-wines', true);
            return;
        }

        // Gerar cards para cada vinho
        vinhos.forEach((vinho, index) => {
            console.log(`Processando vinho ${index + 1}:`, vinho);

            // Determinar imagem baseada no nome
            const imagemNome = imagensVinhos[vinho.nome] || 'default-wine.png';

            // Gerar avaliação simulada baseada no preço
            const estrelas = gerarEstrelas(vinho.preco);
            const numAvaliacoes = Math.floor(Math.random() * 150) + 50; // Entre 50-200

            const div = document.createElement('div');
            div.className = 'col-lg-4 col-md-6 mb-4';
            div.innerHTML = `
                <div class="product-card">
                    <div class="product-image" style="display: flex; justify-content: center; margin-bottom: 15px;">
                        <img src="${pageContext.request.contextPath}/img/${imagemNome}"
                             class="img-fluid"
                             style="max-width: 120px; height: auto;"
                             alt="${vinho.nome}"
                             onerror="this.src='${pageContext.request.contextPath}/img/default-wine.png'">
                    </div>
                    <div class="product-info">
                        <div class="product-rating" style="margin-bottom: 10px;">
                            <div class="stars" style="display: inline-block; margin-right: 5px;">
                                ${estrelas}
                            </div>
                            <span class="rating-count">(${numAvaliacoes} avaliações)</span>
                        </div>
                        <h3 class="product-title">${vinho.nome}</h3>
                        <p class="product-price">R$ ${parseFloat(vinho.preco).toFixed(2).replace('.', ',')}</p>
                        <p class="product-description">
                            ${vinho.descricao || 'Descrição não disponível.'}
                        </p>
                        <div class="wine-info mt-2 p-2" style="background-color: #f8f9fa; border-radius: 5px;">
                            <small class="text-muted">
                                <strong>Tipo:</strong> ${vinho.tipo} |
                                <strong>Estoque:</strong> ${vinho.estoque} unidades
                            </small>
                        </div>
                        <button class="btn-product mt-3" onclick="verDetalhes(${vinho.id})">
                            <i class="fas fa-shopping-cart"></i>
                            Ver mais
                        </button>
                    </div>
                </div>
            `;
            container.appendChild(div);
        });

        console.log(`Total de ${vinhos.length} vinhos carregados com sucesso!`);

    } catch (error) {
        console.error('Erro ao carregar vinhos:', error);

        mostrarElemento('loading', false);
        mostrarElemento('error-container', true);

        // Determinar mensagem de erro específica
        let mensagemErro = 'Erro desconhecido.';

        if (error.name === 'TypeError' && error.message.includes('fetch')) {
            mensagemErro = 'Não foi possível conectar com o servidor. Verifique se a API está rodando em http://127.0.0.1:8000';
        } else if (error.message.includes('CORS')) {
            mensagemErro = 'Erro de CORS. Configure o servidor Python para aceitar requisições do frontend.';
        } else if (error.message.includes('404')) {
            mensagemErro = 'Endpoint não encontrado. Verifique se a URL da API está correta.';
        } else if (error.message.includes('500')) {
            mensagemErro = 'Erro interno do servidor. Verifique os logs do backend Python.';
        } else {
            mensagemErro = error.message;
        }

        document.getElementById('error-message').textContent = mensagemErro;
    }
}

// Função para ver detalhes do vinho
function verDetalhes(vinhoId) {
    console.log('Ver detalhes do vinho ID:', vinhoId);

    // Por enquanto, mostrar um alert simples
    // Você pode implementar um modal ou redirecionar para uma página de detalhes
    alert(`Visualizar detalhes do vinho (ID: ${vinhoId})\n\nEsta funcionalidade pode ser expandida para mostrar mais informações ou redirecionar para uma página de produto.`);

    // Exemplo de como buscar detalhes específicos:
    // buscarDetalhesVinho(vinhoId);
}

// Função opcional para buscar detalhes de um vinho específico
async function buscarDetalhesVinho(vinhoId) {
    try {
        const response = await fetch(`http://127.0.0.1:8000/vinhos/${vinhoId}`);
        if (response.ok) {
            const vinho = await response.json();
            console.log('Detalhes do vinho:', vinho);
            // Implementar modal ou redirecionamento aqui
        }
    } catch (error) {
        console.error('Erro ao buscar detalhes:', error);
    }
}

// Executar quando a página carregar
window.addEventListener('DOMContentLoaded', function() {
    console.log('Página carregada. Carregando vinhos...');
    carregarVinhos();
});

// Função global para recarregar (útil para debug)
window.carregarVinhos = carregarVinhos;
</script>