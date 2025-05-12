<?php
    if (session_status() !== PHP_SESSION_ACTIVE) {
        session_start();
    }
    require_once("../class/Connection.php");
    require_once("../class/Database.php");
    require_once("../class/UserRegistration.php");

    $email = "admin123@gmail.com";
    $password = "admin123";
    $hashed_password = password_hash($password, PASSWORD_BCRYPT);

    // echo $hashed_password;

    $checkQuery = "SELECT * FROM admin WHERE admin_email = :email";
    $stmt = $conn->prepare($checkQuery);
    $stmt->bindParam(':email', $email);
    $stmt->execute();
    $existingUser = $stmt->fetch(PDO::FETCH_ASSOC);
    
    if ($existingUser) {
        echo "<script>alert('Email already exists.');</script>";
    } 
    else {
        $query = "INSERT INTO admin(admin_email, admin_password) VALUES(:email, :hashed_password)";
        $stmt = $conn->prepare($query);
        $stmt->bindParam(':email', $email);
        $stmt->bindParam(':hashed_password', $hashed_password);
        
        if ($stmt->execute()) {
            echo "<script>alert('Successfully added admin');</script>";
        } else {
            echo "<script>alert('Failed to add admin');</script>";
        }
    }
    
?>