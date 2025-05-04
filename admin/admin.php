<?php
    if(session_status() == PHP_SESSION_NONE){
      session_start();
  }

  require_once("../class/Connection.php");
  require_once("../includes/login_checker.php");
  require_once("../class/UserRegistration.php");

   if ($_SERVER['REQUEST_METHOD'] == "POST") {
      $adminEmail = trim($_POST['email_container']);
      $adminPassword = trim($_POST["admin_password_container"]);

      if (!empty($adminEmail) && !empty($adminPassword)){
         $loginResult = $admin->adminLogin($adminEmail, $adminPassword);

         if($loginResult){
             if(password_verify($adminPassword, $loginResult['admin_password'])){
                 $_SESSION['email_container'] = $loginResult['admin_email'];
                 $_SESSION['id'] = $loginResult['id'];

                 header("Location: admin_dashboard.php");
                 exit();
             }
             else{
                 include_once("../pages/user_error_message.php");
             }

         }
         else{
             echo "<script>alert('Email not found!');</script>";
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
      <title>Admin Login Form</title>
      <link rel="stylesheet" href="../assets/css/admin.css" />
      <link rel="preconnect" href="https://fonts.googleapis.com">
      <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
      <link href="https://fonts.googleapis.com/css2?family=Playwrite+SK:wght@100..400&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

      <link rel='stylesheet' href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' >
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
            <h2>Welcome Administrator</h2>
            <form active="" method="post">
               <!-- <label for="username-container">Admin Username</label> -->
               <input type="email" id="usemame_container" name="email_container" placeholder="Admin Username"  required/>
               <!-- <label for="password_container">Access Password</label> -->
               <input type="password" name="admin_password_container" placeholder="Enter Password" minlength="8" required/>
               <center><button type="submit">Access</button></center>
            </form>
   
            <div class="user_access">
               <a href="../pages/login.php"><i class='bx bx-user'></i></a>
            </div>
        </div>
   </body>
</html>