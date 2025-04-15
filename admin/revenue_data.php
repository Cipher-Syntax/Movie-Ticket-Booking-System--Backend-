<?php
    include("../includes/connection.php");

    $query = "SELECT DATE(booking_date) AS booking_day, SUM(total_price) AS total_revenue FROM bookings GROUP BY booking_day ORDER BY booking_day ASC";

    $result = mysqli_query($conn, $query);

    $data = [];

    while ($row = mysqli_fetch_assoc($result)) {
        $data[] = [
            "day" => $row['booking_day'],
            "revenue" => $row['total_revenue']
        ];
    }

    header('Content-Type: application/json');
    echo json_encode($data);
?>


