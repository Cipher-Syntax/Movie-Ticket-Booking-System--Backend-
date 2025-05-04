<?php
   if(session_status() == PHP_SESSION_NONE){
      session_start();
   }

   require_once("../class/Connection.php");
   require_once("../class/Database.php");
   require_once("../class/UserRegistration.php");

   if ($_SERVER['REQUEST_METHOD'] == "POST") {
      $first_name = trim(htmlspecialchars($_POST['firstname']));
      $last_name = trim(htmlspecialchars($_POST['lastname']));
      $userEmail = trim(filter_var($_POST['email_container'], FILTER_SANITIZE_EMAIL));
      $password = trim($_POST['password_container']);

      $usernameQuery = $conn->prepare("SELECT COUNT(id) as total_users FROM users");
      $usernameQuery->execute();

      $username = "mbts" . str_pad($userCounter, 3, "0", STR_PAD_LEFT);

      if (!empty($first_name) && !empty($last_name) && !empty($userEmail) && !empty($password)) {
         $hashed_password = password_hash($password, PASSWORD_BCRYPT);

         $checkEmail = $user->login($userEmail);
         if($checkEmail){
            echo "<script>alert('Email is already used!');</script>";
         }
         else{
            $createAccount = $user->createAccount($username, $first_name, $last_name, $userEmail, $hashed_password);

         }
      } else {
         echo "<script>alert('Please fill in all required fields!');</script>";
      }
   }
?>

<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1.0">
   <meta http-equiv="X-UA-Compatible" content="ie=edge">
   <title>Sign Up Form</title>
   <link rel="stylesheet" href="../assets/css/signup.css" />

   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   <link href="https://fonts.googleapis.com/css2?family=Playwrite+SK:wght@100..400&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
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
            <h2>Create Account</h2>
            <form method="post" >
               <div class="firstname">
                  <input type="txt" name="firstname" placeholder="Firstname" required/>
               </div>
               <div class="lastname">
                  <input type="txt" name="lastname" placeholder="Lastname" required/>
               </div>
               <input type="email" id="email_container" name="email_container" placeholder="Enter Email"  required/>
               <div class="password-field">
                  <input type="password" id="password_container" name="password_container" placeholder="Password" minlength="8" required/>
                  <i class="far fa-eye" id="eye" onclick="showPassword()"></i>
                  <i class="fa fa-eye-slash" style="display: none;" id="eye-slashed" onclick="hidePassword()"></i>
               </div>
               <center><button type="submit">Create Account</button></center>
            </form>

             <div class="links">Already have an account? 
                <a href="../pages/login.php" id="create">Log in</a> <br>
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