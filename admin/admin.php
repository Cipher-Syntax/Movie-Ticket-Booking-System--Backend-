<?php
   session_start();

   include("../includes/connection.php");
   include("../includes/allFunction.php");


   if ($_SERVER['REQUEST_METHOD'] == "POST") {
      // Get admin input and trim white spaces
      $adminEmail = trim($_POST['email_container']);
      $adminPassword = trim($_POST["admin_password_container"]);

      if (!empty($adminEmail) && !empty($adminPassword)) {
         $stmt = $conn->prepare("SELECT * FROM admin WHERE admin_email = ? LIMIT 1");
         if ($stmt) {
               $stmt->bind_param("s", $adminEmail);
               $stmt->execute();
               $result = $stmt->get_result();

               if ($result && $result->num_rows > 0) {
                  $admin_data = $result->fetch_assoc();

                  if (password_verify($adminPassword, $admin_data['admin_password'])) {
                     // Set session variables for the admin
                     $_SESSION['email_container'] = $admin_data['admin_email'];
                     $_SESSION['id'] = $admin_data['id'];

                     // Redirect to admin dashboard page
                     header("Location: admin_dashboard.php");
                     exit;
                  } else {
                     echo "<script>alert('Invalid email or password!');</script>";
                  }
               } else {
                  echo "<script>alert('Invalid email or password!');</script>";
               }
               $stmt->close();
         } else {
               echo "<script>alert('An error occurred. Please try again!');</script>";
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