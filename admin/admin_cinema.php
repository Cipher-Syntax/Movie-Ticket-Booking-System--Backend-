<?php
    if(session_status() == PHP_SESSION_NONE){
        session_start();
    }

    require_once("../class/Connection.php");
    require_once("../includes/login_checker.php");
    require_once("../class/UserRegistration.php");

    $admin_data = checkAdminLogin($conn);

    $cinemas = [];

    $query = $conn->prepare("SELECT * FROM cinemas");
    $query->execute();
    $result = $query->fetchAll(PDO::FETCH_ASSOC);

    foreach ($result as $row) {
        $cinemaId = "cinema" . $row['id'];
        $cinemas[$cinemaId] = [
            "name" => $row['cinema_name'],
            "location" => $row['location']
        ];
    }

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Cinema</title>
    <link rel="stylesheet" href="../assets/css/admin_cinema.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.10.2/css/all.css" />
</head>
<body>
    <header>
        <div class="logo">
            <h1>NoirÉclipse</h1>
        </div>

        <div class="user-information">
                <div class="notif-bell" id="notif-bell">
                    <div class="notif-value" id="notif-value"></div>
                <i class='bx bx-bell'></i>
                </div>
            <img src="../assets/images/others/user.png" class="user-pic" onclick="toggleMenu()">
        </div>
    </header>
    <div class="sub-menu-wrapper" id="js-sub-menu">
        <div class="sub-menu">
            <div class="user-info">
                <img src="../assets/images/others/user.png" class="user-pic">
                <?php echo "Admin " . $admin_data['id']; ?>
            </div>
            <hr>

            <a href="../pages/logout.php" class="sub-menu-links logout" id="logout">
                <i class='bx bx-log-out'></i>
                <p>Logout</p>
                <!-- <span> > </span> -->
            </a>
        </div>
    </div>

    <div class="bookings-container">
        <div class="dashboard">
            <nav class="sidebar-navigation">
            <!-- Dashboard -->
            <div class="dashboard-field">
                <i class='bx bxs-dashboard'></i>
                <a href="../admin/admin_dashboard.php">Dashboard</a>
            </div>
            <!-- Movies (Add / Delete) -->
            <div class="movies-field">
                <i class='bx bxs-movie'></i>
                <a href="../admin/add_delete_movies.php">Movies</a>
            </div>
            <!-- Bookings -->
            <div class="bookings-field">
                <i class='bx bx-notepad'></i>
                <a href="../admin/bookings.php">Bookings</a>
            </div>
            <!-- Cinema -->
            <div class="cinema-field">
                <i class='bx bxs-camera-movie'></i>
                <a href="#">Cinema</a>
            </div>
            <!-- Settings
            <div class="settings-field">
                <i class='bx bxs-cog'></i>
                <h5>Settings</h5>
            </div> -->
        </nav>
        <div class="container">
            <table>
                <thead>
                    <tr>
                        <th>Cinema</th>
                        <th>Location</th>
                        <th>Seats Taken</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                        foreach ($cinemas as $cinemaId => $cinema) {
                            $query = $conn->prepare("SELECT seats FROM bookings WHERE cinema_table = '$cinemaId'");
                            $query->execute();
                            $result = $query->fetchAll(PDO::FETCH_ASSOC);

                            $totalSeats = 0;

                            // Count all seats
                            foreach ($result as $row) {
                                $seatList = array_filter(explode(',', $row['seats']));
                                $totalSeats += count($seatList);
                            }

                            echo "<tr>";
                            echo "<td>{$cinema['name']}</td>";
                            echo "<td>{$cinema['location']}</td>";
                            echo "<td>{$totalSeats} </td>"; 
                            echo "</tr>";
                        }
                    ?>
                </tbody>
            </table>
        </div>
    </div>

    <script>
        // USER PROFILE MENU
        let subMenu = document.getElementById("js-sub-menu");

        function toggleMenu(){
            subMenu.classList.toggle("js-open-menu");
        }
    </script>
</body>
</html>