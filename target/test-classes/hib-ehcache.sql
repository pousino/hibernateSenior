-- phpMyAdmin SQL Dump
-- version 4.9.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jun 21, 2023 at 10:18 PM
-- Server version: 10.4.10-MariaDB
-- PHP Version: 7.3.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `hib-ehcache`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
CREATE TABLE IF NOT EXISTS `address` (
  `emp_id` int(11) UNSIGNED NOT NULL,
  `address_line1` varchar(50) NOT NULL DEFAULT '',
  `zipcode` varchar(10) DEFAULT NULL,
  `city` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`emp_id`, `address_line1`, `zipcode`, `city`) VALUES
(1, 'Albany Dr', '95129', 'San Jose'),
(2, 'Arques Ave', '95051', 'Santa Clara'),
(3, 'BTM 1st Stage', '560100', 'Bangalore'),
(4, 'City Centre', '100100', 'New Delhi');

-- --------------------------------------------------------

--
-- Table structure for table `car`
--

DROP TABLE IF EXISTS `car`;
CREATE TABLE IF NOT EXISTS `car` (
  `ID` bigint(4) NOT NULL AUTO_INCREMENT,
  `CAR_NUMBER` varchar(128) NOT NULL,
  `MODEL` varchar(128) NOT NULL,
  `BUY_DATE` datetime DEFAULT NULL,
  `EMP_ID` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `car`
--

INSERT INTO `car` (`ID`, `CAR_NUMBER`, `MODEL`, `BUY_DATE`, `EMP_ID`) VALUES
(1, 'CF-569-XR', 'BMW X3', '2021-11-08 00:00:00', 1),
(2, 'FG-553-GU', 'Renault Laguna', '2022-06-13 00:00:00', 1),
(3, 'HJ-234-GV', 'Land Rover Discovery', '2021-02-17 00:00:00', 2),
(4, 'NJ-159-GU', 'Land Rover Evoque', '2020-07-14 00:00:00', 2),
(5, 'VB-542-SD', 'Porsche Cayenne', '2019-09-10 00:00:00', 3),
(6, 'TY-103-BN', 'Nissan Terrano', '2010-06-24 00:00:00', 3),
(7, 'HU-269-JK', 'KIA Sportage', '2010-01-20 00:00:00', 3);

-- --------------------------------------------------------

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
CREATE TABLE IF NOT EXISTS `employee` (
  `emp_id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
  `emp_name` varchar(20) NOT NULL,
  `emp_salary` double(10,0) NOT NULL DEFAULT 0,
  PRIMARY KEY (`emp_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `employee`
--

INSERT INTO `employee` (`emp_id`, `emp_name`, `emp_salary`) VALUES
(1, 'Pankaj', 100),
(2, 'David', 200),
(3, 'Lisa', 300),
(4, 'Jack', 400);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE IF NOT EXISTS `role` (
  `ID` bigint(4) NOT NULL AUTO_INCREMENT,
  `TYPE` varchar(128) NOT NULL,
  `CREATION_DATE` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COMMENT='TABLE QUI CONTIENT LES DIFFERENT ROLE ( ADMIN,LOCATAIRE, PROPRI?TAIRE, SUPERADMIN, ...)';

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`ID`, `TYPE`, `CREATION_DATE`) VALUES
(1, 'SUPER ADMIN', '2020-07-01 00:00:00'),
(2, 'ADMIN', '2020-07-02 00:00:00'),
(3, 'PROPRIETAIRE', '2020-07-02 00:00:00'),
(4, 'LOCATAIRE', '2020-07-02 00:00:00'),
(5, 'GARANT', '2020-07-02 00:00:00');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `address`
--
ALTER TABLE `address`
  ADD CONSTRAINT `emp_fk_1` FOREIGN KEY (`emp_id`) REFERENCES `employee` (`emp_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
