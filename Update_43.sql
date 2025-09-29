-- Patrick is reponsible for this so if it breaks... Blame him

-- Task 1: 
-- Step 1: Extend partner type (only if "PS" doesn't already exist)
INSERT INTO `partnertype` (`PartnerTypeID`, `Description`) VALUES
('PS', 'Producer and Supplier')
ON DUPLICATE KEY UPDATE Description = 'Producer and Supplier';

-- Step 2: Add Brisbane Fresh partner
INSERT INTO `partner` (`Name`, `TypeID`, `Phone`, `StreetNo`, `StreetName`, `City`, `State`, `PostCode`) VALUES
('Brisbane Fresh', 'PS', '0731234567', '25', 'Grey St', 'South Brisbane', 'QLD', '4101');

-- Capture Brisbane Fresh PartnerID
SET @partner_id = LAST_INSERT_ID();

-- Step 3: Add the new partnership
INSERT INTO `partnership` (`StartDate`, `TotalInvestment`) VALUES
('2025-09-01', 345000.00);

-- Capture PartnershipID
SET @partnership_id = LAST_INSERT_ID();

-- Step 4: Link Brisbane Fresh with investment and share
INSERT INTO `partnerpartnership` (`PartnerID`, `PartnershipID`, `PartnerInvShare`, `PartnerSaleShare`) VALUES
(@partner_id, @partnership_id, 150000.00, 65.00);


-- Task 2: 
-- Step 1: Capture Brisbane Fresh PartnerID (assuming just inserted)
SET @partner_id = (SELECT PartnerID FROM partner WHERE Name = 'Brisbane Fresh');

-- Step 2: Capture the new PartnershipID (August 2025)
SET @partnership_id = (SELECT PartnershipID FROM partnership 
                       WHERE StartDate = '2025-09-01' AND TotalInvestment = 345000.00);

-- Step 3: Insert all four product variations into partnershipproduct for the new partnership
INSERT INTO `partnershipproduct` (`ProductNo`, `PartnershipID`, `TotalUnitAgreed`, `TotalUnitDelivered`)
VALUES
(21, @partnership_id, 30000, 0),  -- still, single bottle
(22, @partnership_id, 20000, 0),  -- still, pack of 6
(33, @partnership_id, 25000, 0),  -- sparkling, single bottle
(34, @partnership_id, 15000, 0);  -- sparkling, pack of 6

-- Task 3: 
-- Step 1: Capture PartnerIDs
SET @brisbane_fresh_id = (SELECT PartnerID FROM partner WHERE Name = 'Brisbane Fresh');
SET @altd_spirits_id  = (SELECT PartnerID FROM partner WHERE Name = 'ALTD Sprits');

-- Step 2: Capture the new PartnershipID
SET @new_partnership_id = (SELECT PartnershipID FROM partnership 
                           WHERE StartDate = '2025-09-01' AND TotalInvestment = 345000.00);

-- Step 3: Update Brisbane Fresh sale share
UPDATE partnerpartnership
SET PartnerSaleShare = 55.00
WHERE PartnerID = @brisbane_fresh_id
  AND PartnershipID = @new_partnership_id;

-- Step 4: Add ALTD Spirits to the partnership with 0 investment and 10% sale share
INSERT INTO partnerpartnership (PartnerID, PartnershipID, PartnerInvShare, PartnerSaleShare)
VALUES (@altd_spirits_id, @new_partnership_id, 0.00, 10.00);

-- Task 4:
-- Step 1: Capture the new PartnershipID
SET @new_partnership_id = (SELECT PartnershipID 
                           FROM partnership 
                           WHERE StartDate = '2025-09-01' AND TotalInvestment = 345000.00);

-- Step 2: Update the single glass bottle quantity
UPDATE partnershipproduct
SET TotalUnitAgreed = 50000
WHERE PartnershipID = @new_partnership_id
  AND ProductNo = 33;  -- sparkling, single bottle

-- Step 3: Update the pack-of-6 quantity
UPDATE partnershipproduct
SET TotalUnitAgreed = 20000
WHERE PartnershipID = @new_partnership_id
  AND ProductNo = 34;  -- sparkling, pack of 6

-- Task 5: 
-- Step 1: Capture the new PartnershipID
SET @new_partnership_id = (SELECT PartnershipID 
                           FROM partnership 
                           WHERE StartDate = '2025-09-01' AND TotalInvestment = 345000.00);

-- Step 2: Update delivered units for sparkling single glass bottle
UPDATE partnershipproduct
SET TotalUnitDelivered = 1000
WHERE PartnershipID = @new_partnership_id
  AND ProductNo = 33;  -- sparkling, single bottle

