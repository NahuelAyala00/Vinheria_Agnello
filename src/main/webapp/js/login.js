// Toggle de senha
function togglePassword() {
    const passwordInput = document.getElementById('password');
    passwordInput.type = passwordInput.type === 'password' ? 'text' : 'password';
}

// Login via FastAPI
async function handleSubmit(event) {
    event.preventDefault();

    const email = document.getElementById('email').value;
    const senha = document.getElementById('password').value;

    try {
        const response = await fetch('http://127.0.0.1:8000/usuarios/login', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ email, senha })
        });

        if (!response.ok) {
            const errorData = await response.json();
            alert(errorData.detail || 'Erro ao logar');
            return;
        }

        const data = await response.json();
        console.log('Login bem-sucedido:', data);

        window.location.href = 'index.jsp'; // redireciona para a página principal
    } catch (err) {
        console.error('Erro de rede:', err);
        alert('Não foi possível conectar ao servidor');
    }
}

// Esqueceu senha
function forgotPassword() {
    console.log('Forgot password clicked');
    // window.location.href = 'forgot-password.jsp';
}

// Google login
function googleLogin() {
    console.log('Google login clicked');
    // window.location.href = 'google-auth';
}

// Suporte à tecla Enter
document.addEventListener('DOMContentLoaded', () => {
    const form = document.getElementById('loginForm');
    form.addEventListener('keypress', (e) => {
        if (e.key === 'Enter') form.submit();
    });
});
