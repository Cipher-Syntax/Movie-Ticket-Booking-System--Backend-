<?php
    session_start();

    include("../includes/connection.php");
    include("../includes/allFunction.php");

    $user_data = check_login($conn);

    $movieId = $_SESSION['movie_id'];
    $cinemaTable = $_SESSION['cinema_table'];
    $selectedDate = $_SESSION['selected_date'];
    $selectedTime = $_SESSION['selected_time'];
    
    $selectedSeats = isset($_POST['selected_seats']) ? $_POST['selected_seats'] : '';
    $booking_date = date("m/d/y");
    $price = isset($_POST['price']) ? $_POST['price'] : '0';
  
    // Fetch movie details
    $sql = "SELECT * FROM movies WHERE id = ?";
    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, "i", $movieId);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);
    $movie = mysqli_fetch_assoc($result);

    $seatArray = array_filter(array_map('trim', explode(',', $selectedSeats)));
    $tickets = count($seatArray);
    $price_per_ticket = 150;
    $total_price = $tickets * $price_per_ticket;

    // Insert booking record into the bookings table
    $insert_sql = "INSERT INTO bookings (user_id, movie_id, cinema_table, seats, price_per_ticket, tickets, total_price) VALUES (?, ?, ?, ?, ?, ?, ?)";
    $stmt = mysqli_prepare($conn, $insert_sql);
    mysqli_stmt_bind_param($stmt, "iissidi", $user_data['id'], $movieId,  $cinemaTable, $selectedSeats, $price_per_ticket, $tickets, $total_price);
    mysqli_stmt_execute($stmt);
    mysqli_stmt_close($stmt);

    // Generating QR code
    $qrData = json_encode([
        'title' => $movie['title'],
        'date' => $booking_date,
        'time' => $selectedTime,
        'cinema' => $cinemaTable,
        'seats' => $selectedSeats,
        'price' => $price
    ]);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Ticket Page</title>
    <link rel="stylesheet" href="../assets/css/ticket.css" />

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Playwrite+SK:wght@100..400&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.10.2/css/all.css" />
    <link rel='stylesheet' href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/qrcodejs/1.0.0/qrcode.min.js"></script>
</head>
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

            
            <a href="../pages/user_settings.php" class="sub-menu-links settings-and-privacy">
                <i class='bx bx-cog'></i>
                <p>Settings & Privacy</p>
                <!-- <span> > </span> -->
            </a>

            <a href="../pages/user_sapMain.php" class="sub-menu-links history">
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
    <div class="text">YOUR MOVIE ADVENTURE STARTS NOW</div>
    <div class="ticket">
        <div class="ticket-container">
            <div class="ticket-image">
                <img src="<?php echo $movie['image']; ?>" alt="<?php echo htmlspecialchars($movie['title']); ?>" />
                <div class="ticket-header">
                    <h1 class="ticket-title" id="ticket-title"><?php echo htmlspecialchars($movie['title']); ?></h1>
                </div>
            </div>
            <div class="ticket-cutout top"></div>
            <div class="ticket-cutout bottom"></div>
            <div class="ticket-line"></div>
            

            <div class="ticket-details">
                <div class="ticket-info">
                    <div class="side-side">
                        <div class="info-group">
                            <div class="info-label">Date</div>
                            <div class="info-value"><?php echo $booking_date; ?></div>
                        </div>
                        <div class="info-group">
                            <div class="info-label">Time</div>
                            <div class="info-value"><?php echo $selectedTime . " - " . date("D d", strtotime($selectedDate)); ?></div> 
                        </div>
                    </div>
                    
                    <div class="side-side">
                        <div class="info-group">
                            <div class="info-label">Cinema No</div>
                            <div class="info-value"><?php echo htmlspecialchars($cinemaTable); ?></div>
                        </div>
                        <div class="info-group">
                            <div class="info-label">Seat</div>
                            <div class="info-value" data-seat-display="true"><?php echo htmlspecialchars($selectedSeats); ?></div>
                        </div>
                    </div>
    
                </div>
            
            <div class="ticket-price">
                <div class="info-label">Price</div>
                <div class="info-value">PHP <?php echo $price; ?> </div>
            </div>
            <div class="ticket-qrCode">
                <!-- <img id="qr-code" src="" alt="QR Code"> -->
                <div id="qr-code"></div>
            </div>
        </div>
    </div>

    <input type="button" name="button" id="ticket-btn" value="Download Ticket" class="js-download-btn"/>

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
    
    <script src="../assets/js/ticket.js"></script>

    <script>
        let qrData = <?php echo json_encode($qrData); ?>;
        new QRCode(document.getElementById("qr-code"), {
            text: qrData,
            width: 150,
            height: 150
        });

        document.getElementById('notif-bell').addEventListener('click', () => {
            window.location.href = "/pages/transaction_history.php";
        })

        
        let cart = [];
        document.getElementById('ticket-btn').addEventListener('click', () => {

            let matching = false;
            
            for (let i = 0; i < cart.length; i++) {
                if (cart[i].text === ticketInfo) {
                    cart[i].quantity++;
                    matching = true;
                    break;
                }
            }

            if (!matching) {
                cart.push({ 
                    text: qrData, 
                    quantity: 1 
                });
            }

            console.log(cart);
            let totalQuantity = 0;

            cart.forEach((item) => {
                totalQuantity += item.quantity;
            })

            alert("Successfully downloaded")

            let notif_value = document.getElementById('notif-value');
            notif_value.innerHTML = totalQuantity;
            
        });


    </script>
</body>
</html>