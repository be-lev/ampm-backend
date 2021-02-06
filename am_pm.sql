-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Feb 05, 2021 at 06:09 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 8.0.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `am:pm`
--
CREATE DATABASE IF NOT EXISTS `am:pm` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `am:pm`;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `categoryId` int(11) NOT NULL,
  `categoryName` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`categoryId`, `categoryName`) VALUES
(1, 'cookies'),
(2, 'candies'),
(3, 'salty snakes'),
(4, 'vegetables '),
(5, 'fruits');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `productId` int(11) NOT NULL,
  `categoryId` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `manufactureDate` datetime NOT NULL,
  `expirationDate` datetime NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`productId`, `categoryId`, `name`, `manufactureDate`, `expirationDate`, `price`) VALUES
(1, 5, 'pear', '2021-01-07 10:08:34', '2021-02-08 10:08:34', '54.00'),
(2, 2, 'loly pop', '2018-09-05 03:09:26', '2024-02-02 00:00:26', '0.50'),
(3, 3, 'black pepper chips', '2020-09-22 10:10:43', '2021-08-17 12:10:43', '36.00'),
(4, 4, 'avocado', '2021-01-19 10:11:24', '2021-02-05 15:11:25', '26.00'),
(14, 1, '37% milca', '1982-02-08 10:08:34', '2021-08-17 09:10:43', '36.00'),
(15, 2, 'TimTam', '2021-02-02 00:00:00', '2021-03-05 00:00:00', '12.00'),
(16, 2, 'click', '2021-02-08 00:00:00', '2021-02-25 00:00:00', '3.00'),
(17, 2, 'click', '2021-02-01 00:00:00', '2021-02-01 00:00:00', '12.00');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`categoryId`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`productId`),
  ADD KEY `categoryId` (`categoryId`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `categoryId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `productId` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`categoryId`) REFERENCES `categories` (`categoryId`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
