<?php
    if(session_status() == PHP_SESSION_NONE){
        session_start();
    }

    require_once("../class/Connection.php");
    require_once("../includes/login_checker.php");
    require_once("../class/Movies.php");

    $admin_data = checkAdminLogin($conn);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Page</title>
    <link rel="stylesheet" href="../assets/css/bookings.css">

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
                <a href="#">Bookings</a>
            </div>
            <!-- Cinema -->
            <div class="cinema-field">
                <i class='bx bxs-camera-movie'></i>
                <a href="../admin/admin_cinema.php">Cinema</a>
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
                        <th>Id</th>
                        <th>Movie Id</th>
                        <th>User Id</th>
                        <th>Cinema Table</th>
                        <th>Seats</th>
                        <th>Price</th>
                        <th>Tickets</th>
                        <th>Total Price</th>
                        <th>Booking Date</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                        $bookings = $admin->getAllBookings();

                        if (!empty($bookings)) {
                            foreach ($bookings as $booking) {
                                echo "<tr>";
                                echo "<td>" . $booking['id'] . "</td>";
                                echo "<td>" . $booking['movie_id'] . "</td>";
                                echo "<td>" . $booking['user_id'] . "</td>";
                                echo "<td>" . $booking['cinema_table'] . "</td>";
                                echo "<td>" . $booking['seats'] . "</td>";
                                echo "<td>" . $booking['price_per_ticket'] . "</td>";
                                echo "<td>" . $booking['tickets'] . "</td>";
                                echo "<td>" . $booking['total_price'] . "</td>";
                                echo "<td>" . date("M d - D", strtotime($booking['booking_date'])) . "</td>";
                                echo "</tr>";
                            }
                        } else {
                            echo "<tr><td colspan='9' style='text-align:center;'>No bookings found</td></tr>";
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