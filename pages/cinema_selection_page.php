<?php
    session_start();
    
    require_once("../class/Connection.php");
    require_once("../includes/login_checker.php");
    require_once("../class/Movies.php");

    $user_data = checkUserLogin($conn);
    $moviePosters = [
        "cinema1" => [
            "../assets/images/movie_posters/G_PrideAndPrejudice.png",
            "../assets/images/movie_posters/PG_500DaysOfSummer.png",
            "../assets/images/movie_posters/PG_AboutTime.png",
            "../assets/images/movie_posters/PG_AlwaysBeMyMaybe.png",
            "../assets/images/movie_posters/PG_AnyoneButYou.png",
            "../assets/images/movie_posters/PG_AQuietPlace.png"
        ],
        "cinema2" => [
            "../assets/images/movie_posters/PG_HarryPotterAndTheGobletOfFire.png",
            "../assets/images/movie_posters/PG_HarryPotterAndTheHalfBloofPrince.png",
            "../assets/images/movie_posters/PG_MatrixReloaded.png",
            "../assets/images/movie_posters/PG_Interstellar.png",
            "../assets/images/movie_posters/PG_Inception.png",
            "../assets/images/movie_posters/PG_LaLaLand.png"
        ],
        "cinema3" => [
            "../assets/images/movie_posters/PG_TheHobbit.png",
            "../assets/images/movie_posters/PG_TheFaultInOurStars.png",
            "../assets/images/movie_posters/PG_TheMartian.png",
            "../assets/images/movie_posters/PG_TheNotebook.png",
            "../assets/images/movie_posters/PG_TheOtherGuys.png",
            "../assets/images/movie_posters/PG_TheGrandBudapest.png"
        ],
        "cinema4" => [
            "../assets/images/movie_posters/R_BladeRunner.png",
            "../assets/images/movie_posters/R_Blockers.png",
            "../assets/images/movie_posters/R_Borat.png",
            "../assets/images/movie_posters/R_BoratSubsequentMovieFilm.png",
            "../assets/images/movie_posters/R_Bridesmaids.png",
            "../assets/images/movie_posters/R_CallMeByYourName.png"
        ],
        "cinema5" => [
            "../assets/images/movie_posters/R_Nope.png",
            "../assets/images/movie_posters/R_PansLabyrinth.png",
            "../assets/images/movie_posters/R_ParanormalActivity.png",
            "../assets/images/movie_posters/R_Scream.png",
            "../assets/images/movie_posters/R_StepBrothers.png",
            "../assets/images/movie_posters/R_SuperBad.png"
        ]
    ];
    
    $cinemas = [];
    $result = $user->getAllResults();
    
    while ($row = $result->fetch(PDO::FETCH_ASSOC)) {
        $slug = strtolower(str_replace(' ', '', $row['cinema_name']));
    
        $cinemas[] = [
            'name' => $row['cinema_name'],
            'location' => $row['location'],
            'image' => ($row['cinema_image']),
            'slug' => $slug,
            'movies' => $moviePosters[$slug] ?? [] 
        ];
    }
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cinema Selection Page</title>
    <link rel="stylesheet" href="../assets/css/cinema_selection_page.css" >

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Playwrite+SK:wght@100..400&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap" rel="stylesheet">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.10.2/css/all.css" />
    <link rel='stylesheet' href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css'>
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
                <?php echo $user_data['username'] ?>
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


    <div class="cinema-details">


        <?php foreach ($cinemas as $cinema) { ?>
            <div class="cinema-wrapper">
                <img src="<?php echo $cinema['image']; ?>" alt="<?php echo $cinema['name']; ?>">

                <div class="cinema-container">
                    <div class="left-side">
                        <div class="cinema-name">
                            <h2><?php echo $cinema['name']; ?></h2> 
                        </div>

                        <div class="cinema-location">
                            <p><?php echo $cinema['location']; ?></p>
                        </div>

                        <div class="select-btn">
                            <a href="<?php echo $cinema['slug']; ?>.php?cinema=<?php echo $cinema['slug']; ?>">Select</a>
                        </div>
                    </div>

                    <div class="right-side">
                        <?php foreach ($cinema['movies'] as $moviePoster) { ?>
                            <div class="right-side-container">
                                <img src="<?php echo $moviePoster; ?>" alt="Movie Poster">
                            </div>
                            
                        <?php } ?>
                    </div>
                </div>
            </div>
        <?php } ?>


        <div class="scroll-btn-container">
            <button id="scroll-up" class="scroll-btn">▲</button>
            <button id="scroll-down" class="scroll-btn">▼</button>
        </div>

    </div>

    <script>
        document.addEventListener('DOMContentLoaded', () => {

            const cinemaWrappers = document.querySelectorAll('.cinema-wrapper');
            let currentCinemaIndex = 0;
            
            // DISPLAY ONLY ONE CINEMA AT A TIME
            function cinemaInteraction() {
                cinemaWrappers.forEach((wrapper, index) => {
                    if (index === 0) {
                        wrapper.style.display = 'block';
                    } else {
                        wrapper.style.display = 'none';
                    }
                });
            }

            const scrollUpBtn = document.getElementById('scroll-up');
            const scrollDownBtn = document.getElementById('scroll-down');

            // SCROLL DOWN
            function scrollDown() {
                cinemaWrappers[currentCinemaIndex].style.display = 'none';
                currentCinemaIndex = (currentCinemaIndex + 1) % cinemaWrappers.length;
                cinemaWrappers[currentCinemaIndex].style.display = 'block';
            }

            // SCROLL UP
            function scrollUp() {
                cinemaWrappers[currentCinemaIndex].style.display = 'none';
                currentCinemaIndex = (currentCinemaIndex - 1 + cinemaWrappers.length) % cinemaWrappers.length;
                cinemaWrappers[currentCinemaIndex].style.display = 'block';
            }

            scrollDownBtn.addEventListener('click', scrollDown);
            scrollUpBtn.addEventListener('click', scrollUp);

            cinemaInteraction();
        });

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