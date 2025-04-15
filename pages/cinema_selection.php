<?php
    session_start();
    
    include("../includes/connection.php");
    include("../includes/allFunction.php");

    $user_data = check_login($conn);

    $cinemas = [
        "cinema1" => ["name" => "Cinema 1", "location" => "3rd Floor Room 1", "image" => "cinema_1.png"],
        "cinema2" => ["name" => "Cinema 2", "location" => "3rd Floor Room 2", "image" => "cinema_2.png"],
        "cinema3" => ["name" => "Cinema 3", "location" => "3rd Floor Room 3", "image" => "cinema_3.jpg"],
        "cinema4" => ["name" => "Cinema 4", "location" => "3rd Floor Room 4", "image" => "cinema_4.jpg"],
        "cinema5" => ["name" => "Cinema 5", "location" => "3rd Floor Room 5", "image" => "cinema_5.jpg"]
    ];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cinema Selection</title>
    <link rel="stylesheet" href="../assets/css/cinema_selection.css">
</head>
<body>
    <header>
        <div class="logo">
            <h1>NoirÉclipse</h1>
        </div>
    </header>

    <h1 id="select-cinema">Select A Cinema</h1>

    <div class="cinema-wrapper">
        <div class="cinema-container">
            <div class="vertical-scroll">
                <?php foreach ($cinemas as $table => $cinema) { ?>
                    <div class="container">
                        <div class="left-side">
                            <img src="../assets/images/cinemas/<?php echo $cinema['image']; ?>" alt="<?php echo $cinema['name']; ?>">
                        </div>
                        <div class="right-side">
                            <h2><?php echo $cinema['name']; ?></h2> 
                            <h3><?php echo $cinema['location']; ?></h3>
                            <div class="confirm-btn">
                                <a href="<?php echo $table; ?>.php?cinema=<?php echo $table; ?>">Select</a>
                            </div>
                        </div>
                    </div>
                <?php } ?>
            </div>
        </div>

        <div class="scroll-btn-container">
            <button id="scroll-up" class="scroll-btn">▲</button>
            <button id="scroll-down" class="scroll-btn">▼</button>
        </div>
    </div>

    <script src="../assets/js/cinema_selection.js"></script>
</body>
</html>
