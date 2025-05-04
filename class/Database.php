<?php
    class Database{
        private $servername = "localhost";
        private$username = "root";
        private $password = "";
        private $dbname = "mbts";
        public $conn;

        public function getConnection(){
            try{
                $this->conn = null;
                $this->conn = new PDO("mysql:host=" . $this->servername . ";dbname=" . $this->dbname, $this->username, $this->password);
                $this->password;
                $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    
            }
            catch(PDOException $e){
                http_response_code(500);
                echo json_encode(["message" => "Database connection error.", "error" => $e->getMessage()]);
                exit;
            }
            return $this->conn;
        }
    }
?>