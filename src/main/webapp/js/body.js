// Mapeamento de imagens para os vinhos
const imagensVinhos = {
    'vinho reserva': 'otronia_45_rugientes_pinot_noir.png',
    'vinho tannat garzon': 'garzon_reserva_tannat.png',
    'vinho branco seco': 'rute_89_reserve_malbec.png',
    'vinho primitivo torrevento': 'torrevento_infinitum_primitivo_puglia_IGT.png',
    'vinho anza rioja': 'anza_rioja.png',
    'chambolle-musigny vieilles vignes': 'Chambolle_musigny_Vieilles_Vignes.png'
};

// Função para gerar estrelas baseado no preço
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
    const elemento = document.getElementById(id);
    if (elemento) {
        elemento.style.display = mostrar ? 'block' : 'none';
    }
}

// Função para obter o context path dinamicamente
function getContextPath() {
    // Pega o path atual e remove a página
    const path = window.location.pathname;
    const contextPath = path.substring(0, path.lastIndexOf('/'));
    return contextPath || '';
}

// Função principal para carregar vinhos
async function carregarVinhos() {
    console.log('Iniciando carregamento dos vinhos...');

    // Mostrar loading e ocultar outros elementos
    mostrarElemento('loading', true);
    mostrarElemento('error-container', false);
    mostrarElemento('no-wines', false);

    const container = document.getElementById('vinhos-container');
    if (container) {
        container.innerHTML = '';
    }

    try {
        // Fazer requisição para API
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

        // Verificar se há vinhos
        if (!vinhos || vinhos.length === 0) {
            mostrarElemento('no-wines', true);
            return;
        }

        // Gerar cards para cada vinho
        const contextPath = getContextPath();

        vinhos.forEach(vinho => {
            // Pega a imagem correspondente ao nome (case-insensitive)
            const imagemNome = imagensVinhos[vinho.nome.toLowerCase()] || 'default-wine.png';
            const estrelas = gerarEstrelas(vinho.preco);
            const numAvaliacoes = Math.floor(Math.random() * 150) + 50;

            // Monta o caminho correto para as imagens
            const imgPath = `${contextPath}/img/${imagemNome}`;
            const fallbackPath = `${contextPath}/img/default-wine.png`;

            console.log(`Vinho: ${vinho.nome} | Imagem: ${imagemNome} | Path: ${imgPath}`);

            const div = document.createElement('div');
            div.className = 'col-lg-4 col-md-6 mb-4';
            div.innerHTML = `
                <div class="product-card">
                    <div class="product-image text-center mb-3">
                        <img src="${imgPath}"
                             class="img-fluid"
                             style="max-width:120px; height:auto; border-radius:8px;"
                             alt="${vinho.nome}"
                             onerror="console.log('Erro ao carregar: ${imagemNome}'); this.src='${fallbackPath}'">
                    </div>
                    <div class="product-info">
                        <div class="product-rating mb-2">
                            <div class="stars d-inline-block me-2">${estrelas}</div>
                            <span class="rating-count">(${numAvaliacoes} avaliações)</span>
                        </div>
                        <h3 class="product-title">${vinho.nome}</h3>
                        <p class="product-price">R$ ${parseFloat(vinho.preco).toFixed(2).replace('.', ',')}</p>
                        <p class="product-description">${vinho.descricao || 'Descrição não disponível.'}</p>
                        <div class="wine-info mt-2 p-2 bg-light rounded">
                            <small class="text-muted">
                                <strong>Tipo:</strong> ${vinho.tipo} |
                                <strong>Estoque:</strong> ${vinho.estoque} unidades
                            </small>
                        </div>
                        <button class="btn-product mt-3" onclick="verDetalhes(${vinho.id})">
                            <i class="fas fa-shopping-cart"></i> Ver mais
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

        const errorElement = document.getElementById('error-message');
        if (errorElement) {
            errorElement.textContent = mensagemErro;
        }
    }
}

// Função para ver detalhes do vinho
function verDetalhes(vinhoId) {
    console.log('Ver detalhes do vinho ID:', vinhoId);

    // Buscar detalhes do vinho específico
    buscarDetalhesVinho(vinhoId);
}

// Função para buscar detalhes de um vinho específico
async function buscarDetalhesVinho(vinhoId) {
    try {
        const response = await fetch(`http://127.0.0.1:8000/vinhos/${vinhoId}`);
        if (response.ok) {
            const vinho = await response.json();
            console.log('Detalhes do vinho:', vinho);
            mostrarModalDetalhes(vinho);
        } else {
            alert('Erro ao carregar detalhes do vinho');
        }
    } catch (error) {
        console.error('Erro ao buscar detalhes:', error);
        alert(`Visualizar detalhes do vinho (ID: ${vinhoId})\n\nImplementar modal de detalhes aqui.`);
    }
}

// Função para mostrar modal com detalhes do vinho
function mostrarModalDetalhes(vinho) {
    // Criar modal simples para mostrar detalhes
    const modalHTML = `
        <div class="modal fade" id="detalhesModal" tabindex="-1" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">${vinho.nome}</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-4 text-center">
                                <img src="${getContextPath()}/img/${imagensVinhos[vinho.nome.toLowerCase()] || 'default-wine.png'}"
                                     class="img-fluid" style="max-width: 150px;" alt="${vinho.nome}">
                            </div>
                            <div class="col-md-8">
                                <p><strong>Tipo:</strong> ${vinho.tipo}</p>
                                <p><strong>Preço:</strong> R$ ${parseFloat(vinho.preco).toFixed(2).replace('.', ',')}</p>
                                <p><strong>Estoque:</strong> ${vinho.estoque} unidades</p>
                                <p><strong>Descrição:</strong></p>
                                <p>${vinho.descricao || 'Não informada'}</p>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
                        <button type="button" class="btn btn-primary" onclick="adicionarAoCarrinho(${vinho.id})">
                            <i class="fas fa-cart-plus"></i> Adicionar ao Carrinho
                        </button>
                    </div>
                </div>
            </div>
        </div>
    `;

    // Remover modal existente se houver
    const modalExistente = document.getElementById('detalhesModal');
    if (modalExistente) {
        modalExistente.remove();
    }

    document.body.insertAdjacentHTML('beforeend', modalHTML);

    // Mostrar modal (Bootstrap)
    if (typeof bootstrap !== 'undefined') {
        const modal = new bootstrap.Modal(document.getElementById('detalhesModal'));
        modal.show();
    }
}

// Função para adicionar ao carrinho (placeholder)
function adicionarAoCarrinho(vinhoId) {
    console.log('Adicionando vinho ao carrinho:', vinhoId);
    alert(`Vinho adicionado ao carrinho!\n(ID: ${vinhoId})`);

    // Fechar modal se estiver aberto
    const modal = bootstrap.Modal.getInstance(document.getElementById('detalhesModal'));
    if (modal) {
        modal.hide();
    }

    // Aqui você implementaria a lógica real do carrinho
    // Por exemplo: salvar no localStorage, enviar para API, etc.
}

// Função para testar imagens
function verificarImagens() {
    console.log('Verificando imagens...');
    const contextPath = getContextPath();

    Object.values(imagensVinhos).forEach(imagem => {
        const img = new Image();
        img.onload = () => console.log(`✅ Imagem OK: ${imagem}`);
        img.onerror = () => console.log(`❌ Imagem não encontrada: ${imagem}`);
        img.src = `${contextPath}/img/${imagem}`;
    });
}

// Função para recarregar vinhos (usada pelo botão de erro)
function recarregarVinhos() {
    carregarVinhos();
}

// Executar quando o DOM estiver carregado
document.addEventListener('DOMContentLoaded', function() {
    console.log('DOM carregado. Iniciando carregamento dos vinhos...');
    carregarVinhos();
});

// Funções globais para debug
window.carregarVinhos = carregarVinhos;
window.verificarImagens = verificarImagens;
window.verDetalhes = verDetalhes;
window.adicionarAoCarrinho = adicionarAoCarrinho;