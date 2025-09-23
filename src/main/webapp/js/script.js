const catalogo = document.querySelector('.catalogo');
document.getElementById('next').addEventListener('click', () => {
    catalogo.scrollBy({ left: 200, behavior: 'smooth' });
});
document.getElementById('prev').addEventListener('click', () => {
    catalogo.scrollBy({ left: -200, behavior: 'smooth' });
});
