-- Patrick is reponsible for this so if it breaks... Blame him

-- Task 1: 
-- 1. Insert the new partner 'Brisbane Fresh'
INSERT INTO `partner` (Name, TypeID, Phone, StreetNo, StreetName, City, State, PostCode)
VALUES ('Brisbane Fresh', 'PR', '', '', '', 'South Brisbane', 'QLD', '4101');

-- 2. Insert the new partnership
INSERT INTO `partnership` (StartDate, TotalInvestment)
VALUES ('2025-08-01', 345000.00);

-- 3. Insert Brisbane Fresh's participation
INSERT INTO `partnerpartnership` (PartnerID, PartnershipID, PartnerInvShare, PartnerSaleShare)
SELECT PartnerID, LAST_INSERT_ID(), 150000.00, 65.00
FROM partner
WHERE Name = 'Brisbane Fresh';

-- 4. Insert Kakadu Kitchen's participation
INSERT INTO `partnerpartnership` (PartnerID, PartnershipID, PartnerInvShare, PartnerSaleShare)
SELECT PartnerID, LAST_INSERT_ID(), 195000.00, 35.00
FROM `partner`
WHERE Name = 'Kakadu Kitchen';

-- Task 2: 
