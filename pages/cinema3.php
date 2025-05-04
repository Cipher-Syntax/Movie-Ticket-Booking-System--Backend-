<?php
    if(session_status() == PHP_SESSION_NONE){
        session_start();
    }

    require_once("../class/Connection.php");
    require_once("../includes/login_checker.php");
    require_once("../class/UserRegistration.php");

    $user_data = checkUserLogin($conn);

    $allowedCinemas = ['cinema1', 'cinema2', 'cinema3', 'cinema4', 'cinema5'];
    if (isset($_GET['cinema']) && in_array($_GET['cinema'], $allowedCinemas)) {
        $_SESSION['cinema_table'] = $_GET['cinema'];
    } 
    else {
        header("Location: cinema_selection_page.php");
        exit();
    }

    if (!isset($_SESSION['cinema_table'])) {
        header("Location: cinema_selection_page.php");
        exit();
    }

    $cinemaTable = $_SESSION['cinema_table'];

    $searchTerm = "";
    $searchCondition = "";
    $bind_params = [];
    
    if (isset($_GET['search']) && !empty($_GET['search'])) {
        $searchTerm = $_GET['search'];
        $searchCondition = " AND title LIKE :search";
        $bind_params = [':search' => "%$searchTerm%"];
    }
    
    $queries = [
        'nowShowing' => "SELECT * FROM movies WHERE status = 'Now Showing' AND cinema_number = 3 $searchCondition",
        'popular' => "SELECT * FROM movies WHERE status = 'Popular Movies' AND cinema_number = 3 $searchCondition",
        'comingSoon' => "SELECT * FROM movies WHERE status = 'Coming Soon' AND cinema_number = 3 $searchCondition"
    ];
    
    $nowShowingStmt = $conn->prepare($queries['nowShowing']);
    $popularStmt = $conn->prepare($queries['popular']);
    $comingSoonStmt = $conn->prepare($queries['comingSoon']);
    
    $nowShowingStmt->execute($bind_params);
    $popularStmt->execute($bind_params);
    $comingSoonStmt->execute($bind_params);

    $nowShowingResult = $nowShowingStmt->fetchAll(PDO::FETCH_ASSOC);
    $popularResult = $popularStmt->fetchAll(PDO::FETCH_ASSOC);
    $comingSoonResult = $comingSoonStmt->fetchAll(PDO::FETCH_ASSOC);

?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Movie Selection Page</title>

    <link rel="stylesheet" href="../assets/css/cinema.css" />
    <link rel='stylesheet' href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'>
</head>
<body>
    <header>
        <h1 class="logo">NoirÉclipse</h1>
        <form action="" method="GET" class="search-box" id="searchForm">
            <input type="text" name="search" placeholder="Search movies here..." class="search-input" value="<?php echo htmlspecialchars($searchTerm); ?>" />
            <input type="hidden" name="cinema" value="<?php echo htmlspecialchars($cinemaTable); ?>" />
            <button type="submit">
                <i class='bx bx-search'></i>
            </button>
        </form>

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

    <div class="hero_section">
        <div class="hero-img">
            <div class="image_container">
                <div class="hero-container">
                    <p class="overlay_text1">Your epic movie adventure starts here</p>
                    <p class="overlay_text2">Secure your tickets for the hottest new releases and special screenings!!</p>
                    <div class="button">
                        <button type="submit" id="hero-btn" onclick="scrollToNowShowing()">Book Now</button>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <?php if (!empty($searchTerm)): ?>
        <div class="search-results-info">
            <center>
                <h2>Search results for: "<?php echo htmlspecialchars($searchTerm); ?>"</h2>
                <button onclick="clearSearch()" class="clear-search-btn">Clear Search</button>
            </center>
        </div>
    <?php endif; ?>

    <center>
        <div class="movies-showing" id="js-now-showing" <?php echo (count($nowShowingResult) === 0) ? 'style="display:none;"' : ''; ?>>
            <div class="movie-labels">
                <h3 class="movie-label">Now Showing</h3>
            </div>
            <div class="horizontal-scrolling js-now-showing-scroll">
                <div class="movie-container js-movie-grid">
                    <?php foreach ($nowShowingResult as $movie): ?>
                        <div class="movies">
                            <div class="background-container">
                                <div class="image-container">
                                    <img src="<?php echo $movie['image']; ?>" width="200px" height="250px" />
                                </div>
                                <h3 class="movie-title"><?php echo hideExceedingTitle($movie['title']); ?></h3>
                                <a href="movie_details.php?id=<?php echo $movie['id']; ?>&cinema=<?php echo $cinemaTable; ?>">
                                    <input type="button" value="Book Now" class="js-book-now-link" data-get-title="<?php echo $movie['title']; ?>"/>
                                </a>
                            </div>
                        </div>
                    <?php endforeach ?>
                </div>
            </div>
            <div class="scroll-btn-container">
                <button id="now-showing-scroll-left" class="scroll-btn">◀</button>
                <button id="now-showing-scroll-right" class="scroll-btn">▶</button>
            </div>
        </div>
    </center>


    <!-- Popular Movies Section -->
    <center>
        <div class="movies-showing" id="js-popular-movies" <?php echo (COUNT($popularResult) === 0) ? 'style="display:none;"' : ''; ?>>
            <div class="movie-labels">
                <h3 class="movie-label">Popular Movies</h3>
            </div>
            <div class="horizontal-scrolling js-popular-movies-scroll">
                <div class="movie-container js-popular-movie-grid">
                    <?php foreach ($popularResult as $movie): ?>
                        <div class="movies">
                            <div class="background-container">
                                <div class="image-container">
                                    <img src="<?php echo $movie['image']; ?>" width="200px" height="250px" />
                                </div>
                                <h3 class="movie-title"><?php echo hideExceedingTitle($movie['title']); ?></h3>
                                <a href="movie_details.php?id=<?php echo $movie['id']; ?>&cinema=<?php echo $cinemaTable; ?>">
                                    <input type="button" value="Book Now" class="js-book-now-link" data-get-title="<?php echo $movie['title']; ?>"/>
                                </a>
                            </div>
                        </div>
                    <?php endforeach ?>
                </div>
            </div>
            <div class="scroll-btn-container">
                <button id="popular-movies-scroll-left" class="scroll-btn">◀</button>
                <button id="popular-movies-scroll-right" class="scroll-btn">▶</button>
            </div>
        </div>
    </center>

    <!-- Coming Soon Section -->
    <center>
        <div class="movies-showing" id="js-coming-soon" <?php echo (COUNT($comingSoonResult) === 0) ? 'style="display:none;"' : ''; ?>>
            <div class="movie-labels">
                <h3 class="movie-label">Coming Soon</h3>
            </div>
            <div class="horizontal-scrolling js-coming-soon-scroll">
                <div class="movie-container js-coming-soon-movie-grid">
                    <?php foreach ($comingSoonResult as $movie): ?>
                        <div class="movies">
                            <div class="background-container">
                                <div class="image-container">
                                    <img src="<?php echo $movie['image']; ?>" width="200px" height="250px" />
                                </div>
                                <h3 class="movie-title"><?php echo hideExceedingTitle($movie['title']); ?></h3>
                                <a href="movie_details.php?id=<?php echo $movie['id']; ?>&cinema=<?php echo $cinemaTable; ?>">
                                    <input type="button" value="Book Now" class="js-book-now-link" data-get-title="<?php echo $movie['title']; ?>"/>
                                </a>
                            </div>
                        </div>
                    <?php endforeach ?>
                </div>
            </div>
            <div class="scroll-btn-container">
                <button id="coming-soon-scroll-left" class="scroll-btn">◀</button>
                <button id="coming-soon-scroll-right" class="scroll-btn">▶</button>
            </div>
        </div>
    </center>

    <?php 
        // No results found
        if (COUNT($nowShowingResult) === 0 && COUNT($popularResult) === 0 && COUNT($comingSoonResult) === 0 && !empty($searchTerm)) {
            echo '<center><div class="no-results"><h2>No movies found matching "' . htmlspecialchars($searchTerm) . '"</h2></div></center>';
        }
    ?>

    <script src="../assets/js/movie_selection.js"></script>

    <?php
        function hideExceedingTitle($title, $maxLength = 23) {
            if (strlen($title) > $maxLength) {
                return substr($title, 0, $maxLength) . '...';
            }
            return $title;
        }
    ?>
    
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

</body>
</html>
