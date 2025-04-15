<?php
    session_start();

    include("../includes/connection.php");
    include("../includes/allFunction.php");

    $admin_data = admin_login($conn);

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        if (isset($_POST['cancel'])) {
            header("Location: admin_dashboard.php");
            exit;
        }
    
        if (isset($_POST['add'])) {
            $title = trim($_POST['title']);
            $synopsis = trim($_POST['synopsis']);
            $status = $_POST['status'];
            $genre = $_POST['genre'];
            $duration = trim($_POST['duration']);
            $casts = trim($_POST['casts']);
            $cinema = $_POST['cinema_number'];
        
            // Uploads
            $poster = $_FILES['poster']['name'];
            $rating = $_FILES['rating']['name'];
            

            $poster_tmp = $_FILES['poster']['tmp_name'];
            $rating_tmp = $_FILES['rating']['tmp_name'];
    
            $poster_path = "../assets/images/movie_posters/" . $poster;
            $rating_path = "../assets/images/ratings/" . $rating;
    
            move_uploaded_file($poster_tmp, $poster_path);
            move_uploaded_file($rating_tmp, $rating_path);
            
            if (empty($title) || empty($synopsis) || empty($status) || empty($genre) || empty($duration) || empty($casts) || empty($cinema) || empty($poster) || empty($rating)) {
                echo "<script>alert('All fields are required!'); window.history.back();</script>";
            }
            
            else{
                // Insert to DB
                $query = "INSERT INTO movies (image, title, genre, duration, synopsis, casts, rating, status, cinema_number)
                        VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        
                $stmt = $conn->prepare($query);
                $stmt->bind_param("ssssssssi", $poster_path, $title, $genre, $duration, $synopsis, $casts, $rating_path, $status, $cinema);
                $stmt->execute();

                if ($stmt->affected_rows > 0) {
                    // Get the last inserted movie ID
                    $movie_id = $conn->insert_id;
                
                    // Default schedule times
                    $default_times = ['09:00:00', '13:00:00', '16:00:00', '19:00:00', '22:00:00'];
                    $start_date = '2025-05-01';
                
                    foreach ($default_times as $index => $time) {
                        $show_date = date('Y-m-d', strtotime($start_date . " +$index days"));
                        
                        $schedule_query = "INSERT INTO movie_schedules (movie_id, cinema_number, show_time, show_date)
                                        VALUES (?, ?, ?, ?)";
                        $schedule_stmt = $conn->prepare($schedule_query);
                        $schedule_stmt->bind_param("iiss", $movie_id, $cinema, $time, $show_date);
                        $schedule_stmt->execute();
                    }
                
                    echo "<script>alert('Movie added successfully!');</script>";
                }
                else{
                    echo "<script>alert('Failed to add movie!');</script>";
                }
                
            }

        }        
    }
    
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Adding New Movies</title>
    <link rel="stylesheet" href="../assets/css/add_new_movies.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
</head>
<body>
    <header>
        <div class="logo">
            <h1>NoirÉclipse</h1>
        </div>

        <form action="#" class="search-box">
            <input type="text" name="search" placeholder="Search here...." class="search-input" />
            <button type="submit">
                <i class='bx bx-search'></i>
            </button>
        </form>

        <div class="user-profile">
            <i class="fa fa-bell"></i>
            <i class="far fa-user-circle"></i>
        </div>
    </header>
    
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

        <h1 id="text-logo">ADD NEW MOVIES</h1>
        <!-- <form action="" method="POST" class="container"> 
            <div class="container">
                <div class="first-flex">
                    <div class="movie-tzitle-container">
                        <h3>Movie Title:</h3>
                        <textarea type="text" name="movie-title" placeholder="Enter movie title here..." id="movie-title"></textarea>
                    </div>

                    <div class="cinema-choice-container">
                        <h3>Cinema Selection: </h3>
                        <select name="cinema-choice" id="cinema-choice">
                            <option value="slect-cinema">Select Cinema</option>
                            <option value="slect-cinema">Cinema 1</option>
                            <option value="slect-cinema">Cinema 2</option>
                            <option value="slect-cinema">Cinema 3</option>
                            <option value="slect-cinema">Cinema 4</option>
                            <option value="slect-cinema">Cinema 5</option>
                        </select>
                        <h3>Movie Genre</h3>
                        <select name="genre-choice" id="genre-choice">
                            <option value="slect-cinema">Select Genre</option>
                            <option value="slect-cinema">Adventure</option>
                            <option value="slect-cinema">Romance</option>
                            <option value="slect-cinema">Action</option>
                            <option value="slect-cinema">Drama</option>
                            <option value="slect-cinema">Thriller</option>
                        </select>
                    </div>

                    <div class="movie-status-container">
                    <h3>Movie Status: </h3>
                        <select name="cinema-choice" id="cinema-choice">
                            <option value="slect-cinema">Now Showing</option>
                            <option value="slect-cinema">Popular Movies</option>
                            <option value="slect-cinema">Coming Soon</option>
                        </select>
                    </div>
                </div>

                <div class="second-flex">
                    <div class="movie-synopsis-container">
                        <h3>Synopsis:</h3>
                        <textarea type="text" name="movie-synopsis" placeholder="Enter synopsis here..." id="movie-synopsis"></textarea>
                    </div>

                    <div class="movie-casts-container">
                        <h3>Casts & Crew:</h3>
                        <textarea type="text" name="movie-casts" placeholder="Enter casts and crew here..." id="movie-casts"></textarea>
                    </div>
                </div>

                <div class="third-flex">
                    <div class="upload-image-container">
                        <div class="image-upload">
                            <h3>Movie Poster:</h3>
                            <label for="posterUpload" class="upload-button">
                                <h3 class="upload-text">Upload Here</h3>
                                <i class='bx bx-upload'></i>
                                <input type="file" name="poster" id="posterUpload" accept="image/png">
                            </label>
                        </div>
                        <div class="rating-upload">
                            <h3>Movie Rating:</h3>
                            <label for="posterUpload" class="upload-button">
                                <h3 class="upload-text">Upload Here</h3>
                                <i class='bx bx-upload'></i>
                                <input type="file" name="rating" id="posterUpload" accept="image/png">
                            </label>
                        </div>
                    </div>

                    <div class="btn-links">
                        <form action="" id="btn-choice">
                            <button type="submit" id="add-new-movie">Add To List</button>
                            <button type="submit" id="cancel-adding-movie">Cancel</button>
                        </form>
                    </div>
                </div>
            </div>
        </form> -->
        <form action="" method="POST" enctype="multipart/form-data" class="container">  
            <div class="first-flex">
                <div class="movie-title-container">
                    <h3>Movie Title:</h3>
                    <textarea name="title" placeholder="Enter movie title here..."></textarea>
                </div>

                <div class="cinema-choice-container">
                    <h3>Cinema Selection:</h3>
                    <select name="cinema_number">
                        <option value="1">Cinema 1</option>
                        <option value="2">Cinema 2</option>
                        <option value="3">Cinema 3</option>
                        <option value="4">Cinema 4</option>
                        <option value="5">Cinema 5</option>
                    </select>

                    <h3>Movie Genre</h3>
                    <select name="genre">
                        <option value="Adventure">Adventure</option>
                        <option value="Romance">Romance</option>
                        <option value="Action">Action</option>
                        <option value="Drama">Drama</option>
                        <option value="Thriller">Thriller</option>
                    </select>
                </div>

                <div class="movie-status-container">
                    <h3>Movie Status:</h3>
                    <select name="status">
                        <option value="Now Showing">Now Showing</option>
                        <option value="Popular Movies">Popular Movies</option>
                        <option value="Coming Soon">Coming Soon</option>
                    </select>
                </div>

                <div class="movie-time-container">
                    <h3>Time Duration:</h3>
                    <input type="text" name="duration" placeholder="Time Duration">
                </div>
            </div>

            <div class="second-flex">
                <div class="movie-synopsis-container">
                    <h3>Synopsis:</h3>
                    <textarea name="synopsis" placeholder="Enter synopsis here..."></textarea>
                </div>

                <div class="movie-casts-container">
                    <h3>Casts & Crew:</h3>
                    <textarea name="casts" placeholder="Enter casts and crew here..."></textarea>
                </div>
            </div>

            <div class="third-flex">
                <div class="upload-image-container">
                    <div class="image-upload">
                        <h3>Movie Poster:</h3>
                        <label for="posterUpload" class="upload-button">
                            <h3 class="upload-text">Upload Here</h3>
                            <i class='bx bx-upload'></i>
                            <input type="file" name="poster" id="posterUpload" accept="image/png">
                        </label>
                    </div>
                    <div class="rating-upload">
                        <h3>Movie Rating:</h3>
                        <label for="ratingUpload" class="upload-button">
                            <h3 class="upload-text">Upload Here</h3>
                            <i class='bx bx-upload'></i>
                            <input type="file" name="rating" id="ratingUpload" accept="image/png">
                        </label>
                    </div>
                </div>

                <div class="btn-links">
                    <button type="submit" name="add" id="add-new-movie">Add To List</button>
                    <button type="submit" name="cancel" id="cancel-adding-movie">Cancel</button>
                </div>
            </div>
        </form>


    </div>

    <script>
        document.getElementById('posterUpload').addEventListener('change', function(event) {
            const file = event.target.files[0];
            if (file) {
                console.log('File selected:', file.name);
                // Here you would typically upload the file to a server
            }
        });
    </script>
</body>
</html>