<?php

    require_once("../class/Connection.php");
    require_once("../class/Database.php");

    class Movies{
        private $conn;
        private $cinemaTable = "cinemas";
        private $movieTable = "movies";
        private $movieSchedules = "movie_schedules";
        private $bookingsTable = "bookings";

        public function __construct($db){
            $this->conn = $db;
        }

        // GET ALL RESULTS
        public function getAllResults(){
            $query = "SELECT *FROM " . $this->cinemaTable;
            $stmt = $this->conn->prepare($query);
            $stmt->execute();
            return $stmt;
        }

        // GET RESULTS BY ID
        public function getResultsById($id){
            $query = "SELECT * FROM " . $this->movieTable . " WHERE id = ?";
            $stmt = $this->conn->prepare($query);
            $stmt->execute([$id]);
            return $stmt;
            // return $stmt->fetch(PDO::FETCH_ASSOC);
        }

        // GET MOVIE SCHEDULES
        public function getMovieSchedules($movieId, $cinemaNumber) {
            $query = "SELECT * FROM " . $this->movieSchedules .   " WHERE movie_id = :movieId AND cinema_number = :cinemaNumber";
            $stmt = $this->conn->prepare($query);
            $stmt->bindParam(':movieId', $movieId, PDO::PARAM_INT);
            $stmt->bindParam(':cinemaNumber', $cinemaNumber, PDO::PARAM_INT);
            $stmt->execute();
            return $stmt;
        }
        
        // GET RESULTS FROM BOOKINGS
        public function bookings($cinemaTable, $movieId){
            $query = "SELECT seats FROM " . $this->bookingsTable .   " WHERE cinema_table = :cinemaTable AND id = :movieId";
            $stmt = $this->conn->prepare($query);
            $stmt->bindParam(':cinemaTable', $cinemaTable);
            $stmt->bindParam(':movieId', $movieId);
            $stmt->execute();
            return $stmt;
        }

        // CREATE BOOKINGS
        public function createBookings($userId, $movieId, $cinemaTable, $seats, $pricePerTicket, $tickets, $totalPrice){
            $query = "INSERT INTO " . $this->bookingsTable . " (user_id, movie_id, cinema_table, seats, price_per_ticket, tickets, total_price) VALUES (:user_id, :movie_id, :cinema_table, :seats, :price_per_ticket, :tickets, :total_price)";
            $stmt = $this->conn->prepare($query);
            $bindParams = [":user_id" => $userId, ":movie_id" => $movieId, ":cinema_table" => $cinemaTable, ":seats" => $seats, ":price_per_ticket" => $pricePerTicket, ":tickets" => $tickets, ":total_price" => $totalPrice];
            return $stmt->execute($bindParams);
        }

        public function getAllBookings(){
            $query = "SELECT *FROM bookings";
            $stmt = $this->conn->prepare($query);
            $stmt->execute();

            return $stmt;
        }
    }

    $db = new Database();
    $conn = $db->getConnection();
    $user = new Movies($conn);

    $db = new Database();
    $conn = $db->getConnection();
    $admin = new Movies($conn);

?>