<?php
    session_start();

    include("../includes/connection.php");
    include("../includes/allFunction.php");

    $user_data = check_login($conn);

    // Get movie ID from URL parameter
    if (isset($_GET['id']) && isset($_GET['cinema'])) {
        $movieId = $_GET['id'];
        $cinema_table = $_GET['cinema']; 

        $sql = "SELECT * FROM movies WHERE id = ?";
        // Fetch movie details
        $stmt = mysqli_prepare($conn, $sql);
        mysqli_stmt_bind_param($stmt, "i", $movieId);
        mysqli_stmt_execute($stmt);
        $result = mysqli_stmt_get_result($stmt);

        // Fetch movie schedules from cinema1_movie_schedules - cinema5_movie_scheduls
        $schedule_table = $cinema_table . "movie_schedules";

        $schedule_sql = "SELECT show_time, show_date FROM movie_schedules WHERE movie_id = ?";
        $schedule_stmt = mysqli_prepare($conn, $schedule_sql);
        mysqli_stmt_bind_param($schedule_stmt, "i", $movieId);
        mysqli_stmt_execute($schedule_stmt);
        $schedule_result = mysqli_stmt_get_result($schedule_stmt);

        $schedules = [];
        while ($row = mysqli_fetch_assoc($schedule_result)) {
            $schedules[] = $row;
        }

        if ($result && mysqli_num_rows($result)) {
            $movie = mysqli_fetch_assoc($result);
        } else {
            // Redirect to cinema selection if movie not found
            header("Location: cinema_selection_page.php");
            exit();
        }
    } else {
        // Redirect to cinema selection if no ID provided
        header("Location: cinema_selection_page.php");
        exit();
    }
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie Details</title>
    <link rel="stylesheet" href="../assets/css/movie_details.css"/>
    
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Playwrite+SK:wght@100..400&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.10.2/css/all.css" />
    <link rel='stylesheet' href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'>
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

    <div class="details-container">
        <div class="left-side">
            <div class="img-box">
                <center>
                    <img src="<?php echo $movie['image']; ?>" alt="<?php echo $movie['title']; ?>" />
                </center>
            </div>

            <div class="text-details">
                <h2><?php echo $movie['title']; ?></h2>
            </div>

            <div class="genre">
                <p>Genre: <?php echo $movie['genre']; ?></p>
            </div>

            <div class="duration">
                <p>Duration: <?php echo $movie['duration']; ?></p>
            </div>

            <div class="synopsis">
                <h2>Synopsis</h2>
                <?php
                // Split the synopsis to show "See More"
                $fullSynopsis = $movie['synopsis'];
                $shortSynopsis = substr($fullSynopsis, 0, 150);
                $remainingSynopsis = substr($fullSynopsis, 150);
                ?>

                <p>
                    <?php echo $shortSynopsis; ?><span id="dots">...</span>
                    
                    <span id="more" class="hidden-content"> 
                        <?php echo $remainingSynopsis; ?>
                    </span>
                    
                    <span id="toggleBtn" class="see-more" onclick="toggleText()">See More</span>
                </p>
                <div class="time-container">
                    <h2 id="movie-schedule">Select Date and Time</h2>

                    <div class="schedule-wrapper">
                        <div class="time-options">
                            <?php foreach ($schedules as $schedule) { ?>
                                <div class="time" data-time="<?php echo date("H:i", strtotime($schedule['show_time'])); ?>">
                                    <?php echo date("H:i", strtotime($schedule['show_time'])); ?>
                                </div>
                            <?php } ?>
                        </div>

                        <div class="date-options">
                            <?php
                            $unique_dates = array_unique(array_column($schedules, 'show_date'));
                            foreach ($unique_dates as $date) { ?>
                                <div class="date" data-date="<?php echo $date; ?>">
                                    <?php echo date("D <br> d", strtotime($date)); ?>
                                </div>
                            <?php } ?>
                        </div>
                    </div>

                    <!-- <form action="seat_selection_page.php" method="post">
                        <input type="submit" name="button" id="bookTicket-btn" value="Book Ticket" />
                    </form> -->
                    <form action="seat_selection_page.php" method="post">
                        <input type="hidden" name="movie_id" value="<?php echo $movieId; ?>">
                        <input type="hidden" name="cinema_table" value="<?php echo $cinema_table; ?>">
                        <input type="hidden" id="selected_date_input" name="selected_date">
                        <input type="hidden" id="selected_time_input" name="selected_time">

                        <input type="submit" name="button" id="bookTicket-btn" value="Book Ticket">
                    </form>

                </div>

            </div>

        </div>

        <div class="right-side">
            <div class="right-container">
                <div class="cast-crew">
                    <h2 id="cast">Cast & Crew:</h2>
                    <p><?php echo $movie['casts']; ?></p>

                    <div class="rating">
                        <h2 id="rate">Rating:</h2>
                        <img src="<?php echo $movie['rating']; ?>" alt="rating"/>
                    </div>

                    <textarea id="comment-bar" cols="400px" placeholder="Add Comment"></textarea>

                    <form action="#" method="post">
                        <input type="submit" id="submit" name="submit" />
                    </form>
                </div>
            </div>
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
    
    <script src="../assets/js/movie_details.js"></script>

    <script>
        let subMenu = document.getElementById("js-sub-menu");

        function toggleMenu(){
            subMenu.classList.toggle("js-open-menu");
        }
        
        document.getElementById('notif-bell').addEventListener('click', () => {
            window.location.href = "../pages/transaction_history.php";
        })
    </script>
</body>
</html>

<?php
    $conn->close();
?>