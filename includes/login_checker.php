<?php
    if (session_status() !== PHP_SESSION_ACTIVE) {
        session_start();
    }

    function checkUserLogin($conn) {
        if (isset($_SESSION['email_container'])) {
            $email = $_SESSION['email_container'];

            $query = "SELECT * FROM users WHERE user_email = :email LIMIT 1";
            $stmt = $conn->prepare($query);
            $stmt->bindParam(':email', $email);
            $stmt->execute();

            $user_data = $stmt->fetch(PDO::FETCH_ASSOC);

            if ($user_data) {
                return $user_data;
            }
        }
        header("Location: login.php");
        exit;
    }

    function checkAdminLogin($conn) {
        if (isset($_SESSION['email_container'])) {
            $email = $_SESSION['email_container'];

            $query = "SELECT * FROM admin WHERE admin_email = :email LIMIT 1";
            $stmt = $conn->prepare($query);
            $stmt->bindParam(':email', $email);
            $stmt->execute();

            $admin_data = $stmt->fetch(PDO::FETCH_ASSOC);

            if ($admin_data) {
                return $admin_data;
            }
        }
        header("Location: admin.php");
        exit;
    }

?>
