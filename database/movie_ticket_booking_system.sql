CREATE DATABASE movie_ticket_booking_system;
USE movie_ticket_booking_system;

CREATE TABLE users (
    id INT(11)PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    user_email VARCHAR(250) UNIQUE,
    user_password VARCHAR(250),
    user_profile VARCHAR(999)
);

CREATE TABLE admin (
    id INT(11)PRIMARY KEY AUTO_INCREMENT,
    admin_email VARCHAR(250) UNIQUE,
    admin_password VARCHAR(250)
);

CREATE TABLE cinemas (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    cinema_number INT(11) NOT NULL,
    location VARCHAR(999),
    cinema_image VARCHAR(999)
);

CREATE TABLE movies (
    id INT(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    image VARCHAR(999),
    title VARCHAR(999),
    genre VARCHAR(999),
    duration VARCHAR(999),
    synopsis VARCHAR(999),
    casts VARCHAR(999),
    rating VARCHAR(999),
    status ENUM('Now Showing', 'Popular Movies', 'Coming Soon'),
    cinema_number INT
);

CREATE TABLE movie_schedules (
    id INT(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    movie_id INT(11) NOT NULL,
    cinema_number INT(11) NOT NULL,
    show_time TIME NOT NULL,
    show_date DATE NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES movies(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE bookings (
    id int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
    movie_id int(11),
    user_id int(11),
    cinema_table varchar(50),
    seats varchar(255) NULL,
    price_per_ticket decimal(10,2),
    tickets int(11),
    total_price decimal(10,2),
    booking_date datetime DEFAULT current_timestamp(),
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE ON UPDATE CASCADE
);

-- For Cinema 1
INSERT INTO movie_schedules (movie_id, cinema_number, show_time, show_date) 
SELECT id, cinema_number, '09:00:00', '2025-05-01' FROM movies WHERE cinema_number = 1;

INSERT INTO movie_schedules (movie_id, cinema_number, show_time, show_date) 
SELECT id, cinema_number, '13:00:00', '2025-05-02' FROM movies WHERE cinema_number = 1;

INSERT INTO movie_schedules (movie_id, cinema_number, show_time, show_date) 
SELECT id, cinema_number, '16:00:00', '2025-05-03' FROM movies WHERE cinema_number = 1;

INSERT INTO movie_schedules (movie_id, cinema_number, show_time, show_date) 
SELECT id, cinema_number, '19:00:00', '2025-05-04' FROM movies WHERE cinema_number = 1;

INSERT INTO movie_schedules (movie_id, cinema_number, show_time, show_date) 
SELECT id, cinema_number, '22:00:00', '2025-05-05' FROM movies WHERE cinema_number = 1;

-- For Cinema 2
INSERT INTO movie_schedules (movie_id, cinema_number, show_time, show_date) 
SELECT id, cinema_number, '09:00:00', '2025-05-01' FROM movies WHERE cinema_number = 2;

INSERT INTO movie_schedules (movie_id, cinema_number, show_time, show_date) 
SELECT id, cinema_number, '13:00:00', '2025-05-02' FROM movies WHERE cinema_number = 2;

INSERT INTO movie_schedules (movie_id, cinema_number, show_time, show_date) 
SELECT id, cinema_number, '16:00:00', '2025-05-03' FROM movies WHERE cinema_number = 2;

INSERT INTO movie_schedules (movie_id, cinema_number, show_time, show_date) 
SELECT id, cinema_number, '19:00:00', '2025-05-04' FROM movies WHERE cinema_number = 2;

INSERT INTO movie_schedules (movie_id, cinema_number, show_time, show_date) 
SELECT id, cinema_number, '22:00:00', '2025-05-05' FROM movies WHERE cinema_number = 2;

-- For Cinema 3
INSERT INTO movie_schedules (movie_id, cinema_number, show_time, show_date) 
SELECT id, cinema_number, '09:00:00', '2025-05-01' FROM movies WHERE cinema_number = 3;

INSERT INTO movie_schedules (movie_id, cinema_number, show_time, show_date) 
SELECT id, cinema_number, '13:00:00', '2025-05-02' FROM movies WHERE cinema_number = 3;

INSERT INTO movie_schedules (movie_id, cinema_number, show_time, show_date) 
SELECT id, cinema_number, '16:00:00', '2025-05-03' FROM movies WHERE cinema_number = 3;

INSERT INTO movie_schedules (movie_id, cinema_number, show_time, show_date) 
SELECT id, cinema_number, '19:00:00', '2025-05-04' FROM movies WHERE cinema_number = 3;

INSERT INTO movie_schedules (movie_id, cinema_number, show_time, show_date) 
SELECT id, cinema_number, '22:00:00', '2025-05-05' FROM movies WHERE cinema_number = 3;

-- For Cinema 4
INSERT INTO movie_schedules (movie_id, cinema_number, show_time, show_date) 
SELECT id, cinema_number, '09:00:00', '2025-05-01' FROM movies WHERE cinema_number = 4;

INSERT INTO movie_schedules (movie_id, cinema_number, show_time, show_date) 
SELECT id, cinema_number, '13:00:00', '2025-05-02' FROM movies WHERE cinema_number = 4;

INSERT INTO movie_schedules (movie_id, cinema_number, show_time, show_date) 
SELECT id, cinema_number, '16:00:00', '2025-05-03' FROM movies WHERE cinema_number = 4;

INSERT INTO movie_schedules (movie_id, cinema_number, show_time, show_date) 
SELECT id, cinema_number, '19:00:00', '2025-05-04' FROM movies WHERE cinema_number = 4;

INSERT INTO movie_schedules (movie_id, cinema_number, show_time, show_date) 
SELECT id, cinema_number, '22:00:00', '2025-05-05' FROM movies WHERE cinema_number = 4;

-- For Cinema 5
INSERT INTO movie_schedules (movie_id, cinema_number, show_time, show_date) 
SELECT id, cinema_number, '09:00:00', '2025-05-01' FROM movies WHERE cinema_number = 5;

INSERT INTO movie_schedules (movie_id, cinema_number, show_time, show_date) 
SELECT id, cinema_number, '13:00:00', '2025-05-02' FROM movies WHERE cinema_number = 5;

INSERT INTO movie_schedules (movie_id, cinema_number, show_time, show_date) 
SELECT id, cinema_number, '16:00:00', '2025-05-03' FROM movies WHERE cinema_number = 5;

INSERT INTO movie_schedules (movie_id, cinema_number, show_time, show_date) 
SELECT id, cinema_number, '19:00:00', '2025-05-04' FROM movies WHERE cinema_number = 5;

INSERT INTO movie_schedules (movie_id, cinema_number, show_time, show_date) 
SELECT id, cinema_number, '22:00:00', '2025-05-05' FROM movies WHERE cinema_number = 5;

INSERT INTO cinemas (cinema_name, location, cinema_image)
VALUES
("Cinema 1", "3rd Floor Room 1", "../assets/images/cinemas/cinema_1.png"),
("Cinema 2", "3rd Floor Room 2", "../assets/images/cinemas/cinema_2.png"),
("Cinema 3", "3rd Floor Room 3", "../assets/images/cinemas/cinema_3.png"),
("Cinema 4", "3rd Floor Room 4", "../assets/images/cinemas/cinema_4.png"),
("Cinema 5", "3rd Floor Room 5", "../assets/images/cinemas/cinema_5.png");

-- RESET ID in movies to 1
SET @new_id = 0;
UPDATE movies SET id = (@new_id := @new_id + 1) ORDER BY id;
