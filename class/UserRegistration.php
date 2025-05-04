<?php

    require_once("../class/Connection.php");
    require_once("../class/Database.php");

    class UserRegistration{
        private $conn;
        private $userTable = "users";
        private $adminTable = "admin";

        public function __construct($db){
            $this->conn = $db;
        }

        // CREATE ACCOUNT
        public function createAccount($username, $firstname, $lastname, $email, $password){
            $query = "INSERT INTO " . $this->userTable . " (username, first_name, last_name, user_email, user_password) VALUES (:username, :firstname, :lastname, :email, :password)";
            $stmt = $this->conn->prepare($query);
            $bind_params = [":username" =>$username, ":firstname" => $firstname, ":lastname" => $lastname, ":email" => $email, ":password" => $password];
            return $stmt->execute($bind_params);
        }

        // LOGIN
        public function login($email){
            $query = "SELECT *FROM " . $this->userTable . " WHERE user_email = :email LIMIT 1";
            $stmt = $this->conn->prepare($query);
            $stmt->bindParam(":email", $email);
            $stmt->execute();

            $result = $stmt->fetch(PDO::FETCH_ASSOC);
            return $result;
        }

        // UPDATE USER
        public function updateUser($id, $username, $email, $userProfile){
            $query = "UPDATE " . $this->userTable . " SET username = :username, user_email = :email, user_profile = :user_profile WHERE id = :id";
            $stmt = $this->conn->prepare($query);
            $bindParams = [':id' => $id, ':username' => $username, ':email' => $email, ':user_profile' => $userProfile];
            return $stmt->execute($bindParams);
        }

        // GET ALL USERS
        public function getAllUsers(){
            $query = "SELECT * FROM " . $this->userTable;
            $stmt = $this->conn->prepare($query);
            $stmt->execute();
            return $stmt->fetchAll(PDO::FETCH_ASSOC);
        }

        // GET USER BY ID
        public function getUserById($id) {
            $query = "SELECT * FROM " . $this->userTable . " WHERE id = ?";
            $stmt = $this->conn->prepare($query);
            $stmt->execute([$id]);
            return $stmt->fetch(PDO::FETCH_ASSOC);
        }

        public function deleteUser($id) {
            $query = "DELETE FROM " . $this->userTable . " WHERE id = ?";
            $stmt = $this->conn->prepare($query);
            return $stmt->execute([$id]);
        }

        // ADMIN
        public function createAdmin($email, $password){
            $query = "INSERT INTO " . $this->adminTable . " (admn_email, admin_password) VALUES (:email, :password)";
            $stmt = $this->conn->prepare($query);
            $bind_params = [":email" => $email, ":password" => $password];
            return $stmt->execute($bind_params);
        }

        // LOGIN
        public function adminLogin($email){
            $query = "SELECT *FROM " . $this->adminTable . " WHERE admin_email = :email LIMIT 1";
            $stmt = $this->conn->prepare($query);
            $stmt->bindParam(":email", $email);
            $stmt->execute();

            $result = $stmt->fetch(PDO::FETCH_ASSOC);
            return $result;
        }

    }

    $db = new Database();
    $conn = $db->getConnection();
    $user = new UserRegistration($conn);

    $db = new Database();
    $conn = $db->getConnection();
    $admin = new UserRegistration($conn);

?>