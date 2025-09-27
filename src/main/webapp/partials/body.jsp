<!-- partials/produtos.jsp -->
<div id="loading" class="text-center py-5">
    <div class="spinner-border text-danger" role="status">
        <span class="visually-hidden">Carregando...</span>
    </div>
    <p class="mt-2">Carregando vinhos...</p>
</div>

<section class="products-section">
    <div class="container">
        <div class="row" id="vinhos-container"></div>

        <div id="error-container" class="row" style="display: none;">
            <div class="col-12">
                <div class="alert alert-danger text-center">
                    <h4>Erro ao carregar vinhos</h4>
                    <p id="error-message">Verifique se o servidor está rodando.</p>
                    <button class="btn btn-outline-danger" onclick="carregarVinhos()">Tentar Novamente</button>
                </div>
            </div>
        </div>

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

<script src="${pageContext.request.contextPath}/assets/js/body.js"></script>
