<?php
    session_start();

    include("../includes/connection.php");
    include("../includes/allFunction.php");
    
    
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>NoirÉclipse - Movie Ticket Booking</title>
    <link rel="stylesheet" href="../assets/css/landing_page.css">
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>

</head>
<body>
    <header>
        <div class="header-top">
            <h1 class="logo">NoirÉclipse</h1>
            <a href="../pages/signup.php" class="btn signup-btn">Sign In</a>
            <a href="#contact" class="contact">Contact Us</a>
            <a href="#about" class="about">About Us</a>
        </div>
        <hr>
        
        <div class="header-content">
            <h1>NoirÉclipse</h1>
            <p>" Immerse In The Magic Of Movies: NoirÉclipse Where Every Ticket Tells A Story "</p>
            <a href="#about" class="btn learn-more-btn"> Learn More...</a>
        </div>
    </header>
    
    <main>
        <div class="image-slider">
            
            <div class="mySlides fade">
                <img src="../assets/images/cinemas/cinema1.png" alt="Cinema 1">
            </div>
            
            <div class="mySlides fade">
                <img src="../assets/images/cinemas/cinema2.png" alt="Cinema 2">
            </div>
            
            <div class="mySlides fade">
                <img src="../assets/images/cinemas/cinema3.png" alt="Cinema 3">
            </div>
            
            <div class="mySlides fade">
                <img src="../assets/images/cinemas/cinema4.png" alt="Cinema 4">
            </div>
            
            <div class="mySlides fade">
                <img src="../assets/images/cinemas/cinema5.png" alt="Cinema 5">
            </div>
        </div>
        <div class="catchphrase">
            <p id="c1">" Your epic movie adventure starts here</p>
            <p id="c2"> Secure your tickets for the hottest new releases and special screenings!! "</p>
        </div>
    </main>
    
    <div class="hero-section">
        <div class="left-side">
            <pre>Immerse In The Magic Of Movies:
     NoirÉclipse Where Every Ticket Tells A Story
            </pre>
            <a href="/databaseSample/signup.php" class="btn hero-signup-btn">Get Started</a>
        </div>
        <div class="display-container">
            <img src="../assets/images/others/login.png" alt="Login Image">
        </div>
    </div>

    <!-- Contact Section -->
    <section id="contact">
        <div class="contact-container">
            <div class="contact-info">
                <h3>Contact Us</h3>
                <div class="info-item">
                    <i class='bx bx-map info-icon'></i>
                    <div class="info-text">
                        <h4>Location</h4>
                        <p>Zamboanga Del Sur Zamboanga City</p>
                    </div>
                </div>
                <div class="info-item">
                    <i class='bx bx-phone info-icon'></i>
                    <div class="info-text">
                        <h4>Phone</h4>
                        <p>+63-1234-567-8910</p>
                    </div>
                </div>
                <div class="info-item">
                    <i class='bx bx-envelope info-icon'></i>
                    <div class="info-text">
                        <h4>Email</h4>
                        <p>noiréclipse@gmail.com</p>
                    </div>
                </div>
                <div class="info-item">
                    <i class='bx bx-time info-icon'></i>
                    <div class="info-text">
                        <h4>Opening Hours</h4>
                        <p>Monday - Sunday</p>
                    </div>
                </div>
            </div>
            <div class="contact-form">
                <form>
                    <div class="form-group">
                        <input type="text" class="forms" placeholder="Your Name" required>
                    </div>
                    <div class="form-group">
                        <input type="email" class="forms" placeholder="Your Email" required>
                    </div>
                    <div class="form-group">
                        <textarea class="forms" rows="5" placeholder="Your Message" required></textarea>
                    </div>
                    <button type="submit" class="btn">Send Message</button>
                </form>
            </div>
        </div>
    </section>
    
    <!-- Footer -->
    <footer>
        <div class="footer-content">
            <div class="footer-logo">
                <h2>NoirÉclipse</h2>
                <p>Immerse in the magic of movies where every ticket tells a story.</p>
                <div class="social-links">
                    <a href="#" class="social-link"><i class='bx bxl-facebook'></i></a>
                    <a href="#" class="social-link"><i class='bx bxl-twitter'></i></a>
                    <a href="#" class="social-link"><i class='bx bxl-instagram'></i></a>
                    <a href="#" class="social-link"><i class='bx bxl-youtube'></i></a>
                </div>
            </div>
            <div class="footer-links">
                <h4>Movie Links</h4>
                <ul>
                    <li><a href="#">Now Showing</a></li>
                    <li><a href="#">Popular Movies</a></li>
                    <li><a href="#">Coming Soon</a></li>
                </ul>
            </div>
            <div class="footer-links">
                <h4>Support</h4>
                <ul>
                    <li><a href="../pages/faq.php">FAQs</a></li>
                    <li><a href="#">Contact Us</a></li>
                </ul>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2025 NoirÉclipse. All Rights Reserved.</p>
        </div>
    </footer>
    
    <script src="../assets/js/landing_page.js"></script>
</body>
</html>