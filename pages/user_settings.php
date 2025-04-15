<?php
    session_start();

    include("../includes/connection.php");
    include("../includes/allFunction.php");


    $user_data = check_login($conn);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Settings</title>
    <link rel="stylesheet" href="../assets/css/user_settings.css"/>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.10.2/css/all.css" />

    <link rel='stylesheet' href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' >

    <script src="https://cdnjs.cloudflare.com/ajax/libs/qrcodejs/1.0.0/qrcode.min.js"></script>
</head>

<body>
    <header>
        <div class="logo">
            <h1>NoirÉclipse</h1>
        </div>

        <div class="user-information">
            <div class="notif-bell" id="notif-bell">
                <div class="notif-value" id="notif-value"></div>
                <i class='bx bx-bell'></i>
            </div>
            <img src="<?php echo $user_data['user_profile']; ?>" class="user-pic" onclick="toggleMenu()">
        </div>
    </header>


    <div class="sub-menu-wrapper" id="js-sub-menu">
        <div class="sub-menu">
            <div class="user-info">
                <img src="<?php echo $user_data['user_profile']; ?>" class="user-pic">
                <?php echo $user_data['first_name']; ?>
            </div>
            <hr>

            <a href="../pages/user_editprofile.php" class="sub-menu-links edit-profile">
                <i class='bx bx-user'></i>
                <p>Edit Profile</p>
                <!-- <span> > </span> -->
            </a>

            
            <a href="../pages/user_sapMain.php" class="sub-menu-links settings-and-privacy">
                <i class='bx bx-cog'></i>
                <p>Settings & Privacy</p>
                <!-- <span> > </span> -->
            </a>

            <a href="../pages/transaction_history.php" class="sub-menu-links history">
                <i class='bx bx-history'></i>
                <p>History</p>
                <!-- <span> > </span> -->
            </a>

            <a href="logout.php" class="sub-menu-links logout" id="logout">
                <i class='bx bx-log-out'></i>
                <p>Logout</p>
                <!-- <span> > </span> -->
            </a>
        </div>
    </div>

    <div class="settings">
        <nav class="sidebar-navigation">
            <!-- Dashboard -->
            <div class="dashboard-field">
                <i class='bx bx-user'></i>
                <a href="../pages/user_editprofile.php"><h5>User Profile</h5></a>
            </div>
            <!-- Movies (Add / Delete) -->
            <div class="movies-field">
                <i class='bx bx-cog'></i>
                <a href="../pages/user_sapMain.php"><h5>Settings & Privacy</h5></a>
            </div>
            <!-- Bookings -->
            <div class="bookings-field">
                <i class='bx bx-history' ></i>
                <a href="../pages/transaction_history.php"><h5>History</h5></a>
            </div>
            <!-- Cinema -->
            <div class="cinema-field">
                <i class='bx bx-log-out' ></i>
                <a href="../pages/logout.php"><h5>Logout</h5></a>
            </div>
        </nav> 

        <div class="container">
            <h2> Settings </h2>
            <div class="settings-option">
                <button id="auto-update"><i class="fa fa-refresh"></i> Auto-Update Settings </button>
                <button id="data-usage"><i class="fa fa-signal"></i> Data Usage Settings </button>
            </div>
    
            <h2> Help and Support </h2>
            <div class="settings-option">
                <button id="faq"><i class="fa fa-question-circle"></i> FAQs </button>
                <button id="contact-support"><i class="fa fa-envelope"></i> Contact Support </button>
                <button id="report"><i class="fa fa-exclamation-triangle"></i> Report a Problem </button>
            </div>
        </div>
    </div>


    <footer>
        <div class="footer-logo">
            <h1>NoirÉclipse</h1>
        </div>

        <div class="contact-info">
            <a href="../pages/about.php" id="about">About Us | Contact Us</a>
            <!-- <a href="#" id="contact">Contact Us</a> -->
        </div>

        <div class="categories">
            <a href="#js-now-showing" id="now-movie">Now Showing | </a>
            <a href="#js-popular-movies" id="pop-movie">Popular Movies | </a>
            <a href="#coming-soon" id="coming-movie">Coming Soon</a>
        </div>
    </footer>

    <script src="../assets/js/user_settings.js"></script>
    <script>
        document.getElementById('notif-bell').addEventListener('click', () => {
            window.location.href = "/pages/transaction_history.php";
        })

        document.getElementById('faq').addEventListener('click', () => {
            window.location.href = "/pages/faq.php";
        })
    </script>
</body>
</html>