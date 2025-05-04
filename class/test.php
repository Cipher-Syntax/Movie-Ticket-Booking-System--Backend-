<?php
    header("Content-Type: application/json");
    header("Access-Control-Allow-Origin: *");

    require_once("../class/Connection.php");
    require_once("../class/Database.php");

    $database = new Database();
    $db = $database->getConnection();

    $test = new Connection($db);
    $response = $test->checkConnection();

    echo json_encode($response);

?>