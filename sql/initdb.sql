-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: mysql
-- Generation Time: Nov 30, 2021 at 02:48 PM
-- Server version: 10.6.4-MariaDB-1:10.6.4+maria~focal
-- PHP Version: 7.4.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `haarlemdb`
--

use haarlemdb;


-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
     `id` int(11) UNIQUE NOT NULL,
     `username` varchar(255) UNIQUE NOT NULL,
     `email` varchar(255) UNIQUE NOT NULL,
     `password` varchar(1000) NOT NULL,
     `first_name` varchar(255) NULL,
     `last_name` varchar(255) NULL,
     `permissions` int(11) DEFAULT 1,
     `date_created` datetime  DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--


--
-- Indexes for dumped tables
--

--
-- Indexes for table `users`
--

ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--

ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=0;

-- --------------------------------------------------------

--
-- Table structure for table `restaurantCategory`
--

CREATE TABLE `restaurantCategory` (
    `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `category` varchar(21) NOT NULL,
    `order` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `restaurantCategory`
--

INSERT INTO `restaurantCategory` (`id`, `category`, `order`) VALUES
    (1, 'From The Sea', 1),
    (2, 'International Cuisine', 2);

-- --------------------------------------------------------

--
-- Table structure for table `restaurantCategory`
--

CREATE TABLE `restaurant` (
    `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` varchar(50) NOT NULL,
    `tags` varchar(35) NOT NULL,
    `rating` int NOT NULL,
    `address` varchar(100) NOT NULL,
    `phoneNumber` varchar(25) NOT NULL,
    `menuLink` varchar(255) NOT NULL,
    `menuText` text NOT NULL,
    `description` text NOT NULL,
    `adultPrice` float NOT NULL,
    `childPrice` float NOT NULL,
    `previewImage` blob NOT NULL,
    `frontPageImage` blob NOT NULL,
    `displayImageOne` blob NOT NULL,
    `displayImageTwo` blob NOT NULL,
    `category` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `restaurant`
ADD CONSTRAINT `FK_CATEGORY_ID` FOREIGN KEY (`category`) REFERENCES `restaurantCategory`(`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (id, name, tags, rating, address, phoneNumber, menuLink, menuText, `description`, adultPrice, childPrice, previewImage, frontPageImage, displayImageOne, displayImageTwo, category) VALUES
    (1, 'Ratatouille', 'French,Fish and Seafood,European', 4, 'Spaarne 96, 2011 CL Haarlem', '123', 'google.com', 'foo', 'foo', 5, 5, 'Ratatouille', 'Ratatouille', 'Ratatouille', 'Ratatouille', 1),
    (2, 'ML', 'Dutch,Fish and Seafood,European', 4, 'Kleine Houtstraat 70, 2011 DR Haarlem', '123', 'google.com', 'foo', 'foo', 5, 5, 'Ratatouille', 'Ratatouille', 'Ratatouille', 'Ratatouille', 1),
    (3, 'Fris', 'Dutch,French,European', 4, 'Twijnderslaan 7, 2012 BG Haarlem', '123', 'google.com', 'foo', 'foo', 5, 5, 'Ratatouille', 'Ratatouille', 'Ratatouille', 'Ratatouille', 2),
    (4, 'Specktakel', 'Asian,International,European', 3, 'Spekstraat 4, 2011 HM Haarlem', '123', 'google.com', 'foo', 'foo', 5, 5, 'Ratatouille', 'Ratatouille', 'Ratatouille', 'Ratatouille', 2);

-- --------------------------------------------------------

--
-- Table structure for table `restaurantSession`
--

CREATE TABLE `restaurantSession` (
    `id` int(11) NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `timeslot` DATETIME NOT NULL,
    `availableSeats` int NOT NULL,
    `restaurant` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `restaurantSession`
ADD CONSTRAINT `FK_RESTAURANT_ID` FOREIGN KEY (`restaurant`) REFERENCES `restaurant`(`id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- --------------------------------------------------------

--
-- Table structure for table `yummyDetails`
--

CREATE TABLE `yummyDetails` (
    `date` varchar(50) NOT NULL PRIMARY KEY,
    `description` text NOT NULL,
    `reminder` text NOT NULL
);

--
-- Dumping data for table `yummyDetails`
--

INSERT INTO `yummyDetails` (`date`, `description`, `reminder`) VALUES
    ('July 25th-28th', 'Come and see the participating restaurants at our very own food event at the Haarlem Festival. Featuring all sorts of different cuisines you''re sure to find something you that fits your tastes! Take a quick look at each restaurant and easily find out more about any restaurant and book your very own reservation by clicking "Learn More".', 'A reservation is mandatory to dine at participating restaurants, remember to book before you wish to dine!');


-- --------------------------------------------------------

--
-- Table structure for table `resetTokens`
--

CREATE TABLE `resetTokens` (
     `id` int(11) AUTO_INCREMENT PRIMARY KEY,
     `email` varchar(255) NOT NULL,
     `token` VARCHAR(255) NOT NULL,
     `expiration` datetime  NOT NULL,
     `date_created` datetime  DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `resetTokens`
--


--
-- Indexes for dumped tables
--

--
-- Indexes for table `resetTokens`
--

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `resetTokens`
--

-- --------------------------------------------------------

--
-- Table structure for table `texts`
--

CREATE TABLE `texts` (
                         `id` int(11) NOT NULL,
                         `category` varchar(55) NOT NULL,
                         `text` mediumtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `texts`
--

INSERT INTO `texts` (`id`, `category`, `text`) VALUES
   (1, '', "July 2024"),
   (2, '', "Immerse yourself in the vibrant beats of Haarlem Dance! Join us for an electrifying showcase featuring the finest DJs, where each set promises to transport you through the realms of electronic music. From pulsating bass lines to soaring melodies, get ready to dance the night away in an unforgettable atmosphere. Don\'t miss out on this rhythmic extravaganza!\r\n\r\n\r\n\r\nThe event will take place on the 26, 27 and 28th of July"),
   (3, '', "Browse through 7 different unique restaurants in the Yummy! event, each restaurant featuring delicious cuisine so you’re guaranteed to find something you like. \r\n\r\nThe 7 different restaurants are categorized with restaurants featuring more seafood and others featuring a more international cuisine, quickly learn more about each different restaurant and make a reservation directly on the same page.\r\n\r\nThe event will take place on the 25, 26, 27, and 28th of July."),
   (4, '', "Stroll Through History is a walking tour, where we will visit nine of Haarlem’s historic landmarks and learn more about them.\r\n\r\nThe city of Haarlem boast a profoundly rich and captivating history. Haarlem is a very old city with turbulent history and great sites to see. We want to invite people to come to Haarlem and feast their eyes on the splendour of old and new.\r\n\r\nThe event will take place on the 25, 26, 27 and 28th of July.\r\n\r\nThe tour is offered in three languages: English, Dutch and Mandarin."),
   (5, '', "Explore the wonders of art and history with the Teyler Museum\'s Children Puzzle App! With its engaging historical material and fascinating puzzles, this interactive program is perfect for young brains as it combines education and fun. It gives kids an enjoyable approach to discover the wonders of art."),
   (6, '', "The city of Haarlem boast a profoundly rich and captivating history. Therefore we will be offering a guided tour through Haarlem, visiting buildings and places that offered an important contribution to Haarlem’s history. During the event stroll through history we will visit nine of Haarlem’s historic landmarks, by foot. Haarlem is a very old city with turbulent history and great sites to see. We want to invite people to come to Haarlem and feast their eyes on the splendour of old and new."),
   (7, 'history_practicalInformation', 'Duration:\r\n2.5 hours.'),
   (8, 'history_practicalInformation', 'When:\r\nThursday 25th of July 2024 to Sunday 28 July 2024.'),
   (9, 'history_practicalInformation', 'Break:\r\n15 minutes, including one free drink per person.'),
   (10, 'history_practicalInformation', 'Group size:\r\n12 participants and 1 tour guide.'),
   (11, 'history_practicalInformation', 'Price:\r\n€ 17,50 per person. Or € 60,- for a group of 4.'),
   (12, '', 'We host the tour in 3 different languages, below you’ll find the schedule for each language.  '),
   (13, '', 'Church of St. Bavo'),
   (14, '', 'Grote Markt 22, 2011 RD Haarlem'),
   (15, '', 'The tour will start at the Church of St. Bavo, at the Grote Markt, in the centre of Haarlem. The exact location will be marked with a big flag.');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `texts`
--
ALTER TABLE `texts`
    ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `texts`
--
ALTER TABLE `texts`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

-- --------------------------------------------------------

--
-- Table structure for table `festivalEvents`
--

CREATE TABLE `festivalEvents` (
                                  `id` int(11) NOT NULL,
                                  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `festivalEvents`
--

INSERT INTO `festivalEvents` (`id`, `name`) VALUES
            (1, 'DANCE!'),
            (2, 'Yummy!'),
            (3, 'Stroll Through History'),
            (4, 'The Secret Of Professor Teyler');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `festivalEvents`
--
ALTER TABLE `festivalEvents`
    ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `festivalEvents`
--
ALTER TABLE `festivalEvents`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

-- --------------------------------------------------------

--
-- Table structure for table `festivalSchedule`
--

CREATE TABLE `festivalSchedule` (
                                    `id` int(11) NOT NULL,
                                    `event` int(11) NOT NULL,
                                    `date` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `festivalSchedule`
--

INSERT INTO `festivalSchedule` (`id`, `event`, `date`) VALUES
    (1, 1, '2024-07-26 00:00:00'),
    (2, 1, '2024-07-27 00:00:00'),
    (3, 1, '2024-07-28 00:00:00'),
    (4, 2, '2024-07-25 00:00:00'),
    (5, 2, '2024-07-26 00:00:00'),
    (6, 2, '2024-07-27 00:00:00'),
    (7, 2, '2024-07-28 00:00:00'),
    (8, 3, '2024-07-25 00:00:00'),
    (9, 3, '2024-07-26 00:00:00'),
    (10, 3, '2024-07-27 00:00:00'),
    (11, 3, '2024-07-28 00:00:00'),
    (12, 4, '2024-07-25 00:00:00'),
    (13, 4, '2024-07-26 00:00:00'),
    (14, 4, '2024-07-27 00:00:00'),
    (15, 4, '2024-07-28 00:00:00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `festivalSchedule`
--
ALTER TABLE `festivalSchedule`
    ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `festivalSchedule`
--
ALTER TABLE `festivalSchedule`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

-- --------------------------------------------------------

--
-- Table structure for table `historyContent`
--

CREATE TABLE `historyContent` (
                                  `id` int(11) NOT NULL,
                                  `category` varchar(255) DEFAULT NULL,
                                  `content` mediumtext NOT NULL,
                                  `addition` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `historyContent`
--

INSERT INTO `historyContent` (`id`, `category`, `content`, `addition`) VALUES
                                                                           (1, '', 'The city of Haarlem boast a profoundly rich and captivating history. Therefore we will be offering a guided tour through Haarlem, visiting buildings and places that offered an important contribution to Haarlem’s history. During the event stroll through history we will visit nine of Haarlem’s historic landmarks, by foot. Haarlem is a very old city with turbulent history and great sites to see. We want to invite people to come to Haarlem and feast their eyes on the splendour of old and new.', ''),
                                                                           (2, 'practicalInformation', 'Duration:\r\n2.5 hours.', '\\img\\history\\duration_icon.png'),
                                                                           (3, 'practicalInformation', 'When:\r\nThursday 25th of July 2024 to Sunday 28 July 2024.', '\\img\\history\\when_icon.png'),
                                                                           (4, 'practicalInformation', 'Break:\r\n15 minutes, including one free drink per person.', '\\img\\history\\break_icon.png'),
                                                                           (5, 'practicalInformation', 'Group size:\r\n12 participants and 1 tour guide.', '\\img\\history\\groupsize_icon.png'),
                                                                           (6, 'practicalInformation', 'Price:\r\n€ 17,50 per person. Or € 60,- for a group of 4.', '\\img\\history\\price_icon.png'),
                                                                           (7, '', 'We host the tour in 3 different languages, below you’ll find the schedule for each language.  ', ''),
                                                                           (8, '', 'Church of St. Bavo', ''),
                                                                           (9, '', 'Grote Markt 22, 2011 RD Haarlem', ''),
                                                                           (10, '', 'The tour will start at the Church of St. Bavo, at the Grote Markt, in the centre of Haarlem. The exact location will be marked with a big flag.', ''),
                                                                           (11, 'faq', 'Where do we gather?', 'The tour starts near the Church of St. Bavo at the Grote Markt, in the centre of Haarlem. A giant flag will mark the exact starting location.'),
                                                                           (12, 'faq', 'How long does the event last?', 'The duration of the walking tour is approximately 2,5 hours.'),
                                                                           (13, 'faq', 'Is there a break during the event?', 'During the tour, there will be a 15 minute break, including one free drink per person.'),
                                                                           (14, 'faq', 'Is the event free?', 'No. Participating in the event costs € 17,50 per person, or € 60,- for a group of 4.'),
                                                                           (15, 'faq', 'How old do I need to be to participate?', 'You need to be at least 12 years old to participate.'),
                                                                           (16, 'faq', 'Can I bring a stroller?', 'No. Sadly bringing a stroller is not allowed during the event. '),
                                                                           (17, 'faq', 'Is the event wheelchair friendly?', 'We don’t recommend attending with a wheelchair. Not all location we will be entering are wheelchair accessible, so you will be missing out on some things, if you do wish to attend on a wheelchair.'),
                                                                           (18, 'faq', 'How much walking is involved during the tour?', 'We will walk approximately.'),
                                                                           (19, 'faq', 'How big is each tour group?', 'The group size of each tour is 12 participants and 1 tour guide.'),
                                                                           (20, 'location1', 'Church of St. Bavo', 'title'),
                                                                           (21, 'location1', 'The St. Bavo Church stands as a testament to the rich history and architectural grandeur of Haarlem. The church is officially named the Grote Kerk, meaning \"Great Church,\" and is dedicated to Saint Bavo, a 7th-century Flemish saint. It is one of the most significant landmarks in the city and a masterpiece of Gothic architecture.', 'description'),
                                                                           (22, 'location1', 'The Church of St. Bavo is the first location we will be visiting during the tour. The Church of St. Bavo, also knows as the Grote Kerk (Great Church), is dedicated to Saint Bavo, a 7th-century Flemish saint. The Church is the main Protestant Church in Haarlem. It is one of the most significant landmarks in the city and a masterpiece of Gothic architecture.', 'text1'),
                                                                           (23, 'location1', 'Grote Markt 22, 2011 RD Haarlem', 'address'),
                                                                           (24, 'location1', 'The church has a rich history that dates back to the 14th century. Construction of the church began in the mid-14th century and continued over several centuries, with various architectural styles represented in its structure.\r\n\r\nThe church is known for its impressive Gothic architecture and features such as the towering steeple, which stands as one of the tallest in the Netherlands.\r\n\r\nThe Church of St. Bavo is a symbol of Haarlem\'s cultural heritage and religious history. Its architecture and interior reflect the changing styles and artistic achievements of different periods.\r\n', 'text2'),
(25, 'location1', 'Inside the Church of St. Bavo, visitors can find numerous works of art, including the famous Muller organ, built by Christian Müller in the 18th century. This organ is renowned for its size and musical quality.\r\nThe church houses several notable artworks, including the tomb of Frans Hals, the renowned Dutch Golden Age painter. Hals was buried in the church in 1666.\r\nThe aforementioned Muller organ is a masterpiece of organ building and is a major draw for music enthusiasts and tourists alike.\r\n', 'text3'),
(26, 'location1', 'It is a place of worship and holds regular religious services.\r\n\r\nAdditionally, the church is a venue for concerts and cultural events due to its impressive acoustics and historical significance.\r\n', 'text4'),
(27, 'location1', 'In summary, the Church of St. Bavo in Haarlem is not only a place of worship but also a historical and cultural treasure that contributes significantly to the identity and heritage of the city. Its architecture, artworks, and cultural events make it a central element in Haarlem\'s vibrant cultural landscape.', 'text5');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `historyContent`
--
ALTER TABLE `historyContent`
    ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `historyContent`
--
ALTER TABLE `historyContent`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

-- --------------------------------------------------------

--
-- Table structure for table `historySchedule`
--

CREATE TABLE `historySchedule` (
                                   `id` int(11) NOT NULL,
                                   `language` varchar(255) NOT NULL,
                                   `startTime` datetime NOT NULL,
                                   `endTime` datetime NOT NULL,
                                   `tourGuide` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `historySchedule`
--

INSERT INTO `historySchedule` (`id`, `language`, `startTime`, `endTime`, `tourGuide`) VALUES
                                                                                              (1, 'english', '2024-07-25 10:00:00', '2024-07-25 12:30:00', 'Frederic'),
                                                                                              (2, 'english', '2024-07-25 13:00:00', '2024-07-25 15:30:00', 'Frederic'),
                                                                                              (3, 'english', '2024-07-25 16:00:00', '2024-07-25 18:30:00', 'Frederic'),
                                                                                              (4, 'english', '2024-07-26 10:00:00', '2024-07-26 12:30:00', 'William'),
                                                                                              (5, 'english', '2024-07-26 13:00:00', '2024-07-26 15:30:00', 'William'),
                                                                                              (6, 'english', '2024-07-26 16:00:00', '2024-07-26 18:30:00', 'William'),
                                                                                              (7, 'english', '2024-07-27 10:00:00', '2024-07-27 12:30:00', 'Frederic & William'),
                                                                                              (8, 'english', '2024-07-27 13:00:00', '2024-07-27 15:30:00', 'Frederic & William'),
                                                                                              (9, 'english', '2024-07-27 16:00:00', '2024-07-27 18:30:00', 'Frederic'),
                                                                                              (10, 'english', '2024-07-28 10:00:00', '2024-07-28 12:30:00', 'Deindre & Frederic'),
                                                                                              (11, 'english', '2024-07-28 13:00:00', '2024-07-28 15:30:00', 'Deindre, Frederic & William'),
                                                                                              (12, 'english', '2024-07-28 16:00:00', '2024-07-28 18:30:00', 'Deindre'),
                                                                                              (13, 'dutch', '2024-07-25 10:00:00', '2024-07-25 12:30:00', 'Jan-Willem'),
                                                                                              (14, 'dutch', '2024-07-25 13:00:00', '2024-07-25 15:30:00', 'Jan-Willem'),
                                                                                              (15, 'dutch', '2024-07-25 16:00:00', '2024-07-25 18:30:00', 'Jan-Willem'),
                                                                                              (16, 'dutch', '2024-07-26 10:00:00', '2024-07-26 12:30:00', 'Annet'),
                                                                                              (17, 'dutch', '2024-07-26 13:00:00', '2024-07-26 15:30:00', 'Annet'),
                                                                                              (18, 'dutch', '2024-07-26 16:00:00', '2024-07-26 18:30:00', 'Annet'),
                                                                                              (19, 'dutch', '2024-07-27 10:00:00', '2024-07-27 12:30:00', 'Annet & Jan-Willem'),
                                                                                              (20, 'dutch', '2024-07-27 13:00:00', '2024-07-27 15:30:00', 'Annet & Jan-Willem'),
                                                                                              (21, 'dutch', '2024-07-27 16:00:00', '2024-07-27 18:30:00', 'Annet'),
                                                                                              (22, 'dutch', '2024-07-28 10:00:00', '2024-07-28 12:30:00', 'Lisa & Annet'),
                                                                                              (23, 'dutch', '2024-07-28 13:00:00', '2024-07-28 15:30:00', 'Lisa, Annet & Jan-Willem'),
                                                                                              (24, 'dutch', '2024-07-28 16:00:00', '2024-07-28 18:30:00', 'Lisa'),
                                                                                              (25, 'mandarin', '2024-07-26 13:00:00', '2024-07-26 15:30:00', 'Kim'),
                                                                                              (26, 'mandarin', '2024-07-27 13:00:00', '2024-07-27 15:30:00', 'Kim'),
                                                                                              (27, 'mandarin', '2024-07-27 16:00:00', '2024-07-27 18:30:00', 'Kim'),
                                                                                              (28, 'mandarin', '2024-07-28 10:00:00', '2024-07-28 12:30:00', 'Kim'),
                                                                                              (29, 'mandarin', '2024-07-28 13:00:00', '2024-07-28 15:30:00', 'Kim & Susan');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `historySchedule`
--
ALTER TABLE `historySchedule`
    ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `historySchedule`
--
ALTER TABLE `historySchedule`
    MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

COMMIT;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
