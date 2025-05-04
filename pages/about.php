<?php
    if(session_status() == PHP_SESSION_NONE){
        session_start();
    }

    require_once("../class/Connection.php");
    require_once("../includes/login_checker.php");
    require_once("../class/UserRegistration.php");

    $user_data = checkUserLogin($conn);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>
    <link rel="stylesheet" href="../assets/css/about.css">
    <link rel='stylesheet' href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'>
</head>
<body>
<header>
        <h1 class="logo">NoirÉclipse</h1>

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
                <?php echo $user_data['username']; ?>
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

    <h1 id="text-logo">About Us</h1>
    <div class="container">
        <div class="paragraph-text">
            <p>Welcome to NoirÉclipse, where the perfect movie experience starts before the lights even dim! We’ve taken the hassle out of movie ticket booking and made it an adventure in itself. Imagine this: scrolling through the hottest new releases, picking out the best seats in your favorite theaters, and securing your tickets—all with just a few taps. Whether you're gearing up for a weekend blockbuster or a late-night indie flick, NoirÉclipse puts the cinema in your pocket.
            </p>
            <p>But we’re not just about tickets—we’re about experiences. Our sleek, user-friendly platform is designed for movie lovers, by movie lovers. From discovering hidden gems to grabbing tickets for opening night, we make sure you never miss a moment.So, why wait? Skip the lines, grab your popcorn, and let NoirÉclipse take you straight to the magic of the big screen. Your next unforgettable movie night is just a click away! Lights, camera… NoirÉclipse!</p>
        </div>
    </div>

    <h1 id="contact-logo">Contact Us</h1>
    <div class="container">
        <div class="contact-text">
            <div class="email-us">
                <i class='bx bx-envelope'></i>
                <p>noiréclipse@gmail.com</p>
            </div>

            <div class="contact-us">
                <i class='bx bx-phone'></i>
                <p>+63 123 -456 - 7890</p>
            </div>
        </div>
    </div>

    <script src="../assets/js/about.js"></script>
</body>
</html>