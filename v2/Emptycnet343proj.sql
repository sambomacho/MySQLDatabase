-- phpMyAdmin SQL Dump
-- version 4.2.11
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Mar 04, 2015 at 06:10 PM
-- Server version: 5.6.21
-- PHP Version: 5.6.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `cnet343proj`
--
CREATE DATABASE IF NOT EXISTS `cnet343proj` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `cnet343proj`;

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

DROP TABLE IF EXISTS `bookings`;
CREATE TABLE IF NOT EXISTS `bookings` (
`booking_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `screening_id` int(11) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `films`
--

DROP TABLE IF EXISTS `films`;
CREATE TABLE IF NOT EXISTS `films` (
`film_id` int(11) NOT NULL,
  `imdb_id` varchar(10) NOT NULL,
  `film_name` varchar(60) NOT NULL,
  `age_rating` varchar(3) NOT NULL,
  `year` year(4) NOT NULL,
  `runtime` varchar(10) NOT NULL,
  `release_date` date NOT NULL,
  `genre` varchar(60) NOT NULL,
  `description` varchar(255) NOT NULL,
  `director` varchar(60) NOT NULL,
  `writers` varchar(60) NOT NULL,
  `language` varchar(60) NOT NULL,
  `origin` varchar(60) NOT NULL,
  `awards` varchar(60) NOT NULL,
  `metascore` int(2) NOT NULL,
  `imdb_rating` float NOT NULL,
  `imdb_votes` int(6) NOT NULL,
  `image_loc` varchar(255) NOT NULL,
  `actors` varchar(60) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `screenings`
--

DROP TABLE IF EXISTS `screenings`;
CREATE TABLE IF NOT EXISTS `screenings` (
`screening_id` int(11) NOT NULL,
  `venue_id` int(11) NOT NULL,
  `film_id` int(11) NOT NULL,
  `screening_date` date NOT NULL,
  `screen_number` int(2) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
`user_id` int(11) NOT NULL,
  `fname` varchar(60) NOT NULL,
  `sname` varchar(60) NOT NULL,
  `dob` date NOT NULL,
  `mobile` varchar(13) NOT NULL,
  `email` varchar(160) NOT NULL,
  `password` varchar(40) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `venues`
--

DROP TABLE IF EXISTS `venues`;
CREATE TABLE IF NOT EXISTS `venues` (
`venue_id` int(11) NOT NULL,
  `venue_name` varchar(60) NOT NULL,
  `postcode` varchar(10) NOT NULL,
  `latitude` float NOT NULL,
  `longitude` float NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
 ADD PRIMARY KEY (`booking_id`), ADD UNIQUE KEY `user_id` (`user_id`,`screening_id`), ADD KEY `screening_id_idx` (`screening_id`);

--
-- Indexes for table `films`
--
ALTER TABLE `films`
 ADD PRIMARY KEY (`film_id`), ADD UNIQUE KEY `imdb_id` (`imdb_id`);

--
-- Indexes for table `screenings`
--
ALTER TABLE `screenings`
 ADD PRIMARY KEY (`screening_id`), ADD UNIQUE KEY `venue_id` (`venue_id`,`film_id`), ADD KEY `film_id_idx` (`film_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
 ADD PRIMARY KEY (`user_id`), ADD UNIQUE KEY `mobile` (`mobile`,`email`);

--
-- Indexes for table `venues`
--
ALTER TABLE `venues`
 ADD PRIMARY KEY (`venue_id`), ADD UNIQUE KEY `venue_name` (`venue_name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `films`
--
ALTER TABLE `films`
MODIFY `film_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=24;
--
-- AUTO_INCREMENT for table `screenings`
--
ALTER TABLE `screenings`
MODIFY `screening_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
MODIFY `user_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=15;
--
-- AUTO_INCREMENT for table `venues`
--
ALTER TABLE `venues`
MODIFY `venue_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
ADD CONSTRAINT `screening_id` FOREIGN KEY (`screening_id`) REFERENCES `screenings` (`screening_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `user_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Constraints for table `screenings`
--
ALTER TABLE `screenings`
ADD CONSTRAINT `film_id` FOREIGN KEY (`film_id`) REFERENCES `films` (`film_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
ADD CONSTRAINT `venue_id` FOREIGN KEY (`venue_id`) REFERENCES `venues` (`venue_id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
