<?php
    if(session_status() == PHP_SESSION_NONE){
        session_start();
    }

    require_once("../class/Connection.php");
    require_once("../includes/login_checker.php");
    require_once("../class/UserRegistration.php");

    $user_data = checkUserLogin($conn);

    if ($_SERVER['REQUEST_METHOD'] == "POST") {
        if (isset($_POST['save'])) {
            $user_id = $user_data['id'];
            $username = trim($_POST['username']);
            $email = trim(filter_var($_POST['email'], FILTER_SANITIZE_EMAIL));
    
            $user_profile = $_FILES['userProfile']['name'];
            $user_profile_tmp = $_FILES['userProfile']['tmp_name'];
            $user_profile_path = "../assets/images/others/" . $user_profile;
    
            if (!empty($user_profile)) {
                move_uploaded_file($user_profile_tmp, $user_profile_path);
            } 
            else {
                $user_profile_path = $user_data['user_profile'];
            }

            $result = $user->updateUser($user_id, $username, $email, $user_profile_path);

            if($result){
                echo "<script>alert('Updated Successfully!');</script>";
                echo "<script>window.location.href='user_editprofile.php';</script>";

            }
            else{
                echo "<script>alert('Failed to update!');</script>";
            }
        }
    }
    
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NoirÉclipse Profile</title>
    <link rel="stylesheet" href="../assets/css/user_editprofile.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.10.2/css/all.css" />

    <link rel='stylesheet' href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' >
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

            <a href="#" class="sub-menu-links edit-profile">
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

            <a href="../pages/logout.php" class="sub-menu-links logout" id="logout">
                <i class='bx bx-log-out'></i>
                <p>Logout</p>
                <!-- <span> > </span> -->
            </a>
        </div>
    </div>

    <div class="user-info-container">     
        <nav class="sidebar-navigation">
            <!-- Dashboard -->
            <div class="dashboard-field">
                <i class='bx bx-user'></i>
                <a href="#"><h5>User Profile</h5></a>
            </div>
            <!-- Movies (Add / Delete) -->
            <div class="movies-field">
                <i class='bx bx-cog'></i>
                <a href="../pages/user_sapMain.php"><h5>Settings & Privacy</h5></a>
            </div>
            <!-- Bookings -->
            <div class="bookings-field">
                <i class='bx bx-history' ></i>
                <a href="../pges/transaction_history.php"><h5>History</h5></a>
            </div>
            <!-- Cinema -->
            <div class="cinema-field">
                <i class='bx bx-log-out' ></i>
                <a href="../pages/logout.php"><h5>Logout</h5></a>
            </div>
        </nav> 

            
        <form action="" method="POST" enctype="multipart/form-data">
            <div class="profile-container">
                <div class="profile-header"></div>
                <div class="profile-picture">
                    <input type="file" name="userProfile" id="fileInput" accept="image/*" style="display: none;">
                    
                    <label for="fileInput">
                        <img id="profileImage" src="<?php echo $user_data['user_profile']; ?>" onerror="this.onerror=null; this.src='../assets/images/others/user.png';" alt="Profile Picture" />
                    </label>

                    <p>Click the image to change</p>
                </div>

                <script>
                    document.getElementById("fileInput").addEventListener("change", function(event) {
                        const file = event.target.files[0];

                        if (file) {
                            const reader = new FileReader();
                            reader.onload = function(e) {
                                document.getElementById("profileImage").src = e.target.result;
                            };
                            reader.readAsDataURL(file);
                        }
                    });
                </script>
                
                <div class="profile-info">
                    <div class="info-box">
                        <input type="text" name="username" id="username" class="name-input" value="<?php echo $user_data['username']; ?>">
                        <span class="label" id="username-label" >Username</span>
                    </div>
                    <div class="info-box">
                        <input type="email" name="email" class="email-input" id="email" value="<?php echo $user_data['user_email']; ?>">
                        <span class="label" id="email-label">Email</span>
                    </div>
                </div>

                <div class="save-button">
                    <button type="submit" name="save" id="save-button">Save Changes</button>
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

    <script src="../assets/js/user_editprofile.js"></script>
    <script>
        document.getElementById('notif-bell').addEventListener('click', () => {
            window.location.href = "../pages/transaction_history.php";
        });


        let save = document.getElementById('save-button');
        save.style.display = "none";

        let usernameInput = document.getElementById('username');
        let emailInput = document.getElementById('email');
        let image = document.getElementById('profileImage');

        usernameInput.addEventListener('click', () => {
            save.style.display = "block";
        });

        emailInput.addEventListener('click', () => {
            save.style.display = "block";
        });

        image.addEventListener("click", () => {
            save.style.display = "block";
        })
    </script>
</body>
</html>
