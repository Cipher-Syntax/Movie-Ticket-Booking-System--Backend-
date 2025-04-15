
document.addEventListener('DOMContentLoaded', function() {

    document.querySelector('.vertical-scroll');
    const scrollUpBtn = document.getElementById('scroll-up');
    const scrollDownBtn = document.getElementById('scroll-down');
    
    const cinema = document.querySelectorAll('.container');
    let count = 0;
    
    function scrollToCinema(i) {
        if (i >= 0 && i < cinema.length) {
            cinema[i].scrollIntoView({
                behavior: 'smooth',
                block: 'start'
            });
            count = i;
            
            buttonStatus();
        }
    }
    
    function buttonStatus() {
        // first item 
        if (count === 0) {
            scrollUpBtn.disabled = true;
            scrollUpBtn.style.opacity = '0.5';
        } else {
            scrollUpBtn.disabled = false;
            scrollUpBtn.style.opacity = '1';
        }
    
        // last item
        if (count === cinema.length - 1) {
            scrollDownBtn.disabled = true;
            scrollDownBtn.style.opacity = '0.5';
        } else {
            scrollDownBtn.disabled = false;
            scrollDownBtn.style.opacity = '1';
        }
    }
    
    
    scrollDownBtn.addEventListener('click', function() {
        if (count < cinema.length - 1) {
            scrollToCinema(count + 1);
        }
    });
    
    scrollUpBtn.addEventListener('click', function() {
        if (count > 0) {
            scrollToCinema(count - 1);
        }
    });
    
    buttonStatus();
});

// USER PROFILE MENU
let subMenu = document.getElementById("js-sub-menu");

function toggleMenu(){
    subMenu.classList.toggle("js-open-menu");
}
