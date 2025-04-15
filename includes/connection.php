<?php
    // Database connection
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "mbts";

    // Create connection
    // $conn = new mysqli($servername, $username, $password, $dbname);
    $conn = mysqli_connect($servername, $username, $password, $dbname);
    // Check connection

    if(mysqli_connect_error()){
        die("Connection failed: " . mysqli_connect_error());
    }


?>