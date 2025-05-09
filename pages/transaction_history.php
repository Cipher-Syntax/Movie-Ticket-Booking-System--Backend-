<?php
    session_start();

    include("../includes/connection.php");
    include("../includes/allFunction.php");

    $user_data = check_login($conn);
    $day = date("m/d/y");

    $query = "SELECT bookings.*, movies.title, movies.cinema_number
            FROM bookings
            LEFT JOIN movies ON bookings.movie_id = movies.id
            GROUP BY bookings.booking_date DESC";

    $result = mysqli_query($conn, $query);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transaction History</title>
    <link rel="stylesheet" href="../assets/css/transaction_history.css">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.10.2/css/all.css" />

    <link rel='stylesheet' href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' >
    <script src="https://cdnjs.cloudflare.com/ajax/libs/qrcodejs/1.0.0/qrcode.min.js"></script>
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
            <img src="<?php echo $user_data['user_profile']; ?>" class="user-pic" onclick="toggleMenu()">
        </div>
    </header>

    <div class="sub-menu-wrapper" id="js-sub-menu">
        <div class="sub-menu">
            <div class="user-info">
                <img src="<?php echo $user_data['user_profile']; ?>" class="user-pic">
                <?php echo $user_data['username']; ?>
            </div>
            <hr>

            <a href="../pages/user_editprofile.php" class="sub-menu-links edit-profile">
                <i class='bx bx-user'></i>
                <p>Edit Profile</p>
                <!-- <span> > </span> -->
            </a>

            
            <a href="../pages/user_sapMain.php" class="sub-menu-links settings-and-privacy">
                <i class='bx bx-cog'></i>
                <p>Settings & Privacy</p>
                <!-- <span> > </span> -->
            </a>

            <a href="#" class="sub-menu-links history">
                <i class='bx bx-history'></i>
                <p>History</p>
                <!-- <span> > </span> -->
            </a>

            <a href="../pages/logout.php" class="sub-menu-links logout" id="logout">
                <i class='bx bx-log-out'></i>
                <p>Logout</p>
                <!-- <span> > </span> -->
            </a>
        </div>
    </div>

    <div class="main-container">
        <nav class="sidebar-navigation">
            <!-- Dashboard -->
            <div class="dashboard-field">
                <i class='bx bx-user'></i>
                <a href="../pages/user_editprofile.php"><h5>User Profile</h5></a>
            </div>
            <!-- Movies (Add / Delete) -->
            <div class="movies-field">
                <i class='bx bx-cog'></i>
                <a href="../pages/user_sapMain.php"><h5>Settings & Privacy</h5></a>
            </div>
            <!-- Bookings -->
            <div class="bookings-field">
                <i class='bx bx-history' ></i>
                <a href="#"><h5>History</h5></a>
            </div>
            <!-- Cinema -->
            <div class="cinema-field">
                <i class='bx bx-log-out' ></i>
                <a href="../pages/logout.php"><h5>Logout</h5></a>
            </div>
        </nav> 
        
        <main class="main-content">
            <div class="content-wrapper">
                <div class="tab-active"> Transactions </div>
            </div>
        
            <div class="vertical-scroll">
                <div class="transaction-container">
                    <div class="transaction-list">
                
                        <?php while ($transactions = mysqli_fetch_assoc($result)) { ?>
                            <div class="date-group">
                                <div class="date-header"><?php echo date("M d, Y", strtotime($transactions['booking_date'])); ?></div>
                                <div class="transaction-item">
                                    <div class="movie-info">
                                        <div class="movie-time"><?php echo date("H:i", strtotime($transactions['booking_date'])); ?></div>
                                        
                                        <div class="movie-seat"><?php echo $transactions['seats'];?></div>
                                    </div>
                                    <div class="movie-title"><?php echo $transactions['title'];?></div>
                                    <div class="ticket-info"><?php echo $transactions['tickets'] . " Tickets";?></div>
                                    <div class="price"><?php echo "₱" . $transactions['total_price'];?></div>
                                </div>
                            </div>

                        <?php }?>

                        <!-- <div class="date-group">
                            <div class="date-header">Jan 14, 2025</div>
                            <div class="transaction-item">
                                <div class="movie-info">
                                    <div class="movie-time">13:00</div>
                                    <div class="movie-seat">A-2</div>
                                </div>
                                <div class="movie-title">The Nice Guys</div>
                                <div class="ticket-info">1 Ticket</div>
                                <div class="price">₱180.00</div>
                            </div>
                        </div>
                        <div class="date-group">
                            <div class="date-header">Feb 14, 2025</div>
                            <div class="transaction-item">
                                <div class="movie-info">
                                    <div class="movie-time">13:00</div>
                                    <div class="movie-seat">A-3, B-3</div>
                                </div>
                                <div class="movie-title">Moana 2</div>
                                <div class="ticket-info">2 Tickets</div>
                                <div class="price">₱360.00</div>
                            </div>
                            <div class="transaction-item">
                                <div class="movie-info">
                                    <div class="movie-time">18:00</div>
                                    <div class="movie-seat">A-4, B-4</div>
                                    </div>
                                        <div class="movie-title">La La Land</div>
                                        <div class="ticket-info">2 Tickets</div>
                                        <div class="price">₱3600.00</div>
                                    </div>
                                </div>
                        </div>
                        <div class="date-group">
                            <div class="date-header">Mar 8, 2025</div>
                            <div class="transaction-item">
                                <div class="movie-info">
                                    <div class="movie-time">15:00</div>
                                    <div class="movie-seat">A-6, B-6, C-2</div>
                                </div>
                                <div class="movie-title">Harry Potter And the Goblet of Fire</div>
                                <div class="ticket-info">3 Tickets</div>
                                <div class="price">₱900.00</div>
                            </div>
                        </div>
                        <div class="date-group">
                            <div class="date-header">Mar 30, 2025</div>
                            <div class="transaction-item">
                                <div class="movie-info">
                                    <div class="movie-time">10:00</div>
                                    <div class="movie-seat">D-1, D-2, D-3</div>
                                    <div class="movie-seat">D-4, D-5, D-6</div>
                                </div>
                                <div class="movie-title">To All The Boys I've Loved Before</div>
                                <div class="ticket-info">6 Tickets</div>
                                <div class="price">₱1,080.00</div>
                            </div>
                        </div>
                        <div class="date-group">
                            <div class="date-header">April 5, 2025</div>
                            <div class="transaction-item">
                                <div class="movie-info">
                                    <div class="movie-time">20:30</div>
                                    <div class="movie-seat">E-5, E-6</div>
                                </div>
                                <div class="movie-title">Kung Fu Panda 4</div>
                                <div class="ticket-info">2 Tickets</div>
                                <div class="price">₱360.00</div>
                            </div>
                        </div> -->
                    </div>
                </div>
            </div>
        </main>
    </div>

    <footer>
        <div class="footer-logo">
            <h1>NoirÉclipse</h1>
        </div>

        <div class="contact-info">
            <a href="../pages/about.php" id="about">About Us | Contact Us</a>
            <!-- <a href="#" id="contact">Contact Us</a> -->
        </div>

        <div class="categories">
            <a href="#js-now-showing" id="now-movie">Now Showing | </a>
            <a href="#js-popular-movies" id="pop-movie">Popular Movies | </a>
            <a href="#coming-soon" id="coming-movie">Coming Soon</a>
        </div>
    </footer>

    <script src="../assets/js/transaction_history.js"></script>
    <script>
        document.getElementById('notif-bell').addEventListener('click', () => {
            window.location.href = "/pages/transaction_history.php";
        })
    </script>
</body>
</html>