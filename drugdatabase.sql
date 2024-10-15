-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 15, 2024 at 07:57 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `drugdatabase`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `getorders` (IN `param1` VARCHAR(20))   BEGIN
   SELECT * FROM orders WHERE uid=param1;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `getsellerorders` (IN `param1` VARCHAR(20))   BEGIN
    SELECT *  FROM orders where sid=param1;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `uid` varchar(20) NOT NULL,
  `pass` varchar(20) DEFAULT NULL,
  `fname` varchar(15) DEFAULT NULL,
  `lname` varchar(15) DEFAULT NULL,
  `email` varchar(30) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `phno` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`uid`, `pass`, `fname`, `lname`, `email`, `address`, `phno`) VALUES
('002', '002', 'Af', 'M', 'Afrin.om12@gmail.com', 'main st', 7373538795),
('1213', '123', 'ashi123', 'af', 'af@gmail.com', 'Chennai', 870856798),
('123', '123', 'Afrin', 'M', 'Afrin.om12@gmail.com', 'chn', 7373578785),
('12345', '123', 'Afrin', 'O M', 'Afrin.om12@gmail.com', 'north st', 7539980870);

-- --------------------------------------------------------

--
-- Table structure for table `forder`
--

CREATE TABLE `forder` (
  `order_id` varchar(255) DEFAULT NULL,
  `payment_id` varchar(255) DEFAULT NULL,
  `signature` varchar(255) DEFAULT NULL,
  `amount` decimal(10,2) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone_number` varchar(20) DEFAULT NULL,
  `order_datetime` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `forder`
--

INSERT INTO `forder` (`order_id`, `payment_id`, `signature`, `amount`, `name`, `phone_number`, `order_datetime`) VALUES
(NULL, 'pay_MKA0t2w7I2rhU9', NULL, '3240.00', 'Afrin M', '0737345412', '2023-07-31 02:56:22'),
(NULL, 'pay_MKA6nTKe5ur2zI', NULL, '3240.00', 'Afrin M', '0737434532412', '2023-07-31 03:01:58'),
(NULL, 'pay_MKA9F2PaILg3e1', NULL, '3240.00', 'Afrin M', '0737353412', '2023-07-31 03:04:17'),
(NULL, 'pay_MKADAo8Nb0cD3Z', NULL, '3240.00', 'Afrin M', '0737353234', '2023-07-31 03:08:00'),
(NULL, 'pay_MKAKi0vjQYi69X', NULL, '3240.00', 'Afrin M', '0734677412', '2023-07-31 03:15:08'),
(NULL, 'pay_MKGfyIqwIQcqNu', NULL, '3260.00', 'Afrin M', '0348342412', '2023-07-31 09:27:34'),
(NULL, 'pay_MN269z4AK9JZXD', NULL, '3280.00', 'Fathima', '0734546244', '2023-08-07 09:08:49'),
(NULL, 'pay_MN9EEFhg90RpCl', NULL, '3300.00', 'afs', '56893452489', '2023-08-07 16:07:18'),
(NULL, 'pay_Mol3bTkxTklWIm', NULL, '20.00', 'trrt54', '07373532412', '2023-10-16 10:40:38'),
(NULL, 'pay_MouiL6F8VIbfw0', NULL, '60.00', 'Afrin M', '07373532412', '2023-10-16 20:07:29'),
(NULL, 'pay_P8TLgFbVGVDOdL', NULL, '260.00', 'ashi', '7646493053', '2024-10-13 14:57:41');

-- --------------------------------------------------------

--
-- Table structure for table `inventory`
--

CREATE TABLE `inventory` (
  `pid` varchar(15) NOT NULL,
  `pname` varchar(20) DEFAULT NULL,
  `quantity` int(10) UNSIGNED DEFAULT NULL,
  `sid` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory`
--

INSERT INTO `inventory` (`pid`, `pname`, `quantity`, `sid`) VALUES
('1', 'Paracetamol', 44, '1'),
('2', 'DOLO', 50, '1');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `oid` int(11) NOT NULL,
  `pid` varchar(15) DEFAULT NULL,
  `sid` varchar(15) DEFAULT NULL,
  `uid` varchar(15) DEFAULT NULL,
  `orderdatetime` datetime DEFAULT NULL,
  `quantity` int(10) UNSIGNED DEFAULT NULL,
  `price` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`oid`, `pid`, `sid`, `uid`, `orderdatetime`, `quantity`, `price`) VALUES
(36, '1', '1', '12345', '2024-10-13 14:55:50', 1, 20),
(37, '2', '1', '12345', '2024-10-13 14:55:56', 2, 240);

--
-- Triggers `orders`
--
DELIMITER $$
CREATE TRIGGER `inventorytrigger` AFTER INSERT ON `orders` FOR EACH ROW begin

DECLARE qnty int;
DECLARE productid varchar(20);

SELECT   pid INTO productid
FROM      orders
ORDER BY  oid DESC
LIMIT     1;

SELECT   quantity INTO qnty 
FROM      orders
ORDER BY  oid DESC
LIMIT     1;

UPDATE inventory
SET quantity=quantity-qnty
WHERE pid=productid;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `updatetime` BEFORE INSERT ON `orders` FOR EACH ROW BEGIN
    SET NEW.orderdatetime = NOW();
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `pid` varchar(15) NOT NULL,
  `pname` varchar(20) DEFAULT NULL,
  `manufacturer` varchar(20) DEFAULT NULL,
  `mfg` date DEFAULT NULL,
  `exp` date DEFAULT NULL,
  `price` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`pid`, `pname`, `manufacturer`, `mfg`, `exp`, `price`) VALUES
('1', 'Paracetamol', 'Manufacturer A', '2022-07-25', '2025-09-01', 20),
('2', 'DOLO', 'ABC 1', '2021-11-28', '2027-11-28', 120);

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `sid` varchar(15) NOT NULL,
  `sname` varchar(20) DEFAULT NULL,
  `pass` varchar(20) DEFAULT NULL,
  `address` varchar(128) DEFAULT NULL,
  `phno` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`sid`, `sname`, `pass`, `address`, `phno`) VALUES
('1', 'Sup1', '123', '123 Main Street', 1234567891);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`uid`);

--
-- Indexes for table `inventory`
--
ALTER TABLE `inventory`
  ADD PRIMARY KEY (`pid`,`sid`),
  ADD KEY `fk02` (`pname`),
  ADD KEY `fk03` (`sid`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`oid`),
  ADD KEY `fk04` (`pid`),
  ADD KEY `fk05` (`sid`),
  ADD KEY `fk06` (`uid`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`pid`),
  ADD UNIQUE KEY `pname` (`pname`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`sid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `oid` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `inventory`
--
ALTER TABLE `inventory`
  ADD CONSTRAINT `fk01` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk02` FOREIGN KEY (`pname`) REFERENCES `product` (`pname`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk03` FOREIGN KEY (`sid`) REFERENCES `seller` (`sid`) ON DELETE CASCADE;

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk04` FOREIGN KEY (`pid`) REFERENCES `product` (`pid`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk05` FOREIGN KEY (`sid`) REFERENCES `seller` (`sid`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk06` FOREIGN KEY (`uid`) REFERENCES `customer` (`uid`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
