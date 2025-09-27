// Mapeamento de imagens
const imagensVinhos = {
    'Vinho Reserva': 'otronia_45_rugientes_pinot_noir.png',
    'Vinho Branco Seco': 'rute_89_reserve_malbec.png',
    'Vinho Primitivo Torrevento': 'torrevento_infinitum_primitivo_puglia_IGT.png',
    'Vinho Tannat Garzón': 'garzon_reserva_tannat.png',
    'Vinho Anza Rioja': 'anza_rioja.png',
    'Chambolle-musigny Vieilles Vignes': 'anza_rioja.png'
};

function gerarEstrelas(preco) {
    let rating = 3;
    if (preco > 100) rating = 5;
    else if (preco > 80) rating = 4.5;
    else if (preco > 60) rating = 4;
    else if (preco > 40) rating = 3.5;

    const fullStars = Math.floor(rating);
    const hasHalf = rating % 1 !== 0;
    let stars = '';
    for (let i = 0; i < fullStars; i++) stars += '<i class="fas fa-star"></i>';
    if (hasHalf) stars += '<i class="fas fa-star-half-alt"></i>';
    const emptyStars = 5 - fullStars - (hasHalf ? 1 : 0);
    for (let i = 0; i < emptyStars; i++) stars += '<i class="far fa-star"></i>';
    return stars;
}

function mostrarElemento(id, mostrar) {
    document.getElementById(id).style.display = mostrar ? 'block' : 'none';
}

async function carregarVinhos() {
    mostrarElemento('loading', true);
    mostrarElemento('error-container', false);
    mostrarElemento('no-wines', false);
    const container = document.getElementById('vinhos-container');
    container.innerHTML = '';

    try {
        const response = await fetch('http://127.0.0.1:8000/vinhos');
        if (!response.ok) throw new Error(`HTTP ${response.status}`);
        const vinhos = await response.json();
        mostrarElemento('loading', false);

        if (!vinhos || vinhos.length === 0) {
            mostrarElemento('no-wines', true);
            return;
        }

        vinhos.forEach(vinho => {
            const imagemNome = imagensVinhos[vinho.nome] || 'default-wine.png';
            const estrelas = gerarEstrelas(vinho.preco);
            const numAvaliacoes = Math.floor(Math.random() * 150) + 50;

            const div = document.createElement('div');
            div.className = 'col-lg-4 col-md-6 mb-4';
            div.innerHTML = `
                <div class="product-card">
                    <div class="product-image text-center mb-3">
                        <img src="img/${imagemNome}" class="img-fluid" style="max-width:120px;" alt="${vinho.nome}" onerror="this.src='img/default-wine.png'">
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
                            <small class="text-muted"><strong>Tipo:</strong> ${vinho.tipo} | <strong>Estoque:</strong> ${vinho.estoque}</small>
                        </div>
                        <button class="btn-product mt-3" onclick="verDetalhes(${vinho.id})"><i class="fas fa-shopping-cart"></i> Ver mais</button>
                    </div>
                </div>
            `;
            container.appendChild(div);
        });
    } catch (error) {
        mostrarElemento('loading', false);
        mostrarElemento('error-container', true);

        let mensagemErro = 'Erro desconhecido.';
        if (error.message.includes('fetch')) mensagemErro = 'Não foi possível conectar ao servidor. Verifique se a API está rodando.';
        else if (error.message.includes('CORS')) mensagemErro = 'Erro de CORS. Configure o backend para aceitar requisições do frontend.';
        else if (error.message.includes('404')) mensagemErro = 'Endpoint não encontrado.';
        else if (error.message.includes('500')) mensagemErro = 'Erro interno do servidor.';

        document.getElementById('error-message').textContent = mensagemErro;
        console.error(error);
    }
}

function verDetalhes(vinhoId) {
    alert(`Visualizar detalhes do vinho (ID: ${vinhoId})`);
}

window.addEventListener('DOMContentLoaded', carregarVinhos);
window.carregarVinhos = carregarVinhos;
