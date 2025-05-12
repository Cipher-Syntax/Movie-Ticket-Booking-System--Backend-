-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 08, 2025 at 02:40 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mbts`
--


-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `admin_email` varchar(250) DEFAULT NULL,
  `admin_password` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `admin_email`, `admin_password`) VALUES
(1, 'admin123@gmail.com', '$2y$10$gdqm7/O.h0P53dQht12UDO7/.nL7fCLPwzY6.mX5mB8T.7fryJPwG');

-- --------------------------------------------------------

--
-- Table structure for table `backup_table`
--

CREATE TABLE `backup_table` (
  `id` int(11) NOT NULL DEFAULT 0,
  `image` varchar(999) DEFAULT NULL,
  `title` varchar(999) DEFAULT NULL,
  `genre` varchar(999) DEFAULT NULL,
  `duration` varchar(999) DEFAULT NULL,
  `synopsis` varchar(999) DEFAULT NULL,
  `casts` varchar(999) DEFAULT NULL,
  `rating` varchar(999) DEFAULT NULL,
  `status` enum('Now Showing','Popular Movies','Coming Soon') DEFAULT NULL,
  `cinema_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `backup_table`
--

INSERT INTO `backup_table` (`id`, `image`, `title`, `genre`, `duration`, `synopsis`, `casts`, `rating`, `status`, `cinema_number`) VALUES
(1, '../assets/images/movie_posters/G_PrideAndPrejudice.png', 'Pride And Prejudice', 'Romance, Drama', '127 minutes', 'Set in early 19th-century England, the independent and witty Elizabeth Bennet navigates issues of class, marriage, and societal expectations. When she meets tproud and wealthy Mr. Darcy, their initial misunderstandings and prejudices threaten to keep them apart—until they realize their true feelings for each other.', 'Joe Wright, Deborah Moggach (screenplay), Jane Austen (novel), Tim Bevan, Eric Fellner, Paul Webster', '../assets/images/ratings/rating_4_6.png', 'Now Showing', 1),
(2, '../assets/images/movie_posters/PG_500DaysOfSummer.png', '500 Days of Summer', 'Romance, Comedy, Drama', '95 minutes', 'Tom Hansen, a hopeless romantic, falls deeply in love with Summer Finn, a free-spirited woman who doesnt believe in love. As their relationship unfolds innonlinear fashion, Tom reflects on their 500 days together, trying to understand where things went wrong and what love truly means.', 'Marc Webb, Scott Neustadter, Michael H. Weber, Mark Waters, Jessica Tuchinsky, Mason Novick, Steven J. Wolfe, Joseph Gordon-Levitt as Tom Hansen, Zooey Deschanas Summer Finn, Geoffrey Arend as McKenzie, Chloë Grace Moretz as Rachel Hansen, Matthew Gray Gubler as Paul', '../assets/images/ratings/rating_4_5.png', 'Now Showing', 1),
(3, '../assets/images/movie_posters/PG_AboutTime.png', 'About Time', 'Romance, Comedy, Drama, Fantasy', '123 minutes', 'When Tim Lake turns 21, he discovers that the men in his family have the ability to travel through time. Using this gift, he tries to improve his life and wthe heart of Mary, the woman he loves. However, as he alters moments in time, he learns that some things—especially love and family—are beyond his control.', 'Domhnall Gleeson as Tim Lake, Rachel McAdams as Mary, Bill Nighy as James Lake, Lydia Wilson as Kit Kat, Tom Hollander as Harry', '../assets/images/ratings/rating_4_8.png', 'Now Showing', 1),
(4, '../assets/images/movie_posters/PG_AlwaysBeMyMaybe.png', 'Always Be My Maybe', 'Romantic Comedy', '102 minutes', 'Childhood friends Sasha Tran and Marcus Kim lose touch after a teenage fling ends badly. Sixteen years later, Sasha, now a celebrity chef, returns to SFrancisco to open a new restaurant and unexpectedly reconnects with Marcus, a local musician still living at home. As old sparks reignite, they must navigate tdifferences in their lifestyles to see if they can make their relationship work this time around.', 'Ali Wong as Sasha Tran, Randall Park as Marcus Kim, James Saito as Harry Kim, Michelle Buteau as Veronica, Keanu Reeves as Himself', '../assets/images/ratings/rating_4_3.png', 'Now Showing', 1),
(5, '../assets/images/movie_posters/PG_AQuietPlace.png', 'A Quiet Place', 'Horror, Sci-Fi, Thriller', '90 minutes', 'In a post-apocalyptic world, a family is forced to live in silence to avoid blind creatures with an acute sense of hearing that hunt by sound. Communicatithrough sign language and careful movements, they strive to survive in this tense and silent existence.', 'Emily Blunt as Evelyn Abbott, John Krasinski as Lee Abbott, Millicent Simmonds as Regan Abbott, Noah Jupe as Marcus Abbott, Cade Woodward as Beau Abbott', '../assets/images/ratings/rating_4_3.png', 'Now Showing', 1),
(6, '../assets/images/movie_posters/PG_Arrival.png', 'Arrival', 'Science Fiction, Drama', '116 minutes', 'A linguist is recruited by the military to communicate witalien lifeforms after twelve mysterious spacecraft appear around the world.', 'Amy Adams as Dr. Louise Banks, Jeremy Renner as Ian Donnelly, Forest Whitaker aColonel Weber, Michael Stuhlbarg as Agent Halpern', '../assets/images/ratings/rating_4_4.png', 'Now Showing', 1),
(7, '../assets/images/movie_posters/PG_Avatar.png', 'Avatar', 'Science, Fiction, Adventure', '162 minutes', 'In the 22nd century, paraplegic Marine Jake Sully is sent to the moon Pandora on a unique mission. He becomes torn between following his orders and protecting the world he feels is his home.', 'Sam Worthington as Jake Sully, Zoe Saldana as Neytiri, Sigourney Weaver as Dr. Grace Augustine, Stephen Lang as Colonel Miles Quaritch, Giovanni Ribisi as Parker Selfridge', '../assets/images/ratings/rating_4_6.png', 'Popular Movies', 1),
(8, '../assets/images/movie_posters/PG_Avatar_TheWayOfWater.png', 'Avatar: The Way of Water', 'Science Fiction, Adventure', '192 minutes', 'Set more than a decade after the events of the first film, Jake Sully and Neytiri have formed a family on Pandora. When a familiar threat returns, they must work together with the Na`vi race to protect their home.', 'Sam Worthington as Jake Sully, Zoe Saldana as Neytiri, Sigourney Weaver as Kiri, Stephen Lang as Colonel Miles Quaritch, Kate Winslet as Ronal', '../assets/images/ratings/rating_4_3.png', 'Popular Movies', 1),
(9, '../assets/images/movie_posters/PG_AWalkToRemember.png', 'A Walk To Remember', 'Romance, Drama', '101 minutes', 'Landon Carter, a rebellious high school senior, is forced to participate in community service after a prank goes wrong. There, he meets Jamie Sullivan, a kind and deeply religious girl. As their unexpected romance blooms, Landon discovers the true meaning of love, faith, and sacrifice, changing his life forever.', 'Mandy Moore as Jamie Sullivan, Shane West as Landon Carter, Peter Coyote as Reverend Sullivan, Daryl Hannah as Cynthia Carter', '../assets/images/ratings/rating_4_7.png', 'Popular Movies', 1),
(10, '../assets/images/movie_posters/PG_CrazyRichAsians.png', 'Crazy Rich Asians', 'Romance, Comedy, Drama', '120 minutes', 'Rachel Chu, a Chinese-American professor, travels to Singapore with her boyfriend, Nick Young, only to discover that he comes from one of the wealthiest families in Asia. As she navigates the extravagant world of the elite, she faces disapproval from Nick`s powerful mother and learns what it truly means to be part of his world.', 'Constance Wu as Rachel Chu, Henry Golding as Nick Young, Michelle Yeoh as Eleanor Young, Gemma Chan as Astrid Leong, Awkwafina as Peik Lin Goh', '../assets/images/ratings/rating_4_5.png', 'Popular Movies', 1),
(11, '../assets/images/movie_posters/PG_DearJohn.png', 'Dear John', 'Romance, Drama', '108 minutes', 'While on leave from the Army, John Tyree meets Savannah Curtis, a college student, and they quickly fall in love. Their relationship is tested when John is deployed overseas, and they maintain their bond through heartfelt letters. However, time and distance challenge their love in ways they never expected.', 'Channing Tatum as John Tyree, Amanda Seyfried as Savannah Curtis, Richard Jenkins as Mr. Tyree, Henry Thomas as Tim Wheddon, Scott Porter as Randy', '../assets/images/ratings/rating_4_0.png', 'Popular Movies', 1),
(12, '../assets/images/movie_posters/PG_DoctorStrange.png', 'Doctor Strange', 'Fantasy, Action, Superhero', '115 minutes', 'After a career-ending accident, brilliant neurosurgeon Dr. Stephen Strange seeks healing in the mystical world of Kamar-Taj. Under the guidance of the Ancient One, he learns powerful magic and becomes the Sorcerer Supreme, defending Earth from dark forces beyond reality.', 'Benedict Cumberbatch as Dr. Stephen Strange, Tilda Swinton as The Ancient One, Chiwetel Ejiofor as Karl Mordo, Rachel McAdams as Christine Palmer, Mads Mikkelsen as Kaecilius, Benedict Wong as Wong', '../assets/images/ratings/rating_4_4.png', 'Popular Movies', 1),
(13, '../assets/images/movie_posters/PG_DragMeToHell.png', 'Drag Me To Hell', 'Horror, Thriller', '99 minutes', 'Ambitious loan officer Christine Brown denies an elderly woman an extension on her mortgage, aiming to impress her boss. In retaliation, the woman places a curse on Christine, subjecting her to three days of escalating supernatural torment before she is destined to be dragged to hell. Desperate, Christine seeks help to break the curse before her time runs out.', 'Alison Lohman as Christine Brown, Justin Long as Clay Dalton, Lorna Raver as Sylvia Ganush, Dileep Rao as Rham Jas, David Paymer as Mr. Jacks', '../assets/images/ratings/rating_3_8.png', 'Coming Soon', 1),
(14, '../assets/images/movie_posters/PG_Dune.png', 'Dune', 'Science Fiction, Adventure', '155 minutes', 'Based on Frank Herbert`s seminal novel, Dune follows Paul Atreides, a young nobleman whose family assumes control of the desert planet Arrakis. As the sole source of the universe`s most valuable substance, spice, control of Arrakis is highly contested. Betrayal and political intrigue ensue, leading Paul on a journey that will determine the fate of his family and the planet.', 'Timothée Chalamet as Paul Atreides, Rebecca Ferguson as Lady Jessica, Oscar Isaac as Duke Leto Atreides, Zendaya as Chani, Jason Momoa as Duncan Idaho, Stellan Skarsgård as Baron Vladimir Harkonnen', '../assets/images/ratings/rating_4_0.png', 'Coming Soon', 1),
(15, '../assets/images/movie_posters/PG_DunePartTwo.png', 'Dune Part Two', 'Science Fiction, Adventure', '180 minutes', 'Continuing the epic saga, Dune: Part Two delves deeper into Paul Atreides` journey as he allies with the Fremen to avenge his family and prevent a catastrophic future only he can foresee. The film explores themes of destiny, politics, and the human spirit`s resilience.', 'Timothée Chalamet as Paul Atreides, Zendaya as Chani, Rebecca Ferguson as Lady Jessica, Josh Brolin as Gurney Halleck, Austin Butler as Feyd-Rautha, Florence Pugh as Princess Irulan', '../assets/images/ratings/rating_4_5.png', 'Coming Soon', 1),
(16, '../assets/images/movie_posters/PG_DungeonsAndDragons_HonorAmongThieves.png', 'Dungeons & Dragons: Honor Among Thieves', 'Fantasy, Adventure, Action', '134 minutes', 'A charming thief and his ragtag band of adventurers embark on a daring heist to retrieve a lost relic. However, their mission takes an unexpected turn when they face deadly enemies and uncover a dark conspiracy that threatens the entire world.', 'Chris Pine as Edgin Darvis, Michelle Rodriguez as Holga Kilgore, Regé-Jean Page as Xenk Yendar, Justice Smith as Simon Aumar, Sophia Lillis as Doric, Hugh Grant as Forge Fitzwilliam', '../assets/images/ratings/rating_4_4.png', 'Coming Soon', 1),
(17, '../assets/images/movie_posters/PG_EdgeOfTomorrow.png', 'Edge Of Tomorrow', 'Science Fiction, Action', '113 minutes', 'In the near future, Major William Cage, an untrained soldier, is thrown into a time loop during humanity`s war against an invading alien race. He repeatedly fights and dies, becoming more skilled with each iteration. With the help of Sergeant Rita Vrataski, he seeks to use his unique situation to end the war.', 'Tom Cruise as Major William Cage, Emily Blunt as Sergeant Rita Vrataski, Bill Paxton as Master Sergeant Farell, Brendan Gleeson as General Brigham', '../assets/images/ratings/rating_4_7.png', 'Coming Soon', 1),
(18, '../assets/images/movie_posters/PG_EverythingEverywhereAllAtOnce.png', 'Everything Everywhere All at Once', 'Absurdist Comedy-Drama, Science Fiction', '139 minutes', 'Evelyn Quan Wang, a Chinese-American immigrant, discovers that she must connect with parallel universe versions of herself to prevent a powerful being from destroying the multiverse.', 'Michelle Yeoh as Evelyn Quan Wang, Stephanie Hsu as Joy Wang, Ke Huy Quan as Waymond Wang, James Hong as Gong Gong, Jamie Lee Curtis as Deirdre Beaubeirdre', '../assets/images/ratings/rating_3_9.png', 'Coming Soon', 1),
(19, '../assets/images/movie_posters/PG_ExMachina.png', 'Ex Machina', 'Science Fiction, Thriller', '108 minutes', 'A young programmer is selected to participate in a groundbreaking experiment in synthetic intelligence by evaluating the human qualities of a highly advanced humanoid A.I.', 'Domhnall Gleeson as Caleb Smith, Alicia Vikander as Ava, Oscar Isaac as Nathan Bateman, Sonoya Mizuno as Kyoko', '../assets/images/ratings/rating_3_9.png', 'Coming Soon', 1),
(20, '../assets/images/movie_posters/PG_Gravity.png', 'Gravity', 'Science Fiction, Thriller', '91 minutes', 'Two astronauts work together to survive after an accident leaves them stranded in space.', 'Sandra Bullock as Dr. Ryan Stone, George Clooney as Matt Kowalski', '../assets/images/ratings/rating_3_9.png', 'Coming Soon', 1),
(21, '../assets/images/movie_posters/PG_HarryPotterAndTheDeathlyHallows_Part1.png', 'Harry Potter and the Deathly Hallows: Part 1', 'Fantasy, Adventure, Family', '146 minutes', 'Harry, Ron, and Hermione set out on a dangerous mission to find and destroy Voldemort`s Horcruxes. As they evade the Death Eaters and uncover hidden secrets, their friendship is tested like never before. With Hogwarts no longer safe, the battle for the wizarding world looms closer.', 'Daniel Radcliffe as Harry Potter, Rupert Grint as Ron Weasley, Emma Watson as Hermione Granger, Ralph Fiennes as Lord Voldemort, Helena Bonham Carter as Bellatrix Lestrange, Alan Rickman as Severus Snape, Bill Nighy as Rufus Scrimgeour', '../assets/images/ratings/rating_4_8.png', 'Coming Soon', 1),
(22, '../assets/images/movie_posters/PG_HarryPotterAndTheDeathlyHollows_Part2.png', 'Harry Potter and the Deathly Hallows: Part 2', 'Fantasy, Adventure, Family', '130 minutes', 'The final battle between good and evil erupts at Hogwarts as Harry Potter faces Lord Voldemort in an epic showdown. With the fate of the wizarding world at stake, Harry must make the ultimate sacrifice to end Voldemort`s reign once and for all.', 'Daniel Radcliffe as Harry Potter, Rupert Grint as Ron Weasley, Emma Watson as Hermione Granger, Ralph Fiennes as Lord Voldemort, Helena Bonham Carter as Bellatrix Lestrange, Alan Rickman as Severus Snape, Maggie Smith as Minerva McGonagall', '../assets/images/ratings/rating_4_8.png', 'Coming Soon', 1),
(23, '../assets/images/movie_posters/PG_HarryPotterAndTheGobletOfFire.png', 'Harry Potter and the Goblet of Fire', 'Fantasy, Adventure, Family', '157 minutes', 'Harry unexpectedly becomes a competitor in the dangerous Triwizard Tournament, where he faces deadly challenges alongside wizards from other schools. As Voldemort’s return looms closer, Harry must survive the tournament and prepare for the battle ahead.', 'Daniel Radcliffe as Harry Potter, Rupert Grint as Ron Weasley, Emma Watson as Hermione Granger, Ralph Fiennes as Lord Voldemort, Brendan Gleeson as Alastor Mad-Eye Moody, Robert Pattinson as Cedric Diggory, Stanislav Yanevski as Viktor Krum', '../assets/images/ratings/rating_4_7.png', 'Now Showing', 2),
(24, '../assets/images/movie_posters/PG_HarryPotterAndTheHalfBloofPrince.png', 'Harry Potter Half Blood', 'Fantasy, Adventure, Family', '153 minutes', 'As Voldemort tightens his grip on the wizarding and Muggle worlds, Harry Potter discovers an old Potions textbook belonging to the mysterious Half-Blood Prince. Meanwhile, Dumbledore guides Harry through memories of Tom Riddle’s past, preparing him for the ultimate battle ahead.', 'Daniel Radcliffe as Harry Potter, Rupert Grint as Ron Weasley, Emma Watson as Hermione Granger, Michael Gambon as Albus Dumbledore, Alan Rickman as Severus Snape, Tom Felton as Draco Malfoy, Jim Broadbent as Horace Slughorn', '../assets/images/ratings/rating_4_7.png', 'Now Showing', 2),
(25, '../assets/images/movie_posters/PG_HarryPotterAndTheOrderOfThePhoenix.png', 'Harry Potter And The', 'Fantasy, Adventure, Family', '138 minutes', 'As Voldemort’s return is denied by the Ministry of Magic, Harry and his friends form Dumbledore’s Army to secretly train in Defense Against the Dark Arts. Meanwhile, the oppressive Dolores Umbridge takes over Hogwarts, making Harry’s fifth year one of the most challenging yet.', 'Daniel Radcliffe as Harry Potter, Rupert Grint as Ron Weasley, Emma Watson as Hermione Granger, Imelda Staunton as Dolores Umbridge, Gary Oldman as Sirius Black, Helena Bonham Carter as Bellatrix Lestrange, Alan Rickman as Severus Snape', '../assets/images/ratings/rating_4_7.png', 'Now Showing', 2),
(26, '../assets/images/movie_posters/PG_HarryPotterAndThePhilosophersStone.png', 'Harry Potter And The', 'Fantasy, Adventure, Family', '152 minutes', 'On his 11th birthday, Harry Potter discovers he is a wizard and is invited to attend Hogwarts School of Witchcraft and Wizardry. As he learns magic and makes new friends, he uncovers the mystery of the Sorcerer’s Stone, which holds the key to immortality—and is being sought after by the dark wizard Voldemort.', 'Daniel Radcliffe as Harry Potter, Rupert Grint as Ron Weasley, Emma Watson as Hermione Granger, Richard Harris as Albus Dumbledore, Maggie Smith as Minerva McGonagall, Alan Rickman as Severus Snape, Robbie Coltrane as Rubeus Hagrid', '../assets/images/ratings/rating_4_8.png', 'Now Showing', 2),
(27, '../assets/images/movie_posters/PG_HarryPotterAndThePrisonerOfAzkaban.png', 'Harry Potter And The', 'Fantasy, Adventure, Family', '142 minutes', 'In his third year at Hogwarts, Harry learns that Sirius Black, a dangerous prisoner, has escaped from Azkaban and is believed to be hunting him. As he uncovers the truth about his parents’ past, Harry must confront Dementors, time travel, and shocking revelations about his own destiny.', 'Daniel Radcliffe as Harry Potter, Rupert Grint as Ron Weasley, Emma Watson as Hermione Granger, Gary Oldman as Sirius Black, Michael Gambon as Albus Dumbledore, Alan Rickman as Severus Snape, David Thewlis as Remus Lupin', '../assets/images/ratings/rating_4_8.png', 'Now Showing', 2),
(28, '../assets/images/movie_posters/PG_Inception.png', 'Inception', 'Science Fiction, Action, Thriller', '148 minutes', 'Dom Cobb is a skilled thief who specializes in stealing secrets from deep within the subconscious through dream-sharing technology. Given a chance to have his criminal record erased, he must accomplish the impossible: implanting an idea into someone\'s mind. However, his past threatens to unravel the mission from within.', 'Leonardo DiCaprio as Dom Cobb, Joseph Gordon-Levitt as Arthur, Ellen Page (Elliot Page) as Ariadne, Tom Hardy as Eames, Ken Watanabe as Saito, Cillian Murphy as Robert Fischer, Marion Cotillard as Mal', '../assets/images/ratings/rating_4_8.png', 'Now Showing', 2),
(29, '../assets/images/movie_posters/PG_Interstellar.png', 'Interstellar', 'Science Fiction, Drama, Adventure', '169 minutes', 'In a future where Earth is becoming uninhabitable, a group of astronauts embarks on a journey through a wormhole in search of a new home for humanity. As they battle time dilation, cosmic dangers, and personal sacrifices, former NASA pilot Cooper must make impossible choices to save his family and the human race.', 'Matthew McConaughey as Cooper, Anne Hathaway as Dr. Amelia Brand, Jessica Chastain as Murph, Michael Caine as Professor Brand, Mackenzie Foy as Young Murph, Casey Affleck as Tom', '../assets/images/ratings/rating_4_9.png', 'Popular Movies', 2),
(30, '../assets/images/movie_posters/PG_LaLaLand.png', 'La La Land', 'Romance, Musical, Drama', '128 minutes', 'In Los Angeles, aspiring actress Mia and jazz musician Sebastian fall deeply in love while chasing their dreams. As they navigate the struggles of their respective careers, their relationship is tested by ambition, success, and the sacrifices required to achieve greatness.', 'Ryan Gosling as Sebastian Wilder, Emma Stone as Mia Dolan, John Legend as Keith, Rosemarie DeWitt as Laura Wilder, J.K. Simmons as Bill', '../assets/images/ratings/rating_4_4.png', 'Popular Movies', 2),
(31, '../assets/images/movie_posters/PG_LittleWomen.png', 'Little Women', 'Drama, Romance', '135 minutes', 'Based on Louisa May Alcott\'s classic novel, Little Women follows the lives of the four March sisters—Jo, Meg, Beth, and Amy—as they come of age during the aftermath of the American Civil War. The story explores their personal ambitions, relationships, and the societal pressures they face, highlighting themes of love, family, and the pursuit of one\'s dreams.', 'Saoirse Ronan as Jo March, Emma Watson as Meg March, Florence Pugh as Amy March, Eliza Scanlen as Beth March, Timothée Chalamet as Theodore Laurie Laurence', '../assets/images/ratings/rating_4_2.png', 'Popular Movies', 2),
(32, '../assets/images/movie_posters/PG_MatrixReloaded.png', 'The Matrix Reloaded', 'Science Fiction, Action', '138 minutes', 'As Neo, Morpheus, and Trinity continue their battle against the machines, they learn of a looming attack on Zion. Neo must confront new enemies, unlock his true potential, and uncover the deeper truths behind the Matrix while facing the powerful Agent Smith, who has evolved beyond his programming.', 'Keanu Reeves as Neo, Laurence Fishburne as Morpheus, Carrie-Anne Moss as Trinity, Hugo Weaving as Agent Smith, Jada Pinkett Smith as Niobe, Monica Bellucci as Persephone', '../assets/images/ratings/rating_4_2.png', 'Popular Movies', 2),
(33, '../assets/images/movie_posters/PG_MatrixRevolutions.png', 'The Matrix Revolutions', 'Science Fiction, Action', '129 minutes', 'As the war between humans and machines reaches its climax, Neo embarks on a final journey to confront Agent Smith, who threatens to consume both the Matrix and the real world. Meanwhile, Zion braces for its last stand against the relentless onslaught of Sentinels, leading to a fateful showdown.', 'Keanu Reeves as Neo, Laurence Fishburne as Morpheus, Carrie-Anne Moss as Trinity, Hugo Weaving as Agent Smith, Jada Pinkett Smith as Niobe, Lambert Wilson as The Merovingian', '../assets/images/ratings/rating_3_8.png', 'Popular Movies', 2),
(34, '../assets/images/movie_posters/PG_MeBeforeYou.png', 'Me Before You', 'Romance, Drama', '110 minutes', 'Louisa Lou Clark, a cheerful and quirky young woman, takes a job as a caregiver for Will Traynor, a wealthy and cynical man left paralyzed after an accident. As they spend time together, their relationship blossoms into something life-changing, challenging both of them to see the world in a new light.', 'Emilia Clarke as Louisa Clark, Sam Claflin as Will Traynor, Janet McTeer as Camilla Traynor, Charles Dance as Steven Traynor, Matthew Lewis as Patrick', '../assets/images/ratings/rating_4_7.png', 'Popular Movies', 2),
(35, '../assets/images/movie_posters/PG_MissionPossibleFallout.png', 'Mission Impossible', 'Action, Adventure, Thriller', '147 minutes', 'Ethan Hunt and his IMF team join forces with CIA assassin August Walker to prevent a disaster of epic proportions. Arms dealer John Lark and a group of terrorists plan to use three plutonium cores for simultaneous nuclear attacks. When the weapons go missing, Ethan and his crew find themselves in a desperate race against time to prevent them from falling into the wrong hands.', 'Tom Cruise as Ethan Hunt, Henry Cavill as August Walker, Ving Rhames as Luther Stickell, Simon Pegg as Benji Dunn, Rebecca Ferguson as Ilsa Faust', '../assets/images/ratings/rating_4_7.png', 'Coming Soon', 2),
(36, '../assets/images/movie_posters/PG_PacificRim.png', 'Pacific Rim', 'Science Fiction, Action', '131 minutes', 'As a war between humankind and monstrous sea creatures wages on, a former pilot and a trainee are paired up to drive a seemingly obsolete special weapon in a desperate effort to save the world from the apocalypse.', 'Charlie Hunnam as Raleigh Becket, Idris Elba as Stacker Pentecost, Rinko Kikuchi as Mako Mori, Charlie Day as Dr. Newton Geiszler', '../assets/images/ratings/rating_4_6.png', 'Coming Soon', 2),
(37, '../assets/images/movie_posters/PG_PastLives.png', 'Past Lives', 'Romantic Drama', '106 minutes', 'Past Lives tells the story of Nora and Hae Sung, two deeply connected childhood friends who are separated after Nora\'s family emigrates from South Korea. Two decades later, they are reunited in New York for one fateful week as they confront notions of destiny, love, and the choices that make a life.', 'Greta Lee as Nora, Teo Yoo as Hae Sung, John Magaro as Arthur', '../assets/images/ratings/rating_4_2.png', 'Coming Soon', 2),
(38, '../assets/images/movie_posters/PG_PSILoveYou.png', 'P.S. I Love You', 'Romance, Drama', '126 minutes', 'After losing her husband, Gerry, to a terminal illness, Holly Kennedy struggles to move forward. However, on her 30th birthday, she receives the first of several letters Gerry wrote before his passing, designed to help her heal and embrace life again. As she follows his heartfelt instructions, Holly embarks on a journey of love, loss, and self-discovery.', 'Hilary Swank as Holly Kennedy, Gerard Butler as Gerry Kennedy, Lisa Kudrow as Denise, Harry Connick Jr. as Daniel, Jeffrey Dean Morgan as William', '../assets/images/ratings/rating_4_4.png', 'Coming Soon', 2),
(39, '../assets/images/movie_posters/PG_Stardust.png', 'Stardust', 'Fantasy, Adventure, Romance', '127 minutes', ' In a magical kingdom, a young man named Tristan embarks on a quest to retrieve a fallen star to win the heart of his beloved. However, the star is actually a celestial being named Yvaine, and Tristan soon finds himself caught between witches, princes, and sky pirates as he fights to protect her and discover his own destiny.', 'Charlie Cox as Tristan, Claire Danes as Yvaine, Michelle Pfeiffer as Lamia, Robert De Niro as Captain Shakespeare, Mark Strong as Septimus, Sienna Miller as Victoria', '../assets/images/ratings/rating_4_6.png', 'Coming Soon', 2),
(40, '../assets/images/movie_posters/PG_Taken.png', 'Taken', 'Action, Thriller', '90 minutes', 'A retired CIA operative travels across Europe to rescue his estranged daughter who has been kidnapped while on a trip to Paris.', 'Liam Neeson as Bryan Mills, Maggie Grace as Kim Mills, Famke Janssen as Lenore Mills, Leland Orser as Sam, Xander Berkeley as Stuart', '../assets/images/ratings/rating_4_7.png', 'Coming Soon', 2),
(41, '../assets/images/movie_posters/PG_TheBourneIdentity.png', 'The Bourne Identity', ' Action, Thriller', ' 119 minutes', 'A man suffering from amnesia is found adrift in the Mediterranean Sea. As he recovers, he discovers extraordinary combat and linguistic skills, but lacks any personal identity. Determined to uncover his true self, he embarks on a perilous journey, evading assassins and uncovering a covert CIA operation', 'Matt Damon as Jason Bourne, Franka Potente as Marie Kreutz, Chris Cooper as Alexander Conklin, Clive Owen as The Professor, Brian Cox as Ward Abbott', '../assets/images/ratings/rating_4_6.png', 'Coming Soon', 2),
(42, '../assets/images/movie_posters/PG_TheChroniclesOfNarnia.png', 'The Chronicles ...', 'Fantasy, Adventure, Family', '143 minutes', 'During World War II, four siblings—Lucy, Edmund, Susan, and Peter—discover a magical wardrobe that transports them to the land of Narnia. There, they join forces with the great lion Aslan to battle the evil White Witch and restore peace to the enchanted kingdom.', 'Georgie Henley as Lucy Pevensie, Skandar Keynes as Edmund Pevensie, Anna Popplewell as Susan Pevensie, William Moseley as Peter Pevensie, Tilda Swinton as White Witch, Liam Neeson as Aslan (voice)James McAvoy as Mr. Tumnus', '../assets/images/ratings/rating_4_7.png', 'Coming Soon', 2),
(43, '../assets/images/movie_posters/PG_TheCreator.png', 'The Creator', 'Science Fiction, Action, Thriller', '133 minutes', ' Set in a future where humans are at war with artificial intelligence, ex-special forces agent Joshua is recruited to eliminate the elusive architect of advanced AI, known as The Creator. His mission intensifies upon discovering that the weapon designed to end the conflict is an AI in the form of a young child.', 'John David Washington as Joshua, Gemma Chan as Maya, Ken Watanabe as Harun, Madeleine Yuna Voyles as Alphie, Allison Janney as Colonel Howell', '../assets/images/ratings/rating_3_7.png', 'Coming Soon', 2),
(44, '../assets/images/movie_posters/PG_TheDarkKnight.png', 'The Dark Knight', 'Action, Crime, Drama', '152 minutes', 'Batman continues his crusade against crime in Gotham City, with the assistance of Lieutenant Jim Gordon and District Attorney Harvey Dent. Their efforts are challenged by the emergence of the Joker, a criminal mastermind intent on plunging the city into chaos. As Batman faces his greatest psychological and physical tests, he must confront the fine line between heroism and vigilantism.', 'Christian Bale as Bruce Wayne / Batman, Heath Ledger as The Joker, Aaron Eckhart as Harvey Dent, Michael Caine as Alfred Pennyworth', '../assets/images/ratings/rating_4_9.png', 'Coming Soon', 2),
(45, '../assets/images/movie_posters/PG_TheFaultInOurStars.png', 'The Fault In Our Stars', 'Romance, Drama', '126 minutes', 'Hazel Grace Lancaster, a teenager battling cancer, meets Augustus Waters at a support group, and the two form a deep, life-changing connection. As they embark on a journey filled with love, humor, and heartbreak, they navigate the realities of illness while making the most of every moment they have together.', 'Shailene Woodley as Hazel Grace Lancaster, Ansel Elgort as Augustus Waters, Nat Wolff as Isaac, Laura Dern as Frannie Lancaster, Willem Dafoe as Peter Van Houten', '../assets/images/ratings/rating_4_8.png', 'Now Showing', 3),
(46, '../assets/images/movie_posters/PG_TheGrandBudapest.png', 'The Grand Budapest', 'Comedy, Drama', '99 minutes', 'In the 1930s, renowned concierge Gustave H. befriends a young lobby boy named Zero at the Grand Budapest Hotel. Their lives take a dramatic turn when Gustave is framed for murder and embarks on a thrilling adventure involving a stolen painting, a vast family fortune, and a world on the brink of war.', 'Ralph Fiennes as Gustave H., Tony Revolori as Zero Moustafa, Adrien Brody as Dmitri, Saoirse Ronan as Agatha, Willem Dafoe as J.G. Jopling, Tilda Swinton as Madame D.', '../assets/images/ratings/rating_4_7.png', 'Now Showing', 3),
(47, '../assets/images/movie_posters/PG_TheHobbit_AnUnexpectedJourney.png', 'The Hobbit An Unexpected Journey', 'Fantasy, Adventure', '169 minutes', 'Young Bilbo Baggins is unexpectedly swept into an epic quest to reclaim the lost Dwarven kingdom of Erebor from the dragon Smaug. Guided by the wizard Gandalf, Bilbo joins a company of dwarves led by Thorin Oakenshield. Along the way, he encounters trolls, goblins, and the creature Gollum, where he unknowingly acquires the One Ring.', 'Martin Freeman as Bilbo Baggins, Ian McKellen as Gandalf, Richard Armitage as Thorin Oakenshield, Andy Serkis as Gollum, Cate Blanchett as Galadriel, Hugo Weaving as Elrond, Christopher Lee as Saruman', '../assets/images/ratings/rating_4_7.png', 'Now Showing', 3),
(48, '../assets/images/movie_posters/PG_TheHobbit_TheDesolationOfSmaug.png', 'The Hobbit The Desolation Of Smaug', 'Fantasy, Adventure', '161 minutes', 'Bilbo Baggins continues his journey with Thorin Oakenshield and his company of dwarves as they head toward the Lonely Mountain. Along the way, they face deadly creatures, encounter the mysterious Elf King Thranduil, and reach Erebor, where Bilbo comes face-to-face with the fearsome dragon, Smaug. Meanwhile, dark forces stir across Middle-earth.', 'Martin Freeman as Bilbo Baggins, Ian McKellen as Gandalf, Richard Armitage as Thorin Oakenshield, Benedict Cumberbatch as Smaug (voice), Orlando Bloom as Legolas, Evangeline Lilly as Tauriel, Lee Pace as Thranduil', '../assets/images/ratings/rating_4_6.png', 'Now Showing', 3),
(49, '../assets/images/movie_posters/PG_TheHobbit.png', 'The Hobbit', 'Fantasy, Adventure', '144 minutes', 'The journey reaches its climax as the battle for Erebor erupts. Thorin, consumed by greed, risks everything to defend his reclaimed homeland, while forces of men, elves, dwarves, and orcs clash in an epic war. As Bilbo struggles to bring peace, the fate of Middle-earth hangs in the balance.', 'Martin Freeman as Bilbo Baggins, Ian McKellen as Gandalf, Richard Armitage as Thorin Oakenshield, Luke Evans as Bard the Bowman, Evangeline Lilly as Tauriel, Orlando Bloom as Legolas, Lee Pace as Thranduil', '../assets/images/ratings/rating_4_4.png', 'Now Showing', 3),
(50, '../assets/images/movie_posters/PG_TheLordOfTheRings_TheFellowshipOfTheRing.png', 'The Lord of the Rings: The Fellowship of the Ring', 'Fantasy, Adventure, Action', '178 minutes', 'Synopsis: The fate of Middle-earth lies in the hands of Frodo Baggins, a young hobbit who inherits the One Ring—an ancient artifact of immense power. With the help of the Fellowship, including Gandalf, Aragorn, and Legolas, Frodo embarks on a perilous journey to destroy the Ring in the fires of Mount Doom before the dark lord Sauron can reclaim it.', 'Elijah Wood as Frodo Baggins, Ian McKellen as Gandalf, Viggo Mortensen as Aragorn, Sean Astin as Samwise Gamgee, Orlando Bloom as Legolas, Cate Blanchett as Galadriel, Christopher Lee as Saruman', '../assets/images/ratings/rating_4_8.png', 'Now Showing', 3),
(51, '../assets/images/movie_posters/PG_TheLordOfTheRings_TheReturnOfTheKing.png', 'The Lord Of The Rings The Return Of The King', 'Fantasy, Adventure, Action', '201 minutes', 'The epic conclusion to the battle for Middle-earth sees Frodo and Sam nearing Mount Doom, struggling under the Ring’s growing burden. Meanwhile, Aragorn leads the armies of men against Sauron’s forces in Gondor. As hope and courage are tested, the fate of the world hangs in the balance.', 'Elijah Wood as Frodo Baggins, Ian McKellen as Gandalf the White, Viggo Mortensen as Aragorn, Sean Astin as Samwise Gamgee, Orlando Bloom as Legolas, Andy Serkis as Gollum, Liv Tyler as Arwen', '../assets/images/ratings/rating_4_9.png', 'Popular Movies', 3),
(52, '../assets/images/movie_posters/PG_TheLordOfTheRings_TheTwoTowers.png', 'The Lord Of The Rings The Two Towers', 'Fantasy, Adventure, Action', '179 minutes', 'The Fellowship has been broken, and Frodo and Sam continue their journey to Mordor, guided by the creature Gollum. Meanwhile, Aragorn, Legolas, and Gimli fight to protect Rohan from the forces of Saruman. As war looms, alliances are tested, and the battle for Middle-earth intensifies.', 'Elijah Wood as Frodo Baggins, Ian McKellen as Gandalf the White, Viggo Mortensen as Aragorn, Sean Astin as Samwise Gamgee, Andy Serkis as Gollum, Miranda Otto as Éowyn, Karl Urban as Éomer', '../assets/images/ratings/rating_4_8.png', 'Popular Movies', 3),
(53, '../assets/images/movie_posters/PG_TheMartian.png', 'The Martian', 'Science Fiction, Adventure, Drama', '144 minutes', 'Astronaut Mark Watney is presumed dead and left behind on Mars after a fierce storm. With limited supplies, he must rely on his ingenuity and spirit to survive and find a way to signal to Earth that he is alive.', 'Matt Damon as Mark Watney, Jessica Chastain as Melissa Lewis, Kristen Wiig as Annie Montrose, Jeff Daniels as Teddy Sanders, Michael Peña as Rick Martinez', '../assets/images/ratings/rating_4_7.png', 'Popular Movies', 3),
(54, '../assets/images/movie_posters/PG_TheNotebook.png', 'The Notebook', 'Romance, Drama', '123 minutes', 'In the 1940s, a young couple, Noah and Allie, fall deeply in love despite coming from different social backgrounds. However, circumstances and societal pressures pull them apart. Years later, their love story is recounted from an old notebook by an elderly man to a woman in a nursing home, revealing a tale of enduring passion, fate, and memory.', 'Ryan Gosling as Noah Calhoun, Rachel McAdams as Allie Hamilton, James Garner as Older Noah, Gena Rowlands as Older Allie, Joan Allen as Anne Hamilton', '../assets/images/ratings/rating_4_7.png', 'Popular Movies', 3),
(55, '../assets/images/movie_posters/PG_TheOtherGuys.png', 'The Other Guys', 'Action, Comedy', '107 minutes', 'Detectives Allen Gamble and Terry Hoitz are desk-bound cops overshadowed by the department\'s top officers. When an opportunity arises, they step up to tackle a high-profile case, leading to unexpected and hilarious consequences.', 'Will Ferrell as Detective Allen Gamble, Mark Wahlberg as Detective Terry Hoitz, Eva Mendes as Dr. Sheila Gamble, Michael Keaton as Captain Gene Mauch, Steve Coogan as David Ershon', '../assets/images/ratings/rating_4_7.png', 'Popular Movies', 3),
(56, '../assets/images/movie_posters/PG_TheRing.png', 'The Ring', 'Horror, Mystery', '115 minutes', 'In Seattle, journalist Rachel Keller investigates a mysterious videotape that allegedly causes the death of anyone who watches it seven days later. After viewing the tape herself, Rachel experiences unsettling phenomena and races against time to uncover the truth behind the curse to save herself and her son.', 'Naomi Watts as Rachel Keller, Martin Henderson as Noah Clay, David Dorfman as Aidan Keller, Brian Cox as Richard Morgan, Daveigh Chase as Samara Morgan', '../assets/images/ratings/rating_4_1.png', 'Popular Movies', 3),
(57, '../assets/images/movie_posters/PG_TheVow.png', 'The Vow', 'Romance, Drama', '104 minutes', 'After a car accident leaves Paige with severe memory loss, she no longer remembers her husband, Leo, or their life together. Determined to win her heart again, Leo embarks on a journey to make her fall in love with him all over again, despite the obstacles standing in their way.', 'Rachel McAdams as Paige Collins, Channing Tatum as Leo Collins, Sam Neill as Bill Thornton, Jessica Lange as Rita Thornton, Scott Speedman as Jeremy', '../assets/images/ratings/rating_4_5.png', 'Coming Soon', 3),
(58, '../assets/images/movie_posters/PG_ToAllTheBoysIveLoveBefore.png', 'To All The Boys I\'ve Love Before', 'Romance, Comedy, Drama', '99 minutes', 'Lara Jean Covey’s secret love letters to her past crushes are accidentally sent out, turning her quiet high school life upside down. To avoid embarrassment, she strikes a deal with one of the recipients, Peter Kavinsky, to pretend they are dating—only for real feelings to develop along the way.', 'Lana Condor as Lara Jean Covey, Noah Centineo as Peter Kavinsky, Janel Parrish as Margot Covey, Anna Cathcart as Kitty Covey, John Corbett as Dr. Covey', '../assets/images/ratings/rating_4_6.png', 'Coming Soon', 3),
(59, '../assets/images/movie_posters/R_Antlers.png', 'Antlers', 'Horror, Mystery', '99 minutes', 'In an isolated Oregon town, a middle-school teacher and her sheriff brother become embroiled with her enigmatic student, whose dark secrets lead to terrifying encounters with a legendary ancestral creature. ', 'Keri Russell as Julia Meadows, Jesse Plemons as Paul Meadows, Jeremy T. Thomas as Lucas Weaver, Graham Greene as Warren Stokes, Scott Haze as Frank Weaver', '../assets/images/ratings/rating_3_4.png', 'Coming Soon', 3),
(60, '../assets/images/movie_posters/PG_WarForThePlanetOfTheApes.png', 'War For The Planet Of The Apes', 'Science Fiction, Drama', '140 minutes', 'After the apes suffer unimaginable losses, Caesar wrestles with his darker instincts and begins his own mythic quest to avenge his kind.', 'Andy Serkis as Caesar, Woody Harrelson as The Colonel, Steve Zahn as Bad Ape, Amiah Miller as Nova', '../assets/images/ratings/rating_4_6.png', 'Coming Soon', 3),
(61, '../assets/images/movie_posters/R_21JumpStreet.png', '21 Jump Street', 'Action, Comedy', '109 minutes', 'Former high school adversaries Morton Schmidt and Greg Jenko become partners in the police force. Assigned to an undercover unit, they pose as high school students to infiltrate a drug ring. Reliving their teenage years, they navigate the challenges of modern high school life while attempting to complete their mission.', 'Jonah Hill as Morton Schmidt, Channing Tatum as Greg Jenko, Brie Larson as Molly Tracey, Dave Franco as Eric Molson, Ice Cube as Captain Dickson', '../assets/images/ratings/rating_4_6.png', 'Coming Soon', 3),
(62, '../assets/images/movie_posters/R_22.png', '22', 'Action, Comedy', '112 minutes', 'Officers Schmidt and Jenko are back, this time going undercover at a local college to investigate a new drug outbreak. As they navigate fraternity culture and academic pressures, their partnership faces challenges, leading them to question their compatibility as both partners and friends.', 'Jonah Hill as Morton Schmidt, Channing Tatum as Greg Jenko, Peter Stormare as Ghost, Ice Cube as Captain Dickson, Amber Stevens West as Maya Dickson', '../assets/images/ratings/rating_4_3.png', 'Coming Soon', 3),
(63, '../assets/images/movie_posters/R_28DaysLater.png', '28 Days Later', 'Horror, Sci-Fi, Thriller', '113 minutes', 'After a highly contagious virus is accidentally released, it spreads rapidly across the United Kingdom, causing societal collapse. Twenty-eight days later, a man awakens from a coma to find London deserted. He joins a group of survivors seeking sanctuary while confronting the infected and the breakdown of civilization.', 'Cillian Murphy as Jim, Naomie Harris as Selena, Brendan Gleeson as Frank,Megan Burns as Hannah, Christopher Eccleston as Major Henry West', '../assets/images/ratings/rating_4_2.png', 'Coming Soon', 3),
(64, '../assets/images/movie_posters/R_300.png', '300', 'Action, Drama', '117 minutes', 'Based on Frank Miller\'s graphic novel, 300 depicts the Battle of Thermopylae, where King Leonidas of Sparta leads 300 warriors against the vast Persian army led by King Xerxes. Despite overwhelming odds, the Spartans\' valor and sacrifice inspire all of Greece to unite against their common enemy.', 'Gerard Butler as King Leonidas, Lena Headey as Queen Gorgo, David Wenham as Dilios, Dominic West as Theron, Rodrigo Santoro as King Xerxes', '../assets/images/ratings/rating_3_6.png', 'Coming Soon', 3),
(65, '../assets/images/movie_posters/R_AtomicBlonde.png', 'Atomic Blonde', 'Action, Thriller', '115 minutes', 'Set during the Cold War, MI6 agent Lorraine Broughton is dispatched to Berlin to investigate the murder of a fellow agent and recover a missing list of double agents. Navigating a web of espionage, deceit, and treachery, she must use all her skills to survive and complete her mission.', 'Charlize Theron as Lorraine Broughton, James McAvoy as David Percival, Sofia Boutella as Delphine Lasalle, Eddie Marsan as Spyglass, John Goodman as Emmett Kurzfeld', '../assets/images/ratings/rating_4_2.png', 'Coming Soon', 3),
(66, '../assets/images/movie_posters/R_BadBoys.png', 'Bad Boys', 'Action, Comedy, Crime', '119 minutes', 'Miami detectives Mike Lowrey and Marcus Burnett are tasked with recovering $100 million worth of seized heroin stolen from their police vault. To protect a witness to a murder, they switch identities, leading to a series of misunderstandings and comedic situations as they work to solve the case.', 'Will Smith as Mike Lowrey, Martin Lawrence as Marcus Burnett, Téa Leoni as Julie Mott, Tchéky Karyo as Fouchet, Joe Pantoliano as Captain Howard', '../assets/images/ratings/rating_4_4.png', 'Coming Soon', 3),
(67, '../assets/images/movie_posters/R_BladeRunner.png', 'Blade Runner 2049', 'Science Fiction, Thriller', '164 minutes', 'Set three decades after the original Blade Runner, the story follows Officer K, a new blade runner for the Los Angeles Police Department. K unearths a long-buried secret that has the potential to plunge society into chaos. His discovery leads him on a quest to find Rick Deckard, a former blade runner who has been missing for thirty years.', 'Ryan Gosling as Officer K, Harrison Ford as Rick Deckard, Ana de Armas as Joi, Sylvia Hoeks as Luv, Robin Wright as Lieutenant Joshi, Jared Leto as Niander Wallace', '../assets/images/ratings/rating_4_2.png', 'Now Showing', 4),
(68, '../assets/images/movie_posters/R_Blockers.png', 'Blockers', 'Comedy', '102 minutes', 'Three parents stumble upon their daughters\' pact to lose their virginity on prom night and launch a covert one-night operation to stop the teens from sealing the deal.', 'Leslie Mann as Lisa, John Cena as Mitchell, Ike Barinholtz as Hunter, Kathryn Newton as Julie, Geraldine Viswanathan as Kayla', '../assets/images/ratings/rating_3_9.png', 'Now Showing', 4),
(69, '../assets/images/movie_posters/R_Borat.png', 'Borat', 'Comedy, Mockumentary', '84 minutes', 'Kazakh journalist Borat Sagdiyev travels to the United States to make a documentary on American society and culture. Along the way, his outrageous behavior and unfiltered commentary lead to a series of comedic and controversial encounters with unsuspecting Americans.', 'Sacha Baron Cohen as Borat Sagdiyev, Ken Davitian as Azamat Bagatov, Luenell as Luenell, Pamela Anderson as Herself', '../assets/images/ratings/rating_4_3.png', 'Now Showing', 4),
(70, '../assets/images/movie_posters/R_BoratSubsequentMovieFilm.png', 'Borat Subsequent...', 'Comedy, Mockumentary', '96 minutes', 'Released from prison for bringing shame to his country, Kazakh journalist Borat Sagdiyev returns to America. This time, he aims to offer his daughter, Tutar, as a bride to then–U.S. Vice President Mike Pence during the COVID-19 pandemic and the 2020 presidential election. Their journey leads to a series of outrageous and revealing encounters with real people across the nation.', 'Sacha Baron Cohen as Borat Sagdiyev, Maria Bakalova as Tutar Sagdiyev, Tom Hanks as Himself, Rudy Giuliani as Himself', '../assets/images/ratings/rating_3_6.png', 'Now Showing', 4),
(71, '../assets/images/movie_posters/R_Bridesmaids.png', 'Bridesmaids', 'Comedy, Romance', '125 minutes', 'Annie\'s life is a mess, but when she learns her best friend Lillian is engaged, she becomes the maid of honor. Despite her personal struggles, Annie navigates the chaotic and expensive rituals associated with the role, leading to a series of comedic misadventures.', 'Kristen Wiig as Annie Walker, Maya Rudolph as Lillian Donovan, Rose Byrne as Helen Harris III, Melissa McCarthy as Megan Price, Chris O\'Dowd as Officer Nathan Rhodes', '../assets/images/ratings/rating_3_9.png', 'Now Showing', 4),
(72, '../assets/images/movie_posters/R_CallMeByYourName.png', 'Call Me by ...', 'Romance, Drama', '132 minutes', 'During a summer in 1980s Italy, 17-year-old Elio Perlman forms an intense bond with Oliver, a charming graduate student working as his father\'s assistant. As their friendship deepens into a passionate romance, they experience a love that will forever change their lives.', 'Timothée Chalamet as Elio Perlman, Armie Hammer as Oliver, Michael Stuhlbarg as Samuel Perlman, Amira Casar as Annella Perlman, Esther Garrel as Marzia', '../assets/images/ratings/rating_4_7.png', 'Now Showing', 4),
(73, '../assets/images/movie_posters/R_Deadpool.png', 'Deadpool', 'Action, Comedy', '108 minutes', 'A former Special Forces operative turned mercenary is subjected to a rogue experiment that leaves him with accelerated healing powers, adopting the alter ego Deadpool.', 'Ryan Reynolds as Wade Wilson / Deadpool, Morena Baccarin as Vanessa, Ed Skrein as Ajax, T.J. Miller as Weasel, Gina Carano as Angel Dust', '../assets/images/ratings/rating_4_5.png', 'Popular Movies', 4),
(74, '../assets/images/movie_posters/R_Deadpool2.png', 'Deadpool 2', 'Action, Comedy', '119 minutes', 'After a personal tragedy, Wade Wilson (Deadpool) assembles a team of mutants to protect a young boy with supernatural abilities from the time-traveling soldier, Cable.', 'Ryan Reynolds as Wade Wilson / Deadpool, Josh Brolin as Cable, Morena Baccarin as Vanessa, Julian Dennison as Russell, Zazie Beetz as Domino', '../assets/images/ratings/rating_4_5.png', 'Popular Movies', 4),
(75, '../assets/images/movie_posters/R_DieHard.png', 'Die Hard', 'Action, Thriller', '132 minutes', 'NYPD officer John McClane arrives in Los Angeles to reconcile with his estranged wife at her company\'s Christmas party. The celebration is abruptly interrupted when a group of terrorists, led by Hans Gruber, seizes the building. With limited resources and no immediate backup, McClane must rely on his wits and training to rescue the hostages and thwart the criminals\' plans.', 'Bruce Willis as John McClane, Alan Rickman as Hans Gruber, Bonnie Bedelia as Holly Gennaro McClane, Reginald VelJohnson as Sgt. Al Powell, Paul Gleason as Dwayne T. Robinson', '../assets/images/ratings/rating_4_7.png', 'Popular Movies', 4),
(76, '../assets/images/movie_posters/R_EternalSunshine.png', 'Eternal Sunshine ...', 'Romance, Sci-Fi, Drama', '108 minutes', 'After a painful breakup, Joel discovers that his ex-girlfriend Clementine has undergone a procedure to erase all memories of their relationship. Devastated, he decides to do the same, but as his memories disappear, he realizes he still loves her. Racing against his own mind, he tries to hold onto their love before it fades forever.', 'Jim Carrey as Joel Barish, Kate Winslet as Clementine Kruczynski, Kirsten Dunst as Mary Svevo, Mark Ruffalo as Stan, Elijah Wood as Patrick', '../assets/images/ratings/rating_4_6.png', 'Popular Movies', 4),
(77, '../assets/images/movie_posters/R_GameNight.png', 'Game Night', 'Comedy, Crime', '100 minutes', 'Max and Annie\'s regular game night takes an unexpected turn when Max\'s charismatic brother, Brooks, arranges a murder mystery party—complete with fake thugs and federal agents. However, when Brooks gets kidnapped, it\'s all part of the game, right? As the competitors set out to solve the case, they begin to discover that neither this game—nor Brooks—are what they seem to be.', 'Jason Bateman as Max, Rachel McAdams as Annie, Kyle Chandler as Brooks, Sharon Horgan as Sarah, Billy Magnussen as Ryan', '../assets/images/ratings/rating_4_3.png', 'Popular Movies', 4),
(78, '../assets/images/movie_posters/R_GetOut.png', 'Get Out', 'Horror, Mystery, Thriller', '104 minutes', 'Chris, an African-American man, visits his white girlfriend Rose\'s family estate. Initially, he interprets their overly accommodating behavior as nervous attempts to deal with their daughter\'s interracial relationship. However, as the weekend progresses, a series of increasingly disturbing discoveries lead him to a truth he could never have imagined.', 'Daniel Kaluuya as Chris Washington, Allison Williams as Rose Armitage, Bradley Whitford as Dean Armitage, Catherine Keener as Missy Armitage, Lil Rel Howery as Rod Williams', '../assets/images/ratings/rating_4_4.png', 'Popular Movies', 4);
INSERT INTO `backup_table` (`id`, `image`, `title`, `genre`, `duration`, `synopsis`, `casts`, `rating`, `status`, `cinema_number`) VALUES
(79, '../assets/images/movie_posters/R_Gladiator.png', 'Gladiator', 'Action, Adventure, Drama', '155 minutes', 'Roman general Maximus Decimus Meridius is betrayed by Commodus, the ambitious son of Emperor Marcus Aurelius, who murders his father and seizes the throne. Left for dead and sold into slavery, Maximus rises through the ranks of the gladiatorial arena, driven by a desire for vengeance against Commodus and justice for his murdered family.', 'Russell Crowe as Maximus, Joaquin Phoenix as Commodus, Connie Nielsen as Lucilla, Oliver Reed as Proximo, Richard Harris as Marcus Aurelius', '../assets/images/ratings/rating_4_8.png', 'Coming Soon', 4),
(80, '../assets/images/movie_posters/R_ItFollows.png', 'It Follows', 'Horror, Mystery, Thriller', '100 minutes', 'After a seemingly innocent sexual encounter, 19-year-old Jay finds herself plagued by strange visions and an inescapable sense that someone—or something—is following her. Faced with this burden, Jay and her friends must find a way to escape the horrors that seem to be only a few steps behind.', 'Maika Monroe as Jay Height, Keir Gilchrist as Paul, Daniel Zovatto as Greg Hannigan, Olivia Luccardi as Yara, Lili Sepe as Kelly Height', '../assets/images/ratings/rating_2_7.png', 'Coming Soon', 4),
(81, '../assets/images/movie_posters/R_JohnWick.png', 'John Wick', 'Action, Thriller', '101 minutes', 'Retired hitman John Wick is mourning the loss of his wife when a group of Russian gangsters, led by Iosef Tarasov, steals his prized car and kills his puppy—a final gift from his late wife. Fueled by grief and vengeance, John returns to his former life, unleashing his lethal skills to hunt down those responsible, while confronting his past connections in the criminal underworld.', 'Keanu Reeves as John Wick, Michael Nyqvist as Viggo Tarasov, Alfie Allen as Iosef Tarasov, Willem Dafoe as Marcus, Adrianne Palicki as Ms. Perkins', '../assets/images/ratings/rating_4_5.png', 'Coming Soon', 4),
(82, '../assets/images/movie_posters/R_KillBill.png', 'Kill Bill ...', 'Action, Crime, Thriller', '111 minutes', 'After waking from a four-year coma, a former assassin seeks vengeance on the team of assassins who betrayed her.', 'Uma Thurman as The Bride, Lucy Liu as O-Ren Ishii, Vivica A. Fox as Vernita Green, Daryl Hannah as Elle Driver, David Carradine as Bill', '../assets/images/ratings/rating_4_4.png', 'Coming Soon', 4),
(83, '../assets/images/movie_posters/R_LethalWeapon.png', 'Lethal Weapon', 'Action, Crime, Thriller', '110 minutes', 'Veteran LAPD detective Roger Murtaugh is paired with volatile and suicidal young detective Martin Riggs. Despite their contrasting personalities, the duo must work together to investigate a drug-smuggling operation, leading them into dangerous confrontations and forging an unlikely partnership.', 'Mel Gibson as Martin Riggs, Danny Glover as Roger Murtaugh, Gary Busey as Mr. Joshua, Mitchell Ryan as General Peter McAllister, Darlene Love as Trish Murtaugh', '../assets/images/ratings/rating_4_5.png', 'Coming Soon', 4),
(84, '../assets/images/movie_posters/R_LetTheRightOneIn.png', 'Let the Right ...', 'Horror, Drama, Romance', '114 minutes', 'In 1980s Stockholm, lonely 12-year-old Oskar befriends his new neighbor, Eli, a mysterious girl who only appears at night. As their bond deepens, Oskar discovers Eli\'s dark secret: she is a vampire responsible for a series of local deaths. Together, they navigate a complex relationship amidst the backdrop of fear and violence.', 'Kåre Hedebrant as Oskar, Lina Leandersson as Eli, Per Ragnar as Håkan, Henrik Dahl as Erik, Karin Bergquist as Yvonne', '../assets/images/ratings/rating_4_3.png', 'Coming Soon', 4),
(85, '../assets/images/movie_posters/R_MadMaxFurryRoad.png', 'Mad Max: Fury Road', 'Action, Adventure, Sci-Fi', '120 minutes', 'In a post-apocalyptic wasteland, Max Rockatansky finds himself captured by the tyrannical Immortan Joe\'s forces. Amidst the chaos, Imperator Furiosa rebels against Joe\'s regime, seeking to rescue his enslaved wives. Teaming up with Max, they embark on a high-octane chase across the desert, battling relentless pursuers in a quest for freedom and redemption.', 'Tom Hardy as Max Rockatansky, Charlize Theron as Imperator Furiosa, Nicholas Hoult as Nux, Hugh Keays-Byrne as Immortan Joe, Zoë Kravitz as Toast the Knowing', '../assets/images/ratings/rating_4_5.png', 'Coming Soon', 4),
(86, '../assets/images/movie_posters/R_Malignant.png', 'Malignant', 'Horror, Thriller', '111 minutes', 'Paralyzed by fear from shocking visions, a woman\'s torment worsens as she discovers her waking dreams are terrifying realities.', 'Annabelle Wallis as Madison Mitchell, Maddie Hasson as Sydney Lake, George Young as Detective Kekoa Shaw, Michole Briana White as Detective Regina Moss, Jean Louisa Kelly as Jane Doe / Serena May', '../assets/images/ratings/rating_3_2.png', 'Coming Soon', 4),
(87, '../assets/images/movie_posters/R_Midsommar.png', 'Midsommar', 'Horror, Drama', '147 minutes', 'Following a family tragedy, Dani accompanies her boyfriend Christian and his friends to a secluded Swedish village for a once-in-a-lifetime midsummer festival. What begins as a peaceful retreat quickly devolves into a nightmarish ordeal as the villagers\' unsettling rituals become increasingly disturbing.', 'Florence Pugh as Dani, Jack Reynor as Christian, William Jackson Harper as Josh, Vilhelm Blomgren as Pelle, Will Poulter as Mark', '../assets/images/ratings/rating_2_9.png', 'Coming Soon', 4),
(88, '../assets/images/movie_posters/R_Neighbors.png', 'Neighbors', 'Comedy', '97 minutes', 'A young couple with a newborn baby face unexpected difficulties when a fraternity moves in next door, leading to an all-out war between the two households.', 'Seth Rogen as Mac Radner, Rose Byrne as Kelly Radner, Zac Efron as Teddy Sanders, Dave Franco as Pete, Christopher Mintz-Plasse as Scoonie', '../assets/images/ratings/rating_3_8.png', 'Coming Soon', 4),
(89, '../assets/images/movie_posters/R_NoHardFeelings.png', 'No Hard Feelings', 'Comedy', '103 minutes', 'Maddie, a struggling woman facing financial troubles, agrees to an unusual job—bringing a socially awkward 19-year-old out of his shell before he heads to college. As she attempts to boost his confidence, unexpected emotions surface, leading to hilarious and heartfelt moments.', 'Jennifer Lawrence as Maddie, Andrew Barth Feldman as Percy, Laura Benanti as Allison, Matthew Broderick as Laird, Natalie Morales as Sara', '../assets/images/ratings/rating_3_6.png', 'Now Showing', 5),
(90, '../assets/images/movie_posters/R_Nope.png', 'Nope', 'Horror, Mystery, Sci-Fi', '130 minutes', 'Siblings OJ and Emerald Haywood, who run a horse ranch in California, discover a mysterious and sinister presence in the skies above their land. As they attempt to capture evidence of the unidentified flying object, they enlist the help of a tech salesman and a renowned cinematographer, leading to a confrontation with the unknown.', 'Daniel Kaluuya as Otis OJ Haywood Jr., Keke Palmer as Emerald Em Haywood, Steven Yeun as Ricky Jupe Park, Michael Wincott as Antlers Holst, Brandon Perea as Angel Torres', '../assets/images/ratings/rating_2_8.png', 'Now Showing', 5),
(91, '../assets/images/movie_posters/R_PalmSprings.png', 'Palm Springs', 'Comedy, Romance, Sci-Fi', '90 minutes', 'When carefree Nyles and reluctant maid of honor Sarah meet at a wedding in Palm Springs, things take an unexpected turn as they become trapped in a time loop, reliving the same day over and over. As they navigate their bizarre reality, they form a unique bond filled with humor, chaos, and self-discovery.', 'Andy Samberg as Nyles, Cristin Milioti as Sarah, J.K. Simmons as Roy, Meredith Hagner as Misty, Camila Mendes as Tala', '../assets/images/ratings/rating_4_5.png', 'Now Showing', 5),
(92, '../assets/images/movie_posters/R_PansLabyrinth.png', 'Pan’s Labyrinth', 'Fantasy, Drama, War', '118 minutes', 'Set in post-Civil War Spain, young Ofelia discovers a mysterious labyrinth where she meets the faun Pan, who sets her on a quest to prove herself as the reincarnation of a lost princess. As she navigates both a magical world and the brutal reality of her stepfather’s tyranny, Ofelia struggles to survive and find her true destiny.', 'Ivana Baquero as Ofelia, Sergi López as Captain Vidal, Maribel Verdú as Mercedes, Doug Jones as Faun/Pale Man, Ariadna Gil as Carmen', '../assets/images/ratings/rating_4_6.png', 'Now Showing', 5),
(93, '../assets/images/movie_posters/R_ParanormalActivity.png', 'Paranormal Activity', 'Horror, Mystery', '86 minutes', 'Young couple Katie and Micah move into a suburban home, but soon become disturbed by a nightly demonic presence. To capture evidence, they set up video cameras, documenting increasingly terrifying events that escalate as the entity\'s grip tightens.', 'Katie Featherston as Katie, Micah Sloat as Micah, Mark Fredrichs as The Psychic, Amber Armstrong as Amber, Ashley Palmer as Diane', '../assets/images/ratings/rating_3_5.png', 'Now Showing', 5),
(94, '../assets/images/movie_posters/R_Predator.png', 'Predator', 'Action, Sci-Fi, Thriller', '107 minutes', 'A team of commandos on a mission in a Central American jungle find themselves hunted by an extraterrestrial warrior.', 'Arnold Schwarzenegger as Dutch, Carl Weathers as Dillon, Elpidia Carrillo as Anna, Bill Duke as Mac, Jesse Ventura as Blain', '../assets/images/ratings/rating_4_7.png', 'Now Showing', 5),
(95, '../assets/images/movie_posters/R_Relic.png', 'Relic', 'Horror, Drama', '89 minutes', 'When elderly matriarch Edna goes missing, her daughter Kay and granddaughter Sam return to their family home to find her. Upon Edna\'s inexplicable return, they begin to experience a sinister presence in the house, which seems to be taking control of Edna herself.', 'Emily Mortimer as Kay, Robyn Nevin as Edna, Bella Heathcote as Sam, Chris Bunton as Jamie, Jeremy Stanford as Alex', '../assets/images/ratings/rating_2_6.png', 'Popular Movies', 5),
(96, '../assets/images/movie_posters/R_SaintMaud.png', 'Saint Maud', 'Horror, Drama', '84 minutes', 'Maud, a newly devout hospice nurse, becomes obsessed with saving the soul of her dying patient, Amanda. As Maud\'s fervent faith escalates, her fixation leads to dark and dangerous consequences.', 'Morfydd Clark as Maud, Jennifer Ehle as Amanda, Lily Knight as Joy, Lily Frazer as Carol, Turlough Convery as Christian', '../assets/images/ratings/rating_3_3.png', 'Popular Movies', 5),
(97, '../assets/images/movie_posters/R_Scream.png', 'Scream', 'Horror, Mystery', '111 minutes', 'In the town of Woodsboro, a masked killer known as Ghostface begins targeting teenagers, including Sidney Prescott, whose mother was murdered a year prior. As the body count rises, Sidney and her friends must navigate the killer\'s twisted game, where everyone is a suspect.', 'Neve Campbell as Sidney Prescott, Courteney Cox as Gale Weathers, David Arquette as Deputy Dewey Riley, Skeet Ulrich as Billy Loomis, Matthew Lillard as Stu Macher', '../assets/images/ratings/rating_4_5.png', 'Popular Movies', 5),
(98, '../assets/images/movie_posters/R_SilverLinings.png', 'Silver Linings ...', 'Romance, Comedy, Drama', '122 minutes', 'After spending time in a mental health facility, Pat Solitano moves back in with his parents, determined to rebuild his life and win back his ex-wife. His plans take an unexpected turn when he meets Tiffany, a mysterious young woman dealing with her own struggles. As they form an unlikely bond, they help each other find hope and new beginnings.', 'Bradley Cooper as Pat Solitano, Jennifer Lawrence as Tiffany Maxwell, Robert De Niro as Pat Solitano Sr., Jacki Weaver as Dolores Solitano, Chris Tucker as Danny', '../assets/images/ratings/rating_4_7.png', 'Popular Movies', 5),
(99, '../assets/images/movie_posters/R_Speed.png', 'Speed', 'Action, Thriller', '116 minutes', 'Los Angeles police officer Jack Traven must prevent a bomb from exploding aboard a city bus by keeping its speed above 50 mph.', 'Keanu Reeves as Jack Traven, Sandra Bullock as Annie Porter, Dennis Hopper as Howard Payne, Jeff Daniels as Harry Temple, Joe Morton as Capt. McMahon', '../assets/images/ratings/rating_4_6.png', 'Popular Movies', 5),
(100, '../assets/images/movie_posters/R_StalloneRambo.png', 'Rambo ...', 'Action, Adventure', '96 minutes', 'John Rambo, a former Green Beret, is serving time in prison when he\'s offered a chance at freedom by participating in a covert mission to document the existence of American POWs in Vietnam. Defying orders to only take photographs, Rambo decides to rescue the prisoners, leading to intense confrontations with enemy forces.', 'Sylvester Stallone as John Rambo, Richard Crenna as Colonel Sam Trautman, Charles Napier as Marshall Murdock, Steven Berkoff as Lieutenant Colonel Podovsky, Julia Nickson as Co Bao', '../assets/images/ratings/rating_4_5.png', 'Popular Movies', 5),
(101, '../assets/images/movie_posters/R_StepBrothers.png', 'Step Brothers', 'Comedy', '98 minutes', 'Brennan Huff and Dale Doback are two middle-aged men still living with their respective single parents. When Brennan\'s mother and Dale\'s father marry, the two man-children are forced to coexist under one roof. Initially at odds, their shared immaturity and interests eventually lead to a unique friendship, causing chaos in their family\'s lives.', 'Will Ferrell as Brennan Huff, John C. Reilly as Dale Doback, Mary Steenburgen as Nancy Huff, Richard Jenkins as Dr. Robert Doback, Adam Scott as Derek Huff', '../assets/images/ratings/rating_4_4.png', 'Coming Soon', 5),
(102, '../assets/images/movie_posters/R_TheCabinInTheWoods.png', 'The Cabin In ...', 'Horror, Mystery, Thriller', '95 minutes', 'Five friends embark on a vacation to a remote cabin in the woods. Upon arrival, they discover a basement filled with mysterious artifacts. Unwittingly, they trigger a series of events controlled by unseen technicians, leading to horrifying occurrences that challenge their understanding of reality and survival.', 'Kristen Connolly as Dana, Chris Hemsworth as Curt, Anna Hutchison as Jules, Fran Kranz as Marty, Jesse Williams as Holden', '../assets/images/ratings/rating_3_2.png', 'Coming Soon', 5),
(103, '../assets/images/movie_posters/R_SuperBad.png', 'Superbad', 'Comedy', '113 minutes', 'High school seniors Seth and Evan have been inseparable friends, navigating the trials of adolescence together. As they approach graduation, the duo aims to make the most of their remaining time by securing alcohol for a party, hoping to impress their crushes. Their quest leads to a series of misadventures, testing their friendship and resilience.', 'Jonah Hill as Seth, Michael Cera as Evan, Christopher Mintz-Plasse as Fogell/McLovin, Bill Hader as Officer Slater, Seth Rogen as Officer Michaels', '../assets/images/ratings/rating_4_6.png', 'Coming Soon', 5),
(104, '../assets/images/movie_posters/R_Tenet.png', 'Tenet', 'Science Fiction, Action, Thriller', '150 minutes', 'Tenet follows a protagonist armed with only one word—Tenet—as he fights for the survival of the world. Journeying through a twilight world of international espionage, he must navigate a mission that unfolds in something beyond real-time.', 'John David Washington as The Protagonist, Robert Pattinson as Neil, Elizabeth Debicki as Kat, Kenneth Branagh as Andrei Sator, Dimple Kapadia as Priya', '../assets/images/ratings/rating_4_0.png', 'Coming Soon', 5),
(105, '../assets/images/movie_posters/R_Terminator2JudgementDay.png', 'Terminator 2 ...', 'Action, Sci-Fi', '137 minutes', 'A decade after the events of the first film, a reprogrammed Terminator is sent back in time to protect young John Connor, the future leader of the human resistance, from a more advanced and relentless cyborg, the T-1000. Together with John\'s mother, Sarah Connor, they must prevent Judgment Day—the impending nuclear apocalypse.', 'Arnold Schwarzenegger as The Terminator, Linda Hamilton as Sarah Connor, Edward Furlong as John Connor, Robert Patrick as T-1000, Joe Morton as Dr. Miles Dyson', '../assets/images/ratings/rating_4_9.png', 'Coming Soon', 5),
(106, '../assets/images/movie_posters/R_TheDescent.png', 'The Descent', 'Horror, Adventure', '99 minutes', 'A year after a tragic accident, six women reunite for a caving expedition in the Appalachian Mountains. Deep within the uncharted cave system, they become trapped and soon discover they are not alone, facing a race against time and creatures lurking in the darkness.', 'Shauna Macdonald as Sarah, Natalie Mendoza as Juno, Alex Reid as Beth, Saskia Mulder as Rebecca, MyAnna Buring as Sam', '../assets/images/ratings/rating_4_1.png', 'Coming Soon', 5),
(107, '../assets/images/movie_posters/R_TheEqualizer.png', 'The Equalizer', 'Action, Crime, Thriller', '132 minutes', 'Robert McCall, a former black-ops operative, seeks a quiet life in Boston. However, when he meets Teri, a young woman under the control of ultra-violent Russian gangsters, he can\'t stand idly by. Armed with hidden skills, McCall emerges from self-imposed retirement to exact justice for the helpless.', 'Denzel Washington as Robert McCall, Marton Csokas as Teddy, Chloë Grace Moretz as Teri, David Harbour as Masters, Melissa Leo as Susan Plummer', '../assets/images/ratings/rating_4_6.png', 'Coming Soon', 5),
(108, '../assets/images/movie_posters/R_TheHangover.png', 'The Hangover', 'Comedy', '100 minutes', 'Before Doug\'s wedding, he and his three friends travel to Las Vegas for a bachelor party. After a night of wild partying, they wake up with no memory of the previous night and discover Doug is missing. With little time before the wedding, the trio retraces their steps to find their friend, encountering a series of bizarre and hilarious situations.', 'Bradley Cooper as Phil Wenneck, Ed Helms as Stu Price, Zach Galifianakis as Alan Garner, Justin Bartha as Doug Billings, Ken Jeong as Mr. Chow', '../assets/images/ratings/rating_4_7.png', 'Coming Soon', 5),
(109, '../assets/images/movie_posters/R_TheInvisibleMan.png', 'The Invisible Man', 'Horror, Sci-Fi, Thriller', '124 minutes', 'After escaping an abusive relationship with a wealthy tech entrepreneur, Cecilia believes she is free when she hears of his apparent suicide. However, she begins to experience a series of inexplicable events, leading her to suspect that her ex is not truly gone and has found a way to become invisible to stalk and terrorize her.', 'Elisabeth Moss as Cecilia Kass, Aldis Hodge as James Lanier, Storm Reid as Sydney Lanier, Harriet Dyer as Emily Kass, Oliver Jackson-Cohen as Adrian Griffin', '../assets/images/ratings/rating_3_9.png', 'Coming Soon', 5),
(110, '../assets/images/movie_posters/R_TheNiceGuys.png', 'The Nice Guys', 'Action, Comedy, Crime', '116 minutes', 'Set in 1977 Los Angeles, private investigator Holland March and enforcer Jackson Healy team up to investigate the disappearance of a young woman named Amelia. Their investigation uncovers a conspiracy involving the death of a porn star, leading them through a labyrinth of intrigue and danger.', 'Russell Crowe as Jackson Healy, Ryan Gosling as Holland March, Angourie Rice as Holly March, Margaret Qualley as Amelia Kuttner, Kim Basinger as Judith Kuttner', '../assets/images/ratings/rating_4_1.png', 'Coming Soon', 5);

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` int(11) NOT NULL,
  `movie_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `cinema_table` varchar(50) DEFAULT NULL,
  `seats` varchar(255) DEFAULT NULL,
  `price_per_ticket` decimal(10,2) DEFAULT NULL,
  `tickets` int(11) DEFAULT NULL,
  `total_price` decimal(10,2) DEFAULT NULL,
  `booking_date` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cinemas`
--

CREATE TABLE `cinemas` (
  `id` int(11) NOT NULL,
  `cinema_name` varchar(999) NOT NULL,
  `location` varchar(999) DEFAULT NULL,
  `cinema_image` varchar(999) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cinemas`
--

INSERT INTO `cinemas` (`id`, `cinema_name`, `location`, `cinema_image`) VALUES
(1, 'Cinema 1', '3rd Floor Room 1', '../assets/images/cinemas/cinema1.png'),
(2, 'Cinema 2', '3rd Floor Room 2', '../assets/images/cinemas/cinema2.png'),
(3, 'Cinema 3', '3rd Floor Room 3', '../assets/images/cinemas/cinema3.png'),
(4, 'Cinema 4', '3rd Floor Room 4', '../assets/images/cinemas/cinema4.png'),
(5, 'Cinema 5', '3rd Floor Room 5', '../assets/images/cinemas/cinema5.png');

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `id` int(11) NOT NULL,
  `image` varchar(999) DEFAULT NULL,
  `title` varchar(999) DEFAULT NULL,
  `genre` varchar(999) DEFAULT NULL,
  `duration` varchar(999) DEFAULT NULL,
  `synopsis` varchar(999) DEFAULT NULL,
  `casts` varchar(999) DEFAULT NULL,
  `rating` varchar(999) DEFAULT NULL,
  `status` enum('Now Showing','Popular Movies','Coming Soon') DEFAULT NULL,
  `cinema_number` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`id`, `image`, `title`, `genre`, `duration`, `synopsis`, `casts`, `rating`, `status`, `cinema_number`) VALUES
(1, '../assets/images/movie_posters/G_PrideAndPrejudice.png', 'Pride And Prejudice', 'Romance, Drama', '127 minutes', 'Set in early 19th-century England, the independent and witty Elizabeth Bennet navigates issues of class, marriage, and societal expectations. When she meets tproud and wealthy Mr. Darcy, their initial misunderstandings and prejudices threaten to keep them apart—until they realize their true feelings for each other.', 'Joe Wright, Deborah Moggach (screenplay), Jane Austen (novel), Tim Bevan, Eric Fellner, Paul Webster', '../assets/images/ratings/rating_4_6.png', 'Now Showing', 1),
(2, '../assets/images/movie_posters/PG_500DaysOfSummer.png', '500 Days of Summer', 'Romance, Comedy, Drama', '95 minutes', 'Tom Hansen, a hopeless romantic, falls deeply in love with Summer Finn, a free-spirited woman who doesnt believe in love. As their relationship unfolds innonlinear fashion, Tom reflects on their 500 days together, trying to understand where things went wrong and what love truly means.', 'Marc Webb, Scott Neustadter, Michael H. Weber, Mark Waters, Jessica Tuchinsky, Mason Novick, Steven J. Wolfe, Joseph Gordon-Levitt as Tom Hansen, Zooey Deschanas Summer Finn, Geoffrey Arend as McKenzie, Chloë Grace Moretz as Rachel Hansen, Matthew Gray Gubler as Paul', '../assets/images/ratings/rating_4_5.png', 'Now Showing', 1),
(3, '../assets/images/movie_posters/PG_AboutTime.png', 'About Time', 'Romance, Comedy, Drama, Fantasy', '123 minutes', 'When Tim Lake turns 21, he discovers that the men in his family have the ability to travel through time. Using this gift, he tries to improve his life and wthe heart of Mary, the woman he loves. However, as he alters moments in time, he learns that some things—especially love and family—are beyond his control.', 'Domhnall Gleeson as Tim Lake, Rachel McAdams as Mary, Bill Nighy as James Lake, Lydia Wilson as Kit Kat, Tom Hollander as Harry', '../assets/images/ratings/rating_4_8.png', 'Now Showing', 1),
(4, '../assets/images/movie_posters/PG_AlwaysBeMyMaybe.png', 'Always Be My Maybe', 'Romantic Comedy', '102 minutes', 'Childhood friends Sasha Tran and Marcus Kim lose touch after a teenage fling ends badly. Sixteen years later, Sasha, now a celebrity chef, returns to SFrancisco to open a new restaurant and unexpectedly reconnects with Marcus, a local musician still living at home. As old sparks reignite, they must navigate tdifferences in their lifestyles to see if they can make their relationship work this time around.', 'Ali Wong as Sasha Tran, Randall Park as Marcus Kim, James Saito as Harry Kim, Michelle Buteau as Veronica, Keanu Reeves as Himself', '../assets/images/ratings/rating_4_3.png', 'Now Showing', 1),
(5, '../assets/images/movie_posters/PG_AQuietPlace.png', 'A Quiet Place', 'Horror, Sci-Fi, Thriller', '90 minutes', 'In a post-apocalyptic world, a family is forced to live in silence to avoid blind creatures with an acute sense of hearing that hunt by sound. Communicatithrough sign language and careful movements, they strive to survive in this tense and silent existence.', 'Emily Blunt as Evelyn Abbott, John Krasinski as Lee Abbott, Millicent Simmonds as Regan Abbott, Noah Jupe as Marcus Abbott, Cade Woodward as Beau Abbott', '../assets/images/ratings/rating_4_3.png', 'Now Showing', 1),
(6, '../assets/images/movie_posters/PG_Arrival.png', 'Arrival', 'Science Fiction, Drama', '116 minutes', 'A linguist is recruited by the military to communicate witalien lifeforms after twelve mysterious spacecraft appear around the world.', 'Amy Adams as Dr. Louise Banks, Jeremy Renner as Ian Donnelly, Forest Whitaker aColonel Weber, Michael Stuhlbarg as Agent Halpern', '../assets/images/ratings/rating_4_4.png', 'Now Showing', 1),
(7, '../assets/images/movie_posters/PG_Avatar.png', 'Avatar', 'Science, Fiction, Adventure', '162 minutes', 'In the 22nd century, paraplegic Marine Jake Sully is sent to the moon Pandora on a unique mission. He becomes torn between following his orders and protecting the world he feels is his home.', 'Sam Worthington as Jake Sully, Zoe Saldana as Neytiri, Sigourney Weaver as Dr. Grace Augustine, Stephen Lang as Colonel Miles Quaritch, Giovanni Ribisi as Parker Selfridge', '../assets/images/ratings/rating_4_6.png', 'Popular Movies', 1),
(8, '../assets/images/movie_posters/PG_Avatar_TheWayOfWater.png', 'Avatar: The Way of Water', 'Science Fiction, Adventure', '192 minutes', 'Set more than a decade after the events of the first film, Jake Sully and Neytiri have formed a family on Pandora. When a familiar threat returns, they must work together with the Na`vi race to protect their home.', 'Sam Worthington as Jake Sully, Zoe Saldana as Neytiri, Sigourney Weaver as Kiri, Stephen Lang as Colonel Miles Quaritch, Kate Winslet as Ronal', '../assets/images/ratings/rating_4_3.png', 'Popular Movies', 1),
(9, '../assets/images/movie_posters/PG_AWalkToRemember.png', 'A Walk To Remember', 'Romance, Drama', '101 minutes', 'Landon Carter, a rebellious high school senior, is forced to participate in community service after a prank goes wrong. There, he meets Jamie Sullivan, a kind and deeply religious girl. As their unexpected romance blooms, Landon discovers the true meaning of love, faith, and sacrifice, changing his life forever.', 'Mandy Moore as Jamie Sullivan, Shane West as Landon Carter, Peter Coyote as Reverend Sullivan, Daryl Hannah as Cynthia Carter', '../assets/images/ratings/rating_4_7.png', 'Popular Movies', 1),
(10, '../assets/images/movie_posters/PG_CrazyRichAsians.png', 'Crazy Rich Asians', 'Romance, Comedy, Drama', '120 minutes', 'Rachel Chu, a Chinese-American professor, travels to Singapore with her boyfriend, Nick Young, only to discover that he comes from one of the wealthiest families in Asia. As she navigates the extravagant world of the elite, she faces disapproval from Nick`s powerful mother and learns what it truly means to be part of his world.', 'Constance Wu as Rachel Chu, Henry Golding as Nick Young, Michelle Yeoh as Eleanor Young, Gemma Chan as Astrid Leong, Awkwafina as Peik Lin Goh', '../assets/images/ratings/rating_4_5.png', 'Popular Movies', 1),
(11, '../assets/images/movie_posters/PG_DearJohn.png', 'Dear John', 'Romance, Drama', '108 minutes', 'While on leave from the Army, John Tyree meets Savannah Curtis, a college student, and they quickly fall in love. Their relationship is tested when John is deployed overseas, and they maintain their bond through heartfelt letters. However, time and distance challenge their love in ways they never expected.', 'Channing Tatum as John Tyree, Amanda Seyfried as Savannah Curtis, Richard Jenkins as Mr. Tyree, Henry Thomas as Tim Wheddon, Scott Porter as Randy', '../assets/images/ratings/rating_4_0.png', 'Popular Movies', 1),
(12, '../assets/images/movie_posters/PG_DoctorStrange.png', 'Doctor Strange', 'Fantasy, Action, Superhero', '115 minutes', 'After a career-ending accident, brilliant neurosurgeon Dr. Stephen Strange seeks healing in the mystical world of Kamar-Taj. Under the guidance of the Ancient One, he learns powerful magic and becomes the Sorcerer Supreme, defending Earth from dark forces beyond reality.', 'Benedict Cumberbatch as Dr. Stephen Strange, Tilda Swinton as The Ancient One, Chiwetel Ejiofor as Karl Mordo, Rachel McAdams as Christine Palmer, Mads Mikkelsen as Kaecilius, Benedict Wong as Wong', '../assets/images/ratings/rating_4_4.png', 'Popular Movies', 1),
(13, '../assets/images/movie_posters/PG_DragMeToHell.png', 'Drag Me To Hell', 'Horror, Thriller', '99 minutes', 'Ambitious loan officer Christine Brown denies an elderly woman an extension on her mortgage, aiming to impress her boss. In retaliation, the woman places a curse on Christine, subjecting her to three days of escalating supernatural torment before she is destined to be dragged to hell. Desperate, Christine seeks help to break the curse before her time runs out.', 'Alison Lohman as Christine Brown, Justin Long as Clay Dalton, Lorna Raver as Sylvia Ganush, Dileep Rao as Rham Jas, David Paymer as Mr. Jacks', '../assets/images/ratings/rating_3_8.png', 'Coming Soon', 1),
(14, '../assets/images/movie_posters/PG_Dune.png', 'Dune', 'Science Fiction, Adventure', '155 minutes', 'Based on Frank Herbert`s seminal novel, Dune follows Paul Atreides, a young nobleman whose family assumes control of the desert planet Arrakis. As the sole source of the universe`s most valuable substance, spice, control of Arrakis is highly contested. Betrayal and political intrigue ensue, leading Paul on a journey that will determine the fate of his family and the planet.', 'Timothée Chalamet as Paul Atreides, Rebecca Ferguson as Lady Jessica, Oscar Isaac as Duke Leto Atreides, Zendaya as Chani, Jason Momoa as Duncan Idaho, Stellan Skarsgård as Baron Vladimir Harkonnen', '../assets/images/ratings/rating_4_0.png', 'Coming Soon', 1),
(15, '../assets/images/movie_posters/PG_DunePartTwo.png', 'Dune Part Two', 'Science Fiction, Adventure', '180 minutes', 'Continuing the epic saga, Dune: Part Two delves deeper into Paul Atreides` journey as he allies with the Fremen to avenge his family and prevent a catastrophic future only he can foresee. The film explores themes of destiny, politics, and the human spirit`s resilience.', 'Timothée Chalamet as Paul Atreides, Zendaya as Chani, Rebecca Ferguson as Lady Jessica, Josh Brolin as Gurney Halleck, Austin Butler as Feyd-Rautha, Florence Pugh as Princess Irulan', '../assets/images/ratings/rating_4_5.png', 'Coming Soon', 1),
(16, '../assets/images/movie_posters/PG_DungeonsAndDragons_HonorAmongThieves.png', 'Dungeons & Dragons: Honor Among Thieves', 'Fantasy, Adventure, Action', '134 minutes', 'A charming thief and his ragtag band of adventurers embark on a daring heist to retrieve a lost relic. However, their mission takes an unexpected turn when they face deadly enemies and uncover a dark conspiracy that threatens the entire world.', 'Chris Pine as Edgin Darvis, Michelle Rodriguez as Holga Kilgore, Regé-Jean Page as Xenk Yendar, Justice Smith as Simon Aumar, Sophia Lillis as Doric, Hugh Grant as Forge Fitzwilliam', '../assets/images/ratings/rating_4_4.png', 'Coming Soon', 1),
(17, '../assets/images/movie_posters/PG_EdgeOfTomorrow.png', 'Edge Of Tomorrow', 'Science Fiction, Action', '113 minutes', 'In the near future, Major William Cage, an untrained soldier, is thrown into a time loop during humanity`s war against an invading alien race. He repeatedly fights and dies, becoming more skilled with each iteration. With the help of Sergeant Rita Vrataski, he seeks to use his unique situation to end the war.', 'Tom Cruise as Major William Cage, Emily Blunt as Sergeant Rita Vrataski, Bill Paxton as Master Sergeant Farell, Brendan Gleeson as General Brigham', '../assets/images/ratings/rating_4_7.png', 'Coming Soon', 1),
(18, '../assets/images/movie_posters/PG_EverythingEverywhereAllAtOnce.png', 'Everything Everywhere All at Once', 'Absurdist Comedy-Drama, Science Fiction', '139 minutes', 'Evelyn Quan Wang, a Chinese-American immigrant, discovers that she must connect with parallel universe versions of herself to prevent a powerful being from destroying the multiverse.', 'Michelle Yeoh as Evelyn Quan Wang, Stephanie Hsu as Joy Wang, Ke Huy Quan as Waymond Wang, James Hong as Gong Gong, Jamie Lee Curtis as Deirdre Beaubeirdre', '../assets/images/ratings/rating_3_9.png', 'Coming Soon', 1),
(19, '../assets/images/movie_posters/PG_ExMachina.png', 'Ex Machina', 'Science Fiction, Thriller', '108 minutes', 'A young programmer is selected to participate in a groundbreaking experiment in synthetic intelligence by evaluating the human qualities of a highly advanced humanoid A.I.', 'Domhnall Gleeson as Caleb Smith, Alicia Vikander as Ava, Oscar Isaac as Nathan Bateman, Sonoya Mizuno as Kyoko', '../assets/images/ratings/rating_3_9.png', 'Coming Soon', 1),
(20, '../assets/images/movie_posters/PG_Gravity.png', 'Gravity', 'Science Fiction, Thriller', '91 minutes', 'Two astronauts work together to survive after an accident leaves them stranded in space.', 'Sandra Bullock as Dr. Ryan Stone, George Clooney as Matt Kowalski', '../assets/images/ratings/rating_3_9.png', 'Coming Soon', 1),
(21, '../assets/images/movie_posters/PG_HarryPotterAndTheDeathlyHallows_Part1.png', 'Harry Potter and the Deathly Hallows: Part 1', 'Fantasy, Adventure, Family', '146 minutes', 'Harry, Ron, and Hermione set out on a dangerous mission to find and destroy Voldemort`s Horcruxes. As they evade the Death Eaters and uncover hidden secrets, their friendship is tested like never before. With Hogwarts no longer safe, the battle for the wizarding world looms closer.', 'Daniel Radcliffe as Harry Potter, Rupert Grint as Ron Weasley, Emma Watson as Hermione Granger, Ralph Fiennes as Lord Voldemort, Helena Bonham Carter as Bellatrix Lestrange, Alan Rickman as Severus Snape, Bill Nighy as Rufus Scrimgeour', '../assets/images/ratings/rating_4_8.png', 'Coming Soon', 1),
(22, '../assets/images/movie_posters/PG_HarryPotterAndTheDeathlyHollows_Part2.png', 'Harry Potter and the Deathly Hallows: Part 2', 'Fantasy, Adventure, Family', '130 minutes', 'The final battle between good and evil erupts at Hogwarts as Harry Potter faces Lord Voldemort in an epic showdown. With the fate of the wizarding world at stake, Harry must make the ultimate sacrifice to end Voldemort`s reign once and for all.', 'Daniel Radcliffe as Harry Potter, Rupert Grint as Ron Weasley, Emma Watson as Hermione Granger, Ralph Fiennes as Lord Voldemort, Helena Bonham Carter as Bellatrix Lestrange, Alan Rickman as Severus Snape, Maggie Smith as Minerva McGonagall', '../assets/images/ratings/rating_4_8.png', 'Coming Soon', 1),
(23, '../assets/images/movie_posters/PG_HarryPotterAndTheGobletOfFire.png', 'Harry Potter and the Goblet of Fire', 'Fantasy, Adventure, Family', '157 minutes', 'Harry unexpectedly becomes a competitor in the dangerous Triwizard Tournament, where he faces deadly challenges alongside wizards from other schools. As Voldemort’s return looms closer, Harry must survive the tournament and prepare for the battle ahead.', 'Daniel Radcliffe as Harry Potter, Rupert Grint as Ron Weasley, Emma Watson as Hermione Granger, Ralph Fiennes as Lord Voldemort, Brendan Gleeson as Alastor Mad-Eye Moody, Robert Pattinson as Cedric Diggory, Stanislav Yanevski as Viktor Krum', '../assets/images/ratings/rating_4_7.png', 'Now Showing', 2),
(24, '../assets/images/movie_posters/PG_HarryPotterAndTheHalfBloofPrince.png', 'Harry Potter Half Blood', 'Fantasy, Adventure, Family', '153 minutes', 'As Voldemort tightens his grip on the wizarding and Muggle worlds, Harry Potter discovers an old Potions textbook belonging to the mysterious Half-Blood Prince. Meanwhile, Dumbledore guides Harry through memories of Tom Riddle’s past, preparing him for the ultimate battle ahead.', 'Daniel Radcliffe as Harry Potter, Rupert Grint as Ron Weasley, Emma Watson as Hermione Granger, Michael Gambon as Albus Dumbledore, Alan Rickman as Severus Snape, Tom Felton as Draco Malfoy, Jim Broadbent as Horace Slughorn', '../assets/images/ratings/rating_4_7.png', 'Now Showing', 2),
(25, '../assets/images/movie_posters/PG_HarryPotterAndTheOrderOfThePhoenix.png', 'Harry Potter And The', 'Fantasy, Adventure, Family', '138 minutes', 'As Voldemort’s return is denied by the Ministry of Magic, Harry and his friends form Dumbledore’s Army to secretly train in Defense Against the Dark Arts. Meanwhile, the oppressive Dolores Umbridge takes over Hogwarts, making Harry’s fifth year one of the most challenging yet.', 'Daniel Radcliffe as Harry Potter, Rupert Grint as Ron Weasley, Emma Watson as Hermione Granger, Imelda Staunton as Dolores Umbridge, Gary Oldman as Sirius Black, Helena Bonham Carter as Bellatrix Lestrange, Alan Rickman as Severus Snape', '../assets/images/ratings/rating_4_7.png', 'Now Showing', 2),
(26, '../assets/images/movie_posters/PG_HarryPotterAndThePhilosophersStone.png', 'Harry Potter And The', 'Fantasy, Adventure, Family', '152 minutes', 'On his 11th birthday, Harry Potter discovers he is a wizard and is invited to attend Hogwarts School of Witchcraft and Wizardry. As he learns magic and makes new friends, he uncovers the mystery of the Sorcerer’s Stone, which holds the key to immortality—and is being sought after by the dark wizard Voldemort.', 'Daniel Radcliffe as Harry Potter, Rupert Grint as Ron Weasley, Emma Watson as Hermione Granger, Richard Harris as Albus Dumbledore, Maggie Smith as Minerva McGonagall, Alan Rickman as Severus Snape, Robbie Coltrane as Rubeus Hagrid', '../assets/images/ratings/rating_4_8.png', 'Now Showing', 2),
(27, '../assets/images/movie_posters/PG_HarryPotterAndThePrisonerOfAzkaban.png', 'Harry Potter And The', 'Fantasy, Adventure, Family', '142 minutes', 'In his third year at Hogwarts, Harry learns that Sirius Black, a dangerous prisoner, has escaped from Azkaban and is believed to be hunting him. As he uncovers the truth about his parents’ past, Harry must confront Dementors, time travel, and shocking revelations about his own destiny.', 'Daniel Radcliffe as Harry Potter, Rupert Grint as Ron Weasley, Emma Watson as Hermione Granger, Gary Oldman as Sirius Black, Michael Gambon as Albus Dumbledore, Alan Rickman as Severus Snape, David Thewlis as Remus Lupin', '../assets/images/ratings/rating_4_8.png', 'Now Showing', 2),
(28, '../assets/images/movie_posters/PG_Inception.png', 'Inception', 'Science Fiction, Action, Thriller', '148 minutes', 'Dom Cobb is a skilled thief who specializes in stealing secrets from deep within the subconscious through dream-sharing technology. Given a chance to have his criminal record erased, he must accomplish the impossible: implanting an idea into someone\'s mind. However, his past threatens to unravel the mission from within.', 'Leonardo DiCaprio as Dom Cobb, Joseph Gordon-Levitt as Arthur, Ellen Page (Elliot Page) as Ariadne, Tom Hardy as Eames, Ken Watanabe as Saito, Cillian Murphy as Robert Fischer, Marion Cotillard as Mal', '../assets/images/ratings/rating_4_8.png', 'Now Showing', 2),
(29, '../assets/images/movie_posters/PG_Interstellar.png', 'Interstellar', 'Science Fiction, Drama, Adventure', '169 minutes', 'In a future where Earth is becoming uninhabitable, a group of astronauts embarks on a journey through a wormhole in search of a new home for humanity. As they battle time dilation, cosmic dangers, and personal sacrifices, former NASA pilot Cooper must make impossible choices to save his family and the human race.', 'Matthew McConaughey as Cooper, Anne Hathaway as Dr. Amelia Brand, Jessica Chastain as Murph, Michael Caine as Professor Brand, Mackenzie Foy as Young Murph, Casey Affleck as Tom', '../assets/images/ratings/rating_4_9.png', 'Popular Movies', 2),
(30, '../assets/images/movie_posters/PG_LaLaLand.png', 'La La Land', 'Romance, Musical, Drama', '128 minutes', 'In Los Angeles, aspiring actress Mia and jazz musician Sebastian fall deeply in love while chasing their dreams. As they navigate the struggles of their respective careers, their relationship is tested by ambition, success, and the sacrifices required to achieve greatness.', 'Ryan Gosling as Sebastian Wilder, Emma Stone as Mia Dolan, John Legend as Keith, Rosemarie DeWitt as Laura Wilder, J.K. Simmons as Bill', '../assets/images/ratings/rating_4_4.png', 'Popular Movies', 2),
(31, '../assets/images/movie_posters/PG_LittleWomen.png', 'Little Women', 'Drama, Romance', '135 minutes', 'Based on Louisa May Alcott\'s classic novel, Little Women follows the lives of the four March sisters—Jo, Meg, Beth, and Amy—as they come of age during the aftermath of the American Civil War. The story explores their personal ambitions, relationships, and the societal pressures they face, highlighting themes of love, family, and the pursuit of one\'s dreams.', 'Saoirse Ronan as Jo March, Emma Watson as Meg March, Florence Pugh as Amy March, Eliza Scanlen as Beth March, Timothée Chalamet as Theodore Laurie Laurence', '../assets/images/ratings/rating_4_2.png', 'Popular Movies', 2),
(32, '../assets/images/movie_posters/PG_MatrixReloaded.png', 'The Matrix Reloaded', 'Science Fiction, Action', '138 minutes', 'As Neo, Morpheus, and Trinity continue their battle against the machines, they learn of a looming attack on Zion. Neo must confront new enemies, unlock his true potential, and uncover the deeper truths behind the Matrix while facing the powerful Agent Smith, who has evolved beyond his programming.', 'Keanu Reeves as Neo, Laurence Fishburne as Morpheus, Carrie-Anne Moss as Trinity, Hugo Weaving as Agent Smith, Jada Pinkett Smith as Niobe, Monica Bellucci as Persephone', '../assets/images/ratings/rating_4_2.png', 'Popular Movies', 2),
(33, '../assets/images/movie_posters/PG_MatrixRevolutions.png', 'The Matrix Revolutions', 'Science Fiction, Action', '129 minutes', 'As the war between humans and machines reaches its climax, Neo embarks on a final journey to confront Agent Smith, who threatens to consume both the Matrix and the real world. Meanwhile, Zion braces for its last stand against the relentless onslaught of Sentinels, leading to a fateful showdown.', 'Keanu Reeves as Neo, Laurence Fishburne as Morpheus, Carrie-Anne Moss as Trinity, Hugo Weaving as Agent Smith, Jada Pinkett Smith as Niobe, Lambert Wilson as The Merovingian', '../assets/images/ratings/rating_3_8.png', 'Popular Movies', 2),
(34, '../assets/images/movie_posters/PG_MeBeforeYou.png', 'Me Before You', 'Romance, Drama', '110 minutes', 'Louisa Lou Clark, a cheerful and quirky young woman, takes a job as a caregiver for Will Traynor, a wealthy and cynical man left paralyzed after an accident. As they spend time together, their relationship blossoms into something life-changing, challenging both of them to see the world in a new light.', 'Emilia Clarke as Louisa Clark, Sam Claflin as Will Traynor, Janet McTeer as Camilla Traynor, Charles Dance as Steven Traynor, Matthew Lewis as Patrick', '../assets/images/ratings/rating_4_7.png', 'Popular Movies', 2),
(35, '../assets/images/movie_posters/PG_MissionPossibleFallout.png', 'Mission Impossible', 'Action, Adventure, Thriller', '147 minutes', 'Ethan Hunt and his IMF team join forces with CIA assassin August Walker to prevent a disaster of epic proportions. Arms dealer John Lark and a group of terrorists plan to use three plutonium cores for simultaneous nuclear attacks. When the weapons go missing, Ethan and his crew find themselves in a desperate race against time to prevent them from falling into the wrong hands.', 'Tom Cruise as Ethan Hunt, Henry Cavill as August Walker, Ving Rhames as Luther Stickell, Simon Pegg as Benji Dunn, Rebecca Ferguson as Ilsa Faust', '../assets/images/ratings/rating_4_7.png', 'Coming Soon', 2),
(36, '../assets/images/movie_posters/PG_PacificRim.png', 'Pacific Rim', 'Science Fiction, Action', '131 minutes', 'As a war between humankind and monstrous sea creatures wages on, a former pilot and a trainee are paired up to drive a seemingly obsolete special weapon in a desperate effort to save the world from the apocalypse.', 'Charlie Hunnam as Raleigh Becket, Idris Elba as Stacker Pentecost, Rinko Kikuchi as Mako Mori, Charlie Day as Dr. Newton Geiszler', '../assets/images/ratings/rating_4_6.png', 'Coming Soon', 2),
(37, '../assets/images/movie_posters/PG_PastLives.png', 'Past Lives', 'Romantic Drama', '106 minutes', 'Past Lives tells the story of Nora and Hae Sung, two deeply connected childhood friends who are separated after Nora\'s family emigrates from South Korea. Two decades later, they are reunited in New York for one fateful week as they confront notions of destiny, love, and the choices that make a life.', 'Greta Lee as Nora, Teo Yoo as Hae Sung, John Magaro as Arthur', '../assets/images/ratings/rating_4_2.png', 'Coming Soon', 2),
(38, '../assets/images/movie_posters/PG_PSILoveYou.png', 'P.S. I Love You', 'Romance, Drama', '126 minutes', 'After losing her husband, Gerry, to a terminal illness, Holly Kennedy struggles to move forward. However, on her 30th birthday, she receives the first of several letters Gerry wrote before his passing, designed to help her heal and embrace life again. As she follows his heartfelt instructions, Holly embarks on a journey of love, loss, and self-discovery.', 'Hilary Swank as Holly Kennedy, Gerard Butler as Gerry Kennedy, Lisa Kudrow as Denise, Harry Connick Jr. as Daniel, Jeffrey Dean Morgan as William', '../assets/images/ratings/rating_4_4.png', 'Coming Soon', 2),
(39, '../assets/images/movie_posters/PG_Stardust.png', 'Stardust', 'Fantasy, Adventure, Romance', '127 minutes', ' In a magical kingdom, a young man named Tristan embarks on a quest to retrieve a fallen star to win the heart of his beloved. However, the star is actually a celestial being named Yvaine, and Tristan soon finds himself caught between witches, princes, and sky pirates as he fights to protect her and discover his own destiny.', 'Charlie Cox as Tristan, Claire Danes as Yvaine, Michelle Pfeiffer as Lamia, Robert De Niro as Captain Shakespeare, Mark Strong as Septimus, Sienna Miller as Victoria', '../assets/images/ratings/rating_4_6.png', 'Coming Soon', 2),
(40, '../assets/images/movie_posters/PG_Taken.png', 'Taken', 'Action, Thriller', '90 minutes', 'A retired CIA operative travels across Europe to rescue his estranged daughter who has been kidnapped while on a trip to Paris.', 'Liam Neeson as Bryan Mills, Maggie Grace as Kim Mills, Famke Janssen as Lenore Mills, Leland Orser as Sam, Xander Berkeley as Stuart', '../assets/images/ratings/rating_4_7.png', 'Coming Soon', 2),
(41, '../assets/images/movie_posters/PG_TheBourneIdentity.png', 'The Bourne Identity', ' Action, Thriller', ' 119 minutes', 'A man suffering from amnesia is found adrift in the Mediterranean Sea. As he recovers, he discovers extraordinary combat and linguistic skills, but lacks any personal identity. Determined to uncover his true self, he embarks on a perilous journey, evading assassins and uncovering a covert CIA operation', 'Matt Damon as Jason Bourne, Franka Potente as Marie Kreutz, Chris Cooper as Alexander Conklin, Clive Owen as The Professor, Brian Cox as Ward Abbott', '../assets/images/ratings/rating_4_6.png', 'Coming Soon', 2),
(42, '../assets/images/movie_posters/PG_TheChroniclesOfNarnia.png', 'The Chronicles ...', 'Fantasy, Adventure, Family', '143 minutes', 'During World War II, four siblings—Lucy, Edmund, Susan, and Peter—discover a magical wardrobe that transports them to the land of Narnia. There, they join forces with the great lion Aslan to battle the evil White Witch and restore peace to the enchanted kingdom.', 'Georgie Henley as Lucy Pevensie, Skandar Keynes as Edmund Pevensie, Anna Popplewell as Susan Pevensie, William Moseley as Peter Pevensie, Tilda Swinton as White Witch, Liam Neeson as Aslan (voice)James McAvoy as Mr. Tumnus', '../assets/images/ratings/rating_4_7.png', 'Coming Soon', 2),
(43, '../assets/images/movie_posters/PG_TheCreator.png', 'The Creator', 'Science Fiction, Action, Thriller', '133 minutes', ' Set in a future where humans are at war with artificial intelligence, ex-special forces agent Joshua is recruited to eliminate the elusive architect of advanced AI, known as The Creator. His mission intensifies upon discovering that the weapon designed to end the conflict is an AI in the form of a young child.', 'John David Washington as Joshua, Gemma Chan as Maya, Ken Watanabe as Harun, Madeleine Yuna Voyles as Alphie, Allison Janney as Colonel Howell', '../assets/images/ratings/rating_3_7.png', 'Coming Soon', 2),
(44, '../assets/images/movie_posters/PG_TheDarkKnight.png', 'The Dark Knight', 'Action, Crime, Drama', '152 minutes', 'Batman continues his crusade against crime in Gotham City, with the assistance of Lieutenant Jim Gordon and District Attorney Harvey Dent. Their efforts are challenged by the emergence of the Joker, a criminal mastermind intent on plunging the city into chaos. As Batman faces his greatest psychological and physical tests, he must confront the fine line between heroism and vigilantism.', 'Christian Bale as Bruce Wayne / Batman, Heath Ledger as The Joker, Aaron Eckhart as Harvey Dent, Michael Caine as Alfred Pennyworth', '../assets/images/ratings/rating_4_9.png', 'Coming Soon', 2),
(45, '../assets/images/movie_posters/PG_TheFaultInOurStars.png', 'The Fault In Our Stars', 'Romance, Drama', '126 minutes', 'Hazel Grace Lancaster, a teenager battling cancer, meets Augustus Waters at a support group, and the two form a deep, life-changing connection. As they embark on a journey filled with love, humor, and heartbreak, they navigate the realities of illness while making the most of every moment they have together.', 'Shailene Woodley as Hazel Grace Lancaster, Ansel Elgort as Augustus Waters, Nat Wolff as Isaac, Laura Dern as Frannie Lancaster, Willem Dafoe as Peter Van Houten', '../assets/images/ratings/rating_4_8.png', 'Now Showing', 3),
(46, '../assets/images/movie_posters/PG_TheGrandBudapest.png', 'The Grand Budapest', 'Comedy, Drama', '99 minutes', 'In the 1930s, renowned concierge Gustave H. befriends a young lobby boy named Zero at the Grand Budapest Hotel. Their lives take a dramatic turn when Gustave is framed for murder and embarks on a thrilling adventure involving a stolen painting, a vast family fortune, and a world on the brink of war.', 'Ralph Fiennes as Gustave H., Tony Revolori as Zero Moustafa, Adrien Brody as Dmitri, Saoirse Ronan as Agatha, Willem Dafoe as J.G. Jopling, Tilda Swinton as Madame D.', '../assets/images/ratings/rating_4_7.png', 'Now Showing', 3),
(47, '../assets/images/movie_posters/PG_TheHobbit_AnUnexpectedJourney.png', 'The Hobbit An Unexpected Journey', 'Fantasy, Adventure', '169 minutes', 'Young Bilbo Baggins is unexpectedly swept into an epic quest to reclaim the lost Dwarven kingdom of Erebor from the dragon Smaug. Guided by the wizard Gandalf, Bilbo joins a company of dwarves led by Thorin Oakenshield. Along the way, he encounters trolls, goblins, and the creature Gollum, where he unknowingly acquires the One Ring.', 'Martin Freeman as Bilbo Baggins, Ian McKellen as Gandalf, Richard Armitage as Thorin Oakenshield, Andy Serkis as Gollum, Cate Blanchett as Galadriel, Hugo Weaving as Elrond, Christopher Lee as Saruman', '../assets/images/ratings/rating_4_7.png', 'Now Showing', 3),
(48, '../assets/images/movie_posters/PG_TheHobbit_TheDesolationOfSmaug.png', 'The Hobbit The Desolation Of Smaug', 'Fantasy, Adventure', '161 minutes', 'Bilbo Baggins continues his journey with Thorin Oakenshield and his company of dwarves as they head toward the Lonely Mountain. Along the way, they face deadly creatures, encounter the mysterious Elf King Thranduil, and reach Erebor, where Bilbo comes face-to-face with the fearsome dragon, Smaug. Meanwhile, dark forces stir across Middle-earth.', 'Martin Freeman as Bilbo Baggins, Ian McKellen as Gandalf, Richard Armitage as Thorin Oakenshield, Benedict Cumberbatch as Smaug (voice), Orlando Bloom as Legolas, Evangeline Lilly as Tauriel, Lee Pace as Thranduil', '../assets/images/ratings/rating_4_6.png', 'Now Showing', 3),
(49, '../assets/images/movie_posters/PG_TheHobbit.png', 'The Hobbit', 'Fantasy, Adventure', '144 minutes', 'The journey reaches its climax as the battle for Erebor erupts. Thorin, consumed by greed, risks everything to defend his reclaimed homeland, while forces of men, elves, dwarves, and orcs clash in an epic war. As Bilbo struggles to bring peace, the fate of Middle-earth hangs in the balance.', 'Martin Freeman as Bilbo Baggins, Ian McKellen as Gandalf, Richard Armitage as Thorin Oakenshield, Luke Evans as Bard the Bowman, Evangeline Lilly as Tauriel, Orlando Bloom as Legolas, Lee Pace as Thranduil', '../assets/images/ratings/rating_4_4.png', 'Now Showing', 3),
(50, '../assets/images/movie_posters/PG_TheLordOfTheRings_TheFellowshipOfTheRing.png', 'The Lord of the Rings: The Fellowship of the Ring', 'Fantasy, Adventure, Action', '178 minutes', 'Synopsis: The fate of Middle-earth lies in the hands of Frodo Baggins, a young hobbit who inherits the One Ring—an ancient artifact of immense power. With the help of the Fellowship, including Gandalf, Aragorn, and Legolas, Frodo embarks on a perilous journey to destroy the Ring in the fires of Mount Doom before the dark lord Sauron can reclaim it.', 'Elijah Wood as Frodo Baggins, Ian McKellen as Gandalf, Viggo Mortensen as Aragorn, Sean Astin as Samwise Gamgee, Orlando Bloom as Legolas, Cate Blanchett as Galadriel, Christopher Lee as Saruman', '../assets/images/ratings/rating_4_8.png', 'Now Showing', 3),
(51, '../assets/images/movie_posters/PG_TheLordOfTheRings_TheReturnOfTheKing.png', 'The Lord Of The Rings The Return Of The King', 'Fantasy, Adventure, Action', '201 minutes', 'The epic conclusion to the battle for Middle-earth sees Frodo and Sam nearing Mount Doom, struggling under the Ring’s growing burden. Meanwhile, Aragorn leads the armies of men against Sauron’s forces in Gondor. As hope and courage are tested, the fate of the world hangs in the balance.', 'Elijah Wood as Frodo Baggins, Ian McKellen as Gandalf the White, Viggo Mortensen as Aragorn, Sean Astin as Samwise Gamgee, Orlando Bloom as Legolas, Andy Serkis as Gollum, Liv Tyler as Arwen', '../assets/images/ratings/rating_4_9.png', 'Popular Movies', 3),
(52, '../assets/images/movie_posters/PG_TheLordOfTheRings_TheTwoTowers.png', 'The Lord Of The Rings The Two Towers', 'Fantasy, Adventure, Action', '179 minutes', 'The Fellowship has been broken, and Frodo and Sam continue their journey to Mordor, guided by the creature Gollum. Meanwhile, Aragorn, Legolas, and Gimli fight to protect Rohan from the forces of Saruman. As war looms, alliances are tested, and the battle for Middle-earth intensifies.', 'Elijah Wood as Frodo Baggins, Ian McKellen as Gandalf the White, Viggo Mortensen as Aragorn, Sean Astin as Samwise Gamgee, Andy Serkis as Gollum, Miranda Otto as Éowyn, Karl Urban as Éomer', '../assets/images/ratings/rating_4_8.png', 'Popular Movies', 3),
(53, '../assets/images/movie_posters/PG_TheMartian.png', 'The Martian', 'Science Fiction, Adventure, Drama', '144 minutes', 'Astronaut Mark Watney is presumed dead and left behind on Mars after a fierce storm. With limited supplies, he must rely on his ingenuity and spirit to survive and find a way to signal to Earth that he is alive.', 'Matt Damon as Mark Watney, Jessica Chastain as Melissa Lewis, Kristen Wiig as Annie Montrose, Jeff Daniels as Teddy Sanders, Michael Peña as Rick Martinez', '../assets/images/ratings/rating_4_7.png', 'Popular Movies', 3),
(54, '../assets/images/movie_posters/PG_TheNotebook.png', 'The Notebook', 'Romance, Drama', '123 minutes', 'In the 1940s, a young couple, Noah and Allie, fall deeply in love despite coming from different social backgrounds. However, circumstances and societal pressures pull them apart. Years later, their love story is recounted from an old notebook by an elderly man to a woman in a nursing home, revealing a tale of enduring passion, fate, and memory.', 'Ryan Gosling as Noah Calhoun, Rachel McAdams as Allie Hamilton, James Garner as Older Noah, Gena Rowlands as Older Allie, Joan Allen as Anne Hamilton', '../assets/images/ratings/rating_4_7.png', 'Popular Movies', 3),
(55, '../assets/images/movie_posters/PG_TheOtherGuys.png', 'The Other Guys', 'Action, Comedy', '107 minutes', 'Detectives Allen Gamble and Terry Hoitz are desk-bound cops overshadowed by the department\'s top officers. When an opportunity arises, they step up to tackle a high-profile case, leading to unexpected and hilarious consequences.', 'Will Ferrell as Detective Allen Gamble, Mark Wahlberg as Detective Terry Hoitz, Eva Mendes as Dr. Sheila Gamble, Michael Keaton as Captain Gene Mauch, Steve Coogan as David Ershon', '../assets/images/ratings/rating_4_7.png', 'Popular Movies', 3),
(56, '../assets/images/movie_posters/PG_TheRing.png', 'The Ring', 'Horror, Mystery', '115 minutes', 'In Seattle, journalist Rachel Keller investigates a mysterious videotape that allegedly causes the death of anyone who watches it seven days later. After viewing the tape herself, Rachel experiences unsettling phenomena and races against time to uncover the truth behind the curse to save herself and her son.', 'Naomi Watts as Rachel Keller, Martin Henderson as Noah Clay, David Dorfman as Aidan Keller, Brian Cox as Richard Morgan, Daveigh Chase as Samara Morgan', '../assets/images/ratings/rating_4_1.png', 'Popular Movies', 3),
(57, '../assets/images/movie_posters/PG_TheVow.png', 'The Vow', 'Romance, Drama', '104 minutes', 'After a car accident leaves Paige with severe memory loss, she no longer remembers her husband, Leo, or their life together. Determined to win her heart again, Leo embarks on a journey to make her fall in love with him all over again, despite the obstacles standing in their way.', 'Rachel McAdams as Paige Collins, Channing Tatum as Leo Collins, Sam Neill as Bill Thornton, Jessica Lange as Rita Thornton, Scott Speedman as Jeremy', '../assets/images/ratings/rating_4_5.png', 'Coming Soon', 3),
(58, '../assets/images/movie_posters/PG_ToAllTheBoysIveLoveBefore.png', 'To All The Boys I\'ve Love Before', 'Romance, Comedy, Drama', '99 minutes', 'Lara Jean Covey’s secret love letters to her past crushes are accidentally sent out, turning her quiet high school life upside down. To avoid embarrassment, she strikes a deal with one of the recipients, Peter Kavinsky, to pretend they are dating—only for real feelings to develop along the way.', 'Lana Condor as Lara Jean Covey, Noah Centineo as Peter Kavinsky, Janel Parrish as Margot Covey, Anna Cathcart as Kitty Covey, John Corbett as Dr. Covey', '../assets/images/ratings/rating_4_6.png', 'Coming Soon', 3),
(59, '../assets/images/movie_posters/R_Antlers.png', 'Antlers', 'Horror, Mystery', '99 minutes', 'In an isolated Oregon town, a middle-school teacher and her sheriff brother become embroiled with her enigmatic student, whose dark secrets lead to terrifying encounters with a legendary ancestral creature. ', 'Keri Russell as Julia Meadows, Jesse Plemons as Paul Meadows, Jeremy T. Thomas as Lucas Weaver, Graham Greene as Warren Stokes, Scott Haze as Frank Weaver', '../assets/images/ratings/rating_3_4.png', 'Coming Soon', 3),
(60, '../assets/images/movie_posters/PG_WarForThePlanetOfTheApes.png', 'War For The Planet Of The Apes', 'Science Fiction, Drama', '140 minutes', 'After the apes suffer unimaginable losses, Caesar wrestles with his darker instincts and begins his own mythic quest to avenge his kind.', 'Andy Serkis as Caesar, Woody Harrelson as The Colonel, Steve Zahn as Bad Ape, Amiah Miller as Nova', '../assets/images/ratings/rating_4_6.png', 'Coming Soon', 3),
(61, '../assets/images/movie_posters/R_21JumpStreet.png', '21 Jump Street', 'Action, Comedy', '109 minutes', 'Former high school adversaries Morton Schmidt and Greg Jenko become partners in the police force. Assigned to an undercover unit, they pose as high school students to infiltrate a drug ring. Reliving their teenage years, they navigate the challenges of modern high school life while attempting to complete their mission.', 'Jonah Hill as Morton Schmidt, Channing Tatum as Greg Jenko, Brie Larson as Molly Tracey, Dave Franco as Eric Molson, Ice Cube as Captain Dickson', '../assets/images/ratings/rating_4_6.png', 'Coming Soon', 3),
(62, '../assets/images/movie_posters/R_22.png', '22', 'Action, Comedy', '112 minutes', 'Officers Schmidt and Jenko are back, this time going undercover at a local college to investigate a new drug outbreak. As they navigate fraternity culture and academic pressures, their partnership faces challenges, leading them to question their compatibility as both partners and friends.', 'Jonah Hill as Morton Schmidt, Channing Tatum as Greg Jenko, Peter Stormare as Ghost, Ice Cube as Captain Dickson, Amber Stevens West as Maya Dickson', '../assets/images/ratings/rating_4_3.png', 'Coming Soon', 3),
(63, '../assets/images/movie_posters/R_28DaysLater.png', '28 Days Later', 'Horror, Sci-Fi, Thriller', '113 minutes', 'After a highly contagious virus is accidentally released, it spreads rapidly across the United Kingdom, causing societal collapse. Twenty-eight days later, a man awakens from a coma to find London deserted. He joins a group of survivors seeking sanctuary while confronting the infected and the breakdown of civilization.', 'Cillian Murphy as Jim, Naomie Harris as Selena, Brendan Gleeson as Frank,Megan Burns as Hannah, Christopher Eccleston as Major Henry West', '../assets/images/ratings/rating_4_2.png', 'Coming Soon', 3),
(64, '../assets/images/movie_posters/R_300.png', '300', 'Action, Drama', '117 minutes', 'Based on Frank Miller\'s graphic novel, 300 depicts the Battle of Thermopylae, where King Leonidas of Sparta leads 300 warriors against the vast Persian army led by King Xerxes. Despite overwhelming odds, the Spartans\' valor and sacrifice inspire all of Greece to unite against their common enemy.', 'Gerard Butler as King Leonidas, Lena Headey as Queen Gorgo, David Wenham as Dilios, Dominic West as Theron, Rodrigo Santoro as King Xerxes', '../assets/images/ratings/rating_3_6.png', 'Coming Soon', 3),
(65, '../assets/images/movie_posters/R_AtomicBlonde.png', 'Atomic Blonde', 'Action, Thriller', '115 minutes', 'Set during the Cold War, MI6 agent Lorraine Broughton is dispatched to Berlin to investigate the murder of a fellow agent and recover a missing list of double agents. Navigating a web of espionage, deceit, and treachery, she must use all her skills to survive and complete her mission.', 'Charlize Theron as Lorraine Broughton, James McAvoy as David Percival, Sofia Boutella as Delphine Lasalle, Eddie Marsan as Spyglass, John Goodman as Emmett Kurzfeld', '../assets/images/ratings/rating_4_2.png', 'Coming Soon', 3),
(66, '../assets/images/movie_posters/R_BadBoys.png', 'Bad Boys', 'Action, Comedy, Crime', '119 minutes', 'Miami detectives Mike Lowrey and Marcus Burnett are tasked with recovering $100 million worth of seized heroin stolen from their police vault. To protect a witness to a murder, they switch identities, leading to a series of misunderstandings and comedic situations as they work to solve the case.', 'Will Smith as Mike Lowrey, Martin Lawrence as Marcus Burnett, Téa Leoni as Julie Mott, Tchéky Karyo as Fouchet, Joe Pantoliano as Captain Howard', '../assets/images/ratings/rating_4_4.png', 'Coming Soon', 3),
(67, '../assets/images/movie_posters/R_BladeRunner.png', 'Blade Runner 2049', 'Science Fiction, Thriller', '164 minutes', 'Set three decades after the original Blade Runner, the story follows Officer K, a new blade runner for the Los Angeles Police Department. K unearths a long-buried secret that has the potential to plunge society into chaos. His discovery leads him on a quest to find Rick Deckard, a former blade runner who has been missing for thirty years.', 'Ryan Gosling as Officer K, Harrison Ford as Rick Deckard, Ana de Armas as Joi, Sylvia Hoeks as Luv, Robin Wright as Lieutenant Joshi, Jared Leto as Niander Wallace', '../assets/images/ratings/rating_4_2.png', 'Now Showing', 4),
(68, '../assets/images/movie_posters/R_Blockers.png', 'Blockers', 'Comedy', '102 minutes', 'Three parents stumble upon their daughters\' pact to lose their virginity on prom night and launch a covert one-night operation to stop the teens from sealing the deal.', 'Leslie Mann as Lisa, John Cena as Mitchell, Ike Barinholtz as Hunter, Kathryn Newton as Julie, Geraldine Viswanathan as Kayla', '../assets/images/ratings/rating_3_9.png', 'Now Showing', 4),
(69, '../assets/images/movie_posters/R_Borat.png', 'Borat', 'Comedy, Mockumentary', '84 minutes', 'Kazakh journalist Borat Sagdiyev travels to the United States to make a documentary on American society and culture. Along the way, his outrageous behavior and unfiltered commentary lead to a series of comedic and controversial encounters with unsuspecting Americans.', 'Sacha Baron Cohen as Borat Sagdiyev, Ken Davitian as Azamat Bagatov, Luenell as Luenell, Pamela Anderson as Herself', '../assets/images/ratings/rating_4_3.png', 'Now Showing', 4),
(70, '../assets/images/movie_posters/R_BoratSubsequentMovieFilm.png', 'Borat Subsequent...', 'Comedy, Mockumentary', '96 minutes', 'Released from prison for bringing shame to his country, Kazakh journalist Borat Sagdiyev returns to America. This time, he aims to offer his daughter, Tutar, as a bride to then–U.S. Vice President Mike Pence during the COVID-19 pandemic and the 2020 presidential election. Their journey leads to a series of outrageous and revealing encounters with real people across the nation.', 'Sacha Baron Cohen as Borat Sagdiyev, Maria Bakalova as Tutar Sagdiyev, Tom Hanks as Himself, Rudy Giuliani as Himself', '../assets/images/ratings/rating_3_6.png', 'Now Showing', 4),
(71, '../assets/images/movie_posters/R_Bridesmaids.png', 'Bridesmaids', 'Comedy, Romance', '125 minutes', 'Annie\'s life is a mess, but when she learns her best friend Lillian is engaged, she becomes the maid of honor. Despite her personal struggles, Annie navigates the chaotic and expensive rituals associated with the role, leading to a series of comedic misadventures.', 'Kristen Wiig as Annie Walker, Maya Rudolph as Lillian Donovan, Rose Byrne as Helen Harris III, Melissa McCarthy as Megan Price, Chris O\'Dowd as Officer Nathan Rhodes', '../assets/images/ratings/rating_3_9.png', 'Now Showing', 4),
(72, '../assets/images/movie_posters/R_CallMeByYourName.png', 'Call Me by ...', 'Romance, Drama', '132 minutes', 'During a summer in 1980s Italy, 17-year-old Elio Perlman forms an intense bond with Oliver, a charming graduate student working as his father\'s assistant. As their friendship deepens into a passionate romance, they experience a love that will forever change their lives.', 'Timothée Chalamet as Elio Perlman, Armie Hammer as Oliver, Michael Stuhlbarg as Samuel Perlman, Amira Casar as Annella Perlman, Esther Garrel as Marzia', '../assets/images/ratings/rating_4_7.png', 'Now Showing', 4),
(73, '../assets/images/movie_posters/R_Deadpool.png', 'Deadpool', 'Action, Comedy', '108 minutes', 'A former Special Forces operative turned mercenary is subjected to a rogue experiment that leaves him with accelerated healing powers, adopting the alter ego Deadpool.', 'Ryan Reynolds as Wade Wilson / Deadpool, Morena Baccarin as Vanessa, Ed Skrein as Ajax, T.J. Miller as Weasel, Gina Carano as Angel Dust', '../assets/images/ratings/rating_4_5.png', 'Popular Movies', 4),
(74, '../assets/images/movie_posters/R_Deadpool2.png', 'Deadpool 2', 'Action, Comedy', '119 minutes', 'After a personal tragedy, Wade Wilson (Deadpool) assembles a team of mutants to protect a young boy with supernatural abilities from the time-traveling soldier, Cable.', 'Ryan Reynolds as Wade Wilson / Deadpool, Josh Brolin as Cable, Morena Baccarin as Vanessa, Julian Dennison as Russell, Zazie Beetz as Domino', '../assets/images/ratings/rating_4_5.png', 'Popular Movies', 4),
(75, '../assets/images/movie_posters/R_DieHard.png', 'Die Hard', 'Action, Thriller', '132 minutes', 'NYPD officer John McClane arrives in Los Angeles to reconcile with his estranged wife at her company\'s Christmas party. The celebration is abruptly interrupted when a group of terrorists, led by Hans Gruber, seizes the building. With limited resources and no immediate backup, McClane must rely on his wits and training to rescue the hostages and thwart the criminals\' plans.', 'Bruce Willis as John McClane, Alan Rickman as Hans Gruber, Bonnie Bedelia as Holly Gennaro McClane, Reginald VelJohnson as Sgt. Al Powell, Paul Gleason as Dwayne T. Robinson', '../assets/images/ratings/rating_4_7.png', 'Popular Movies', 4),
(76, '../assets/images/movie_posters/R_EternalSunshine.png', 'Eternal Sunshine ...', 'Romance, Sci-Fi, Drama', '108 minutes', 'After a painful breakup, Joel discovers that his ex-girlfriend Clementine has undergone a procedure to erase all memories of their relationship. Devastated, he decides to do the same, but as his memories disappear, he realizes he still loves her. Racing against his own mind, he tries to hold onto their love before it fades forever.', 'Jim Carrey as Joel Barish, Kate Winslet as Clementine Kruczynski, Kirsten Dunst as Mary Svevo, Mark Ruffalo as Stan, Elijah Wood as Patrick', '../assets/images/ratings/rating_4_6.png', 'Popular Movies', 4),
(77, '../assets/images/movie_posters/R_GameNight.png', 'Game Night', 'Comedy, Crime', '100 minutes', 'Max and Annie\'s regular game night takes an unexpected turn when Max\'s charismatic brother, Brooks, arranges a murder mystery party—complete with fake thugs and federal agents. However, when Brooks gets kidnapped, it\'s all part of the game, right? As the competitors set out to solve the case, they begin to discover that neither this game—nor Brooks—are what they seem to be.', 'Jason Bateman as Max, Rachel McAdams as Annie, Kyle Chandler as Brooks, Sharon Horgan as Sarah, Billy Magnussen as Ryan', '../assets/images/ratings/rating_4_3.png', 'Popular Movies', 4),
(78, '../assets/images/movie_posters/R_GetOut.png', 'Get Out', 'Horror, Mystery, Thriller', '104 minutes', 'Chris, an African-American man, visits his white girlfriend Rose\'s family estate. Initially, he interprets their overly accommodating behavior as nervous attempts to deal with their daughter\'s interracial relationship. However, as the weekend progresses, a series of increasingly disturbing discoveries lead him to a truth he could never have imagined.', 'Daniel Kaluuya as Chris Washington, Allison Williams as Rose Armitage, Bradley Whitford as Dean Armitage, Catherine Keener as Missy Armitage, Lil Rel Howery as Rod Williams', '../assets/images/ratings/rating_4_4.png', 'Popular Movies', 4);
INSERT INTO `movies` (`id`, `image`, `title`, `genre`, `duration`, `synopsis`, `casts`, `rating`, `status`, `cinema_number`) VALUES
(79, '../assets/images/movie_posters/R_Gladiator.png', 'Gladiator', 'Action, Adventure, Drama', '155 minutes', 'Roman general Maximus Decimus Meridius is betrayed by Commodus, the ambitious son of Emperor Marcus Aurelius, who murders his father and seizes the throne. Left for dead and sold into slavery, Maximus rises through the ranks of the gladiatorial arena, driven by a desire for vengeance against Commodus and justice for his murdered family.', 'Russell Crowe as Maximus, Joaquin Phoenix as Commodus, Connie Nielsen as Lucilla, Oliver Reed as Proximo, Richard Harris as Marcus Aurelius', '../assets/images/ratings/rating_4_8.png', 'Coming Soon', 4),
(80, '../assets/images/movie_posters/R_ItFollows.png', 'It Follows', 'Horror, Mystery, Thriller', '100 minutes', 'After a seemingly innocent sexual encounter, 19-year-old Jay finds herself plagued by strange visions and an inescapable sense that someone—or something—is following her. Faced with this burden, Jay and her friends must find a way to escape the horrors that seem to be only a few steps behind.', 'Maika Monroe as Jay Height, Keir Gilchrist as Paul, Daniel Zovatto as Greg Hannigan, Olivia Luccardi as Yara, Lili Sepe as Kelly Height', '../assets/images/ratings/rating_2_7.png', 'Coming Soon', 4),
(81, '../assets/images/movie_posters/R_JohnWick.png', 'John Wick', 'Action, Thriller', '101 minutes', 'Retired hitman John Wick is mourning the loss of his wife when a group of Russian gangsters, led by Iosef Tarasov, steals his prized car and kills his puppy—a final gift from his late wife. Fueled by grief and vengeance, John returns to his former life, unleashing his lethal skills to hunt down those responsible, while confronting his past connections in the criminal underworld.', 'Keanu Reeves as John Wick, Michael Nyqvist as Viggo Tarasov, Alfie Allen as Iosef Tarasov, Willem Dafoe as Marcus, Adrianne Palicki as Ms. Perkins', '../assets/images/ratings/rating_4_5.png', 'Coming Soon', 4),
(82, '../assets/images/movie_posters/R_KillBill.png', 'Kill Bill ...', 'Action, Crime, Thriller', '111 minutes', 'After waking from a four-year coma, a former assassin seeks vengeance on the team of assassins who betrayed her.', 'Uma Thurman as The Bride, Lucy Liu as O-Ren Ishii, Vivica A. Fox as Vernita Green, Daryl Hannah as Elle Driver, David Carradine as Bill', '../assets/images/ratings/rating_4_4.png', 'Coming Soon', 4),
(83, '../assets/images/movie_posters/R_LethalWeapon.png', 'Lethal Weapon', 'Action, Crime, Thriller', '110 minutes', 'Veteran LAPD detective Roger Murtaugh is paired with volatile and suicidal young detective Martin Riggs. Despite their contrasting personalities, the duo must work together to investigate a drug-smuggling operation, leading them into dangerous confrontations and forging an unlikely partnership.', 'Mel Gibson as Martin Riggs, Danny Glover as Roger Murtaugh, Gary Busey as Mr. Joshua, Mitchell Ryan as General Peter McAllister, Darlene Love as Trish Murtaugh', '../assets/images/ratings/rating_4_5.png', 'Coming Soon', 4),
(84, '../assets/images/movie_posters/R_LetTheRightOneIn.png', 'Let the Right ...', 'Horror, Drama, Romance', '114 minutes', 'In 1980s Stockholm, lonely 12-year-old Oskar befriends his new neighbor, Eli, a mysterious girl who only appears at night. As their bond deepens, Oskar discovers Eli\'s dark secret: she is a vampire responsible for a series of local deaths. Together, they navigate a complex relationship amidst the backdrop of fear and violence.', 'Kåre Hedebrant as Oskar, Lina Leandersson as Eli, Per Ragnar as Håkan, Henrik Dahl as Erik, Karin Bergquist as Yvonne', '../assets/images/ratings/rating_4_3.png', 'Coming Soon', 4),
(85, '../assets/images/movie_posters/R_MadMaxFurryRoad.png', 'Mad Max: Fury Road', 'Action, Adventure, Sci-Fi', '120 minutes', 'In a post-apocalyptic wasteland, Max Rockatansky finds himself captured by the tyrannical Immortan Joe\'s forces. Amidst the chaos, Imperator Furiosa rebels against Joe\'s regime, seeking to rescue his enslaved wives. Teaming up with Max, they embark on a high-octane chase across the desert, battling relentless pursuers in a quest for freedom and redemption.', 'Tom Hardy as Max Rockatansky, Charlize Theron as Imperator Furiosa, Nicholas Hoult as Nux, Hugh Keays-Byrne as Immortan Joe, Zoë Kravitz as Toast the Knowing', '../assets/images/ratings/rating_4_5.png', 'Coming Soon', 4),
(86, '../assets/images/movie_posters/R_Malignant.png', 'Malignant', 'Horror, Thriller', '111 minutes', 'Paralyzed by fear from shocking visions, a woman\'s torment worsens as she discovers her waking dreams are terrifying realities.', 'Annabelle Wallis as Madison Mitchell, Maddie Hasson as Sydney Lake, George Young as Detective Kekoa Shaw, Michole Briana White as Detective Regina Moss, Jean Louisa Kelly as Jane Doe / Serena May', '../assets/images/ratings/rating_3_2.png', 'Coming Soon', 4),
(87, '../assets/images/movie_posters/R_Midsommar.png', 'Midsommar', 'Horror, Drama', '147 minutes', 'Following a family tragedy, Dani accompanies her boyfriend Christian and his friends to a secluded Swedish village for a once-in-a-lifetime midsummer festival. What begins as a peaceful retreat quickly devolves into a nightmarish ordeal as the villagers\' unsettling rituals become increasingly disturbing.', 'Florence Pugh as Dani, Jack Reynor as Christian, William Jackson Harper as Josh, Vilhelm Blomgren as Pelle, Will Poulter as Mark', '../assets/images/ratings/rating_2_9.png', 'Coming Soon', 4),
(88, '../assets/images/movie_posters/R_Neighbors.png', 'Neighbors', 'Comedy', '97 minutes', 'A young couple with a newborn baby face unexpected difficulties when a fraternity moves in next door, leading to an all-out war between the two households.', 'Seth Rogen as Mac Radner, Rose Byrne as Kelly Radner, Zac Efron as Teddy Sanders, Dave Franco as Pete, Christopher Mintz-Plasse as Scoonie', '../assets/images/ratings/rating_3_8.png', 'Coming Soon', 4),
(89, '../assets/images/movie_posters/R_NoHardFeelings.png', 'No Hard Feelings', 'Comedy', '103 minutes', 'Maddie, a struggling woman facing financial troubles, agrees to an unusual job—bringing a socially awkward 19-year-old out of his shell before he heads to college. As she attempts to boost his confidence, unexpected emotions surface, leading to hilarious and heartfelt moments.', 'Jennifer Lawrence as Maddie, Andrew Barth Feldman as Percy, Laura Benanti as Allison, Matthew Broderick as Laird, Natalie Morales as Sara', '../assets/images/ratings/rating_3_6.png', 'Now Showing', 5),
(90, '../assets/images/movie_posters/R_Nope.png', 'Nope', 'Horror, Mystery, Sci-Fi', '130 minutes', 'Siblings OJ and Emerald Haywood, who run a horse ranch in California, discover a mysterious and sinister presence in the skies above their land. As they attempt to capture evidence of the unidentified flying object, they enlist the help of a tech salesman and a renowned cinematographer, leading to a confrontation with the unknown.', 'Daniel Kaluuya as Otis OJ Haywood Jr., Keke Palmer as Emerald Em Haywood, Steven Yeun as Ricky Jupe Park, Michael Wincott as Antlers Holst, Brandon Perea as Angel Torres', '../assets/images/ratings/rating_2_8.png', 'Now Showing', 5),
(91, '../assets/images/movie_posters/R_PalmSprings.png', 'Palm Springs', 'Comedy, Romance, Sci-Fi', '90 minutes', 'When carefree Nyles and reluctant maid of honor Sarah meet at a wedding in Palm Springs, things take an unexpected turn as they become trapped in a time loop, reliving the same day over and over. As they navigate their bizarre reality, they form a unique bond filled with humor, chaos, and self-discovery.', 'Andy Samberg as Nyles, Cristin Milioti as Sarah, J.K. Simmons as Roy, Meredith Hagner as Misty, Camila Mendes as Tala', '../assets/images/ratings/rating_4_5.png', 'Now Showing', 5),
(92, '../assets/images/movie_posters/R_PansLabyrinth.png', 'Pan’s Labyrinth', 'Fantasy, Drama, War', '118 minutes', 'Set in post-Civil War Spain, young Ofelia discovers a mysterious labyrinth where she meets the faun Pan, who sets her on a quest to prove herself as the reincarnation of a lost princess. As she navigates both a magical world and the brutal reality of her stepfather’s tyranny, Ofelia struggles to survive and find her true destiny.', 'Ivana Baquero as Ofelia, Sergi López as Captain Vidal, Maribel Verdú as Mercedes, Doug Jones as Faun/Pale Man, Ariadna Gil as Carmen', '../assets/images/ratings/rating_4_6.png', 'Now Showing', 5),
(93, '../assets/images/movie_posters/R_ParanormalActivity.png', 'Paranormal Activity', 'Horror, Mystery', '86 minutes', 'Young couple Katie and Micah move into a suburban home, but soon become disturbed by a nightly demonic presence. To capture evidence, they set up video cameras, documenting increasingly terrifying events that escalate as the entity\'s grip tightens.', 'Katie Featherston as Katie, Micah Sloat as Micah, Mark Fredrichs as The Psychic, Amber Armstrong as Amber, Ashley Palmer as Diane', '../assets/images/ratings/rating_3_5.png', 'Now Showing', 5),
(94, '../assets/images/movie_posters/R_Predator.png', 'Predator', 'Action, Sci-Fi, Thriller', '107 minutes', 'A team of commandos on a mission in a Central American jungle find themselves hunted by an extraterrestrial warrior.', 'Arnold Schwarzenegger as Dutch, Carl Weathers as Dillon, Elpidia Carrillo as Anna, Bill Duke as Mac, Jesse Ventura as Blain', '../assets/images/ratings/rating_4_7.png', 'Now Showing', 5),
(95, '../assets/images/movie_posters/R_Relic.png', 'Relic', 'Horror, Drama', '89 minutes', 'When elderly matriarch Edna goes missing, her daughter Kay and granddaughter Sam return to their family home to find her. Upon Edna\'s inexplicable return, they begin to experience a sinister presence in the house, which seems to be taking control of Edna herself.', 'Emily Mortimer as Kay, Robyn Nevin as Edna, Bella Heathcote as Sam, Chris Bunton as Jamie, Jeremy Stanford as Alex', '../assets/images/ratings/rating_2_6.png', 'Popular Movies', 5),
(96, '../assets/images/movie_posters/R_SaintMaud.png', 'Saint Maud', 'Horror, Drama', '84 minutes', 'Maud, a newly devout hospice nurse, becomes obsessed with saving the soul of her dying patient, Amanda. As Maud\'s fervent faith escalates, her fixation leads to dark and dangerous consequences.', 'Morfydd Clark as Maud, Jennifer Ehle as Amanda, Lily Knight as Joy, Lily Frazer as Carol, Turlough Convery as Christian', '../assets/images/ratings/rating_3_3.png', 'Popular Movies', 5),
(97, '../assets/images/movie_posters/R_Scream.png', 'Scream', 'Horror, Mystery', '111 minutes', 'In the town of Woodsboro, a masked killer known as Ghostface begins targeting teenagers, including Sidney Prescott, whose mother was murdered a year prior. As the body count rises, Sidney and her friends must navigate the killer\'s twisted game, where everyone is a suspect.', 'Neve Campbell as Sidney Prescott, Courteney Cox as Gale Weathers, David Arquette as Deputy Dewey Riley, Skeet Ulrich as Billy Loomis, Matthew Lillard as Stu Macher', '../assets/images/ratings/rating_4_5.png', 'Popular Movies', 5),
(98, '../assets/images/movie_posters/R_SilverLinings.png', 'Silver Linings ...', 'Romance, Comedy, Drama', '122 minutes', 'After spending time in a mental health facility, Pat Solitano moves back in with his parents, determined to rebuild his life and win back his ex-wife. His plans take an unexpected turn when he meets Tiffany, a mysterious young woman dealing with her own struggles. As they form an unlikely bond, they help each other find hope and new beginnings.', 'Bradley Cooper as Pat Solitano, Jennifer Lawrence as Tiffany Maxwell, Robert De Niro as Pat Solitano Sr., Jacki Weaver as Dolores Solitano, Chris Tucker as Danny', '../assets/images/ratings/rating_4_7.png', 'Popular Movies', 5),
(99, '../assets/images/movie_posters/R_Speed.png', 'Speed', 'Action, Thriller', '116 minutes', 'Los Angeles police officer Jack Traven must prevent a bomb from exploding aboard a city bus by keeping its speed above 50 mph.', 'Keanu Reeves as Jack Traven, Sandra Bullock as Annie Porter, Dennis Hopper as Howard Payne, Jeff Daniels as Harry Temple, Joe Morton as Capt. McMahon', '../assets/images/ratings/rating_4_6.png', 'Popular Movies', 5),
(100, '../assets/images/movie_posters/R_StalloneRambo.png', 'Rambo ...', 'Action, Adventure', '96 minutes', 'John Rambo, a former Green Beret, is serving time in prison when he\'s offered a chance at freedom by participating in a covert mission to document the existence of American POWs in Vietnam. Defying orders to only take photographs, Rambo decides to rescue the prisoners, leading to intense confrontations with enemy forces.', 'Sylvester Stallone as John Rambo, Richard Crenna as Colonel Sam Trautman, Charles Napier as Marshall Murdock, Steven Berkoff as Lieutenant Colonel Podovsky, Julia Nickson as Co Bao', '../assets/images/ratings/rating_4_5.png', 'Popular Movies', 5),
(101, '../assets/images/movie_posters/R_StepBrothers.png', 'Step Brothers', 'Comedy', '98 minutes', 'Brennan Huff and Dale Doback are two middle-aged men still living with their respective single parents. When Brennan\'s mother and Dale\'s father marry, the two man-children are forced to coexist under one roof. Initially at odds, their shared immaturity and interests eventually lead to a unique friendship, causing chaos in their family\'s lives.', 'Will Ferrell as Brennan Huff, John C. Reilly as Dale Doback, Mary Steenburgen as Nancy Huff, Richard Jenkins as Dr. Robert Doback, Adam Scott as Derek Huff', '../assets/images/ratings/rating_4_4.png', 'Coming Soon', 5),
(102, '../assets/images/movie_posters/R_TheCabinInTheWoods.png', 'The Cabin In ...', 'Horror, Mystery, Thriller', '95 minutes', 'Five friends embark on a vacation to a remote cabin in the woods. Upon arrival, they discover a basement filled with mysterious artifacts. Unwittingly, they trigger a series of events controlled by unseen technicians, leading to horrifying occurrences that challenge their understanding of reality and survival.', 'Kristen Connolly as Dana, Chris Hemsworth as Curt, Anna Hutchison as Jules, Fran Kranz as Marty, Jesse Williams as Holden', '../assets/images/ratings/rating_3_2.png', 'Coming Soon', 5),
(103, '../assets/images/movie_posters/R_SuperBad.png', 'Superbad', 'Comedy', '113 minutes', 'High school seniors Seth and Evan have been inseparable friends, navigating the trials of adolescence together. As they approach graduation, the duo aims to make the most of their remaining time by securing alcohol for a party, hoping to impress their crushes. Their quest leads to a series of misadventures, testing their friendship and resilience.', 'Jonah Hill as Seth, Michael Cera as Evan, Christopher Mintz-Plasse as Fogell/McLovin, Bill Hader as Officer Slater, Seth Rogen as Officer Michaels', '../assets/images/ratings/rating_4_6.png', 'Coming Soon', 5),
(104, '../assets/images/movie_posters/R_Tenet.png', 'Tenet', 'Science Fiction, Action, Thriller', '150 minutes', 'Tenet follows a protagonist armed with only one word—Tenet—as he fights for the survival of the world. Journeying through a twilight world of international espionage, he must navigate a mission that unfolds in something beyond real-time.', 'John David Washington as The Protagonist, Robert Pattinson as Neil, Elizabeth Debicki as Kat, Kenneth Branagh as Andrei Sator, Dimple Kapadia as Priya', '../assets/images/ratings/rating_4_0.png', 'Coming Soon', 5),
(105, '../assets/images/movie_posters/R_Terminator2JudgementDay.png', 'Terminator 2 ...', 'Action, Sci-Fi', '137 minutes', 'A decade after the events of the first film, a reprogrammed Terminator is sent back in time to protect young John Connor, the future leader of the human resistance, from a more advanced and relentless cyborg, the T-1000. Together with John\'s mother, Sarah Connor, they must prevent Judgment Day—the impending nuclear apocalypse.', 'Arnold Schwarzenegger as The Terminator, Linda Hamilton as Sarah Connor, Edward Furlong as John Connor, Robert Patrick as T-1000, Joe Morton as Dr. Miles Dyson', '../assets/images/ratings/rating_4_9.png', 'Coming Soon', 5),
(106, '../assets/images/movie_posters/R_TheDescent.png', 'The Descent', 'Horror, Adventure', '99 minutes', 'A year after a tragic accident, six women reunite for a caving expedition in the Appalachian Mountains. Deep within the uncharted cave system, they become trapped and soon discover they are not alone, facing a race against time and creatures lurking in the darkness.', 'Shauna Macdonald as Sarah, Natalie Mendoza as Juno, Alex Reid as Beth, Saskia Mulder as Rebecca, MyAnna Buring as Sam', '../assets/images/ratings/rating_4_1.png', 'Coming Soon', 5),
(107, '../assets/images/movie_posters/R_TheEqualizer.png', 'The Equalizer', 'Action, Crime, Thriller', '132 minutes', 'Robert McCall, a former black-ops operative, seeks a quiet life in Boston. However, when he meets Teri, a young woman under the control of ultra-violent Russian gangsters, he can\'t stand idly by. Armed with hidden skills, McCall emerges from self-imposed retirement to exact justice for the helpless.', 'Denzel Washington as Robert McCall, Marton Csokas as Teddy, Chloë Grace Moretz as Teri, David Harbour as Masters, Melissa Leo as Susan Plummer', '../assets/images/ratings/rating_4_6.png', 'Coming Soon', 5),
(108, '../assets/images/movie_posters/R_TheHangover.png', 'The Hangover', 'Comedy', '100 minutes', 'Before Doug\'s wedding, he and his three friends travel to Las Vegas for a bachelor party. After a night of wild partying, they wake up with no memory of the previous night and discover Doug is missing. With little time before the wedding, the trio retraces their steps to find their friend, encountering a series of bizarre and hilarious situations.', 'Bradley Cooper as Phil Wenneck, Ed Helms as Stu Price, Zach Galifianakis as Alan Garner, Justin Bartha as Doug Billings, Ken Jeong as Mr. Chow', '../assets/images/ratings/rating_4_7.png', 'Coming Soon', 5),
(109, '../assets/images/movie_posters/R_TheInvisibleMan.png', 'The Invisible Man', 'Horror, Sci-Fi, Thriller', '124 minutes', 'After escaping an abusive relationship with a wealthy tech entrepreneur, Cecilia believes she is free when she hears of his apparent suicide. However, she begins to experience a series of inexplicable events, leading her to suspect that her ex is not truly gone and has found a way to become invisible to stalk and terrorize her.', 'Elisabeth Moss as Cecilia Kass, Aldis Hodge as James Lanier, Storm Reid as Sydney Lanier, Harriet Dyer as Emily Kass, Oliver Jackson-Cohen as Adrian Griffin', '../assets/images/ratings/rating_3_9.png', 'Coming Soon', 5),
(110, '../assets/images/movie_posters/R_TheNiceGuys.png', 'The Nice Guys', 'Action, Comedy, Crime', '116 minutes', 'Set in 1977 Los Angeles, private investigator Holland March and enforcer Jackson Healy team up to investigate the disappearance of a young woman named Amelia. Their investigation uncovers a conspiracy involving the death of a porn star, leading them through a labyrinth of intrigue and danger.', 'Russell Crowe as Jackson Healy, Ryan Gosling as Holland March, Angourie Rice as Holly March, Margaret Qualley as Amelia Kuttner, Kim Basinger as Judith Kuttner', '../assets/images/ratings/rating_4_1.png', 'Coming Soon', 5);

-- --------------------------------------------------------

--
-- Table structure for table `movie_schedules`
--

CREATE TABLE `movie_schedules` (
  `id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `cinema_number` int(11) NOT NULL,
  `show_time` time NOT NULL,
  `show_date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movie_schedules`
--

INSERT INTO `movie_schedules` (`id`, `movie_id`, `cinema_number`, `show_time`, `show_date`) VALUES
(1, 1, 1, '09:00:00', '2025-05-01'),
(2, 2, 1, '09:00:00', '2025-05-01'),
(3, 3, 1, '09:00:00', '2025-05-01'),
(4, 4, 1, '09:00:00', '2025-05-01'),
(5, 5, 1, '09:00:00', '2025-05-01'),
(6, 6, 1, '09:00:00', '2025-05-01'),
(7, 7, 1, '09:00:00', '2025-05-01'),
(8, 8, 1, '09:00:00', '2025-05-01'),
(9, 9, 1, '09:00:00', '2025-05-01'),
(10, 10, 1, '09:00:00', '2025-05-01'),
(11, 11, 1, '09:00:00', '2025-05-01'),
(12, 12, 1, '09:00:00', '2025-05-01'),
(13, 13, 1, '09:00:00', '2025-05-01'),
(14, 14, 1, '09:00:00', '2025-05-01'),
(15, 15, 1, '09:00:00', '2025-05-01'),
(16, 16, 1, '09:00:00', '2025-05-01'),
(17, 17, 1, '09:00:00', '2025-05-01'),
(18, 18, 1, '09:00:00', '2025-05-01'),
(19, 19, 1, '09:00:00', '2025-05-01'),
(20, 20, 1, '09:00:00', '2025-05-01'),
(21, 21, 1, '09:00:00', '2025-05-01'),
(22, 22, 1, '09:00:00', '2025-05-01'),
(32, 1, 1, '13:00:00', '2025-05-02'),
(33, 2, 1, '13:00:00', '2025-05-02'),
(34, 3, 1, '13:00:00', '2025-05-02'),
(35, 4, 1, '13:00:00', '2025-05-02'),
(36, 5, 1, '13:00:00', '2025-05-02'),
(37, 6, 1, '13:00:00', '2025-05-02'),
(38, 7, 1, '13:00:00', '2025-05-02'),
(39, 8, 1, '13:00:00', '2025-05-02'),
(40, 9, 1, '13:00:00', '2025-05-02'),
(41, 10, 1, '13:00:00', '2025-05-02'),
(42, 11, 1, '13:00:00', '2025-05-02'),
(43, 12, 1, '13:00:00', '2025-05-02'),
(44, 13, 1, '13:00:00', '2025-05-02'),
(45, 14, 1, '13:00:00', '2025-05-02'),
(46, 15, 1, '13:00:00', '2025-05-02'),
(47, 16, 1, '13:00:00', '2025-05-02'),
(48, 17, 1, '13:00:00', '2025-05-02'),
(49, 18, 1, '13:00:00', '2025-05-02'),
(50, 19, 1, '13:00:00', '2025-05-02'),
(51, 20, 1, '13:00:00', '2025-05-02'),
(52, 21, 1, '13:00:00', '2025-05-02'),
(53, 22, 1, '13:00:00', '2025-05-02'),
(63, 1, 1, '16:00:00', '2025-05-03'),
(64, 2, 1, '16:00:00', '2025-05-03'),
(65, 3, 1, '16:00:00', '2025-05-03'),
(66, 4, 1, '16:00:00', '2025-05-03'),
(67, 5, 1, '16:00:00', '2025-05-03'),
(68, 6, 1, '16:00:00', '2025-05-03'),
(69, 7, 1, '16:00:00', '2025-05-03'),
(70, 8, 1, '16:00:00', '2025-05-03'),
(71, 9, 1, '16:00:00', '2025-05-03'),
(72, 10, 1, '16:00:00', '2025-05-03'),
(73, 11, 1, '16:00:00', '2025-05-03'),
(74, 12, 1, '16:00:00', '2025-05-03'),
(75, 13, 1, '16:00:00', '2025-05-03'),
(76, 14, 1, '16:00:00', '2025-05-03'),
(77, 15, 1, '16:00:00', '2025-05-03'),
(78, 16, 1, '16:00:00', '2025-05-03'),
(79, 17, 1, '16:00:00', '2025-05-03'),
(80, 18, 1, '16:00:00', '2025-05-03'),
(81, 19, 1, '16:00:00', '2025-05-03'),
(82, 20, 1, '16:00:00', '2025-05-03'),
(83, 21, 1, '16:00:00', '2025-05-03'),
(84, 22, 1, '16:00:00', '2025-05-03'),
(94, 1, 1, '19:00:00', '2025-05-04'),
(95, 2, 1, '19:00:00', '2025-05-04'),
(96, 3, 1, '19:00:00', '2025-05-04'),
(97, 4, 1, '19:00:00', '2025-05-04'),
(98, 5, 1, '19:00:00', '2025-05-04'),
(99, 6, 1, '19:00:00', '2025-05-04'),
(100, 7, 1, '19:00:00', '2025-05-04'),
(101, 8, 1, '19:00:00', '2025-05-04'),
(102, 9, 1, '19:00:00', '2025-05-04'),
(103, 10, 1, '19:00:00', '2025-05-04'),
(104, 11, 1, '19:00:00', '2025-05-04'),
(105, 12, 1, '19:00:00', '2025-05-04'),
(106, 13, 1, '19:00:00', '2025-05-04'),
(107, 14, 1, '19:00:00', '2025-05-04'),
(108, 15, 1, '19:00:00', '2025-05-04'),
(109, 16, 1, '19:00:00', '2025-05-04'),
(110, 17, 1, '19:00:00', '2025-05-04'),
(111, 18, 1, '19:00:00', '2025-05-04'),
(112, 19, 1, '19:00:00', '2025-05-04'),
(113, 20, 1, '19:00:00', '2025-05-04'),
(114, 21, 1, '19:00:00', '2025-05-04'),
(115, 22, 1, '19:00:00', '2025-05-04'),
(125, 1, 1, '22:00:00', '2025-05-05'),
(126, 2, 1, '22:00:00', '2025-05-05'),
(127, 3, 1, '22:00:00', '2025-05-05'),
(128, 4, 1, '22:00:00', '2025-05-05'),
(129, 5, 1, '22:00:00', '2025-05-05'),
(130, 6, 1, '22:00:00', '2025-05-05'),
(131, 7, 1, '22:00:00', '2025-05-05'),
(132, 8, 1, '22:00:00', '2025-05-05'),
(133, 9, 1, '22:00:00', '2025-05-05'),
(134, 10, 1, '22:00:00', '2025-05-05'),
(135, 11, 1, '22:00:00', '2025-05-05'),
(136, 12, 1, '22:00:00', '2025-05-05'),
(137, 13, 1, '22:00:00', '2025-05-05'),
(138, 14, 1, '22:00:00', '2025-05-05'),
(139, 15, 1, '22:00:00', '2025-05-05'),
(140, 16, 1, '22:00:00', '2025-05-05'),
(141, 17, 1, '22:00:00', '2025-05-05'),
(142, 18, 1, '22:00:00', '2025-05-05'),
(143, 19, 1, '22:00:00', '2025-05-05'),
(144, 20, 1, '22:00:00', '2025-05-05'),
(145, 21, 1, '22:00:00', '2025-05-05'),
(146, 22, 1, '22:00:00', '2025-05-05'),
(156, 23, 2, '09:00:00', '2025-05-01'),
(157, 24, 2, '09:00:00', '2025-05-01'),
(158, 25, 2, '09:00:00', '2025-05-01'),
(159, 26, 2, '09:00:00', '2025-05-01'),
(160, 27, 2, '09:00:00', '2025-05-01'),
(161, 28, 2, '09:00:00', '2025-05-01'),
(162, 29, 2, '09:00:00', '2025-05-01'),
(163, 30, 2, '09:00:00', '2025-05-01'),
(164, 31, 2, '09:00:00', '2025-05-01'),
(165, 32, 2, '09:00:00', '2025-05-01'),
(166, 33, 2, '09:00:00', '2025-05-01'),
(167, 34, 2, '09:00:00', '2025-05-01'),
(168, 35, 2, '09:00:00', '2025-05-01'),
(169, 36, 2, '09:00:00', '2025-05-01'),
(170, 37, 2, '09:00:00', '2025-05-01'),
(171, 38, 2, '09:00:00', '2025-05-01'),
(172, 39, 2, '09:00:00', '2025-05-01'),
(173, 40, 2, '09:00:00', '2025-05-01'),
(174, 41, 2, '09:00:00', '2025-05-01'),
(175, 42, 2, '09:00:00', '2025-05-01'),
(176, 43, 2, '09:00:00', '2025-05-01'),
(177, 44, 2, '09:00:00', '2025-05-01'),
(187, 23, 2, '13:00:00', '2025-05-02'),
(188, 24, 2, '13:00:00', '2025-05-02'),
(189, 25, 2, '13:00:00', '2025-05-02'),
(190, 26, 2, '13:00:00', '2025-05-02'),
(191, 27, 2, '13:00:00', '2025-05-02'),
(192, 28, 2, '13:00:00', '2025-05-02'),
(193, 29, 2, '13:00:00', '2025-05-02'),
(194, 30, 2, '13:00:00', '2025-05-02'),
(195, 31, 2, '13:00:00', '2025-05-02'),
(196, 32, 2, '13:00:00', '2025-05-02'),
(197, 33, 2, '13:00:00', '2025-05-02'),
(198, 34, 2, '13:00:00', '2025-05-02'),
(199, 35, 2, '13:00:00', '2025-05-02'),
(200, 36, 2, '13:00:00', '2025-05-02'),
(201, 37, 2, '13:00:00', '2025-05-02'),
(202, 38, 2, '13:00:00', '2025-05-02'),
(203, 39, 2, '13:00:00', '2025-05-02'),
(204, 40, 2, '13:00:00', '2025-05-02'),
(205, 41, 2, '13:00:00', '2025-05-02'),
(206, 42, 2, '13:00:00', '2025-05-02'),
(207, 43, 2, '13:00:00', '2025-05-02'),
(208, 44, 2, '13:00:00', '2025-05-02'),
(218, 23, 2, '16:00:00', '2025-05-03'),
(219, 24, 2, '16:00:00', '2025-05-03'),
(220, 25, 2, '16:00:00', '2025-05-03'),
(221, 26, 2, '16:00:00', '2025-05-03'),
(222, 27, 2, '16:00:00', '2025-05-03'),
(223, 28, 2, '16:00:00', '2025-05-03'),
(224, 29, 2, '16:00:00', '2025-05-03'),
(225, 30, 2, '16:00:00', '2025-05-03'),
(226, 31, 2, '16:00:00', '2025-05-03'),
(227, 32, 2, '16:00:00', '2025-05-03'),
(228, 33, 2, '16:00:00', '2025-05-03'),
(229, 34, 2, '16:00:00', '2025-05-03'),
(230, 35, 2, '16:00:00', '2025-05-03'),
(231, 36, 2, '16:00:00', '2025-05-03'),
(232, 37, 2, '16:00:00', '2025-05-03'),
(233, 38, 2, '16:00:00', '2025-05-03'),
(234, 39, 2, '16:00:00', '2025-05-03'),
(235, 40, 2, '16:00:00', '2025-05-03'),
(236, 41, 2, '16:00:00', '2025-05-03'),
(237, 42, 2, '16:00:00', '2025-05-03'),
(238, 43, 2, '16:00:00', '2025-05-03'),
(239, 44, 2, '16:00:00', '2025-05-03'),
(249, 23, 2, '19:00:00', '2025-05-04'),
(250, 24, 2, '19:00:00', '2025-05-04'),
(251, 25, 2, '19:00:00', '2025-05-04'),
(252, 26, 2, '19:00:00', '2025-05-04'),
(253, 27, 2, '19:00:00', '2025-05-04'),
(254, 28, 2, '19:00:00', '2025-05-04'),
(255, 29, 2, '19:00:00', '2025-05-04'),
(256, 30, 2, '19:00:00', '2025-05-04'),
(257, 31, 2, '19:00:00', '2025-05-04'),
(258, 32, 2, '19:00:00', '2025-05-04'),
(259, 33, 2, '19:00:00', '2025-05-04'),
(260, 34, 2, '19:00:00', '2025-05-04'),
(261, 35, 2, '19:00:00', '2025-05-04'),
(262, 36, 2, '19:00:00', '2025-05-04'),
(263, 37, 2, '19:00:00', '2025-05-04'),
(264, 38, 2, '19:00:00', '2025-05-04'),
(265, 39, 2, '19:00:00', '2025-05-04'),
(266, 40, 2, '19:00:00', '2025-05-04'),
(267, 41, 2, '19:00:00', '2025-05-04'),
(268, 42, 2, '19:00:00', '2025-05-04'),
(269, 43, 2, '19:00:00', '2025-05-04'),
(270, 44, 2, '19:00:00', '2025-05-04'),
(280, 23, 2, '22:00:00', '2025-05-05'),
(281, 24, 2, '22:00:00', '2025-05-05'),
(282, 25, 2, '22:00:00', '2025-05-05'),
(283, 26, 2, '22:00:00', '2025-05-05'),
(284, 27, 2, '22:00:00', '2025-05-05'),
(285, 28, 2, '22:00:00', '2025-05-05'),
(286, 29, 2, '22:00:00', '2025-05-05'),
(287, 30, 2, '22:00:00', '2025-05-05'),
(288, 31, 2, '22:00:00', '2025-05-05'),
(289, 32, 2, '22:00:00', '2025-05-05'),
(290, 33, 2, '22:00:00', '2025-05-05'),
(291, 34, 2, '22:00:00', '2025-05-05'),
(292, 35, 2, '22:00:00', '2025-05-05'),
(293, 36, 2, '22:00:00', '2025-05-05'),
(294, 37, 2, '22:00:00', '2025-05-05'),
(295, 38, 2, '22:00:00', '2025-05-05'),
(296, 39, 2, '22:00:00', '2025-05-05'),
(297, 40, 2, '22:00:00', '2025-05-05'),
(298, 41, 2, '22:00:00', '2025-05-05'),
(299, 42, 2, '22:00:00', '2025-05-05'),
(300, 43, 2, '22:00:00', '2025-05-05'),
(301, 44, 2, '22:00:00', '2025-05-05'),
(311, 45, 3, '09:00:00', '2025-05-01'),
(312, 46, 3, '09:00:00', '2025-05-01'),
(313, 47, 3, '09:00:00', '2025-05-01'),
(314, 48, 3, '09:00:00', '2025-05-01'),
(315, 49, 3, '09:00:00', '2025-05-01'),
(316, 50, 3, '09:00:00', '2025-05-01'),
(317, 51, 3, '09:00:00', '2025-05-01'),
(318, 52, 3, '09:00:00', '2025-05-01'),
(319, 53, 3, '09:00:00', '2025-05-01'),
(320, 54, 3, '09:00:00', '2025-05-01'),
(321, 55, 3, '09:00:00', '2025-05-01'),
(322, 56, 3, '09:00:00', '2025-05-01'),
(323, 57, 3, '09:00:00', '2025-05-01'),
(324, 58, 3, '09:00:00', '2025-05-01'),
(325, 59, 3, '09:00:00', '2025-05-01'),
(326, 60, 3, '09:00:00', '2025-05-01'),
(327, 61, 3, '09:00:00', '2025-05-01'),
(328, 62, 3, '09:00:00', '2025-05-01'),
(329, 63, 3, '09:00:00', '2025-05-01'),
(330, 64, 3, '09:00:00', '2025-05-01'),
(331, 65, 3, '09:00:00', '2025-05-01'),
(332, 66, 3, '09:00:00', '2025-05-01'),
(342, 45, 3, '13:00:00', '2025-05-02'),
(343, 46, 3, '13:00:00', '2025-05-02'),
(344, 47, 3, '13:00:00', '2025-05-02'),
(345, 48, 3, '13:00:00', '2025-05-02'),
(346, 49, 3, '13:00:00', '2025-05-02'),
(347, 50, 3, '13:00:00', '2025-05-02'),
(348, 51, 3, '13:00:00', '2025-05-02'),
(349, 52, 3, '13:00:00', '2025-05-02'),
(350, 53, 3, '13:00:00', '2025-05-02'),
(351, 54, 3, '13:00:00', '2025-05-02'),
(352, 55, 3, '13:00:00', '2025-05-02'),
(353, 56, 3, '13:00:00', '2025-05-02'),
(354, 57, 3, '13:00:00', '2025-05-02'),
(355, 58, 3, '13:00:00', '2025-05-02'),
(356, 59, 3, '13:00:00', '2025-05-02'),
(357, 60, 3, '13:00:00', '2025-05-02'),
(358, 61, 3, '13:00:00', '2025-05-02'),
(359, 62, 3, '13:00:00', '2025-05-02'),
(360, 63, 3, '13:00:00', '2025-05-02'),
(361, 64, 3, '13:00:00', '2025-05-02'),
(362, 65, 3, '13:00:00', '2025-05-02'),
(363, 66, 3, '13:00:00', '2025-05-02'),
(373, 45, 3, '16:00:00', '2025-05-03'),
(374, 46, 3, '16:00:00', '2025-05-03'),
(375, 47, 3, '16:00:00', '2025-05-03'),
(376, 48, 3, '16:00:00', '2025-05-03'),
(377, 49, 3, '16:00:00', '2025-05-03'),
(378, 50, 3, '16:00:00', '2025-05-03'),
(379, 51, 3, '16:00:00', '2025-05-03'),
(380, 52, 3, '16:00:00', '2025-05-03'),
(381, 53, 3, '16:00:00', '2025-05-03'),
(382, 54, 3, '16:00:00', '2025-05-03'),
(383, 55, 3, '16:00:00', '2025-05-03'),
(384, 56, 3, '16:00:00', '2025-05-03'),
(385, 57, 3, '16:00:00', '2025-05-03'),
(386, 58, 3, '16:00:00', '2025-05-03'),
(387, 59, 3, '16:00:00', '2025-05-03'),
(388, 60, 3, '16:00:00', '2025-05-03'),
(389, 61, 3, '16:00:00', '2025-05-03'),
(390, 62, 3, '16:00:00', '2025-05-03'),
(391, 63, 3, '16:00:00', '2025-05-03'),
(392, 64, 3, '16:00:00', '2025-05-03'),
(393, 65, 3, '16:00:00', '2025-05-03'),
(394, 66, 3, '16:00:00', '2025-05-03'),
(404, 45, 3, '19:00:00', '2025-05-04'),
(405, 46, 3, '19:00:00', '2025-05-04'),
(406, 47, 3, '19:00:00', '2025-05-04'),
(407, 48, 3, '19:00:00', '2025-05-04'),
(408, 49, 3, '19:00:00', '2025-05-04'),
(409, 50, 3, '19:00:00', '2025-05-04'),
(410, 51, 3, '19:00:00', '2025-05-04'),
(411, 52, 3, '19:00:00', '2025-05-04'),
(412, 53, 3, '19:00:00', '2025-05-04'),
(413, 54, 3, '19:00:00', '2025-05-04'),
(414, 55, 3, '19:00:00', '2025-05-04'),
(415, 56, 3, '19:00:00', '2025-05-04'),
(416, 57, 3, '19:00:00', '2025-05-04'),
(417, 58, 3, '19:00:00', '2025-05-04'),
(418, 59, 3, '19:00:00', '2025-05-04'),
(419, 60, 3, '19:00:00', '2025-05-04'),
(420, 61, 3, '19:00:00', '2025-05-04'),
(421, 62, 3, '19:00:00', '2025-05-04'),
(422, 63, 3, '19:00:00', '2025-05-04'),
(423, 64, 3, '19:00:00', '2025-05-04'),
(424, 65, 3, '19:00:00', '2025-05-04'),
(425, 66, 3, '19:00:00', '2025-05-04'),
(435, 45, 3, '22:00:00', '2025-05-05'),
(436, 46, 3, '22:00:00', '2025-05-05'),
(437, 47, 3, '22:00:00', '2025-05-05'),
(438, 48, 3, '22:00:00', '2025-05-05'),
(439, 49, 3, '22:00:00', '2025-05-05'),
(440, 50, 3, '22:00:00', '2025-05-05'),
(441, 51, 3, '22:00:00', '2025-05-05'),
(442, 52, 3, '22:00:00', '2025-05-05'),
(443, 53, 3, '22:00:00', '2025-05-05'),
(444, 54, 3, '22:00:00', '2025-05-05'),
(445, 55, 3, '22:00:00', '2025-05-05'),
(446, 56, 3, '22:00:00', '2025-05-05'),
(447, 57, 3, '22:00:00', '2025-05-05'),
(448, 58, 3, '22:00:00', '2025-05-05'),
(449, 59, 3, '22:00:00', '2025-05-05'),
(450, 60, 3, '22:00:00', '2025-05-05'),
(451, 61, 3, '22:00:00', '2025-05-05'),
(452, 62, 3, '22:00:00', '2025-05-05'),
(453, 63, 3, '22:00:00', '2025-05-05'),
(454, 64, 3, '22:00:00', '2025-05-05'),
(455, 65, 3, '22:00:00', '2025-05-05'),
(456, 66, 3, '22:00:00', '2025-05-05'),
(466, 67, 4, '09:00:00', '2025-05-01'),
(467, 68, 4, '09:00:00', '2025-05-01'),
(468, 69, 4, '09:00:00', '2025-05-01'),
(469, 70, 4, '09:00:00', '2025-05-01'),
(470, 71, 4, '09:00:00', '2025-05-01'),
(471, 72, 4, '09:00:00', '2025-05-01'),
(472, 73, 4, '09:00:00', '2025-05-01'),
(473, 74, 4, '09:00:00', '2025-05-01'),
(474, 75, 4, '09:00:00', '2025-05-01'),
(475, 76, 4, '09:00:00', '2025-05-01'),
(476, 77, 4, '09:00:00', '2025-05-01'),
(477, 78, 4, '09:00:00', '2025-05-01'),
(478, 79, 4, '09:00:00', '2025-05-01'),
(479, 80, 4, '09:00:00', '2025-05-01'),
(480, 81, 4, '09:00:00', '2025-05-01'),
(481, 82, 4, '09:00:00', '2025-05-01'),
(482, 83, 4, '09:00:00', '2025-05-01'),
(483, 84, 4, '09:00:00', '2025-05-01'),
(484, 85, 4, '09:00:00', '2025-05-01'),
(485, 86, 4, '09:00:00', '2025-05-01'),
(486, 87, 4, '09:00:00', '2025-05-01'),
(487, 88, 4, '09:00:00', '2025-05-01'),
(497, 67, 4, '13:00:00', '2025-05-02'),
(498, 68, 4, '13:00:00', '2025-05-02'),
(499, 69, 4, '13:00:00', '2025-05-02'),
(500, 70, 4, '13:00:00', '2025-05-02'),
(501, 71, 4, '13:00:00', '2025-05-02'),
(502, 72, 4, '13:00:00', '2025-05-02'),
(503, 73, 4, '13:00:00', '2025-05-02'),
(504, 74, 4, '13:00:00', '2025-05-02'),
(505, 75, 4, '13:00:00', '2025-05-02'),
(506, 76, 4, '13:00:00', '2025-05-02'),
(507, 77, 4, '13:00:00', '2025-05-02'),
(508, 78, 4, '13:00:00', '2025-05-02'),
(509, 79, 4, '13:00:00', '2025-05-02'),
(510, 80, 4, '13:00:00', '2025-05-02'),
(511, 81, 4, '13:00:00', '2025-05-02'),
(512, 82, 4, '13:00:00', '2025-05-02'),
(513, 83, 4, '13:00:00', '2025-05-02'),
(514, 84, 4, '13:00:00', '2025-05-02'),
(515, 85, 4, '13:00:00', '2025-05-02'),
(516, 86, 4, '13:00:00', '2025-05-02'),
(517, 87, 4, '13:00:00', '2025-05-02'),
(518, 88, 4, '13:00:00', '2025-05-02'),
(528, 67, 4, '16:00:00', '2025-05-03'),
(529, 68, 4, '16:00:00', '2025-05-03'),
(530, 69, 4, '16:00:00', '2025-05-03'),
(531, 70, 4, '16:00:00', '2025-05-03'),
(532, 71, 4, '16:00:00', '2025-05-03'),
(533, 72, 4, '16:00:00', '2025-05-03'),
(534, 73, 4, '16:00:00', '2025-05-03'),
(535, 74, 4, '16:00:00', '2025-05-03'),
(536, 75, 4, '16:00:00', '2025-05-03'),
(537, 76, 4, '16:00:00', '2025-05-03'),
(538, 77, 4, '16:00:00', '2025-05-03'),
(539, 78, 4, '16:00:00', '2025-05-03'),
(540, 79, 4, '16:00:00', '2025-05-03'),
(541, 80, 4, '16:00:00', '2025-05-03'),
(542, 81, 4, '16:00:00', '2025-05-03'),
(543, 82, 4, '16:00:00', '2025-05-03'),
(544, 83, 4, '16:00:00', '2025-05-03'),
(545, 84, 4, '16:00:00', '2025-05-03'),
(546, 85, 4, '16:00:00', '2025-05-03'),
(547, 86, 4, '16:00:00', '2025-05-03'),
(548, 87, 4, '16:00:00', '2025-05-03'),
(549, 88, 4, '16:00:00', '2025-05-03'),
(559, 67, 4, '19:00:00', '2025-05-04'),
(560, 68, 4, '19:00:00', '2025-05-04'),
(561, 69, 4, '19:00:00', '2025-05-04'),
(562, 70, 4, '19:00:00', '2025-05-04'),
(563, 71, 4, '19:00:00', '2025-05-04'),
(564, 72, 4, '19:00:00', '2025-05-04'),
(565, 73, 4, '19:00:00', '2025-05-04'),
(566, 74, 4, '19:00:00', '2025-05-04'),
(567, 75, 4, '19:00:00', '2025-05-04'),
(568, 76, 4, '19:00:00', '2025-05-04'),
(569, 77, 4, '19:00:00', '2025-05-04'),
(570, 78, 4, '19:00:00', '2025-05-04'),
(571, 79, 4, '19:00:00', '2025-05-04'),
(572, 80, 4, '19:00:00', '2025-05-04'),
(573, 81, 4, '19:00:00', '2025-05-04'),
(574, 82, 4, '19:00:00', '2025-05-04'),
(575, 83, 4, '19:00:00', '2025-05-04'),
(576, 84, 4, '19:00:00', '2025-05-04'),
(577, 85, 4, '19:00:00', '2025-05-04'),
(578, 86, 4, '19:00:00', '2025-05-04'),
(579, 87, 4, '19:00:00', '2025-05-04'),
(580, 88, 4, '19:00:00', '2025-05-04'),
(590, 67, 4, '22:00:00', '2025-05-05'),
(591, 68, 4, '22:00:00', '2025-05-05'),
(592, 69, 4, '22:00:00', '2025-05-05'),
(593, 70, 4, '22:00:00', '2025-05-05'),
(594, 71, 4, '22:00:00', '2025-05-05'),
(595, 72, 4, '22:00:00', '2025-05-05'),
(596, 73, 4, '22:00:00', '2025-05-05'),
(597, 74, 4, '22:00:00', '2025-05-05'),
(598, 75, 4, '22:00:00', '2025-05-05'),
(599, 76, 4, '22:00:00', '2025-05-05'),
(600, 77, 4, '22:00:00', '2025-05-05'),
(601, 78, 4, '22:00:00', '2025-05-05'),
(602, 79, 4, '22:00:00', '2025-05-05'),
(603, 80, 4, '22:00:00', '2025-05-05'),
(604, 81, 4, '22:00:00', '2025-05-05'),
(605, 82, 4, '22:00:00', '2025-05-05'),
(606, 83, 4, '22:00:00', '2025-05-05'),
(607, 84, 4, '22:00:00', '2025-05-05'),
(608, 85, 4, '22:00:00', '2025-05-05'),
(609, 86, 4, '22:00:00', '2025-05-05'),
(610, 87, 4, '22:00:00', '2025-05-05'),
(611, 88, 4, '22:00:00', '2025-05-05'),
(621, 89, 5, '09:00:00', '2025-05-01'),
(622, 90, 5, '09:00:00', '2025-05-01'),
(623, 91, 5, '09:00:00', '2025-05-01'),
(624, 92, 5, '09:00:00', '2025-05-01'),
(625, 93, 5, '09:00:00', '2025-05-01'),
(626, 94, 5, '09:00:00', '2025-05-01'),
(627, 95, 5, '09:00:00', '2025-05-01'),
(628, 96, 5, '09:00:00', '2025-05-01'),
(629, 97, 5, '09:00:00', '2025-05-01'),
(630, 98, 5, '09:00:00', '2025-05-01'),
(631, 99, 5, '09:00:00', '2025-05-01'),
(632, 100, 5, '09:00:00', '2025-05-01'),
(633, 101, 5, '09:00:00', '2025-05-01'),
(634, 102, 5, '09:00:00', '2025-05-01'),
(635, 103, 5, '09:00:00', '2025-05-01'),
(636, 104, 5, '09:00:00', '2025-05-01'),
(637, 105, 5, '09:00:00', '2025-05-01'),
(638, 106, 5, '09:00:00', '2025-05-01'),
(639, 107, 5, '09:00:00', '2025-05-01'),
(640, 108, 5, '09:00:00', '2025-05-01'),
(641, 109, 5, '09:00:00', '2025-05-01'),
(642, 110, 5, '09:00:00', '2025-05-01'),
(652, 89, 5, '13:00:00', '2025-05-02'),
(653, 90, 5, '13:00:00', '2025-05-02'),
(654, 91, 5, '13:00:00', '2025-05-02'),
(655, 92, 5, '13:00:00', '2025-05-02'),
(656, 93, 5, '13:00:00', '2025-05-02'),
(657, 94, 5, '13:00:00', '2025-05-02'),
(658, 95, 5, '13:00:00', '2025-05-02'),
(659, 96, 5, '13:00:00', '2025-05-02'),
(660, 97, 5, '13:00:00', '2025-05-02'),
(661, 98, 5, '13:00:00', '2025-05-02'),
(662, 99, 5, '13:00:00', '2025-05-02'),
(663, 100, 5, '13:00:00', '2025-05-02'),
(664, 101, 5, '13:00:00', '2025-05-02'),
(665, 102, 5, '13:00:00', '2025-05-02'),
(666, 103, 5, '13:00:00', '2025-05-02'),
(667, 104, 5, '13:00:00', '2025-05-02'),
(668, 105, 5, '13:00:00', '2025-05-02'),
(669, 106, 5, '13:00:00', '2025-05-02'),
(670, 107, 5, '13:00:00', '2025-05-02'),
(671, 108, 5, '13:00:00', '2025-05-02'),
(672, 109, 5, '13:00:00', '2025-05-02'),
(673, 110, 5, '13:00:00', '2025-05-02'),
(683, 89, 5, '16:00:00', '2025-05-03'),
(684, 90, 5, '16:00:00', '2025-05-03'),
(685, 91, 5, '16:00:00', '2025-05-03'),
(686, 92, 5, '16:00:00', '2025-05-03'),
(687, 93, 5, '16:00:00', '2025-05-03'),
(688, 94, 5, '16:00:00', '2025-05-03'),
(689, 95, 5, '16:00:00', '2025-05-03'),
(690, 96, 5, '16:00:00', '2025-05-03'),
(691, 97, 5, '16:00:00', '2025-05-03'),
(692, 98, 5, '16:00:00', '2025-05-03'),
(693, 99, 5, '16:00:00', '2025-05-03'),
(694, 100, 5, '16:00:00', '2025-05-03'),
(695, 101, 5, '16:00:00', '2025-05-03'),
(696, 102, 5, '16:00:00', '2025-05-03'),
(697, 103, 5, '16:00:00', '2025-05-03'),
(698, 104, 5, '16:00:00', '2025-05-03'),
(699, 105, 5, '16:00:00', '2025-05-03'),
(700, 106, 5, '16:00:00', '2025-05-03'),
(701, 107, 5, '16:00:00', '2025-05-03'),
(702, 108, 5, '16:00:00', '2025-05-03'),
(703, 109, 5, '16:00:00', '2025-05-03'),
(704, 110, 5, '16:00:00', '2025-05-03'),
(714, 89, 5, '19:00:00', '2025-05-04'),
(715, 90, 5, '19:00:00', '2025-05-04'),
(716, 91, 5, '19:00:00', '2025-05-04'),
(717, 92, 5, '19:00:00', '2025-05-04'),
(718, 93, 5, '19:00:00', '2025-05-04'),
(719, 94, 5, '19:00:00', '2025-05-04'),
(720, 95, 5, '19:00:00', '2025-05-04'),
(721, 96, 5, '19:00:00', '2025-05-04'),
(722, 97, 5, '19:00:00', '2025-05-04'),
(723, 98, 5, '19:00:00', '2025-05-04'),
(724, 99, 5, '19:00:00', '2025-05-04'),
(725, 100, 5, '19:00:00', '2025-05-04'),
(726, 101, 5, '19:00:00', '2025-05-04'),
(727, 102, 5, '19:00:00', '2025-05-04'),
(728, 103, 5, '19:00:00', '2025-05-04'),
(729, 104, 5, '19:00:00', '2025-05-04'),
(730, 105, 5, '19:00:00', '2025-05-04'),
(731, 106, 5, '19:00:00', '2025-05-04'),
(732, 107, 5, '19:00:00', '2025-05-04'),
(733, 108, 5, '19:00:00', '2025-05-04'),
(734, 109, 5, '19:00:00', '2025-05-04'),
(735, 110, 5, '19:00:00', '2025-05-04'),
(745, 89, 5, '22:00:00', '2025-05-05'),
(746, 90, 5, '22:00:00', '2025-05-05'),
(747, 91, 5, '22:00:00', '2025-05-05'),
(748, 92, 5, '22:00:00', '2025-05-05'),
(749, 93, 5, '22:00:00', '2025-05-05'),
(750, 94, 5, '22:00:00', '2025-05-05'),
(751, 95, 5, '22:00:00', '2025-05-05'),
(752, 96, 5, '22:00:00', '2025-05-05'),
(753, 97, 5, '22:00:00', '2025-05-05'),
(754, 98, 5, '22:00:00', '2025-05-05'),
(755, 99, 5, '22:00:00', '2025-05-05'),
(756, 100, 5, '22:00:00', '2025-05-05'),
(757, 101, 5, '22:00:00', '2025-05-05'),
(758, 102, 5, '22:00:00', '2025-05-05'),
(759, 103, 5, '22:00:00', '2025-05-05'),
(760, 104, 5, '22:00:00', '2025-05-05'),
(761, 105, 5, '22:00:00', '2025-05-05'),
(762, 106, 5, '22:00:00', '2025-05-05'),
(763, 107, 5, '22:00:00', '2025-05-05'),
(764, 108, 5, '22:00:00', '2025-05-05'),
(765, 109, 5, '22:00:00', '2025-05-05'),
(766, 110, 5, '22:00:00', '2025-05-05');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `first_name` varchar(50) DEFAULT NULL,
  `last_name` varchar(50) DEFAULT NULL,
  `user_email` varchar(250) DEFAULT NULL,
  `user_password` varchar(250) DEFAULT NULL,
  `user_profile` varchar(999) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `first_name`, `last_name`, `user_email`, `user_password`, `user_profile`) VALUES
(3, 'mbts001', 'Justine', 'Toong', 'programmerjustine@gmail.com', '$2y$10$pyOHLb6HkRmsdJN22snuDOysNYeF5qzVeC5207pDKDZO1Pqwijss.', '../assets/images/others/Adolf-Hitler-1933.webp'),
(4, 'mbts002', 'Adolf', 'Hitler', 'hitleradolf@gmail.com', '$2y$10$aoR.HPdXCYJ8EEblM9M9EOQdSTwSRgDaMetbUOI7jPcggYzYf1mMq', '');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admin_email` (`admin_email`);

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `cinemas`
--
ALTER TABLE `cinemas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `movie_schedules`
--
ALTER TABLE `movie_schedules`
  ADD PRIMARY KEY (`id`),
  ADD KEY `movie_id` (`movie_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `user_email` (`user_email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cinemas`
--
ALTER TABLE `cinemas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=128;

--
-- AUTO_INCREMENT for table `movie_schedules`
--
ALTER TABLE `movie_schedules`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=807;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `movie_schedules`
--
ALTER TABLE `movie_schedules`
  ADD CONSTRAINT `movie_schedules_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
