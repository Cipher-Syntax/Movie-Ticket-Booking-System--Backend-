<?php  
    require_once("../class/Connection.php");
    require_once("../includes/login_checker.php");
    require_once("../class/UserRegistration.php");

    $stmt = $conn->prepare("SELECT DATE(booking_date) AS booking_day, SUM(total_price) AS total_revenue FROM bookings GROUP BY booking_day ORDER BY booking_day ASC WHERE DATE(booking_date) = CURDATE()");
    $stmt->execute();

    $data = [];

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        $data[] = [
            "day" => $row['booking_day'],
            "revenue" => $row['total_revenue']
        ];
    }

    header('Content-Type: application/json');
    echo json_encode($data);
?>


