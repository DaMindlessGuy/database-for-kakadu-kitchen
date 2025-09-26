-- Oliver will work from here
-- 1. 

-- 2. 

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

SELECT partnerpartnership.PartnershipID, partner.PartnerID, partner.Name
FROM `partnerpartnership`
JOIN partner 
ON partnerpartnership.PartnerID = partner.PartnerID
WHERE partnerpartnership.PartnershipID IN (
    SELECT partnerpartnership.PartnershipID
    FROM partnerpartnership
    JOIN partner 
        ON partnerpartnership.PartnerID = partner.PartnerID
    GROUP BY partnerpartnership.PartnershipID
    HAVING SUM(partner.Name = 'Kakadu Kitchen') = 1
       AND COUNT(DISTINCT partner.PartnerID) = 3
)
ORDER BY partnerpartnership.PartnershipID, partner.PartnerID;

-- 7.

SELECT partnershipproduct.ProductNo,
    COUNT(DISTINCT partnershipproduct.PartnershipID) AS NumPartnerships,
    SUM(partnershipproduct.TotalUnitAgreed) AS TotalUnitsAgreed,
    SUM(partnershipproduct.TotalUnitDelivered) AS TotalUnitsDelivered
FROM partnershipproduct
JOIN partnerpartnership 
    ON partnershipproduct.PartnershipID = partnerpartnership.PartnershipID
JOIN partner 
    ON partnerpartnership.PartnerID = partner.PartnerID
WHERE partner.Name <> 'Kakadu Kitchen'
GROUP BY partnershipproduct.ProductNo
HAVING COUNT(DISTINCT partnershipproduct.PartnershipID) > 1;

-- 8. 

SELECT
    partnerpartnership.PartnershipID,
    partnershipproduct.ProductNo,
    product.Name AS ProductName,
    partnershipproduct.TotalUnitAgreed,
    partnershipproduct.TotalUnitDelivered,
    (partnershipproduct.TotalUnitDelivered * product.Price * partnerpartnership.PartnerSaleShare / 100) AS SaleShareDollar
FROM partner
JOIN partnerpartnership 
    ON partner.PartnerID = partnerpartnership.PartnerID
JOIN partnershipproduct 
    ON partnerpartnership.PartnershipID = partnershipproduct.PartnershipID
JOIN product 
    ON partnershipproduct.ProductNo = product.ProductNo
WHERE partner.Name = 'First Nations-owned company'
ORDER BY partnershippartnership.PartnershipID, partnershipproduct.ProductNo;

