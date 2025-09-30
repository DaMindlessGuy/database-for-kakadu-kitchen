CREATE DATABASE IF NOT EXISTS `kkitchen_43`;
USE `kkitchen_43`;

CREATE TABLE `packagingtype` (
  `PackageTypeID` char(3) NOT NULL PRIMARY KEY,
  `Description` varchar(60) NOT NULL
);

CREATE TABLE `partner` (
  `PartnerID` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT, 
  `Name` varchar(50) NOT NULL,
  `TypeID` char(2) NOT NULL,
  `Phone` char(10) NOT NULL,
  `StreetNo` varchar(5) NOT NULL,
  `StreetName` varchar(40) NOT NULL,
  `City` varchar(30) NOT NULL,
  `State` varchar(3) NOT NULL,
  `PostCode` char(4) NOT NULL
); 

CREATE TABLE `partnership` (
  `PartnershipID` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT, 
  `StartDate` date NOT NULL,
  `TotalInvestment` decimal(10,2) NOT NULL
);

CREATE TABLE `partnerpartnership` (
  `PartnerPartnershipID` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `PartnerID` int(11) NOT NULL,
  `PartnershipID` int(11) NOT NULL,
  `PartnerInvShare` decimal(10,2) NOT NULL,
  `PartnerSaleShare` decimal(5,2) NOT NULL,
  FOREIGN KEY (`PartnerID`) REFERENCES partner(PartnerID),
  FOREIGN KEY (`PartnershipID`) REFERENCES partnership(PartnershipID)
);

CREATE TABLE `partnertype` (
  `PartnerTypeID` char(2) NOT NULL PRIMARY KEY,
  `Description` varchar(30) NOT NULL
);

CREATE TABLE `producttype` (
  `ProductTypeID` char(3) NOT NULL PRIMARY KEY,
  `Description` varchar(50) NOT NULL
);

CREATE TABLE `sourcetype` (
  `SourceTypeID` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Description` varchar(40) NOT NULL
);

CREATE TABLE `product` (
  `ProductNo` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `Name` varchar(40) NOT NULL,
  `Description` varchar(70) NOT NULL,
  `ProdTypeID` char(3) NOT NULL,
  `SrcTypeID` int(11) NOT NULL,
  `PackTypeID` char(3) NOT NULL,
  `Ingredients` varchar(200) NOT NULL,
  `Amount` varchar(10) NOT NULL,
  `Price` decimal(5,2) NOT NULL,
  FOREIGN KEY (`ProdTypeID`) REFERENCES producttype(ProductTypeID),
  FOREIGN KEY (`SrcTypeID`) REFERENCES sourcetype(SourceTypeID),
  FOREIGN KEY (`PackTypeID`) REFERENCES packagingtype(PackageTypeID)
);

CREATE TABLE `partnershipproduct` (
  `PartnershipProductID` int(11) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `ProductNo` int(11) NOT NULL,
  `PartnershipID` int(11) ,
  `TotalUnitAgreed` int(11) NOT NULL,
  `TotalUnitDelivered` int(11) NOT NULL,
  FOREIGN KEY (`ProductNo`) REFERENCES product(ProductNo),
  FOREIGN KEY (`PartnershipID`) REFERENCES partnership(PartnershipID)
);

COMMIT;
