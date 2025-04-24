<?php
    session_start();

    include("../includes/connection.php");
    include("../includes/allFunction.php");

    // Check admin login if needed
    $admin_data = admin_login($conn);


    function fetchComingSoonMovies($conn) {
        $movies = array();
        
        for ($i = 1; $i <= 5; $i++) {
            $table = "cinema" . $i;
            $query = "SELECT id, title, image, '$table' as cinema_table FROM movies WHERE status = 'Coming Soon'";
            $result = mysqli_query($conn, $query);
            
            if ($result) {
                while ($row = mysqli_fetch_assoc($result)) {
                    $movies[] = $row;
                }
            }
        }
        
        return $movies;
    }

    function fetchCurrentMovies($conn) {
        $movies = array();
        
        for ($i = 1; $i <= 5; $i++) {
            $table = "cinema" . $i;
            $query = "SELECT id, title, image, status, '$table' as cinema_table FROM movies WHERE status = 'Now Showing' OR status = 'Popular Movies'";
            $result = mysqli_query($conn, $query);
            
            if ($result) {
                while ($row = mysqli_fetch_assoc($result)) {
                    $movies[] = $row;
                }
            }
        }
        
        return $movies;
    }

    if (isset($_POST['add_movie'])) {
        $movie_id = $_POST['movie_id'];
        $source_cinema = $_POST['source_cinema'];
        $target_cinema = $_POST['target_cinema'];
        $new_status = $_POST['new_status'];
        

        $query = "SELECT * FROM $source_cinema WHERE id = ?";
        $stmt = $conn->prepare($query);
        $stmt->bind_param("i", $movie_id);
        $stmt->execute();
        $result = $stmt->get_result();
        $movie_data = $result->fetch_assoc();
        $stmt->close();
        
        if ($movie_data) {
            if ($source_cinema == $target_cinema) {
                $update_query = "UPDATE $source_cinema SET status = ? WHERE id = ?";
                $stmt = $conn->prepare($update_query);
                $stmt->bind_param("si", $new_status, $movie_id);
                $stmt->execute();
                $stmt->close();
            } 
            else {
                $check_query = "SELECT id FROM $target_cinema WHERE title = ?";
                $stmt = $conn->prepare($check_query);
                $stmt->bind_param("s", $movie_data['title']);
                $stmt->execute();
                $check_result = $stmt->get_result();
                
                if ($check_result->num_rows == 0) {
                    // Insert into target cinema with new status
                    $insert_query = "INSERT INTO $target_cinema (title, image, description, trailer, status, genre, director, cast, rating, duration, release_date) 
                                    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                    $stmt = $conn->prepare($insert_query);
                    $stmt->bind_param(
                        "sssssssssss", 
                        $movie_data['title'], 
                        $movie_data['image'], 
                        $movie_data['description'], 
                        $movie_data['trailer'], 
                        $new_status, 
                        $movie_data['genre'], 
                        $movie_data['director'], 
                        $movie_data['cast'], 
                        $movie_data['rating'], 
                        $movie_data['duration'], 
                        $movie_data['release_date']
                    );
                    $stmt->execute();
                    $stmt->close();
                } else {
                    // Update existing movie in target cinema
                    $existing_id = $check_result->fetch_assoc()['id'];
                    $update_query = "UPDATE $target_cinema SET status = ? WHERE id = ?";
                    $stmt = $conn->prepare($update_query);
                    $stmt->bind_param("si", $new_status, $existing_id);
                    $stmt->execute();
                    $stmt->close();
                }
            }
            
            // Redirect to avoid form resubmission
            header("Location: add_delete_movies.php?success=1");
            exit();
        }
    }

    // Process delete movie action
    if (isset($_POST['delete_movie'])) {
        $movie_id = $_POST['movie_id'];
        $cinema_table = $_POST['cinema_table'];
        
        $delete_query = "DELETE FROM $cinema_table WHERE id = ?";
        $stmt = $conn->prepare($delete_query);
        $stmt->bind_param("i", $movie_id);
        $stmt->execute();
        $stmt->close();
        
        // Redirect to avoid form resubmission
        header("Location: add_delete_movies.php?deleted=1");
        exit();
    }

    // Fetch movies for add and delete sections
    $comingSoonMovies = fetchComingSoonMovies($conn);
    $currentMovies = fetchCurrentMovies($conn);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add & Delete Movies</title>
    <link rel="stylesheet" href="../assets/css/add_delete_movies.css">
    <link rel='stylesheet' href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
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
                <a href="../admin/admin_dashboard.php">Dashboard</a>
            </div>
            <!-- Movies (Add / Delete) -->
            <div class="movies-field">
                <i class='bx bxs-movie'></i>
                <a href="#">Movies</a>
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
            <!-- Settings -->
            <div class="settings-field">
                <i class='bx bxs-cog'></i>
                <h5>Settings</h5>
            </div>
        </nav>

        <div class="add-new-movies-btn">
            <div class="add-movies-to-link">
                <i class='bx bx-plus' ></i>
                <a href="../admin/add_new_movies.php">ADD NEW MOVIES</a>
            </div>
        </div>
        <div class="movie-fields">
            <div class="interactive-feature">
                <button id="add-movie" class="selected">Add Movies</button>
                <button id="delete-movie">Delete Movies</button>
            </div>
            
            <?php if (isset($_GET['success'])): ?>
            <div class="alert alert-success">
                Movie has been successfully added!
            </div>
            <?php endif; ?>
            
            <?php if (isset($_GET['deleted'])): ?>
            <div class="alert alert-success">
                Movie has been successfully deleted!
            </div>
            <?php endif; ?>
            
            <div class="add-container">
                <div class="vertical-scrolling">
                    <div class="movie-container js-movie-grid">
                        <div class="add-movie-grid">
                            <?php if ($comingSoonMovies): ?>
                                <?php foreach ($comingSoonMovies as $movie): ?>
                                <div class="movies">
                                    <div class="image-container">
                                        <img src="<?php echo $movie['image']; ?>" width="200px" height="250px" />
                                    </div>
                                    <div class="title">
                                        <p><?php echo hideExceedingTitle($movie['title']); ?></p>
                                    </div>
                                    <div class="add-movie-btn">
                                        <button type="button" class="add-now-btn" 
                                            data-id="<?php echo $movie['id']; ?>" 
                                            data-title="<?php echo $movie['title']; ?>"
                                            data-cinema="<?php echo $movie['cinema_table']; ?>">
                                            Add Now
                                        </button>
                                    </div>
                                </div>
                                <?php endforeach; ?>
                            <?php else: ?>
                                <p class="no-movies">No Coming Soon movies found.</p>
                            <?php endif; ?>
                        </div>
                        
                        <div class="delete-movie-grid" style="display: none;">
                            <?php if ($currentMovies): ?>
                                <?php foreach ($currentMovies as $movie): ?>
                                <div class="movies">
                                    <div class="image-container">
                                        <img src="<?php echo $movie['image']; ?>" width="200px" height="250px" />
                                    </div>
                                    <div class="title">
                                        <p><?php echo $movie['title']; ?></p>
                                    </div>
                                    <div class="cinema-info">
                                        <p>Cinema: <?php echo substr($movie['cinema_table'], -1); ?></p>
                                        <p>Status: <?php echo $movie['status']; ?></p>
                                    </div>
                                    <div class="add-movie-btn">
                                        <button type="button" class="delete-btn" 
                                            data-id="<?php echo $movie['id']; ?>" 
                                            data-title="<?php echo $movie['title']; ?>"
                                            data-cinema="<?php echo $movie['cinema_table']; ?>">
                                            Delete
                                        </button>
                                    </div>
                                </div>
                                <?php endforeach; ?>
                            <?php else: ?>
                                <p class="no-movies">No movies found to delete.</p>
                            <?php endif; ?>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Add Movie Modal -->
    <div id="addMovieModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>Add Movie</h2>
            <form id="addMovieForm" method="post" action="">
                <input type="hidden" id="movie_id" name="movie_id">
                <input type="hidden" id="source_cinema" name="source_cinema">
                
                <div class="form-group">
                    <label for="movie_title">Movie Title:</label>
                    <input type="text" id="movie_title" readonly>
                </div>
                
                <div class="form-group">
                    <label for="new_status">Change Status To:</label>
                    <div class="checkbox-group">
                        <label>
                            <input type="radio" name="new_status" value="Now Showing" required> Now Showing
                        </label>
                        <label>
                            <input type="radio" name="new_status" value="Popular Movies" required> Popular Movies
                        </label>
                    </div>
                </div>
                
                <div class="form-group">
                    <label>Select Cinema:</label>
                    <div class="checkbox-group">
                        <?php for ($i = 1; $i <= 5; $i++): ?>
                        <label>
                            <input type="radio" name="target_cinema" value="cinema<?php echo $i; ?>" required> Cinema <?php echo $i; ?>
                        </label>
                        <?php endfor; ?>
                    </div>
                </div>
                
                <div class="form-actions">
                    <button type="submit" name="add_movie" class="modal-submit-btn">Confirm</button>
                    <button type="button" class="modal-cancel-btn">Cancel</button>
                </div>
            </form>
        </div>
    </div>

    <!-- Delete Movie Modal -->
    <div id="deleteMovieModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <h2>Delete Movie</h2>
            <form id="deleteMovieForm" method="post" action="">
                <input type="hidden" id="delete_movie_id" name="movie_id">
                <input type="hidden" id="delete_cinema_table" name="cinema_table">
                
                <div class="form-group">
                    <p>Are you sure you want to delete the movie "<span id="delete_movie_title"></span>"?</p>
                    <p>This action cannot be undone.</p>
                </div>
                
                <div class="form-actions">
                    <button type="submit" name="delete_movie" class="modal-delete-btn">Delete</button>
                    <button type="button" class="modal-cancel-btn">Cancel</button>
                </div>
            </form>
        </div>
    </div>

    <footer>
        <div class="footer-logo">
            <h1>NoirÉclipse</h1>
        </div>

        <div class="contact-info">
            <a href="#" id="about">About Us | </a>
            <a href="#" id="contact">Contact Us</a>
        </div>

        <div class="categories">
            <a href="#" id="now-movie">Now Showing | </a>
            <a href="#" id="pop-movie">Popular Movies | </a>
            <a href="#" id="coming-movie">Coming Soon</a>
        </div>
    </footer>

    <script src="../assets/js/add_delete_movies.js"></script>
    <script>
        // USER PROFILE MENU
        let subMenu = document.getElementById("js-sub-menu");

        function toggleMenu(){
            subMenu.classList.toggle("js-open-menu");
        }
    </script>

    <?php
        function hideExceedingTitle($title, $maxLength = 19) {
            if (strlen($title) > $maxLength) {
                return substr($title, 0, $maxLength) . '...';
            }
            return $title;
        }
    ?>
</body>
</html>