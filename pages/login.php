<?php
    if(session_status() == PHP_SESSION_NONE){
        session_start();
    }

    require_once("../class/Connection.php");
    require_once("../class/Database.php");
    require_once("../class/UserRegistration.php");
    require_once("../includes/login_checker.php");

    if ($_SERVER['REQUEST_METHOD'] == "POST") {
        $userEmail = trim($_POST['email_container']);
        $userPassword = trim($_POST['password_container']);

        if (!empty($userEmail) && !empty($userPassword)) {
            $loginResult = $user->login($userEmail, $userPassword);

            if($loginResult){
                if(password_verify($userPassword, $loginResult['user_password'])){
                    $_SESSION['email_container'] = $loginResult['user_email'];
                    $_SESSION['id'] = $loginResult['id'];

                    // Redirect to cinema selection page
                    header("Location: cinema_selection_page.php");
                    exit();
                }
                else{
                    include_once("user_error_message.php");
                }

            }
            else{
                echo "<script>alert('Email not found!');</script>";
            }
        } 
        else {
            echo "<script>alert('Please enter both email and password!');</script>";
        }
    }
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Log In</title>
    <link rel="stylesheet" href="../assets/css/login.css" />
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">

</head>

<body>
    <div class="container">
        <div class="left-side">
            <div class="left-logo">
                <h1 id="left-noir">NoirÉclipse</h1>
                <p id="left-paragraph">
                   Immerse In The Magic Of Movies: 
                   NoirÉclipse Where Every Ticket Tells A Story
                </p>
            </div>
        </div>

        <div class="right-side">
            <h2>Log In</h2>
            <form method="POST">
               <input type="email" id="email_container" name="email_container" placeholder="Enter Email" required />
               <div class="password-field">
                    <input type="password" id="password_container" name="password_container" placeholder="Password" minlength="8" required />
                    <i class="far fa-eye" id="eye" onclick="showPassword()"></i>
                    <i class="fa fa-eye-slash" style="display: none;" id="eye-slashed" onclick="hidePassword()"></i>
               </div>
               <center><button type="submit">Log In</button></center>
            </form>

            <div class="links">
               Don't have an account? <a href="../pages/signup.php" id="create">Create Account</a> <br>
               <a href="#" id="forgot">Forgot Password?</a>
            </div>
            
            <div class="admin_access">
                <a href="../admin/admin.php"><i class='bx bx-key'></i></a>
            </div>
        </div>
    </div>

    <script>
        const showPassword = document.querySelector('#eye');
        const slashedEye = document.querySelector('#eye-slashed')
        const password = document.querySelector('#password_container');

        showPassword.addEventListener('click', () => {
            if(password.type === "password"){
                password.type = "text";
                showPassword.style.display = "none";
                slashedEye.style.display = "block";

            }
        });

        slashedEye.addEventListener('click', () => {
            if(password.type === "text"){
                password.type = "password";
                slashedEye.style.display = "none";
                showPassword.style.display = "block";
            }
        })
    </script>
</body>
</html>


