// USER PROFILE MENU
let subMenu = document.getElementById("js-sub-menu");

function toggleMenu(){
    subMenu.classList.toggle("js-open-menu");
}

document.getElementById('notif-bell').addEventListener('click', () => {
    window.location.href = "../pages/transaction_history.php";

})