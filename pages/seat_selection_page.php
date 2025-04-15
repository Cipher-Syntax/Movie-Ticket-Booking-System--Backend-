<?php
    session_start();

    include("../includes/connection.php");
    include("../includes/allFunction.php");

    $user_data = check_login($conn);

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        if (!empty($_POST['movie_id']) && !empty($_POST['cinema_table']) && !empty($_POST['selected_date']) && !empty($_POST['selected_time'])) {
            $_SESSION['movie_id'] = $_POST['movie_id'];
            $_SESSION['cinema_table'] = $_POST['cinema_table'];
            $_SESSION['selected_date'] = $_POST['selected_date'];
            $_SESSION['selected_time'] = $_POST['selected_time'];
        } else {
            echo "<script>alert('Error: Missing booking details.');</script>";
            exit();
        }
    }

    // If session variables are missing redirect to cinema selection page
    if (!isset($_SESSION['movie_id']) || !isset($_SESSION['cinema_table']) || !isset($_SESSION['selected_date']) || !isset($_SESSION['selected_time'])) {
        header("Location: cinema_selection_page.php");
        exit();
    }


    $reservedSeats = array();
    // $query = "SELECT seats FROM bookings";
    $cinemaTable = $_SESSION['cinema_table'];
    $movie_id = $_SESSION['movie_id'];

    $query = "SELECT seats FROM bookings WHERE cinema_table = '$cinemaTable' AND id = '$movie_id'";
    
    $result = mysqli_query($conn, $query);
    while ($row = mysqli_fetch_assoc($result)) {
        $seatsBooked = explode(',', $row['seats']);
        foreach ($seatsBooked as $seatBook) {
            $seatBook = trim($seatBook);
            if (!empty($seatBook)) {
                $reservedSeats[] = $seatBook;
            }
        }
    }

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seat Map</title>
</head>

<link rel="stylesheet" href="../assets/css/seat_selection.css" />

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Playwrite+SK:wght@100..400&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.10.2/css/all.css" />
<link rel='stylesheet' href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'>

<body>
    <header>
        <h1 class="logo">NoirÉclipse</h1>

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
                <?php echo $user_data['first_name']; ?>
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

            <a href="../pages/transaction_history.php" class="sub-menu-links history">
                <i class='bx bx-history'></i>
                <p>History</p>
                <!-- <span> > </span> -->
            </a>

            <a href="logout.php" class="sub-menu-links logout" id="logout">
                <i class='bx bx-log-out'></i>
                <p>Logout</p>
                <!-- <span> > </span> -->
            </a>
        </div>
    </div>

    <div class="text">
        <p>CHOOSE SEATS</p>
        <p id="cinema-screen">Cinema Screen</p>
    </div>

    <h3 id="entrance">Entrance</h3>

    <div class="curve-line">
        <svg xmlns="http://www.w3.org/2000/svg" width="1254" height="95" viewBox="0 0 1254 95" fill="none">
            <path d="M2.99996 89.913C646.941 -25.7245 646.941 -26.7301 1251.05 92" stroke="white" stroke-width="5" stroke-linecap="round"/>
        </svg>
    </div>

    <div class="seat-selection">
        <div class="left-seat">
            <div></div>
            <div>1</div> <div>2</div> <div>3</div> <div>4</div> <div>5</div>
            <div>6</div> <div>7</div> <div>8</div> <div>9</div> <div>10</div>

            <!-- Row A with data-seat attributes -->
            <div class="row-label">A</div>
            <svg class="seat" data-seat="A1"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="A2"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="A3"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="A4"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="A5"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="A6"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="A7"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="A8"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="A9"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="A10"><use href="#seat-icon"></use></svg>

            <!-- Row B -->
            <div class="row-label">B</div>
            <svg class="seat" data-seat="B1"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="B2"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="B3"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="B4"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="B5"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="B6"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="B7"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="B8"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="B9"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="B10"><use href="#seat-icon"></use></svg>

            <!-- Row C -->
            <div class="row-label">C</div>
            <svg class="seat" data-seat="C1"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="C2"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="C3"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="C4"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="C5"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="C6"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="C7"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="C8"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="C9"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="C10"><use href="#seat-icon"></use></svg>

            <!-- Row D -->
            <div class="row-label">D</div>
            <svg class="seat" data-seat="D1"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="D2"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="D3"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="D4"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="D5"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="D6"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="D7"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="D8"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="D9"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="D10"><use href="#seat-icon"></use></svg>

            <!-- Row E -->
            <div class="row-label">E</div>
            <svg class="seat" data-seat="E1"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="E2"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="E3"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="E4"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="E5"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="E6"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="E7"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="E8"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="E9"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="E10"><use href="#seat-icon"></use></svg>
        </div>

        <div class="right-seat">
            <div>10</div> <div>9</div> <div>8</div> <div>7</div> <div>6</div>
            <div>5</div> <div>4</div> <div>3</div> <div>2</div> <div>1</div>
            <div></div>

            <!-- Row G -->
            <svg class="seat" data-seat="G10"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="G9"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="G8"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="G7"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="G6"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="G5"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="G4"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="G3"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="G2"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="G1"><use href="#seat-icon"></use></svg>
            <div class="row-label">G</div>

            <!-- Row H -->
            <svg class="seat" data-seat="H10"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="H9"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="H8"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="H7"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="H6"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="H5"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="H4"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="H3"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="H2"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="H1"><use href="#seat-icon"></use></svg>
            <div class="row-label">H</div>

            <!-- Row I -->
            <svg class="seat" data-seat="I10"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="I9"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="I8"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="I7"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="I6"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="I5"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="I4"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="I3"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="I2"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="I1"><use href="#seat-icon"></use></svg>
            <div class="row-label">I</div>

            <!-- Row J -->
            <svg class="seat" data-seat="J10"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="J9"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="J8"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="J7"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="J6"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="J5"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="J4"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="J3"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="J2"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="J1"><use href="#seat-icon"></use></svg>
            <div class="row-label">J</div>

            <!-- Row K -->
            <svg class="seat" data-seat="K10"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="K9"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="K8"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="K7"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="K6"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="K5"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="K4"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="K3"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="K2"><use href="#seat-icon"></use></svg>
            <svg class="seat" data-seat="K1"><use href="#seat-icon"></use></svg>
            <div class="row-label">K</div>
        </div>

        <svg width="0" height="0">
            <defs>
                <symbol id="seat-icon" viewBox="0 0 27 19" fill="none">
                    <path d="M0.660122 3.39888C0.669849 2.46046 1.43848 1.70759 2.37691 1.71732L4.07609 1.73493C5.01452 1.74466 5.76738 2.51329 5.75765 3.45172L5.66959 11.9476C5.65986 12.886 6.41272 13.6547 7.35115 13.6644L19.2454 13.7877C20.1838 13.7974 20.9525 13.0445 20.9622 12.1061L21.0502 3.61023C21.06 2.6718 21.8286 1.91894 22.767 1.92867L24.4662 1.94628C25.4046 1.95601 26.1575 2.72464 26.1478 3.66307L26.0333 14.7077C26.009 17.0538 24.0874 18.9359 21.7413 18.9116L4.74955 18.7355C2.40348 18.7112 0.521324 16.7896 0.545642 14.4435L0.660122 3.39888Z" fill="currentColor"/>
                    <path d="M6.61616 2.60956C6.63075 1.20191 7.7837 0.072619 9.19134 0.0872095L17.6872 0.175271C19.0949 0.189862 20.2242 1.34281 20.2096 2.75045L20.1127 12.0959C20.1078 12.5651 19.7235 12.9416 19.2543 12.9367L7.36007 12.8134C6.89086 12.8086 6.51443 12.4242 6.51929 11.955L6.61616 2.60956Z" fill="currentColor"/>
                </symbol>
            </defs>
        </svg>
    </div>

    <div class="seat-legend">
        <div class="seat-item">
            <svg xmlns="http://www.w3.org/2000/svg" width="31" height="30" viewBox="0 0 31 30" fill="none">
                <circle cx="15.0977" cy="15" r="15" fill="white" stroke="black"/>
            </svg>
            <p>Available</p>
        </div>
        <div class="seat-item">
            <svg xmlns="http://www.w3.org/2000/svg" width="31" height="30" viewBox="0 0 31 30" fill="none">
                <circle cx="15.0977" cy="15" r="15" fill="#B6116B"/>
            </svg>
            <p>Reserved</p>
        </div>
        <div class="seat-item">
            <svg xmlns="http://www.w3.org/2000/svg" width="31" height="30" viewBox="0 0 31 30" fill="none">
                <circle cx="15.0977" cy="15" r="15" fill="#09FBD3"/>
            </svg>
            <p>Selected</p>
        </div>
    </div>

    <h3 id="fire-exit">Fire Exit</h3>
    <div class="straight-line">
        <svg xmlns="http://www.w3.org/2000/svg" width="1232" height="7" viewBox="0 0 1232 7" fill="none">
            <path d="M3.00035 2.99986C641.978 5.0902 1229.5 3.00019 1229.5 3.00019" stroke="white" stroke-width="5" stroke-linecap="round"/>
        </svg>
    </div>

    <form action="ticket.php" method="post">
        <input type="hidden" name="selected_date" value="<?php echo $_SESSION['selected_date']; ?>">
        <input type="hidden" name="selected_time" value="<?php echo $_SESSION['selected_time']; ?>">
        <input type="hidden" name="cinema_number" value="<?php echo $_SESSION['cinema_table']; ?>">
        
        <input type="hidden" name="selected_seats" id="selected_seats_input" value="">
        <input type="hidden" name="price" id="price_input" value="<?php echo isset($_SESSION['price']) ? $_SESSION['price'] : '0'; ?>">
        <input type="submit" name="button" id="ticket-btn" value="Get Ticket">
    </form>

    <div class="booking-confirmation js-booking-confirmation">
        <div class="text-confirmation">
            <p>Confirm Booking?</p>
        </div>
        <div class="confirmation-btn">
            <a href="../pages/cinema_selection_page.php">Cancel</a>
            <a href="../pages/ticket.php">Yes</a>
        </div>
        <div class="text-confirmation-note">
            <p>Note that after clicking yes you can no longer cancel your booking</p>
        </div>
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

    <script id="reservedSeats"> <?php echo json_encode($reservedSeats); ?> </script>

    <script src="../assets/js/seat_selection_page.js"></script>
</body>
</html>
