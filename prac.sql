-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Sep 17, 2025 at 02:07 AM
-- Server version: 9.1.0
-- PHP Version: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `prac`
--

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
CREATE TABLE IF NOT EXISTS `customer` (
  `customerID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `email` varchar(25) NOT NULL,
  `mobile` int NOT NULL,
  `address` varchar(25) NOT NULL,
  `password` varchar(25) NOT NULL,
  PRIMARY KEY (`customerID`),
  UNIQUE KEY `name_2` (`name`),
  UNIQUE KEY `customerID` (`customerID`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customerID`, `name`, `email`, `mobile`, `address`, `password`) VALUES
(34, 'Janice', 'btsxtxt27@gmail.com', 2147483647, 'Balabag', '123456'),
(35, 'Helen', 'seventeenism@gmail.com', 2147483634, 'City', '123456789');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
CREATE TABLE IF NOT EXISTS `orders` (
  `orderID` int NOT NULL AUTO_INCREMENT,
  `customerID` int NOT NULL,
  `orderDate` date NOT NULL,
  `totalAmount` int NOT NULL,
  `status` varchar(25) NOT NULL,
  PRIMARY KEY (`orderID`,`customerID`),
  UNIQUE KEY `customerID` (`customerID`),
  UNIQUE KEY `orderID` (`orderID`)
) ENGINE=InnoDB AUTO_INCREMENT=236 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderID`, `customerID`, `orderDate`, `totalAmount`, `status`) VALUES
(234, 34, '2025-01-02', 340, 'Paid'),
(235, 35, '2025-03-02', 3560, 'Paid');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

DROP TABLE IF EXISTS `payments`;
CREATE TABLE IF NOT EXISTS `payments` (
  `paymentID` int NOT NULL AUTO_INCREMENT,
  `orderID` int NOT NULL,
  `paymentDate` date NOT NULL,
  `amount` int NOT NULL,
  `paymentMethod` varchar(25) NOT NULL,
  PRIMARY KEY (`paymentID`,`orderID`),
  UNIQUE KEY `orderID` (`orderID`)
) ENGINE=InnoDB AUTO_INCREMENT=6549 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`paymentID`, `orderID`, `paymentDate`, `amount`, `paymentMethod`) VALUES
(6547, 234, '2025-09-01', 340, 'Cash'),
(6548, 235, '2025-09-02', 3560, 'Cash');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

DROP TABLE IF EXISTS `products`;
CREATE TABLE IF NOT EXISTS `products` (
  `productID` int NOT NULL AUTO_INCREMENT,
  `name` varchar(25) NOT NULL,
  `price` int NOT NULL,
  `category` varchar(25) NOT NULL,
  `stock` int NOT NULL,
  PRIMARY KEY (`productID`),
  UNIQUE KEY `name_2` (`name`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5567 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`productID`, `name`, `price`, `category`, `stock`) VALUES
(4455, 'Janice', 340, 'Essentials', 1000),
(5566, 'Helen', 3560, 'Cleaning', 1050);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `orders` (`customerID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`orderID`) REFERENCES `orders` (`orderID`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`name`) REFERENCES `customer` (`name`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
