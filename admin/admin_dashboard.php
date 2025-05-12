<?php
    if(session_status() == PHP_SESSION_NONE){
        session_start();
    }

    require_once("../class/Connection.php");
    require_once("../includes/login_checker.php");
    require_once("../class/Movies.php");

    $admin_data = checkAdminLogin($conn);

    $query = $conn->prepare("SELECT * FROM bookings ORDER BY booking_date DESC LIMIT 4");
    $query->execute();
    $result = $query->fetchAll(PDO::FETCH_ASSOC);

    // TOTAL QUERY
    $total_query = $conn->prepare("SELECT COUNT(id) AS total_bookings FROM bookings");
    $total_query->execute();
    $total_result = $total_query->fetch(PDO::FETCH_ASSOC);
    $total_bookings = $total_result['total_bookings'];

    // REVENUE TODAY
    $revenue_query = $conn->prepare("SELECT SUM(total_price) as revenue_today FROM bookings");
    $revenue_query->execute();
    $revenue_result = $revenue_query->fetch(PDO::FETCH_ASSOC);
    $revenue_today = $revenue_result['revenue_today'] ?? 0;

    // ACTIVE USERS
    $active_query = $conn->prepare("SELECT COUNT(DISTINCT user_id) AS active_users FROM bookings");
    $active_query->execute();
    $active_result = $active_query->fetch(PDO::FETCH_ASSOC);
    $active_users = $active_result['active_users'];

?>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="../assets/css/admin_dashboard.css" />
    <script src="movie_selection.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Playwrite+SK:wght@100..400&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.10.2/css/all.css" />

    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
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
    
    <div class="dashboard">
        <nav class="sidebar-navigation">
            <!-- Dashboard -->
            <div class="dashboard-field">
                <i class='bx bxs-dashboard'></i>
                <a href="#">Dashboard</a>
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
                <a href="../admin/admin_cinema.php">Cinema</a>
            </div>
            <!-- Settings
            <div class="settings-field">
                <i class='bx bxs-cog'></i>
                <h5>Settings</h5>
            </div> -->
        </nav>

        <div class="dashboard-metrics">
                <div class="container">
                    <div class="total-bookings">
                        <p>Total Bookings</p>
                    </div>

                    <div class="values">
                        <p><?php echo $total_bookings; ?></p>
                        <div class="icon-container">
                            <i class='bx bxs-calendar-alt'></i>
                        </div>
                    </div>
                </div>

                <div class="container">
                    <div class="revenue-today">
                        <p>Revenue Today</p>
                    </div>
                    <div class="values">
                        <p><?php echo $revenue_today; ?></p>
                        <div class="icon-container">
                            <p>₱</p>
                        </div>
                    </div>
                </div>

                <div class="container">
                    <div class="active-users">
                        <p>Today's Active Users</p>
                    </div>
                    <div class="values">
                        <p><?php echo $active_users; ?></p>
                        <div class="icon-container">
                            <i class='bx bxs-user-plus' ></i>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
    
    <div class="dashboard-chart-popularity">
        <div class="dashboard-chart">
            <div class="dashboard-text">
                <p id="revenue-overview">Revenue Overview</p>
            </div>

            <div class="chart-container" style="display: flex; gap: 20px; flex-wrap: wrap;">
                <!-- Line Chart -->
                <div style="flex: 1; min-width: 300px;">
                    <canvas id="revenueLineChart"></canvas>
                </div>

                <!-- Pie Chart with fixed size -->
                <div style="width: 300px; height: 300px; margin-top: 50px">
                    <canvas id="revenuePieChart" width="250" height="250"></canvas>
                </div>
            </div>

        </div>
    </div>


    <div class="recent-bookings">
        <a href="../admin/bookings.php" class="recent-bookings-text">Recent Bookings</a>

        <div class="table-container">
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
                        $bookings = $result;

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
                            echo "<tr><td colspan='9' style='text-align:center;'>No bookings found today</td></tr>";
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

        // CHART
        document.addEventListener("DOMContentLoaded", function () {
            fetch("../admin/revenue_data.php")
                .then((res) => res.json())
                .then((data) => {
                    const labels = data.map(item => item.day);
                    const revenues = data.map(item => item.revenue);

                    // Line Chart
                    new Chart(document.getElementById("revenueLineChart"), {
                        type: "bar",
                        data: {
                            labels: labels,
                            datasets: [{
                                label: "Daily Revenue (₱)",
                                data: revenues,
                                borderColor: "rgb(0, 119, 182)",
                                backgroundColor: "rgba(0, 119, 182, 0.2)",
                                tension: 0.3,
                                fill: true,
                                pointRadius: 3
                            }]
                        },
                        options: {
                            responsive: true,
                            plugins: {
                                legend: { display: true }
                            },
                            scales: {
                                y: { beginAtZero: true }
                            }
                        }
                    });

                    // Pie Chart (Sum of revenue per day)
                    new Chart(document.getElementById("revenuePieChart"), {
                        type: "pie",
                        data: {
                            labels: labels,
                            datasets: [{
                                label: "Revenue Share",
                                data: revenues,
                                backgroundColor: [
                                    "rgba(0, 119, 182, 0.7)",
                                    "rgba(0, 200, 83, 0.7)",
                                    "rgba(255, 193, 7, 0.7)",
                                    "rgba(244, 67, 54, 0.7)",
                                    "rgba(156, 39, 176, 0.7)",
                                    "rgba(255, 87, 34, 0.7)"
                                ],
                                borderColor: "#fff",
                                borderWidth: 1
                            }]
                        },
                        options: {
                            responsive: true,
                            plugins: {
                                legend: {
                                    position: "bottom"
                                }
                            }
                        }
                    });
                })
                .catch(err => console.error("Error loading chart data:", err));
        });
    </script>

</body>
</html>