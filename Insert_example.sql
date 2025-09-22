-- This an example snippet of code inserts some data into the partner table

INSERT INTO `partner` 
(`PartnerID`, `Name`, `TypeID`, `Phone`, `StreetNo`, `StreetName`, `City`, `State`, `PostCode`) 
VALUES
(1, 'GreenTech Supplies', 'S1', '0412345678', '12', 'Oak Street', 'Sydney', 'NSW', '2000'),
(2, 'FreshMart Groceries', 'R2', '0498765432', '88', 'Kingston Rd', 'Brisbane', 'QLD', '4000'),
(3, 'Urban Builders', 'C1', '0387654321', '45', 'Queen Street', 'Melbourne', 'VIC', '3000'),
(4, 'Aussie Electronics', 'S2', '0291234567', '7', 'George Street', 'Sydney', 'NSW', '2001'),
(5, 'Harbour Bookstore', 'R1', '0411999888', '101', 'Harbour Drive', 'Darwin', 'NT', '0800');

-- Now you should look inside of the .docx file that talks about the data that actually needs to be inserted
-- And you create a file called Insert_43.sql and put the data into there
