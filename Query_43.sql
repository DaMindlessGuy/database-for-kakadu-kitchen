-- Oliver will work from here
-- 1. 

-- 2. 

-- Nhan will work from here
-- 3. 

-- 4. 

-- Patrick will work from here
-- 5. 
/* 
 * Find all products of limited editions which are not available in the market
 * yet. Show such __products, their types, unit amount and unit price__. Note if
 * there is no delivery of a particular product yet, the product is assumed to be
 * not available in the market. Also, the data in the ProductType table show
 * that there are currently 3 products of type limited editions
 * Important tables: partnershipproduct, product, producttype
*/

SELECT Name, ProductTypeID, Amount, Price
FROM `partnershipproduct`
INNER JOIN `product`
ON partnershipproduct.ProductNo = product.ProductNo
INNER JOIN `producttype`
ON product.ProdTypeID = producttype.ProductTypeID
WHERE TotalUnitDelivered = 0 and ProductTypeID = "SLC" or ProductTypeID = "SLP" or ProductTypeID = "SLT"

-- 6. 

-- 7.
 
-- 8. 