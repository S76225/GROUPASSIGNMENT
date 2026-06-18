-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jun 18, 2026 at 06:00 PM
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
-- Database: `sheeds_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `menu`
--

CREATE TABLE `menu` (
  `item_id` varchar(10) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `category` varchar(50) DEFAULT NULL,
  `price` double DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menu`
--

INSERT INTO `menu` (`item_id`, `name`, `category`, `price`, `status`) VALUES
('M-110', 'Latte', 'Espresso', 11, 'Available'),
('M-236', 'Orange Juice', 'Cold Drinks', 9, 'Available'),
('M-415', 'Chocolate Frappe', 'Espresso', 10, 'Available'),
('M-476', 'Chocolate ', 'Non-Coffee', 9, 'Available'),
('M-567', 'Butter Croissant', 'Pastry', 3.5, 'Available'),
('M-721', 'Matcha Latte', 'Cold Drinks', 10, 'Available'),
('M-952', 'Chicken & Mushroom Pie', 'Pastry', 6, 'Available');

-- --------------------------------------------------------

--
-- Table structure for table `messages`
--

CREATE TABLE `messages` (
  `message_id` varchar(20) NOT NULL,
  `name` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `content` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `messages`
--

INSERT INTO `messages` (`message_id`, `name`, `email`, `content`) VALUES
('MSG-723', 'Muhammad Syakir bin Hamid', 'shakir@gmail.com', 'nak nombor akak cashier');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `item_name` varchar(100) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `order_type` varchar(20) DEFAULT NULL,
  `total_amount` decimal(10,2) DEFAULT 0.00,
  `status` varchar(50) DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`order_id`, `customer_name`, `item_name`, `quantity`, `order_type`, `total_amount`, `status`) VALUES
(5, 'Syakir', 'Chocolate Frappe', 1, 'Dine-in', 10.00, 'Pending'),
(7, 'asyraf', 'Matcha Latte', 1, 'Pickup', 10.00, 'Pending'),
(8, 'asyraf', 'Latte', 1, 'Pickup', 11.00, 'Pending'),
(9, 'asyraf', 'Chicken & Mushroom Pie', 1, 'Pickup', 6.00, 'Pending'),
(10, 'hasif', 'Butter Croissant', 1, 'Pickup', 3.50, 'Pending'),
(11, 'hasif', 'Orange Juice', 1, 'Pickup', 9.00, 'Pending');

-- --------------------------------------------------------

--
-- Table structure for table `reviews`
--

CREATE TABLE `reviews` (
  `review_id` int(11) NOT NULL,
  `customer_name` varchar(100) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  `comments` text DEFAULT NULL,
  `username` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `reviews`
--

INSERT INTO `reviews` (`review_id`, `customer_name`, `rating`, `comments`, `username`) VALUES
(6, 'hasif', 5, 'Absolutely loved this cafe! The coffee was perfect and the atmosphere was super cozy. Will definitely come back ', 'hasif'),
(7, 'asyraf', 4, 'Really nice cafe with great coffee, Just wish the waiting time was a bit shorter.', 'asyraf'),
(8, 'syakir', 3, 'I was okay, Nothing really stood out, but not bad either', 'syakir'),
(9, 'tracie', 5, 'Everything was on point  from the drinks to the ambience. Worth every visit!', 'tracie');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(20) DEFAULT 'customer'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `username`, `email`, `password`, `role`) VALUES
(1, 'admin', 'admin@sheedscafe.com', 'admin123', 'admin'),
(2, 'asep', 'asep@gmail.com', 'asep123', 'customer'),
(3, 'asyraf', 'acap@gmail.com', 'acap123', 'customer'),
(4, 'hasif', 'asep@gmail.com', 'asep123', 'customer'),
(5, 'syakir', 'syakir@gmail', 'syakir123', 'customer'),
(6, 'tracie', 'tracie@00', 'tracie123', 'customer');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`item_id`);

--
-- Indexes for table `messages`
--
ALTER TABLE `messages`
  ADD PRIMARY KEY (`message_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`);

--
-- Indexes for table `reviews`
--
ALTER TABLE `reviews`
  ADD PRIMARY KEY (`review_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `reviews`
--
ALTER TABLE `reviews`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
