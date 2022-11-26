-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 26, 2022 at 01:05 PM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `inve`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `ExampleProc` ()   BEGIN
      DECLARE done INT DEFAULT 0; 
      DECLARE fullName VARCHAR(20);
      DECLARE cur CURSOR FOR SELECT * FROM customer;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
      OPEN cur;
      label: LOOP
      FETCH cur INTO fullName;
      INSERT INTO backup VALUES(fullName);
      IF done = 1 THEN LEAVE label;
      END IF;
      END LOOP;
      CLOSE cur;
   END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Example_Proc` ()   BEGIN
      DECLARE done INT DEFAULT 0;
      
      DECLARE fullName VARCHAR(20);
      DECLARE cur CURSOR FOR SELECT fullName FROM customer;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
      OPEN cur;
      label: LOOP
      FETCH cur INTO fullName;
      INSERT INTO backup VALUES(fullName);
      IF done = 1 THEN LEAVE label;
      END IF;
      END LOOP;
      CLOSE cur;
   END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `get_proc` ()   BEGIN
SELECT * FROM purchase WHERE quantity <10;
SELECT * FROM purchase WHERE unitPrice>1000;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `proc` ()   BEGIN
      DECLARE done INT DEFAULT 0;
      
      DECLARE fullName VARCHAR(20);
      DECLARE cur CURSOR FOR SELECT fullName FROM customer;
      DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = 1;
      OPEN cur;
      label: LOOP
      FETCH cur INTO fullName;
      INSERT INTO backup VALUES(fullname);
      IF done = 1 THEN LEAVE label;
      END IF;
      END LOOP;
      CLOSE cur;
   END$$

--
-- Functions
--
CREATE DEFINER=`root`@`localhost` FUNCTION `zero_discount` (`ItemNumber` INT(25)) RETURNS INT(20) DETERMINISTIC BEGIN  
    DECLARE zero_discount VARCHAR(20);  
    IF ItemNumber < 3 THEN  
        SET zero_discount = 0;  
    ELSEIF (ItemNumber <= 5 AND   
            ItemNumber >= 4) THEN  
        SET zero_discount = 2;   
    END IF;  
    -- return the customer occupation  
    RETURN (zero_discount);  
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `backup`
--

CREATE TABLE `backup` (
  `fullname` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `backup`
--

INSERT INTO `backup` (`fullname`) VALUES
(NULL),
(NULL),
(NULL),
(NULL),
(NULL),
(NULL),
(NULL),
('tharun'),
('Steve Jobs'),
('fgafaf'),
('Bill Gates'),
('sanjay'),
('sahoo');

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customerID` int(11) NOT NULL,
  `fullName` varchar(100) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `mobile` int(11) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customerID`, `fullName`, `email`, `mobile`, `address`) VALUES
(4, 'Bill Gates', 'bill@microsoft.com', 993737, '45, Palo Alto House, Marine Drive'),
(14, 'Steve Jobs', 'sjobs@apple.com', 333829832, '1st Floor, Apple House'),
(69, 'fgafaf', ' ghar ', 919191, ' ghar '),
(134, ' sanjay ', ' sanjay@gmail.com ', 901321212, ' sanjay s house ');

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `productID` int(11) NOT NULL,
  `itemNumber` varchar(255) NOT NULL,
  `itemName` varchar(255) NOT NULL,
  `discount` float NOT NULL DEFAULT 0,
  `stock` int(11) NOT NULL DEFAULT 0,
  `unitPrice` float NOT NULL DEFAULT 0,
  `customerID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`productID`, `itemNumber`, `itemName`, `discount`, `stock`, `unitPrice`, `customerID`) VALUES
(34, '1', 'First Bag', 0, 28, 1500, NULL),
(35, '2', 'School Bag', 0, 5, 500, NULL),
(36, '3', 'Office Bag', 0, 5, 1300, NULL),
(37, '4', 'Leather Bag', 2, 6, 3409, NULL),
(38, '5', 'Travel Bag', 2, 17, 1200, NULL),
(39, '6', 'Gym Bag', 0, 0, 3000, NULL),
(40, '7', 'Handbag', 1.5, 10, 1650, NULL),
(41, '8', 'Laptop Bag', 2.1, 9, 2300, NULL),
(43, '10', 'Sports Bag', 1, 92, 1000, NULL),
(45, '11', 'First Aid Bag', 1.5, 11, 1200, NULL),
(49, '14', 'Hiking Bag', 1.5, 6, 1200, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `purchaseID` int(11) NOT NULL,
  `itemNumber` varchar(255) NOT NULL,
  `purchaseDate` date NOT NULL,
  `itemName` varchar(255) NOT NULL,
  `unitPrice` float NOT NULL DEFAULT 0,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `vendorName` varchar(255) NOT NULL DEFAULT 'Test Vendor',
  `vendorID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`purchaseID`, `itemNumber`, `purchaseDate`, `itemName`, `unitPrice`, `quantity`, `vendorName`, `vendorID`) VALUES
(39, '1', '2018-05-24', 'First Bag', 1600, 10, 'Johnson and Johnsons Co.', 3),
(40, '2', '2018-05-18', 'First Bag', 2341, 2, 'Louise Vitton Bag', 4),
(41, '4', '2018-05-07', 'Leather Bag', 1234, 3, 'Johnson and Johnsons Co.', 3),
(42, '1', '2018-05-24', 'First Bag', 345, 12, 'Louise Vitton Bag', 4),
(43, '5', '2018-05-03', 'Travel Bag', 35, 3, 'Johnson and Johnsons Co.', 3),
(44, '5', '2018-05-16', 'Travel Bag', 3000, 2, 'ABC Company', 1),
(45, '5', '2018-05-21', 'Travel Bag', 3000, 10, 'Sample Vendor 222', 2),
(46, '4', '2018-05-19', 'Leather Bag', 1200, 4, 'Johnson and Johnsons Co.', 3),
(47, '2', '2018-05-10', 'School Bag', 2, 1, 'Sample Vendor 222', 2);

-- --------------------------------------------------------

--
-- Table structure for table `sale`
--

CREATE TABLE `sale` (
  `saleID` int(11) NOT NULL,
  `itemNumber` varchar(255) NOT NULL,
  `customerID` int(11) NOT NULL,
  `saleDate` date NOT NULL,
  `discount` float NOT NULL DEFAULT 0,
  `quantity` int(11) NOT NULL DEFAULT 0,
  `unitPrice` float(10,0) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `sale`
--

INSERT INTO `sale` (`saleID`, `itemNumber`, `customerID`, `saleDate`, `discount`, `quantity`, `unitPrice`) VALUES
(1, '3', 4, '2018-05-24', 5, 2, 1300),
(2, '1', 39, '2018-05-24', 0, 111, 1500),
(3, '4', 18, '2018-05-24', 2, 1, 3409),
(4, '5', 25, '2018-05-24', 2, 1, 1200),
(5, '6', 24, '2018-05-24', 0, 1, 3000),
(6, '7', 14, '2018-05-24', 1.5, 1, 1650),
(7, '1', 14, '0000-00-00', 0, 5, 1500);

--
-- Triggers `sale`
--
DELIMITER $$
CREATE TRIGGER `major_sale` BEFORE INSERT ON `sale` FOR EACH ROW BEGIN
    IF NEW.discount<5 THEN SET NEW.discount=0;
    END IF;  
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `userID` int(11) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `customerID` int(11) DEFAULT NULL,
  `vendorID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`userID`, `fullName`, `username`, `password`, `customerID`, `vendorID`) VALUES
(5, 'bill gates', 'bill gates', '81dc9bdb52d04dc20036dbd8313ed055', 4, NULL),
(6, 'steve jobs', 'steve jobs', '0cc175b9c0f1b6a831c399e269772661', 14, NULL),
(7, 'admin', 'admin', '21232f297a57a5a743894a0e4a801fc3', 69, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `vendorID` int(11) NOT NULL,
  `fullName` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `mobile` int(11) NOT NULL,
  `address` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vendor`
--

INSERT INTO `vendor` (`vendorID`, `fullName`, `email`, `mobile`, `address`) VALUES
(2, 'Sample Vendor 222', 'sample@volvo.com', 99828282, '123, A Road, B avenue '),
(3, 'Johnson and Johnsons Co.', '32323', 0, '34, Malwatta Road'),
(4, 'Louise Vitton Bag', 'vitton@vitton.usa.com', 323234938, '45, Palmer Valley'),
(10, 'ABC Company', '2343567', 0, '80, Ground Floor, ABC Shopping Complex');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customerID`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`productID`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`purchaseID`),
  ADD KEY `vendorID` (`vendorID`);

--
-- Indexes for table `sale`
--
ALTER TABLE `sale`
  ADD PRIMARY KEY (`saleID`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`userID`),
  ADD KEY `customerID` (`customerID`),
  ADD KEY `vendorID` (`vendorID`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`vendorID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1346;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `productID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=50;

--
-- AUTO_INCREMENT for table `purchase`
--
ALTER TABLE `purchase`
  MODIFY `purchaseID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `sale`
--
ALTER TABLE `sale`
  MODIFY `saleID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `userID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `vendorID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `user`
--
ALTER TABLE `user`
  ADD CONSTRAINT `user_ibfk_1` FOREIGN KEY (`customerID`) REFERENCES `customer` (`customerID`),
  ADD CONSTRAINT `user_ibfk_2` FOREIGN KEY (`vendorID`) REFERENCES `vendor` (`vendorID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
