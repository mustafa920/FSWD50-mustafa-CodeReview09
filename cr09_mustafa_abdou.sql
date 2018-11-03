-- phpMyAdmin SQL Dump
-- version 4.8.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 03, 2018 at 04:54 PM
-- Server version: 10.1.36-MariaDB
-- PHP Version: 7.2.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cr09_mustafa_abdou`
--

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `address_id` smallint(5) UNSIGNED NOT NULL,
  `city` varchar(10) DEFAULT NULL,
  `zip_code` int(5) DEFAULT NULL,
  `street` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`address_id`, `city`, `zip_code`, `street`) VALUES
(1, 'vienna', 1020, 'obermullner'),
(2, 'linz', 6575, 'linz');

-- --------------------------------------------------------

--
-- Table structure for table `address2`
--

CREATE TABLE `address2` (
  `address2_id` smallint(5) UNSIGNED NOT NULL,
  `city` varchar(30) NOT NULL,
  `Zip_code` int(5) NOT NULL,
  `street` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `address2`
--

INSERT INTO `address2` (`address2_id`, `city`, `Zip_code`, `street`) VALUES
(1, 'graz', 6578, 'mom'),
(2, 'linz', 5588, 'karls');

-- --------------------------------------------------------

--
-- Table structure for table `agency`
--

CREATE TABLE `agency` (
  `agency_id` smallint(5) UNSIGNED NOT NULL,
  `agency_name` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agency`
--

INSERT INTO `agency` (`agency_id`, `agency_name`) VALUES
(1, 'code factory'),
(2, 'drive now');

-- --------------------------------------------------------

--
-- Table structure for table `car_model`
--

CREATE TABLE `car_model` (
  `car_model_id` smallint(5) UNSIGNED NOT NULL,
  `horse_power` int(5) NOT NULL,
  `car_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `car_model`
--

INSERT INTO `car_model` (`car_model_id`, `horse_power`, `car_type`) VALUES
(1, 300, 'bmw'),
(2, 400, 'audi');

-- --------------------------------------------------------

--
-- Table structure for table `check`
--

CREATE TABLE `check` (
  `check_id` smallint(5) UNSIGNED NOT NULL,
  `price` int(30) NOT NULL,
  `fk_car_model` smallint(20) UNSIGNED DEFAULT NULL,
  `fk_rent_a_car_site` smallint(20) UNSIGNED DEFAULT NULL,
  `fk_payment` smallint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `check2`
--

CREATE TABLE `check2` (
  `check2_id` smallint(5) UNSIGNED NOT NULL,
  `Infraction` varchar(30) NOT NULL,
  `accident` varchar(30) NOT NULL,
  `fk_agency` smallint(5) UNSIGNED DEFAULT NULL,
  `fk_client` smallint(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `client`
--

CREATE TABLE `client` (
  `client_id` smallint(5) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `pick_up` date DEFAULT NULL,
  `fk_rent_a_car` smallint(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client`
--

INSERT INTO `client` (`client_id`, `name`, `pick_up`, `fk_rent_a_car`) VALUES
(1, 'mustafa', '2018-11-06', NULL),
(2, 'jehad', '2018-11-06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `customer_id` smallint(5) UNSIGNED NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `age` varchar(30) NOT NULL,
  `driver_licence` varchar(30) NOT NULL,
  `fk_address` smallint(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`customer_id`, `first_name`, `last_name`, `age`, `driver_licence`, `fk_address`) VALUES
(1, 'mustafa', 'abdou', '26', 'dasdas', NULL),
(2, 'ahmad', 'abdou', '52', 'wedadas', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` smallint(5) UNSIGNED NOT NULL,
  `cash` varchar(30) NOT NULL,
  `cart` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `payment`
--

INSERT INTO `payment` (`payment_id`, `cash`, `cart`) VALUES
(3, '435345', NULL),
(4, '', 4536456);

-- --------------------------------------------------------

--
-- Table structure for table `rent_a_car`
--

CREATE TABLE `rent_a_car` (
  `rent_a_car_id` smallint(5) UNSIGNED NOT NULL,
  `fk_check` smallint(5) UNSIGNED DEFAULT NULL,
  `fk_reservation` smallint(5) UNSIGNED DEFAULT NULL,
  `fk_address2` smallint(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `rent_a_car_site`
--

CREATE TABLE `rent_a_car_site` (
  `rent_a_car_site_id` smallint(5) UNSIGNED NOT NULL,
  `web_site_address` varchar(10) DEFAULT NULL,
  `web_site_name` varchar(20) DEFAULT NULL,
  `fk_customer` smallint(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `reservation`
--

CREATE TABLE `reservation` (
  `reservation_id` smallint(5) UNSIGNED NOT NULL,
  `reservation_start` date DEFAULT NULL,
  `reservation_finish` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `reservation`
--

INSERT INTO `reservation` (`reservation_id`, `reservation_start`, `reservation_finish`) VALUES
(1, '2018-11-06', '2018-11-07'),
(2, '2018-11-06', '2018-11-21');

-- --------------------------------------------------------

--
-- Table structure for table `return`
--

CREATE TABLE `return` (
  `return_id` smallint(5) UNSIGNED NOT NULL,
  `fk_client` smallint(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`address_id`);

--
-- Indexes for table `address2`
--
ALTER TABLE `address2`
  ADD PRIMARY KEY (`address2_id`);

--
-- Indexes for table `agency`
--
ALTER TABLE `agency`
  ADD PRIMARY KEY (`agency_id`);

--
-- Indexes for table `car_model`
--
ALTER TABLE `car_model`
  ADD PRIMARY KEY (`car_model_id`);

--
-- Indexes for table `check`
--
ALTER TABLE `check`
  ADD PRIMARY KEY (`check_id`),
  ADD KEY `fk_rent_a_car_site` (`fk_rent_a_car_site`),
  ADD KEY `fk_car_model` (`fk_car_model`),
  ADD KEY `fk_payment` (`fk_payment`);

--
-- Indexes for table `check2`
--
ALTER TABLE `check2`
  ADD PRIMARY KEY (`check2_id`),
  ADD KEY `fk_agency` (`fk_agency`);

--
-- Indexes for table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`client_id`),
  ADD KEY `fk_rent_a_car` (`fk_rent_a_car`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`),
  ADD KEY `fk_address` (`fk_address`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`);

--
-- Indexes for table `rent_a_car`
--
ALTER TABLE `rent_a_car`
  ADD PRIMARY KEY (`rent_a_car_id`),
  ADD KEY `fk_check` (`fk_check`),
  ADD KEY `fk_reservation` (`fk_reservation`),
  ADD KEY `fk_address2` (`fk_address2`);

--
-- Indexes for table `rent_a_car_site`
--
ALTER TABLE `rent_a_car_site`
  ADD PRIMARY KEY (`rent_a_car_site_id`),
  ADD KEY `FK_customer` (`fk_customer`);

--
-- Indexes for table `reservation`
--
ALTER TABLE `reservation`
  ADD PRIMARY KEY (`reservation_id`);

--
-- Indexes for table `return`
--
ALTER TABLE `return`
  ADD PRIMARY KEY (`return_id`),
  ADD KEY `fk_client` (`fk_client`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `address_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `address2`
--
ALTER TABLE `address2`
  MODIFY `address2_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `agency`
--
ALTER TABLE `agency`
  MODIFY `agency_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `car_model`
--
ALTER TABLE `car_model`
  MODIFY `car_model_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `check`
--
ALTER TABLE `check`
  MODIFY `check_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `check2`
--
ALTER TABLE `check2`
  MODIFY `check2_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `client`
--
ALTER TABLE `client`
  MODIFY `client_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `rent_a_car`
--
ALTER TABLE `rent_a_car`
  MODIFY `rent_a_car_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rent_a_car_site`
--
ALTER TABLE `rent_a_car_site`
  MODIFY `rent_a_car_site_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reservation`
--
ALTER TABLE `reservation`
  MODIFY `reservation_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `return`
--
ALTER TABLE `return`
  MODIFY `return_id` smallint(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `check`
--
ALTER TABLE `check`
  ADD CONSTRAINT `fk_car_model` FOREIGN KEY (`fk_car_model`) REFERENCES `car_model` (`car_model_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_payment` FOREIGN KEY (`fk_payment`) REFERENCES `payment` (`payment_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_rent_a_car_site` FOREIGN KEY (`fk_rent_a_car_site`) REFERENCES `rent_a_car_site` (`rent_a_car_site_id`) ON UPDATE CASCADE;

--
-- Constraints for table `check2`
--
ALTER TABLE `check2`
  ADD CONSTRAINT `fk_agency` FOREIGN KEY (`fk_agency`) REFERENCES `agency` (`agency_id`) ON UPDATE CASCADE;

--
-- Constraints for table `client`
--
ALTER TABLE `client`
  ADD CONSTRAINT `fk_rent_a_car` FOREIGN KEY (`fk_rent_a_car`) REFERENCES `rent_a_car` (`rent_a_car_id`) ON UPDATE CASCADE;

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `fk_address` FOREIGN KEY (`fk_address`) REFERENCES `address` (`address_id`) ON UPDATE CASCADE;

--
-- Constraints for table `rent_a_car`
--
ALTER TABLE `rent_a_car`
  ADD CONSTRAINT `fk_address2` FOREIGN KEY (`fk_address2`) REFERENCES `address2` (`address2_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_check` FOREIGN KEY (`fk_check`) REFERENCES `check` (`check_id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_reservation` FOREIGN KEY (`fk_reservation`) REFERENCES `reservation` (`reservation_id`) ON UPDATE CASCADE;

--
-- Constraints for table `rent_a_car_site`
--
ALTER TABLE `rent_a_car_site`
  ADD CONSTRAINT `FK_customer` FOREIGN KEY (`fk_customer`) REFERENCES `customer` (`customer_id`) ON UPDATE CASCADE;

--
-- Constraints for table `return`
--
ALTER TABLE `return`
  ADD CONSTRAINT `fk_client` FOREIGN KEY (`fk_client`) REFERENCES `client` (`client_id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
