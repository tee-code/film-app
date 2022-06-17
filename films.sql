-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Jun 17, 2022 at 11:16 AM
-- Server version: 5.7.24
-- PHP Version: 8.1.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `films`
--

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf16_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf16_unicode_ci NOT NULL,
  `dob` date NOT NULL,
  `password` varchar(255) COLLATE utf16_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf16_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `email`, `dob`, `password`, `address`) VALUES
(1, 'Oluwatobi Odekunle', 'ooluwatobialao@gmail.com', '1996-04-18', 'lordteecode', 'Uyo, Akwa Ibom State.'),
(2, 'Oluwatobi Odekunle', 'ooluwatobialao1@gmail.com', '1996-04-18', 'lordteecode', 'Uyo, Akwa Ibom State.'),
(3, 'Oluwatobi Adekunle', 'ooluwatobialao2@gmail.com', '1959-04-18', 'lordteecode', 'Abak, Akwa Ibom State.'),
(4, 'Oluwatobi Emmanuel', 'ooluwatobialao3@gmail.com', '1995-04-18', 'lordteecode', 'Surulere, Lagos State.'),
(5, 'Emmanuel Odekunle', 'ooluwatobialao4@gmail.com', '1986-04-18', 'lordteecode', 'Ibadan, Oyo State.');

-- --------------------------------------------------------

--
-- Table structure for table `films`
--

CREATE TABLE `films` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf16_unicode_ci NOT NULL,
  `is_available` tinyint(1) NOT NULL DEFAULT '0',
  `amount` float NOT NULL,
  `genre_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `films`
--

INSERT INTO `films` (`id`, `name`, `is_available`, `amount`, `genre_id`) VALUES
(3, 'The Pirate', 1, 200000, 1),
(4, '3 Idiots', 1, 300000, 4),
(5, 'The Pirate 2', 0, 200000, 1),
(6, 'Wedding Party', 1, 300000, 2),
(7, 'Source of Love', 1, 200000, 3);

-- --------------------------------------------------------

--
-- Table structure for table `genres`
--

CREATE TABLE `genres` (
  `id` int(11) NOT NULL,
  `name` varchar(255) COLLATE utf16_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `genres`
--

INSERT INTO `genres` (`id`, `name`) VALUES
(1, 'Action'),
(2, 'Love'),
(3, 'Romance'),
(4, 'Comedy');

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `customer_id` int(11) NOT NULL,
  `film_id` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf16 COLLATE=utf16_unicode_ci;

--
-- Dumping data for table `purchases`
--

INSERT INTO `purchases` (`customer_id`, `film_id`, `date`) VALUES
(1, 4, '2022-05-16 17:15:42'),
(2, 3, '2022-06-16 17:16:20'),
(3, 6, '2022-06-16 17:16:20'),
(4, 7, '2022-06-17 12:16:12');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Indexes for table `films`
--
ALTER TABLE `films`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD UNIQUE KEY `name` (`name`),
  ADD KEY `id_2` (`id`),
  ADD KEY `genre_id` (`genre_id`);

--
-- Indexes for table `genres`
--
ALTER TABLE `genres`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`customer_id`,`film_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `film_id` (`film_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `films`
--
ALTER TABLE `films`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `genres`
--
ALTER TABLE `genres`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `films`
--
ALTER TABLE `films`
  ADD CONSTRAINT `films_ibfk_1` FOREIGN KEY (`genre_id`) REFERENCES `genres` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `purchases`
--
ALTER TABLE `purchases`
  ADD CONSTRAINT `purchases_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purchases_ibfk_2` FOREIGN KEY (`film_id`) REFERENCES `films` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
