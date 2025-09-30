-- Oliver will work from here
-- 1. 

SELECT Name, Phone, CONCAT(StreetNo, ' ', StreetName, ' ', City, State, ' ', PostCode) as Address  FROM `partner` 

-- 2. 
-- Joins the product and sourcetype table and selects products where the SrcTypeID = 2 (The id of Kakadu National Park)... -- edit by Patrick
SELECT Name, `sourcetype`.Description as "Source"
FROM `product` 
INNER JOIN `sourcetype`
WHERE `product`.`SrcTypeID` = `sourcetype`.`SourceTypeID` and SrcTypeID = 2

-- Nhan will work from here
-- 3. 

SELECT DATE_FORMAT(StartDate, '%d-%m-%Y') AS partnership_date, CONCAT('$', FORMAT(TotalInvestment, 0)) AS total_investment  
FROM partnership  
ORDER BY StartDate ASC 
LIMIT 1 OFFSET 1; 

-- 4. 

SELECT Name, COUNT(*) AS total_products 
FROM product 
GROUP BY Name 
HAVING COUNT(*) > 3 
ORDER BY total_products DESC; 

-- Patrick will work from here
-- 5. 

SELECT Name, ProductTypeID, Amount, Price
FROM `partnershipproduct`
INNER JOIN `product`
ON partnershipproduct.ProductNo = product.ProductNo
INNER JOIN `producttype`
ON product.ProdTypeID = producttype.ProductTypeID
WHERE TotalUnitDelivered = 0 and ProductTypeID = "SLC" or ProductTypeID = "SLP" or ProductTypeID = "SLT"

-- 6. 

SELECT partnerpartnership.PartnershipID, partner.PartnerID, partner.Name, partnerpartnership.PartnerInvShare, partnerpartnership.PartnerSaleShare
FROM partnerpartnership 
JOIN partner
ON partnerpartnership.PartnerID = partner.PartnerID
WHERE partnerpartnership.PartnershipID IN (
        SELECT PartnershipID
        FROM partnerpartnership
        GROUP BY PartnershipID
        HAVING COUNT(PartnerID) = 2
    )
ORDER BY partnerpartnership.PartnershipID, partner.PartnerID;


-- 7.

SELECT partnershipproduct.ProductNo,
    COUNT(DISTINCT partnershipproduct.PartnershipID) AS NumPartnerships,
    SUM(DISTINCT partnershipproduct.TotalUnitAgreed) AS TotalUnitsAgreed,
    SUM(DISTINCT partnershipproduct.TotalUnitDelivered) AS TotalUnitsDelivered
FROM partnershipproduct
JOIN partnerpartnership 
ON partnershipproduct.PartnershipID = partnerpartnership.PartnershipID
JOIN partner 
ON partnerpartnership.PartnerID = partner.PartnerID
GROUP BY partnershipproduct.ProductNo
HAVING COUNT(DISTINCT partnershipproduct.PartnershipID) > 1;

-- 8. 

SELECT
    partnerpartnership.PartnershipID,
    partnershipproduct.ProductNo,
    product.Name AS ProductName,
    partnershipproduct.TotalUnitAgreed,
    partnershipproduct.TotalUnitDelivered,
    
    CONCAT('$', partnershipproduct.TotalUnitDelivered * product.Price * partnerpartnership.PartnerSaleShare / 100) AS SaleShareDollar
FROM partner

JOIN partnerpartnership
ON partner.PartnerID = partnerpartnership.PartnerID

JOIN partnershipproduct 
ON partnerpartnership.PartnershipID = partnershipproduct.PartnershipID

JOIN product 
ON partnershipproduct.ProductNo = product.ProductNo

WHERE partner.Name = 'First Nations-owned company'
ORDER BY partnerpartnership.PartnershipID, partnershipproduct.ProductNo;


