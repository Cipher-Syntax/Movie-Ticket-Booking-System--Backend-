<?php
    if(session_status() == PHP_SESSION_NONE){
        session_start();
    }

    require_once("../class/Connection.php");
    require_once("../includes/login_checker.php");
    require_once("../class/UserRegistration.php");

    $user_data = checkUserLogin($conn);

    if($_SERVER['REQUEST_METHOD'] == "POST"){
        if(isset($_POST['delete'])){

            $user_id = $user_data['id'];
            $query = "DELETE FROM users WHERE id = '$user_id' ";
            $stmt = $conn->prepare($query);
            $stmt->execute();
            $result = $stmt->fetch(PDO::FETCH_ASSOC);
    
            if ($result) {
                echo "<script>alert('Succesfully deleted the account');</script>";
            } else {
                echo "<script>alert('Failed to delete!');</script>";
            }
        }
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Settings and Privacy</title>
    <link rel="stylesheet" href="../assets/css/user_sapMain.css" />

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
                <?php echo $user_data['username']; ?>
            </div>
            <hr>

            <a href="../pages/user_editprofile.php" class="sub-menu-links edit-profile">
                <i class='bx bx-user'></i>
                <p>Edit Profile</p>
                <!-- <span> > </span> -->
            </a>

            
            <a href="#" class="sub-menu-links settings-and-privacy">
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

    <div class="settings-privacy-container">
        <nav class="sidebar-navigation">
            <div class="dashboard-field">
                <i class='bx bx-home-alt'></i>
                <a href="../pages/cinema_selection_page.php"><h5>Home</h5></a>
            </div>
            <!-- Dashboard -->
            <div class="dashboard-field">
                <i class='bx bx-user'></i>
                <a href="../pages/user_editprofile.php"><h5>User Profile</h5></a>
            </div>
            <!-- Movies (Add / Delete) -->
            <div class="movies-field">
                <i class='bx bx-cog'></i>
                <a href="#"><h5>Settings & Privacy</h5></a>
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

        <form action="" method="POST" enctype="multipart/form-data">
            <div class="container">
                <div class="settingsAndPrivacy">
                    <div class="settings">
                        <button type="button" id="settings" onclick="location.href='../pages/user_settings.php'">
                            <i class="fa fa-cog"></i> 
                            <p>Settings</p>
                        </button>
                    </div>
                </div>

                <div class="delete">
                    <div class="deleteAccount">
                        <button type="submit" name="delete" id="deleteAccount" onclick=" return confirmDelete()">
                            <i class="fa fa-trash"></i> 
                            <p>Delete Account</p>
                        </button>
                    </div>
                </div>

                <div class="logout">
                    <div class="logout-button">
                        <button type="button" id="logout-button" onclick="location.href='../pages/logout.php'">
                            <i class="fa fa-sign-out-alt"></i> 
                            <p>Logout</p>
                        </button>
                    </div>
                </div>
            </div>            
        </form>
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

    <script src="../assets/js/user_sapMain.js"></script>
    <script>
        document.getElementById('notif-bell').addEventListener('click', () => {
            window.location.href = "../pages/transaction_history.php";
        })

        function confirmDelete() {
            return confirm("Are you sure you want to delete this account?");
        }
    </script>
</body>
</html>