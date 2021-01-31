var slideIndex = 1;

function currentSlide_gallery(n,pic_set,caption) {
    showSlides_gallery(slideIndex = n,pic_set,caption);
}

function showSlides_gallery(n,pic_set,caption) {
    var i;
    var slides = document.getElementsByClassName("mySlides_gallery"+pic_set);
    var dots = document.getElementsByClassName("demo"+pic_set);
    if (n > slides.length) {slideIndex = 1}
    if (n < 1) {slideIndex = slides.length}
    for (i = 0; i < slides.length; i++) {
        slides[i].style.display = "none";
    }
    for (i = 0; i < dots.length; i++) {
        dots[i].className = dots[i].className.replace(" active", "");
    }
    slides[slideIndex-1].style.display = "block";
    dots[slideIndex-1].className += " active";
    document.getElementById("caption"+pic_set).innerHTML = caption;
}
