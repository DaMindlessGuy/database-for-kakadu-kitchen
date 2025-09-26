-- Oliver will work from here
-- 1. 

-- 2. 

-- Nhan will work from here
-- 3. 

-- 4. 

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
 
-- 8. 