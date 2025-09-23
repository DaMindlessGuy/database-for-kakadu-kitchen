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

INSERT INTO `partnertype` (`PartnerTypeID`, `Description`) VALUES
('PO', 'Producer only '),
('PR', 'Producer and retailer'),
('RO', 'Retailer only '),
('SO', 'Supplier only'),
('SR', 'Supplier and Retailer ');

INSERT INTO `partner` (`PartnerID`, `Name`, `TypeID`, `Phone`, `StreetNo`, `StreetName`, `City`, `State`, `PostCode`) VALUES
(1, 'Refresh Darwin', 'SO', '0882869887', '10', 'Frame St', 'Alawa ', 'NT', '0810'),
(2, 'ALTD Sprits', 'PR', '0290899663', '45', 'Maple Cres', 'Roackdale', 'NSW', '2500'),
(3, 'OzHarvest', 'PR', '0798933988', '140', 'Rubicon Rd', 'Sunnybank', 'QLD', '4111'),
(4, 'Coles', 'RO', '0392882777', '170', 'Dunnings St', 'Footscary', 'Vic', '3842'),
(5, 'First Nations-owned company ', 'SR', '08784721', '90', 'Bay St', 'Darwin City ', 'NT', '0800');

INSERT INTO `partnership` (`PartnershipID`, `StartDate`, `TotalInvestment`) VALUES
(1, '2018-02-13', 20000.00),
(2, '2021-10-22', 22500.00),
(3, '2022-03-13', 30000.00),
(4, '2024-04-12', 25000.00),
(5, '2025-05-13', 35000.00);

INSERT INTO `partnerpartnership` (`PartnerPartnershipID`, `PartnerID`, `PartnershipID`, `PartnerInvShare`, `PartnerSaleShare`) VALUES
(1, 1, 1, 10000.00, 75.00),
(2, 2, 2, 11000.00, 82.00),
(3, 2, 3, 12000.00, 35.20),
(4, 4, 4, 15000.00, 40.00),
(5, 5, 5, 25000.00, 65.00),
(6, 3, 3, 10000.00, 45.00);

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

INSERT INTO `sourcetype` (`SourceTypeID`, `Description`) VALUES
(1, 'Palmerston Dolostone Aquifer'),
(2, 'Kakadu National Park'),
(3, 'Wild-harvested native native botanicals '),
(4, 'Capricorn Coast aquifer '),
(5, 'Yarra Ranges aquifer ');

INSERT INTO `packagingtype` (`PackagingTypeID`, `Description`) VALUES
('GOP', 'Glass bottle with cork cap (pack of 6)'),
('GOS', 'Glass bottle with cork cap (single) '),
('GRP', 'Glass bottle with crown cap (pack of 6)'),
('GRS', 'Glass boltte with crown Cap (single)'),
('PPP', 'Plastic bottle with polyethylene cap (pack of 6)'),
('PPS', 'Plastic bottle with polyethylene cap (single)');


-- Big Boi
INSERT INTO `product` (`ProductNo`, `Name`, `Description`, `ProdTypeID`, `SrcTypeID`, `PackTypeID`, `Ingredients`, `Amount`, `Price`) VALUES
(1, 'Akuna Springs', 'Mineral-rich spring water', 'WSP', 1, 'GOS', 'Spring water, lightly carbonated', '600ml', 4.99),
(2, 'Akuna Springs', 'Mineral-rich spring water', 'WST', 4, 'GOS', 'Spring water', '600ml', 4.99),
(3, 'Akuna Springs', 'Mineral-rich spring water', 'WSP', 5, 'GRS', 'Spring water, lightly carbonated', '600ml', 4.49),
(4, 'Akuna Springs', 'Mineral-rich spring water', 'WST', 1, 'GRS', 'Spring water', '600ml', 4.49),
(5, 'Akuna Springs', 'Mineral-rich spring water', 'WST', 4, 'PPS', 'Spring water', '600ml', 3.49),
(6, 'Akuna Springs', 'Mineral-rich spring water', 'WSP', 1, 'GOP', 'Spring water, lightly carbonated', '3,600ml', 28.99),
(7, 'Akuna Springs', 'Mineral-rich spring water', 'WST', 4, 'GOP', 'Spring water', '3,600ml', 28.99),
(8, 'Akuna Springs', 'Mineral-rich spring water', 'WSP', 5, 'GRP', 'Spring water, lightly carbonated', '3,600ml', 24.49),
(9, 'Akuna Springs', 'Mineral-rich spring water', 'WST', 1, 'GRP', 'Spring water', '3,600ml', 24.49),
(10, 'Akuna Springs', 'Mineral-rich spring water', 'WST', 4, 'PPP', 'Spring water', '3,600ml', 18.49),
(11, 'Akuna Blue', 'Premium spring water', 'WSP', 1, 'GOS', 'Spring water, lightly carbonated', '600ml', 5.99),
(12, 'Akuna Blue', 'Premium spring water', 'WST', 4, 'GOS', 'Spring water', '600ml', 5.99),
(13, 'Akuna Blue', 'Premium spring water', 'WSP', 5, 'GRS', 'Spring water, lightly carbonated', '600ml', 5.49),
(14, 'Akuna Blue', 'Premium spring water', 'WST', 1, 'GRS', 'Spring water', '600ml', 5.49),
(15, 'Akuna Blue', 'Premium spring water', 'WST', 4, 'PPS', 'Spring water', '600ml', 4.49),
(16, 'Akuna Blue', 'Premium spring water', 'WSP', 1, 'GOP', 'Spring water, lightly carbonated', '3,600ml', 34.99),
(17, 'Akuna Blue', 'Premium spring water', 'WST', 4, 'GOP', 'Spring water', '3,600ml', 34.99),
(18, 'Akuna Blue', 'Premium spring water', 'WSP', 5, 'GRP', 'Spring water, lightly carbonated', '3,600ml', 30.49),
(19, 'Akuna Blue', 'Premium spring water', 'WST', 1, 'GRP', 'Spring water', '3,600ml', 30.49),
(20, 'Akuna Blue', 'Premium spring water', 'WST', 4, 'PPP', 'Spring water', '3,600ml', 25.49),
(21, 'Kakadu An-marabula Bellini', 'Native Peach Bellini, non-alcoholic spirit alternative ', 'SNT', 2, 'GOS', 'Native peach nectar, botanical extracts, dealcoholized wine, natural flavours, colours, sparkling water, citric acid, vegetable glycerine, potassium sorbate and sugar', '750ml', 10.99),
(22, 'Kakadu An-marabula Bellini', 'Native Peach Bellini, non-alcoholic spirit alternative ', 'SNT', 2, 'GOP', 'Native peach nectar, botanical extracts, dealcoholized wine, natural flavours, colours, sparkling water, citric acid, vegetable glycerine, potassium sorbate and sugar', '4,500ml', 61.99),
(23, 'Kakadu Kitchen x OzHarvest Conscious Dri', 'Conscious Drink, non-alcoholic wine alternative', 'WNA', 3, 'GOS', 'Ethically sourced: filtered water, blueberry juice, lemongrass, saltbush, pepper berry, vinegar, botanical extracts, natural flavours, agave, citric acid, and potassium sorbate', '750ml', 18.49),
(24, 'Kakadu Kitchen x OzHarvest Conscious Dri', 'Conscious Drink, non-alcoholic wine alternative', 'WNC', 3, 'GOS', 'Ethically sourced: filtered water, blueberry juice, lemongrass, saltbush, pepper berry, vinegar, botanical extracts, natural flavours, agave, citric acid, potassium sorbate, and lightly carbonated', '750ml', 18.99),
(25, 'Kakadu Kitchen x OzHarvest Conscious Dri', 'Conscious Drink, non-alcoholic wine alternative', 'WNA', 3, 'GOP', 'Ethically sourced: filtered water, blueberry juice, lemongrass, saltbush, pepper berry, vinegar, botanical extracts, natural flavours, agave, citric acid, and potassium sorbate', '4,500ml', 110.49),
(26, 'Kakadu Kitchen x OzHarvest Conscious Dri', 'Conscious Drink, non-alcoholic wine alternative', 'WNC', 3, 'GOP', 'Ethically sourced: filtered water, blueberry juice, lemongrass, saltbush, pepper berry, vinegar, botanical extracts, natural flavours, agave, citric acid, potassium sorbate, and lightly carbonated', '4,500ml', 113.99),
(27, 'ALTD x Kakadu Kaboh (Green Ant) G&T', 'Ready-to-drink (RTD) beverage', 'SLT', 2, 'GRS', 'Distilled juniper, handcrafted bitters, black pepper, green ants, botanical extracts, natural flavours, citric acid, vegetable glycerine, and potassium sorbate', '600ml', 39.99),
(28, 'ALTD x Kakadu Kaboh (Green Ant) G&T', 'Ready-to-drink (RTD) beverage', 'SLP', 2, 'GRS', 'Distilled juniper, handcrafted bitters, black pepper, green ants, botanical extracts, natural flavours, citric acid, vegetable glycerine, and potassium sorbate', '750ml', 45.99),
(29, 'ALTD x Kakadu Kaboh (Green Ant) G&T', 'Ready-to-drink (RTD) beverage', 'SLC', 2, 'GRS', 'Distilled juniper, handcrafted bitters, black pepper, green ants, botanical extracts, natural flavours, citric acid, vegetable glycerine, and potassium sorbate', '500ml', 35.99),
(30, 'ALTD x Kakadu Kaboh (Green Ant) G&T', 'Ready-to-drink (RTD) beverage', 'SLT', 2, 'GOS', 'Distilled juniper, handcrafted bitters, black pepper, green ants, botanical extracts, natural flavours, citric acid, vegetable glycerine, native sugar cane \"djilidjilih\", and potassium sorbate', '600ml', 39.99),
(31, 'ALTD x Kakadu Kaboh (Green Ant) G&T', 'Ready-to-drink (RTD) beverage', 'SLP', 2, 'GOS', 'Distilled juniper, handcrafted bitters, black pepper, green ants, botanical extracts, natural flavours, citric acid, vegetable glycerine, native sugar cane \"djilidjilih\", and potassium sorbate', '750ml', 45.99),
(32, 'ALTD x Kakadu Kaboh (Green Ant) G&T', 'Ready-to-drink (RTD) beverage', 'SLC', 2, 'GOS', 'Distilled juniper, handcrafted bitters, black pepper, green ants, botanical extracts, natural flavours, citric acid, vegetable glycerine, native sugar cane \"djilidjilih\", and potassium sorbate', '500ml', 35.99),
(33, 'Kakadu An-marabula Bellini', 'Native Peach Bellini, non-alcoholic spirit alternative ', 'SNP', 2, 'GOS', 'Native peach nectar, botanical extracts, dealcoholized wine, natural flavours, colours, sparkling water, citric acid, vegetable glycerine, potassium sorbate and sugar', '750ml', 12.99),
(34, 'Kakadu An-marabula Bellini', 'Native Peach Bellini, non-alcoholic spirit alternative ', 'SNP', 2, 'GOP', 'Native peach nectar, botanical extracts, dealcoholized wine, natural flavours, colours, sparkling water, citric acid, vegetable glycerine, potassium sorbate and sugar', '4,500ml', 66.99);



COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

