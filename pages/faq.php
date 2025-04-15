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
    <title>Document</title>
    <link rel="stylesheet" href="../assets/css/faq.css">

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
    
    <section class="faq">
        <h2 class="section-title">Frequently Asked Questions</h2>
        <div class="faq-container">
            <div class="faq-item">
                <div class="faq-question">
                    <p>How do I book tickets online?</p>
                    <i class='bx bx-chevron-down faq-icon'></i>
                </div>
                <div class="faq-answer">
                    <p>To book tickets online, simply create an account, browse the current showtimes, select your movie, choose your seats, your tickets can be downloaded and also available in your account.</p>
                </div>
            </div>
            <div class="faq-item">
                <div class="faq-question">
                    <p>Can I cancel my booking?</p>
                    <i class='bx bx-chevron-down faq-icon'></i>
                </div>
                <div class="faq-answer">
                    <p>Yes, you can cancel your booking as there will be confirmation popup after selecting seats but note that once you clicked "Yes" there will be no cancellation available again after the seat selection has passed.</p>
                </div>
            </div>
            <div class="faq-item">
                <div class="faq-question">
                    <p>Do you offer discounts for students or seniors?</p>
                    <i class='bx bx-chevron-down faq-icon'></i>
                </div>
                <div class="faq-answer">
                    <p>Yes, we offer special discounts for students, seniors, and military personnel with valid ID. These discounts are only available at the box office.</p>
                </div>
            </div>
            <div class="faq-item">
                <div class="faq-question">
                    <p>Can I bring outside food and drinks?</p>
                    <i class='bx bx-chevron-down faq-icon'></i>
                </div>
                <div class="faq-answer">
                    <p>Outside food and drinks are not permitted in our cinemas. We offer a wide variety of snacks, beverages, and meal options at our concession stands to enhance your movie experience.</p>
                </div>
            </div>
            <div class="faq-item">
                <div class="faq-question">
                    <p>Is there a limit of tickets to be booked?</p>
                    <i class='bx bx-chevron-down faq-icon'></i>
                </div>
                <div class="faq-answer">
                    <p>No, there are no limits for such things, so you can sit back, relax and enjoy the show</p>
                </div>
            </div>
        </div>
    </section>

    <script src="../assets/js/faq.js"></script>
</body>
</html>