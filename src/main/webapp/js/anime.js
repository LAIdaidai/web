let currentSlide = 0;
const slides = document.querySelectorAll('.carousel-slide img');
const totalSlides = slides.length;

function showSlide(index) {
    const carousel = document.querySelector('.carousel-slide');
    const newTransformValue = -index * 100;  // 修改为百分比平移
    carousel.style.transform = `translateX(${newTransformValue}%)`;
}

document.querySelector('.carousel-prev').addEventListener('click', function() {
    currentSlide = (currentSlide === 0) ? totalSlides - 1 : currentSlide - 1;
    showSlide(currentSlide);
});

document.querySelector('.carousel-next').addEventListener('click', function() {
    currentSlide = (currentSlide === totalSlides - 1) ? 0 : currentSlide + 1;
    showSlide(currentSlide);
});

document.addEventListener('DOMContentLoaded', function() {
    showSlide(currentSlide);  // 初始化显示第一张幻灯片
});
