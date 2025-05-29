-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 29, 2025 at 01:02 PM
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
-- Database: `cndv`
--

-- --------------------------------------------------------

--
-- Table structure for table `administrator`
--

CREATE TABLE `administrator` (
  `Admin_ID` int(11) NOT NULL,
  `Admin_FN` varchar(255) NOT NULL,
  `Admin_LN` varchar(255) NOT NULL,
  `Admin_Email` varchar(255) NOT NULL,
  `Admin_Phone` varchar(255) NOT NULL,
  `Admin_Username` varchar(255) NOT NULL,
  `Admin_Password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `administrator`
--

INSERT INTO `administrator` (`Admin_ID`, `Admin_FN`, `Admin_LN`, `Admin_Email`, `Admin_Phone`, `Admin_Username`, `Admin_Password`) VALUES
(1, 'Taylor', 'Lautner', 'lautnert@admin-cndv.com', '09170013834', 'WatHappenVella', 'VampireRyte');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `Cart_ID` int(11) NOT NULL,
  `Cust_ID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cartitem`
--

CREATE TABLE `cartitem` (
  `CI_ID` int(11) NOT NULL,
  `Cart_ID` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `CI_Quantity` int(11) NOT NULL,
  `CI_SubTotal` decimal(10,2) NOT NULL,
  `CI_Status` enum('on-cart','checked-out') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `customer`
--

CREATE TABLE `customer` (
  `Cust_ID` int(11) NOT NULL,
  `SA_ID` int(11) NOT NULL,
  `Cust_FN` varchar(255) NOT NULL,
  `Cust_LN` varchar(255) NOT NULL,
  `Cust_Email` varchar(255) NOT NULL,
  `Cust_Phone` varchar(255) NOT NULL,
  `Cust_Username` varchar(255) NOT NULL,
  `Cust_Password` varchar(255) NOT NULL,
  `isActive` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`Cust_ID`, `SA_ID`, `Cust_FN`, `Cust_LN`, `Cust_Email`, `Cust_Phone`, `Cust_Username`, `Cust_Password`, `isActive`) VALUES
(1, 1, 'Juan', 'Dela Cruz', 'juan.delacruz@cndv.com', '09171234567', 'juancruz', 'securepassword', 1);

-- --------------------------------------------------------

--
-- Table structure for table `orderitem`
--

CREATE TABLE `orderitem` (
  `OI_ID` int(11) NOT NULL,
  `Order_ID` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `OI_Quantity` int(11) NOT NULL,
  `OI_SubTotal` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `Order_ID` int(11) NOT NULL,
  `Cust_ID` int(11) NOT NULL,
  `Admin_ID` int(11) NOT NULL,
  `Order_Placed` timestamp NOT NULL DEFAULT current_timestamp(),
  `Order_Recieved` timestamp NOT NULL DEFAULT current_timestamp(),
  `Order_Status` enum('processing','pending','shipped','cancelled','delivered') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `Payment_ID` int(11) NOT NULL,
  `Order_ID` int(11) NOT NULL,
  `Payment_Paid` decimal(10,2) NOT NULL,
  `Payment_Balance` decimal(10,2) DEFAULT NULL,
  `Payment_Method` enum('credit card','cash on delivery') NOT NULL,
  `Payment_DueDate` date DEFAULT NULL,
  `Payment_Date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `Payment_Status` enum('processing','pending','paid','failed','refunded') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `Product_ID` int(11) NOT NULL,
  `Product_Name` varchar(255) NOT NULL,
  `Product_Desc` text NOT NULL,
  `Product_Image` varchar(255) NOT NULL,
  `Product_Category` enum('Power Banks','Chargers','Cables','Earbuds','Headphones','Hubs and Docks') DEFAULT NULL,
  `Product_CreatedAt` timestamp NOT NULL DEFAULT current_timestamp(),
  `Product_UpdatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`Product_ID`, `Product_Name`, `Product_Desc`, `Product_Image`, `Product_Category`, `Product_CreatedAt`, `Product_UpdatedAt`) VALUES
(1, 'CNDV Galaxy Slim Power Bank', 'The CNDV Galaxy is an ultra-thin portable power bank ideal for charging your earbuds, headphones, and smartphones on the go. Its compact profile fits in any bag or pocket, ensuring your audio devices are always powered.', 'https://raw.githubusercontent.com/mouwchie/cndv-e-comm/main/Simple%20E-comm%20Products/power%20bank/slim_power_bank.jpg', 'Power Banks', '2025-05-22 13:36:22', '2025-05-22 13:36:22'),
(2, 'CNDV Free Mini Power Bank', 'The CNDV Free Mini Power Bank is a lightweight, portable battery designed for quick top-ups of your earbuds and headphones while traveling or commuting. Never run out of music on the move.', 'https://raw.githubusercontent.com/mouwchie/cndv-e-comm/main/Simple%20E-comm%20Products/power%20bank/mini_power_bank.jpg', 'Power Banks', '2025-05-22 13:36:22', '2025-05-22 13:36:22'),
(3, 'CNDV Trek Rugged Power Bank', 'The CNDV Trek Rugged Power Bank is a durable, shock-resistant charger perfect for outdoor use. Reliable for keeping your wireless earbuds and headphones powered during adventures and workouts.', 'https://raw.githubusercontent.com/mouwchie/cndv-e-comm/main/Simple%20E-comm%20Products/power%20bank/rugged_power_bank.jpg', 'Power Banks', '2025-05-22 13:36:22', '2025-05-22 13:36:22'),
(4, 'CNDV SolarX Solar Power Bank', 'The CNDV SolarX features built-in solar panels for eco-friendly recharging, making it an essential companion for keeping your headphones and earbuds charged during hikes, camping, or emergencies.', 'https://raw.githubusercontent.com/mouwchie/cndv-e-comm/main/Simple%20E-comm%20Products/power%20bank/solar_power_bank.jpg', 'Power Banks', '2025-05-22 13:36:22', '2025-05-22 13:36:22'),
(5, 'CNDV Turbo Fast Charging Power Bank', 'The CNDV Turbo is a high-end, fast-charging power bank that rapidly charges your headphones, earbuds, and other devices, ensuring minimal downtime and uninterrupted audio experiences.', 'https://raw.githubusercontent.com/mouwchie/cndv-e-comm/main/Simple%20E-comm%20Products/power%20bank/fast_charging_power_bank.jpg', 'Power Banks', '2025-05-22 13:36:22', '2025-05-22 13:36:22'),
(6, 'CNDV Volt USB-C Wall Charger', 'The CNDV Volt USB-C Wall Charger is a budget-friendly wall adapter optimized for efficient charging of your earbuds, headphones, and mobile devices, at home or in the office.', 'https://raw.githubusercontent.com/mouwchie/cndv-e-comm/main/Simple%20E-comm%20Products/charger/usb_c_wall_charger.jpg', 'Chargers', '2025-05-22 13:36:22', '2025-05-22 13:36:22'),
(7, 'CNDV Aura Wireless Charger Pad', 'The CNDV Aura Wireless Charger Pad enables fast, cable-free charging for Qi-enabled headphones and earbuds cases, as well as smartphones and accessories.', 'https://raw.githubusercontent.com/mouwchie/cndv-e-comm/main/Simple%20E-comm%20Products/charger/wireless_charger_pad.jpg', 'Chargers', '2025-05-22 13:36:22', '2025-05-22 13:36:22'),
(8, 'CNDV MagMagnetic Wireless Charger', 'The CNDV MagMagnetic Wireless Charger features magnetic alignment for seamless wireless charging, ideal for compatible earbuds and headphone cases—just snap and power up.', 'https://raw.githubusercontent.com/mouwchie/cndv-e-comm/main/Simple%20E-comm%20Products/charger/magnetic_wireless_charger.jpg', 'Chargers', '2025-05-22 13:36:22', '2025-05-22 13:36:22'),
(9, 'CNDV Titan High-End Wall Charger', 'The CNDV Titan is a premium wall charger with GaN technology for ultra-fast, efficient charging of your headphones, earbuds, and all your mobile gadgets, supporting multiple devices at once.', 'https://raw.githubusercontent.com/mouwchie/cndv-e-comm/main/Simple%20E-comm%20Products/charger/high_end_wall_charger.jpg', 'Chargers', '2025-05-22 13:36:22', '2025-05-22 13:36:22'),
(10, 'CNDV Flex Nylon USB-C Cable', 'The CNDV Flex Nylon USB-C Cable is a durable, tangle-resistant cable perfect for charging and syncing your wireless headphone and earbud cases, as well as other devices.', 'https://raw.githubusercontent.com/mouwchie/cndv-e-comm/main/Simple%20E-comm%20Products/cable/nylon_usb_c_cable.jpg', 'Cables', '2025-05-22 13:36:22', '2025-05-22 13:36:22'),
(11, 'CNDV Stream USB-C Cable', 'The CNDV Stream USB-C Cable is an affordable and reliable option for charging your earbuds, headphones, and other USB-C devices, ensuring your audio gear never loses power.', 'https://raw.githubusercontent.com/mouwchie/cndv-e-comm/main/Simple%20E-comm%20Products/cable/usb_c_cable.jpg', 'Cables', '2025-05-22 13:36:22', '2025-05-22 13:36:22'),
(12, 'CNDV MiniLite Mini Retractable Lightning Cable', 'The CNDV MiniLite is a retractable, Apple-certified Lightning cable—compact for travel and perfect for keeping your Lightning-compatible headphones and earbud cases charged.', 'https://raw.githubusercontent.com/mouwchie/cndv-e-comm/main/Simple%20E-comm%20Products/cable/mini_retractable_lightning_cable.jpg', 'Cables', '2025-05-22 13:36:22', '2025-05-22 13:36:22'),
(13, 'CNDV Zip Retractable USB-C Cable', 'The CNDV Zip is a premium, retractable USB-C cable ideal for fast, tangle-free charging of your wireless headphones, earbuds, and mobile devices wherever you go.', 'https://raw.githubusercontent.com/mouwchie/cndv-e-comm/main/Simple%20E-comm%20Products/cable/retractable_usb_c_cable.jpg', 'Cables', '2025-05-22 13:36:22', '2025-05-22 13:36:22'),
(14, 'CNDV Beat True Wireless Earbuds', 'The CNDV Beat True Wireless Earbuds are budget-friendly, fully wireless earphones with compact charging case, ideal for music and calls without wires.', 'https://raw.githubusercontent.com/mouwchie/cndv-e-comm/main/Simple%20E-comm%20Products/earbuds/true_wireless_earbuds.jpg', 'Earbuds', '2025-05-22 13:36:22', '2025-05-22 13:36:22'),
(15, 'CNDV Pure Classic Earbuds', 'The CNDV Pure Classic Earbuds are affordable, wired in-ear headphones for everyday listening and calls, compatible with a wide range of devices.', 'https://raw.githubusercontent.com/mouwchie/cndv-e-comm/main/Simple%20E-comm%20Products/earbuds/classic_earbuds.jpg', 'Earbuds', '2025-05-22 13:36:22', '2025-05-22 13:36:22'),
(16, 'CNDV Active Sports Earbuds', 'The CNDV Active Sports Earbuds are mid-range, sweatproof earphones with secure fit for active lifestyles, providing clear sound during workouts and outdoor activities.', 'https://raw.githubusercontent.com/mouwchie/cndv-e-comm/main/Simple%20E-comm%20Products/earbuds/sports_earbuds.jpg', 'Earbuds', '2025-05-22 13:36:22', '2025-05-22 13:36:22'),
(17, 'CNDV Blue Bluetooth Earbuds', 'The CNDV Blue Bluetooth Earbuds are mid-range wireless earphones offering high-quality audio and hands-free calling with Bluetooth connectivity.', 'https://raw.githubusercontent.com/mouwchie/cndv-e-comm/main/Simple%20E-comm%20Products/earbuds/bluetooth_earbuds.jpg', 'Earbuds', '2025-05-22 13:36:22', '2025-05-22 13:36:22'),
(18, 'CNDV Silence Noise Cancelling Earbuds', 'The CNDV Silence are high-end, advanced noise-cancelling earbuds designed to block out distractions and deliver immersive audio in any environment.', 'https://raw.githubusercontent.com/mouwchie/cndv-e-comm/main/Simple%20E-comm%20Products/earbuds/noise_cancelling_earbuds.jpg', 'Earbuds', '2025-05-22 13:36:22', '2025-05-22 13:36:22'),
(19, 'CNDV Lite On-Ear Headphones', 'The CNDV Lite On-Ear Headphones are lightweight and budget-friendly, providing comfortable on-ear listening for music, podcasts, and calls.', 'https://raw.githubusercontent.com/mouwchie/cndv-e-comm/main/Simple%20E-comm%20Products/headphones/on_ear_headphones.jpg', 'Headphones', '2025-05-22 13:36:22', '2025-05-22 13:36:22'),
(20, 'CNDV Air Wireless Headphones', 'The CNDV Air Wireless Headphones are mid-range headphones with Bluetooth connectivity, offering quality sound and freedom from wires for everyday use.', 'https://raw.githubusercontent.com/mouwchie/cndv-e-comm/main/Simple%20E-comm%20Products/headphones/wireless_headphones.jpg', 'Headphones', '2025-05-22 13:36:22', '2025-05-22 13:36:22'),
(21, 'CNDV Max Over-Ear Headphones', 'The CNDV Max Over-Ear Headphones are high-end, noise-cancelling headphones with plush ear cushions and immersive sound for premium listening experiences.', 'https://raw.githubusercontent.com/mouwchie/cndv-e-comm/main/Simple%20E-comm%20Products/headphones/over_ear_headphones.jpg', 'Headphones', '2025-05-22 13:36:22', '2025-05-22 13:36:22'),
(22, 'CNDV Port 7-in-1 USB-C Hub', 'The CNDV Port 7-in-1 USB-C Hub is a compact, budget-friendly hub that expands a single USB-C port into multiple connections for peripherals and storage devices.', 'https://raw.githubusercontent.com/mouwchie/cndv-e-comm/main/Simple%20E-comm%20Products/hubs%20docks/7in1_usb_c_hub.jpg', 'Hubs and Docks', '2025-05-22 13:36:22', '2025-05-22 13:36:22'),
(23, 'CNDV Link 4-Port USB Hub', 'The CNDV Link 4-Port USB Hub is an affordable hub that allows multiple USB devices to be connected to your computer or laptop simultaneously.', 'https://raw.githubusercontent.com/mouwchie/cndv-e-comm/main/Simple%20E-comm%20Products/hubs%20docks/4port_usb_hub.jpg', 'Hubs and Docks', '2025-05-22 13:36:22', '2025-05-22 13:36:22'),
(24, 'CNDV Connect Ethernet/HDMI Dock', 'The CNDV Connect Ethernet/HDMI Dock is a mid-range docking station that adds wired network and HDMI video output, ideal for home or office workstations.', 'https://raw.githubusercontent.com/mouwchie/cndv-e-comm/main/Simple%20E-comm%20Products/hubs%20docks/ethernet_hdmi_dock.jpg', 'Hubs and Docks', '2025-05-22 13:36:22', '2025-05-22 13:36:22'),
(25, 'CNDV Ultra Triple Display Dock', 'The CNDV Ultra Triple Display Dock is a high-end docking solution supporting up to three external monitors, perfect for advanced multitasking and productivity.', 'https://raw.githubusercontent.com/mouwchie/cndv-e-comm/main/Simple%20E-comm%20Products/hubs%20docks/triple_display_dock.jpg', 'Hubs and Docks', '2025-05-22 13:36:22', '2025-05-22 13:36:22');

-- --------------------------------------------------------

--
-- Table structure for table `productprices`
--

CREATE TABLE `productprices` (
  `PP_ID` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Product_Price` decimal(10,2) NOT NULL,
  `PP_EffectiveFrom` date NOT NULL,
  `PP_EffectiveTo` date DEFAULT NULL,
  `PP_CreatedAt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `productprices`
--

INSERT INTO `productprices` (`PP_ID`, `Product_ID`, `Product_Price`, `PP_EffectiveFrom`, `PP_EffectiveTo`, `PP_CreatedAt`) VALUES
(1, 1, 599.00, '2025-05-22', NULL, '2025-05-22 13:36:22'),
(2, 2, 499.00, '2025-05-22', NULL, '2025-05-22 13:36:22'),
(3, 3, 1199.00, '2025-05-22', NULL, '2025-05-22 13:36:22'),
(4, 4, 1350.00, '2025-05-22', NULL, '2025-05-22 13:36:22'),
(5, 5, 2499.00, '2025-05-22', NULL, '2025-05-22 13:36:22'),
(6, 6, 299.00, '2025-05-22', NULL, '2025-05-22 13:36:22'),
(7, 7, 950.00, '2025-05-22', NULL, '2025-05-22 13:36:22'),
(8, 8, 1200.00, '2025-05-22', NULL, '2025-05-22 13:36:22'),
(9, 9, 2499.00, '2025-05-22', NULL, '2025-05-22 13:36:22'),
(10, 10, 150.00, '2025-05-22', NULL, '2025-05-22 13:36:22'),
(11, 11, 120.00, '2025-05-22', NULL, '2025-05-22 13:36:22'),
(12, 12, 590.00, '2025-05-22', NULL, '2025-05-22 13:36:22'),
(13, 13, 1250.00, '2025-05-22', NULL, '2025-05-22 13:36:22'),
(14, 14, 690.00, '2025-05-22', NULL, '2025-05-22 13:36:22'),
(15, 15, 350.00, '2025-05-22', NULL, '2025-05-22 13:36:22'),
(16, 16, 1250.00, '2025-05-22', NULL, '2025-05-22 13:36:22'),
(17, 17, 1100.00, '2025-05-22', NULL, '2025-05-22 13:36:22'),
(18, 18, 3499.00, '2025-05-22', NULL, '2025-05-22 13:36:22'),
(19, 19, 799.00, '2025-05-22', NULL, '2025-05-22 13:36:22'),
(20, 20, 2299.00, '2025-05-22', NULL, '2025-05-22 13:36:22'),
(21, 21, 7990.00, '2025-05-22', NULL, '2025-05-22 13:36:22'),
(22, 22, 850.00, '2025-05-22', NULL, '2025-05-22 13:36:22'),
(23, 23, 500.00, '2025-05-22', NULL, '2025-05-22 13:36:22'),
(24, 24, 2200.00, '2025-05-22', NULL, '2025-05-22 13:36:22'),
(25, 25, 5500.00, '2025-05-22', NULL, '2025-05-22 13:36:22');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `Review_ID` int(11) NOT NULL,
  `Product_ID` int(11) NOT NULL,
  `Cust_ID` int(11) NOT NULL,
  `Review_Rating` decimal(3,2) NOT NULL,
  `Review_Comment` text NOT NULL,
  `Review_Date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shippingaddress`
--

CREATE TABLE `shippingaddress` (
  `SA_ID` int(11) NOT NULL,
  `SA_Street` varchar(255) NOT NULL,
  `SA_Barangay` varchar(255) NOT NULL,
  `SA_City` varchar(255) NOT NULL,
  `SA_Province` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `shippingaddress`
--

INSERT INTO `shippingaddress` (`SA_ID`, `SA_Street`, `SA_Barangay`, `SA_City`, `SA_Province`) VALUES
(1, 'Sample Street 123', 'Barangay 1', 'Batangas City', 'Batangas');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `administrator`
--
ALTER TABLE `administrator`
  ADD PRIMARY KEY (`Admin_ID`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`Cart_ID`),
  ADD KEY `Cust_ID` (`Cust_ID`);

--
-- Indexes for table `cartitem`
--
ALTER TABLE `cartitem`
  ADD PRIMARY KEY (`CI_ID`),
  ADD KEY `Cart_ID` (`Cart_ID`),
  ADD KEY `Product_ID` (`Product_ID`);

--
-- Indexes for table `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`Cust_ID`),
  ADD KEY `SA_ID` (`SA_ID`);

--
-- Indexes for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD PRIMARY KEY (`OI_ID`),
  ADD KEY `Order_ID` (`Order_ID`),
  ADD KEY `Product_ID` (`Product_ID`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`Order_ID`),
  ADD KEY `Cust_ID` (`Cust_ID`),
  ADD KEY `fk_admin` (`Admin_ID`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`Payment_ID`),
  ADD KEY `Order_ID` (`Order_ID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`Product_ID`);

--
-- Indexes for table `productprices`
--
ALTER TABLE `productprices`
  ADD PRIMARY KEY (`PP_ID`),
  ADD KEY `Product_ID` (`Product_ID`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`Review_ID`),
  ADD KEY `Product_ID` (`Product_ID`),
  ADD KEY `Cust_ID` (`Cust_ID`);

--
-- Indexes for table `shippingaddress`
--
ALTER TABLE `shippingaddress`
  ADD PRIMARY KEY (`SA_ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `administrator`
--
ALTER TABLE `administrator`
  MODIFY `Admin_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `Cart_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `cartitem`
--
ALTER TABLE `cartitem`
  MODIFY `CI_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `customer`
--
ALTER TABLE `customer`
  MODIFY `Cust_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `orderitem`
--
ALTER TABLE `orderitem`
  MODIFY `OI_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `Order_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `Payment_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `Product_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `productprices`
--
ALTER TABLE `productprices`
  MODIFY `PP_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `Review_ID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `shippingaddress`
--
ALTER TABLE `shippingaddress`
  MODIFY `SA_ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`Cust_ID`) REFERENCES `customer` (`Cust_ID`);

--
-- Constraints for table `cartitem`
--
ALTER TABLE `cartitem`
  ADD CONSTRAINT `cartitem_ibfk_1` FOREIGN KEY (`Cart_ID`) REFERENCES `cart` (`Cart_ID`),
  ADD CONSTRAINT `cartitem_ibfk_2` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`);

--
-- Constraints for table `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`SA_ID`) REFERENCES `shippingaddress` (`SA_ID`);

--
-- Constraints for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`Order_ID`) REFERENCES `orders` (`Order_ID`),
  ADD CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `fk_admin` FOREIGN KEY (`Admin_ID`) REFERENCES `administrator` (`Admin_ID`),
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`Cust_ID`) REFERENCES `customer` (`Cust_ID`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`Order_ID`) REFERENCES `orders` (`Order_ID`);

--
-- Constraints for table `productprices`
--
ALTER TABLE `productprices`
  ADD CONSTRAINT `productprices_ibfk_1` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`Product_ID`) REFERENCES `product` (`Product_ID`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`Cust_ID`) REFERENCES `customer` (`Cust_ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
