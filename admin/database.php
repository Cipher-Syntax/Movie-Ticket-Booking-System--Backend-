<?php 
    session_start();

    include("../includes/connection.php"); 
    include("../includes/allFunction.php");

    $user_data = check_login($conn);


    $createTableQueryCinema1 = "
        CREATE TABLE IF NOT EXISTS cinema1 (
            id INT AUTO_INCREMENT PRIMARY KEY,
            image VARCHAR(255) NOT NULL,
            title VARCHAR(255) NOT NULL,
            genre VARCHAR(100) NOT NULL,
            duration VARCHAR(50) NOT NULL,
            synopsis TEXT NOT NULL,
            casts TEXT NOT NULL,
            rating VARCHAR(10) NOT NULL,
            status VARCHAR(20) NOT NULL
        );
    ";

    $createTableQueryCinema2 = "
        CREATE TABLE IF NOT EXISTS cinema2 (
            id INT AUTO_INCREMENT PRIMARY KEY,
            image VARCHAR(255) NOT NULL,
            title VARCHAR(255) NOT NULL,
            genre VARCHAR(100) NOT NULL,
            duration VARCHAR(50) NOT NULL,
            synopsis TEXT NOT NULL,
            casts TEXT NOT NULL,
            rating VARCHAR(10) NOT NULL,
            status VARCHAR(20) NOT NULL
        );
    ";

    $createTableQueryCinema3 = "
        CREATE TABLE IF NOT EXISTS cinema3 (
            id INT AUTO_INCREMENT PRIMARY KEY,
            image VARCHAR(255) NOT NULL,
            title VARCHAR(255) NOT NULL,
            genre VARCHAR(100) NOT NULL,
            duration VARCHAR(50) NOT NULL,
            synopsis TEXT NOT NULL,
            casts TEXT NOT NULL,
            rating VARCHAR(10) NOT NULL,
            status VARCHAR(20) NOT NULL
        );
    ";

    $createTableQueryCinema4 = "
        CREATE TABLE IF NOT EXISTS cinema4 (
            id INT AUTO_INCREMENT PRIMARY KEY,
            image VARCHAR(255) NOT NULL,
            title VARCHAR(255) NOT NULL,
            genre VARCHAR(100) NOT NULL,
            duration VARCHAR(50) NOT NULL,
            synopsis TEXT NOT NULL,
            casts TEXT NOT NULL,
            rating VARCHAR(10) NOT NULL,
            status VARCHAR(20) NOT NULL
        );
    ";

    $createTableQueryCinema5 = "
        CREATE TABLE IF NOT EXISTS cinema5 (
            id INT AUTO_INCREMENT PRIMARY KEY,
            image VARCHAR(255) NOT NULL,
            title VARCHAR(255) NOT NULL,
            genre VARCHAR(100) NOT NULL,
            duration VARCHAR(50) NOT NULL,
            synopsis TEXT NOT NULL,
            casts TEXT NOT NULL,
            rating VARCHAR(10) NOT NULL,
            status VARCHAR(20) NOT NULL
        );
    ";
    mysqli_query($conn, $createTableQueryCinema1);
    mysqli_query($conn, $createTableQueryCinema2);
    mysqli_query($conn, $createTableQueryCinema3);
    mysqli_query($conn, $createTableQueryCinema4);
    mysqli_query($conn, $createTableQueryCinema5);



    // CINEMA 1
    $cinemaOneInsertQuery = "INSERT INTO cinema1 (image, title, genre, duration, synopsis, casts, rating, status)
        VALUES

        -- NOW SHOWING
        ('../assets/images/movie_posters/G_PrideAndPrejudice.png','Pride And Prejudice','Romance, Drama','127 minutes','Set in early 19th-century England, the independent and witty Elizabeth Bennet navigates issues of class, marriage, and societal expectations. When she meets tproud and wealthy Mr. Darcy, their initial misunderstandings and prejudices threaten to keep them apart—until they realize their true feelings for each other.','Joe Wright, Deborah Moggach (screenplay), Jane Austen (novel), Tim Bevan, Eric Fellner, Paul Webster','../assets/images/ratings/rating_4_6.png','Now Showing'),

        ('../assets/images/movie_posters/PG_500DaysOfSummer.png','500 Days of Summer','Romance, Comedy, Drama','95 minutes','Tom Hansen, a hopeless romantic, falls deeply in love with Summer Finn, a free-spirited woman who doesnt believe in love. As their relationship unfolds innonlinear fashion, Tom reflects on their 500 days together, trying to understand where things went wrong and what love truly means.','Marc Webb, Scott Neustadter, Michael H. Weber, Mark Waters, Jessica Tuchinsky, Mason Novick, Steven J. Wolfe, Joseph Gordon-Levitt as Tom Hansen, Zooey Deschanas Summer Finn, Geoffrey Arend as McKenzie, Chloë Grace Moretz as Rachel Hansen, Matthew Gray Gubler as Paul','../assets/images/ratings/rating_4_5.png','Now Showing'),

        ('../assets/images/movie_posters/PG_AboutTime.png','About Time','Romance, Comedy, Drama, Fantasy','123 minutes','When Tim Lake turns 21, he discovers that the men in his family have the ability to travel through time. Using this gift, he tries to improve his life and wthe heart of Mary, the woman he loves. However, as he alters moments in time, he learns that some things—especially love and family—are beyond his control.','Domhnall Gleeson as Tim Lake, Rachel McAdams as Mary, Bill Nighy as James Lake, Lydia Wilson as Kit Kat, Tom Hollander as Harry','../assets/images/ratings/rating_4_8.png','Now Showing'),

        ('../assets/images/movie_posters/PG_AlwaysBeMyMaybe.png','Always Be My Maybe','Romantic Comedy','102 minutes','Childhood friends Sasha Tran and Marcus Kim lose touch after a teenage fling ends badly. Sixteen years later, Sasha, now a celebrity chef, returns to SFrancisco to open a new restaurant and unexpectedly reconnects with Marcus, a local musician still living at home. As old sparks reignite, they must navigate tdifferences in their lifestyles to see if they can make their relationship work this time around.','Ali Wong as Sasha Tran, Randall Park as Marcus Kim, James Saito as Harry Kim, Michelle Buteau as Veronica, Keanu Reeves as Himself','../assets/images/ratings/rating_4_3.png','Now Showing'),
        
        ('../assets/images/movie_posters/PG_AQuietPlace.png','A Quiet Place','Horror, Sci-Fi, Thriller','90 minutes','In a post-apocalyptic world, a family is forced to live in silence to avoid blind creatures with an acute sense of hearing that hunt by sound. Communicatithrough sign language and careful movements, they strive to survive in this tense and silent existence.','Emily Blunt as Evelyn Abbott, John Krasinski as Lee Abbott, Millicent Simmonds as Regan Abbott, Noah Jupe as Marcus Abbott, Cade Woodward as Beau Abbott','../assets/images/ratings/rating_4_3.png','Now Showing'),

        ('../assets/images/movie_posters/PG_Arrival.png','Arrival','Science Fiction, Drama','116 minutes','A linguist is recruited by the military to communicate witalien lifeforms after twelve mysterious spacecraft appear around the world.','Amy Adams as Dr. Louise Banks, Jeremy Renner as Ian Donnelly, Forest Whitaker aColonel Weber, Michael Stuhlbarg as Agent Halpern','../assets/images/ratings/rating_4_4.png','Now Showing'),

        -- POPULAR MOVIES
        ('../assets/images/movie_posters/PG_Avatar.png', 'Avatar', 'Science, Fiction, Adventure', '162 minutes', 'In the 22nd century, paraplegic Marine Jake Sully is sent to the moon Pandora on a unique mission. He becomes torn between following his orders and protecting the world he feels is his home.', 'Sam Worthington as Jake Sully, Zoe Saldana as Neytiri, Sigourney Weaver as Dr. Grace Augustine, Stephen Lang as Colonel Miles Quaritch, Giovanni Ribisi as Parker Selfridge', '../assets/images/ratings/rating_4_6.png', 'Popular Movies'),

        ('../assets/images/movie_posters/PG_Avatar_TheWayOfWater.png', 'Avatar: The Way of Water', 'Science Fiction, Adventure', '192 minutes', 'Set more than a decade after the events of the first film, Jake Sully and Neytiri have formed a family on Pandora. When a familiar threat returns, they must work together with the Na`vi race to protect their home.', 'Sam Worthington as Jake Sully, Zoe Saldana as Neytiri, Sigourney Weaver as Kiri, Stephen Lang as Colonel Miles Quaritch, Kate Winslet as Ronal', '../assets/images/ratings/rating_4_3.png', 'Popular Movies'),

        ('../assets/images/movie_posters/PG_AWalkToRemember.png', 'A Walk To Remember', 'Romance, Drama', '101 minutes', 'Landon Carter, a rebellious high school senior, is forced to participate in community service after a prank goes wrong. There, he meets Jamie Sullivan, a kind and deeply religious girl. As their unexpected romance blooms, Landon discovers the true meaning of love, faith, and sacrifice, changing his life forever.', 'Mandy Moore as Jamie Sullivan, Shane West as Landon Carter, Peter Coyote as Reverend Sullivan, Daryl Hannah as Cynthia Carter', '../assets/images/ratings/rating_4_7.png', 'Popular Movies'),

        ('../assets/images/movie_posters/PG_CrazyRichAsians.png', 'Crazy Rich Asians', 'Romance, Comedy, Drama', '120 minutes', 'Rachel Chu, a Chinese-American professor, travels to Singapore with her boyfriend, Nick Young, only to discover that he comes from one of the wealthiest families in Asia. As she navigates the extravagant world of the elite, she faces disapproval from Nick`s powerful mother and learns what it truly means to be part of his world.', 'Constance Wu as Rachel Chu, Henry Golding as Nick Young, Michelle Yeoh as Eleanor Young, Gemma Chan as Astrid Leong, Awkwafina as Peik Lin Goh', '../assets/images/ratings/rating_4_5.png', 'Popular Movies'),

        ('../assets/images/movie_posters/PG_DearJohn.png', 'Dear John', 'Romance, Drama', '108 minutes', 'While on leave from the Army, John Tyree meets Savannah Curtis, a college student, and they quickly fall in love. Their relationship is tested when John is deployed overseas, and they maintain their bond through heartfelt letters. However, time and distance challenge their love in ways they never expected.', 'Channing Tatum as John Tyree, Amanda Seyfried as Savannah Curtis, Richard Jenkins as Mr. Tyree, Henry Thomas as Tim Wheddon, Scott Porter as Randy', '../assets/images/ratings/rating_4_0.png', 'Popular Movies'),

        ('../assets/images/movie_posters/PG_DoctorStrange.png', 'Doctor Strange', 'Fantasy, Action, Superhero', '115 minutes', 'After a career-ending accident, brilliant neurosurgeon Dr. Stephen Strange seeks healing in the mystical world of Kamar-Taj. Under the guidance of the Ancient One, he learns powerful magic and becomes the Sorcerer Supreme, defending Earth from dark forces beyond reality.', 'Benedict Cumberbatch as Dr. Stephen Strange, Tilda Swinton as The Ancient One, Chiwetel Ejiofor as Karl Mordo, Rachel McAdams as Christine Palmer, Mads Mikkelsen as Kaecilius, Benedict Wong as Wong', '../assets/images/ratings/rating_4_4.png', 'Popular Movies'),

        -- COMING SOON
        ('../assets/images/movie_posters/PG_DragMeToHell.png','Drag Me To Hell','Horror, Thriller','99 minutes','Ambitious loan officer Christine Brown denies an elderly woman an extension on her mortgage, aiming to impress her boss. In retaliation, the woman places a curse on Christine, subjecting her to three days of escalating supernatural torment before she is destined to be dragged to hell. Desperate, Christine seeks help to break the curse before her time runs out.','Alison Lohman as Christine Brown, Justin Long as Clay Dalton, Lorna Raver as Sylvia Ganush, Dileep Rao as Rham Jas, David Paymer as Mr. Jacks','../assets/images/ratings/rating_3_8.png','Coming Soon'),

        ('../assets/images/movie_posters/PG_Dune.png','Dune','Science Fiction, Adventure','155 minutes','Based on Frank Herbert`s seminal novel, Dune follows Paul Atreides, a young nobleman whose family assumes control of the desert planet Arrakis. As the sole source of the universe`s most valuable substance, spice, control of Arrakis is highly contested. Betrayal and political intrigue ensue, leading Paul on a journey that will determine the fate of his family and the planet.','Timothée Chalamet as Paul Atreides, Rebecca Ferguson as Lady Jessica, Oscar Isaac as Duke Leto Atreides, Zendaya as Chani, Jason Momoa as Duncan Idaho, Stellan Skarsgård as Baron Vladimir Harkonnen','../assets/images/ratings/rating_4_0.png','Coming Soon'),

        ('../assets/images/movie_posters/PG_DunePartTwo.png','Dune Part Two','Science Fiction, Adventure','180 minutes','Continuing the epic saga, Dune: Part Two delves deeper into Paul Atreides` journey as he allies with the Fremen to avenge his family and prevent a catastrophic future only he can foresee. The film explores themes of destiny, politics, and the human spirit`s resilience.','Timothée Chalamet as Paul Atreides, Zendaya as Chani, Rebecca Ferguson as Lady Jessica, Josh Brolin as Gurney Halleck, Austin Butler as Feyd-Rautha, Florence Pugh as Princess Irulan','../assets/images/ratings/rating_4_5.png','Coming Soon'),

        ('../assets/images/movie_posters/PG_DungeonsAndDragons_HonorAmongThieves.png','Dungeons & Dragons: Honor Among Thieves','Fantasy, Adventure, Action','134 minutes','A charming thief and his ragtag band of adventurers embark on a daring heist to retrieve a lost relic. However, their mission takes an unexpected turn when they face deadly enemies and uncover a dark conspiracy that threatens the entire world.','Chris Pine as Edgin Darvis, Michelle Rodriguez as Holga Kilgore, Regé-Jean Page as Xenk Yendar, Justice Smith as Simon Aumar, Sophia Lillis as Doric, Hugh Grant as Forge Fitzwilliam','../assets/images/ratings/rating_4_4.png','Coming Soon'),

        ('../assets/images/movie_posters/PG_EdgeOfTomorrow.png','Edge Of Tomorrow','Science Fiction, Action','113 minutes','In the near future, Major William Cage, an untrained soldier, is thrown into a time loop during humanity`s war against an invading alien race. He repeatedly fights and dies, becoming more skilled with each iteration. With the help of Sergeant Rita Vrataski, he seeks to use his unique situation to end the war.','Tom Cruise as Major William Cage, Emily Blunt as Sergeant Rita Vrataski, Bill Paxton as Master Sergeant Farell, Brendan Gleeson as General Brigham','../assets/images/ratings/rating_4_7.png','Coming Soon'),

        ('../assets/images/movie_posters/PG_EverythingEverywhereAllAtOnce.png','Everything Everywhere All at Once','Absurdist Comedy-Drama, Science Fiction','139 minutes','Evelyn Quan Wang, a Chinese-American immigrant, discovers that she must connect with parallel universe versions of herself to prevent a powerful being from destroying the multiverse.','Michelle Yeoh as Evelyn Quan Wang, Stephanie Hsu as Joy Wang, Ke Huy Quan as Waymond Wang, James Hong as Gong Gong, Jamie Lee Curtis as Deirdre Beaubeirdre','../assets/images/ratings/rating_3_9.png','Coming Soon'),

        ('../assets/images/movie_posters/PG_ExMachina.png','Ex Machina','Science Fiction, Thriller','108 minutes','A young programmer is selected to participate in a groundbreaking experiment in synthetic intelligence by evaluating the human qualities of a highly advanced humanoid A.I.','Domhnall Gleeson as Caleb Smith, Alicia Vikander as Ava, Oscar Isaac as Nathan Bateman, Sonoya Mizuno as Kyoko','../assets/images/ratings/rating_3_9.png','Coming Soon'),

        ('../assets/images/movie_posters/PG_Gravity.png','Gravity','Science Fiction, Thriller','91 minutes','Two astronauts work together to survive after an accident leaves them stranded in space.','Sandra Bullock as Dr. Ryan Stone, George Clooney as Matt Kowalski','../assets/images/ratings/rating_3_9.png','Coming Soon'),

        ('../assets/images/movie_posters/PG_HarryPotterAndTheDeathlyHallows_Part1.png','Harry Potter and the Deathly Hallows: Part 1','Fantasy, Adventure, Family','146 minutes','Harry, Ron, and Hermione set out on a dangerous mission to find and destroy Voldemort`s Horcruxes. As they evade the Death Eaters and uncover hidden secrets, their friendship is tested like never before. With Hogwarts no longer safe, the battle for the wizarding world looms closer.','Daniel Radcliffe as Harry Potter, Rupert Grint as Ron Weasley, Emma Watson as Hermione Granger, Ralph Fiennes as Lord Voldemort, Helena Bonham Carter as Bellatrix Lestrange, Alan Rickman as Severus Snape, Bill Nighy as Rufus Scrimgeour','../assets/images/ratings/rating_4_8.png','Coming Soon'),

        ('../assets/images/movie_posters/PG_HarryPotterAndTheDeathlyHollows_Part2.png','Harry Potter and the Deathly Hallows: Part 2','Fantasy, Adventure, Family','130 minutes','The final battle between good and evil erupts at Hogwarts as Harry Potter faces Lord Voldemort in an epic showdown. With the fate of the wizarding world at stake, Harry must make the ultimate sacrifice to end Voldemort`s reign once and for all.','Daniel Radcliffe as Harry Potter, Rupert Grint as Ron Weasley, Emma Watson as Hermione Granger, Ralph Fiennes as Lord Voldemort, Helena Bonham Carter as Bellatrix Lestrange, Alan Rickman as Severus Snape, Maggie Smith as Minerva McGonagall','../assets/images/ratings/rating_4_8.png','Coming Soon');



    ";

    if (mysqli_query($conn, $cinemaOneInsertQuery)) {
        echo "Movies inserted successfully!";
    } 
    else {
        die("Error inserting data: " . mysqli_error($conn));
    }
    
?>
