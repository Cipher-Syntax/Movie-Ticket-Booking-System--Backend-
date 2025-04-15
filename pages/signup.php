<?php
   session_start();

   include("../includes/connection.php");
   include("../includes/allFunction.php");


   if ($_SERVER['REQUEST_METHOD'] == "POST") {
      // Get user input and sanitize data
      $first_name = trim(htmlspecialchars($_POST['firstname']));
      $last_name = trim(htmlspecialchars($_POST['lastname']));
      $userEmail = trim(filter_var($_POST['email_container'], FILTER_SANITIZE_EMAIL));
      $password = trim($_POST['password_container']);

      if (!empty($first_name) && !empty($last_name) && !empty($userEmail) && !empty($password)) {
         $userPassword = password_hash($password, PASSWORD_BCRYPT);

         $stmt = $conn->prepare("SELECT * FROM users WHERE user_email = ? LIMIT 1");
         if ($stmt) {
               $stmt->bind_param("s", $userEmail);
               $stmt->execute();
               $result = $stmt->get_result();

               if ($result && $result->num_rows > 0) {
                  // Email already exists
                  echo "<script>alert('Email is already used!');</script>";
               } else {
                  $stmt->close();

                  // Insert new user into the database
                  $insertIntoTableStmt = $conn->prepare("INSERT INTO users (first_name, last_name, user_email, user_password) VALUES (?, ?, ?, ?)");
                  if ($insertIntoTableStmt) {
                     $insertIntoTableStmt->bind_param("ssss", $first_name, $last_name, $userEmail, $userPassword);
                     if ($insertIntoTableStmt->execute()) {
                           header("Location: login.php");
                           exit;
                     } else {
                           echo "<script>alert('Something went wrong. Please try again!');</script>";
                     }
                     $insertIntoTableStmt->close();
                  } else {
                     echo "<script>alert('Error preparing the insert statement.');</script>";
                  }
               }
               $stmt->close();
         } else {
               echo "<script>alert('Error preparing the email check statement.');</script>";
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
               <input type="password" id="password_container" name="password_container" placeholder="Password" minlength="8" required/>
               <center><button type="submit">Create Account</button></center>
            </form>

             <div class="links">Already have an account? 
                <a href="../pages/login.php" id="create">Log in</a> <br>
             </div>
         </div>
     </div>
   </body>
</html>