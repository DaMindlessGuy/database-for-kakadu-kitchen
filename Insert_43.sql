-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 23, 2025 at 05:07 AM
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
-- Database: `kkitchen_43`
--

-- --------------------------------------------------------

--
-- Table structure for table `packagingtype`
--

CREATE TABLE `packagingtype` (
  `PackagingTypeID` char(3) NOT NULL,
  `Description` varchar(60) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `packagingtype`
--

INSERT INTO `packagingtype` (`PackagingTypeID`, `Description`) VALUES
('GOP', 'Glass bottle with cork cap (pack of 6)'),
('GOS', 'Glass bottle with cork cap (single) '),
('GRP', 'Glass bottle with crown cap (pack of 6)'),
('GRS', 'Glass boltte with crown Cap (single)'),
('PPP', 'Plastic bottle with polyethylene cap (pack of 6)'),
('PPS', 'Plastic bottle with polyethylene cap (single)');

-- --------------------------------------------------------

--
-- Table structure for table `partner`
--

CREATE TABLE `partner` (
  `PartnerID` int(11) NOT NULL,
  `Name` varchar(50) NOT NULL,
  `TypeID` char(2) NOT NULL,
  `Phone` char(10) NOT NULL,
  `StreetNo` varchar(5) NOT NULL,
  `StreetName` varchar(40) NOT NULL,
  `City` varchar(30) NOT NULL,
  `State` varchar(3) NOT NULL,
  `PostCode` char(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `partner`
--

INSERT INTO `partner` (`PartnerID`, `Name`, `TypeID`, `Phone`, `StreetNo`, `StreetName`, `City`, `State`, `PostCode`) VALUES
(1, 'Refresh Darwin', 'SO', '0882869887', '10', 'Frame St', 'Alawa ', 'NT', '0810'),
(2, 'ALTD Sprits', 'PR', '0290899663', '45', 'Maple Cres', 'Roackdale', 'NSW', '2500'),
(3, 'OzHarvest', 'PR', '0798933988', '140', 'Rubicon Rd', 'Sunnybank', 'QLD', '4111'),
(4, 'Coles', 'RO', '0392882777', '170', 'Dunnings St', 'Footscary', 'Vic', '3842'),
(5, 'First Nations-owned company ', 'SR', '08784721', '90', 'Bay St', 'Darwin City ', 'NT', '0800');

-- --------------------------------------------------------

--
-- Table structure for table `partnerpartnership`
--

CREATE TABLE `partnerpartnership` (
  `PartnerPartnershipID` int(11) NOT NULL,
  `PartnerID` int(11) NOT NULL,
  `PartnershipID` int(11) NOT NULL,
  `PartnerInvShare` decimal(10,2) NOT NULL,
  `PartnerSaleShare` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `partnerpartnership`
--

INSERT INTO `partnerpartnership` (`PartnerPartnershipID`, `PartnerID`, `PartnershipID`, `PartnerInvShare`, `PartnerSaleShare`) VALUES
(1, 1, 1, 10000.00, 75.00),
(2, 2, 2, 11000.00, 82.00),
(3, 2, 3, 12000.00, 35.20),
(4, 4, 4, 15000.00, 40.00),
(5, 5, 5, 25000.00, 65.00),
(6, 3, 3, 10000.00, 45.00);

-- --------------------------------------------------------

--
-- Table structure for table `partnership`
--

CREATE TABLE `partnership` (
  `PartnershipID` int(11) NOT NULL,
  `StartDate` date NOT NULL,
  `TotalInvestment` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `partnership`
--

INSERT INTO `partnership` (`PartnershipID`, `StartDate`, `TotalInvestment`) VALUES
(1, '2018-02-13', 20000.00),
(2, '2021-10-22', 22500.00),
(3, '2022-03-13', 30000.00),
(4, '2024-04-12', 25000.00),
(5, '2025-05-13', 35000.00);

-- --------------------------------------------------------

--
-- Table structure for table `partnershipproduct`
--

CREATE TABLE `partnershipproduct` (
  `PartnershipProductID` int(11) NOT NULL,
  `ProductNo` int(11) NOT NULL,
  `PartnershipID` int(11) NOT NULL,
  `TotalUnitAgreed` int(11) NOT NULL,
  `TotalUnitDelivered` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `partnertype`
--

CREATE TABLE `partnertype` (
  `PartnerTypeID` char(2) NOT NULL,
  `Description` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `partnertype`
--

INSERT INTO `partnertype` (`PartnerTypeID`, `Description`) VALUES
('PO', 'Producer only '),
('PR', 'Producer and retailer'),
('RO', 'Retailer only '),
('SO', 'Supplier only'),
('SR', 'Supplier and Retailer ');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `ProductNo` int(11) NOT NULL,
  `Name` varchar(40) NOT NULL,
  `Description` varchar(70) NOT NULL,
  `ProdTypeID` char(3) NOT NULL,
  `SrcTypeID` int(11) NOT NULL,
  `PackTypeID` char(3) NOT NULL,
  `Ingredients` varchar(200) NOT NULL,
  `Amount` varchar(10) NOT NULL,
  `Price` decimal(5,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `producttype`
--

CREATE TABLE `producttype` (
  `ProductTypeID` char(3) NOT NULL,
  `Description` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `producttype`
--

INSERT INTO `producttype` (`ProductTypeID`, `Description`) VALUES
('SLC', 'Spirit - limited edition, carbonated'),
('SLP', 'Sprit- Limited edition, sparkling '),
('SLT', 'Spirit – limited edition, still'),
('SNP', 'Sprit - Non Alcoholic, sparkling water '),
('SNT', 'Sprit- non-alcoholic,still'),
('WNA', 'Wine – non-alcoholic'),
('WNC', 'Wine – non-alcoholic, carbonated '),
('WSP', 'Water - Sparkling '),
('WST', 'Water - Still');

-- --------------------------------------------------------

--
-- Table structure for table `sourcetype`
--

CREATE TABLE `sourcetype` (
  `SourceTypeID` int(11) NOT NULL,
  `Description` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `sourcetype`
--

INSERT INTO `sourcetype` (`SourceTypeID`, `Description`) VALUES
(1, 'Palmerston Dolostone Aquifer'),
(2, 'Kakadu National Park'),
(3, 'Wild-harvested native native botanicals '),
(4, 'Capricorn Coast aquifer '),
(5, 'Yarra Ranges aquifer ');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `packagingtype`
--
ALTER TABLE `packagingtype`
  ADD PRIMARY KEY (`PackagingTypeID`);

--
-- Indexes for table `partner`
--
ALTER TABLE `partner`
  ADD PRIMARY KEY (`PartnerID`),
  ADD KEY `Test` (`TypeID`);

--
-- Indexes for table `partnerpartnership`
--
ALTER TABLE `partnerpartnership`
  ADD PRIMARY KEY (`PartnerPartnershipID`),
  ADD KEY `Test1` (`PartnerID`),
  ADD KEY `Test2` (`PartnershipID`);

--
-- Indexes for table `partnership`
--
ALTER TABLE `partnership`
  ADD PRIMARY KEY (`PartnershipID`);

--
-- Indexes for table `partnershipproduct`
--
ALTER TABLE `partnershipproduct`
  ADD PRIMARY KEY (`PartnershipProductID`),
  ADD KEY `Test6` (`PartnershipID`),
  ADD KEY `Test7` (`ProductNo`);

--
-- Indexes for table `partnertype`
--
ALTER TABLE `partnertype`
  ADD PRIMARY KEY (`PartnerTypeID`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`ProductNo`),
  ADD KEY `Test3` (`SrcTypeID`),
  ADD KEY `Test4` (`PackTypeID`),
  ADD KEY `Test5` (`ProdTypeID`);

--
-- Indexes for table `producttype`
--
ALTER TABLE `producttype`
  ADD PRIMARY KEY (`ProductTypeID`);

--
-- Indexes for table `sourcetype`
--
ALTER TABLE `sourcetype`
  ADD PRIMARY KEY (`SourceTypeID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `partner`
--
ALTER TABLE `partner`
  MODIFY `PartnerID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `partnerpartnership`
--
ALTER TABLE `partnerpartnership`
  MODIFY `PartnerPartnershipID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `partnership`
--
ALTER TABLE `partnership`
  MODIFY `PartnershipID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `partnershipproduct`
--
ALTER TABLE `partnershipproduct`
  MODIFY `PartnershipProductID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `ProductNo` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sourcetype`
--
ALTER TABLE `sourcetype`
  MODIFY `SourceTypeID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `partner`
--
ALTER TABLE `partner`
  ADD CONSTRAINT `Test` FOREIGN KEY (`TypeID`) REFERENCES `partnertype` (`PartnerTypeID`);

--
-- Constraints for table `partnerpartnership`
--
ALTER TABLE `partnerpartnership`
  ADD CONSTRAINT `Test1` FOREIGN KEY (`PartnerID`) REFERENCES `partner` (`PartnerID`),
  ADD CONSTRAINT `Test2` FOREIGN KEY (`PartnershipID`) REFERENCES `partnership` (`PartnershipID`);

--
-- Constraints for table `partnershipproduct`
--
ALTER TABLE `partnershipproduct`
  ADD CONSTRAINT `Test6` FOREIGN KEY (`PartnershipID`) REFERENCES `partnership` (`PartnershipID`),
  ADD CONSTRAINT `Test7` FOREIGN KEY (`ProductNo`) REFERENCES `product` (`ProductNo`);

--
-- Constraints for table `product`
--
ALTER TABLE `product`
  ADD CONSTRAINT `Test3` FOREIGN KEY (`SrcTypeID`) REFERENCES `sourcetype` (`SourceTypeID`),
  ADD CONSTRAINT `Test4` FOREIGN KEY (`PackTypeID`) REFERENCES `packagingtype` (`PackagingTypeID`),
  ADD CONSTRAINT `Test5` FOREIGN KEY (`ProdTypeID`) REFERENCES `producttype` (`ProductTypeID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
