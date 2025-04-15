<?php
    if (session_status() !== PHP_SESSION_ACTIVE) {
        session_start();
    }

    // User Login
    function check_login($conn) {
        if (isset($_SESSION['email_container'])) {
            $email = $_SESSION['email_container'];

            $stmt = $conn -> prepare("SELECT * FROM users WHERE user_email = ? LIMIT 1");
            if ($stmt) {
                $stmt -> bind_param("s", $email);
                $stmt -> execute();
                $result = $stmt -> get_result();

                if ($result && $result -> num_rows > 0) {
                    $user_data = $result -> fetch_assoc();
                    $stmt -> close();
                    return $user_data;
                }
                $stmt -> close();
            }
        }
        header("Location: login.php");
        exit;
    }

    // Admin Login
    function admin_login($conn) {
        if (isset($_SESSION['email_container'])) {
            $email = $_SESSION['email_container'];

            $stmt = $conn -> prepare("SELECT * FROM admin WHERE admin_email = ? LIMIT 1");
            if ($stmt) {
                $stmt -> bind_param("s", $email);
                $stmt -> execute();
                $result = $stmt -> get_result();

                if ($result && $result -> num_rows > 0) {
                    $admin_data = $result -> fetch_assoc();
                    $stmt -> close();
                    return $admin_data;
                }
                $stmt -> close();
            }
        }
        header("Location: admin.php");
        exit;
    }
?>
