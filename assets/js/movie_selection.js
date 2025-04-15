function scrollToNowShowing() {
    document.getElementById("js-now-showing").scrollIntoView({ behavior: "smooth" });
}

document.addEventListener("DOMContentLoaded", () => {

    nowShowingScrolling();
    popularMoviesScrolling();
    comingSoonScrolling();
});

// Now Showing scrolling
function nowShowingScrolling() {
    const container = document.querySelector(".js-now-showing-scroll");
    const leftBtn = document.getElementById("now-showing-scroll-left");
    const rightBtn = document.getElementById("now-showing-scroll-right");
    
    const scrollAmount = 500;
    let currentScroll = 0;
    
    function buttonStatus() {
        if (currentScroll <= 0) {
            leftBtn.disabled = true;
            leftBtn.style.opacity = '0.5';
        } else {
            leftBtn.disabled = false;
            leftBtn.style.opacity = '1';
        }
        
        if (currentScroll >= container.scrollWidth - container.clientWidth) {
            rightBtn.disabled = true;
            rightBtn.style.opacity = '0.5';
        } else {
            rightBtn.disabled = false;
            rightBtn.style.opacity = '1';
        }
    }
    
    rightBtn.addEventListener('click', function() {
        currentScroll = Math.min(currentScroll + scrollAmount, container.scrollWidth - container.clientWidth);
        container.scrollTo({
            left: currentScroll,
            behavior: 'smooth'
        });
        buttonStatus();
    });
    
    leftBtn.addEventListener('click', function() {
        currentScroll = Math.max(0, currentScroll - scrollAmount);
        container.scrollTo({
            left: currentScroll,
            behavior: 'smooth'
        });
        buttonStatus();
    });
    
    container.addEventListener('scroll', function() {
        currentScroll = container.scrollLeft;
        buttonStatus();
    });
    
    buttonStatus();
}

// Popular Movies scrolling
function popularMoviesScrolling() {
    const container = document.querySelector(".js-popular-movies-scroll");
    const leftBtn = document.getElementById("popular-movies-scroll-left");
    const rightBtn = document.getElementById("popular-movies-scroll-right");
    
    const scrollAmount = 500;
    let currentScroll = 0;
    
    function buttonStatus() {
        if (currentScroll <= 0) {
            leftBtn.disabled = true;
            leftBtn.style.opacity = '0.5';
        } else {
            leftBtn.disabled = false;
            leftBtn.style.opacity = '1';
        }
        
        if (currentScroll >= container.scrollWidth - container.clientWidth) {
            rightBtn.disabled = true;
            rightBtn.style.opacity = '0.5';
        } else {
            rightBtn.disabled = false;
            rightBtn.style.opacity = '1';
        }
    }
    
    rightBtn.addEventListener('click', function() {
        currentScroll = Math.min(currentScroll + scrollAmount, container.scrollWidth - container.clientWidth);
        container.scrollTo({
            left: currentScroll,
            behavior: 'smooth'
        });
        buttonStatus();
    });
    
    leftBtn.addEventListener('click', function() {
        currentScroll = Math.max(0, currentScroll - scrollAmount);
        container.scrollTo({
            left: currentScroll,
            behavior: 'smooth'
        });
        buttonStatus();
    });
    
    container.addEventListener('scroll', function() {
        currentScroll = container.scrollLeft;
        buttonStatus();
    });
    
    buttonStatus();
}

// Coming Soon scrolling functionality
function comingSoonScrolling() {
    const container = document.querySelector(".js-coming-soon-scroll");
    const leftBtn = document.getElementById("coming-soon-scroll-left");
    const rightBtn = document.getElementById("coming-soon-scroll-right");
    
    const scrollAmount = 500;
    let currentScroll = 0;
    
    function buttonStatus() {
        if (currentScroll <= 0) {
            leftBtn.disabled = true;
            leftBtn.style.opacity = '0.5';
        } else {
            leftBtn.disabled = false;
            leftBtn.style.opacity = '1';
        }
        
        if (currentScroll >= container.scrollWidth - container.clientWidth) {
            rightBtn.disabled = true;
            rightBtn.style.opacity = '0.5';
        } else {
            rightBtn.disabled = false;
            rightBtn.style.opacity = '1';
        }
    }
    
    rightBtn.addEventListener('click', function() {
        currentScroll = Math.min(currentScroll + scrollAmount, container.scrollWidth - container.clientWidth);
        container.scrollTo({
            left: currentScroll,
            behavior: 'smooth'
        });
        buttonStatus();
    });
    
    leftBtn.addEventListener('click', function() {
        currentScroll = Math.max(0, currentScroll - scrollAmount);
        container.scrollTo({
            left: currentScroll,
            behavior: 'smooth'
        });
        buttonStatus();
    });
    
    container.addEventListener('scroll', function() {
        currentScroll = container.scrollLeft;
        buttonStatus();
    });
    
    buttonStatus();
}


// USER PROFILE MENU
let subMenu = document.getElementById("js-sub-menu");

function toggleMenu(){
    subMenu.classList.toggle("js-open-menu");
}

// FOR SEARCHING MOVIES
function clearSearch() {
    window.location.href = window.location.pathname;
}


document.addEventListener('DOMContentLoaded', function() {
    const searchInput = document.querySelector('.search-input');
    const searchForm = document.getElementById('searchForm');

    let typingTimer;
    searchInput.addEventListener('input', function() {
        clearTimeout(typingTimer);
        if (searchInput.value) {
            typingTimer = setTimeout(function() {
                searchForm.submit();
            }, 500);
        }
    });
});

document.getElementById('notif-bell').addEventListener('click', () => {
    window.location.href = "../pages/transaction_history.php";

})