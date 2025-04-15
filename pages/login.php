<?php
    session_start();

    include("../includes/connection.php");
    include("../includes/allFunction.php");


    if ($_SERVER['REQUEST_METHOD'] == "POST") {
        $userEmail = trim($_POST['email_container']);
        $userPassword = trim($_POST['password_container']);

        if (!empty($userEmail) && !empty($userPassword)) {
            $stmt = $conn->prepare("SELECT * FROM users WHERE user_email = ? LIMIT 1");
            if ($stmt) {
                $stmt->bind_param("s", $userEmail);
                $stmt->execute();
                $result = $stmt->get_result();

                if ($result && $result->num_rows > 0) {
                    $user_data = $result->fetch_assoc();

                    if (password_verify($userPassword, $user_data['user_password'])) {
                        $_SESSION['email_container'] = $user_data['user_email'];
                        $_SESSION['id'] = $user_data['id'];

                        // Redirect to cinema selection page
                        header("Location: cinema_selection_page.php");
                        exit();
                    } 
                    else {
                        include("user_error_message.php");
                    }
                } 
                else {
                    echo "<script>alert('Email not found!');</script>";
                }
                $stmt->close();
            } 
            else {
                echo "<script>alert('Something went wrong');</script>";
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
               <input type="password" id="password_container" name="password_container" placeholder="Password" minlength="8" required />
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
</body>
</html>


