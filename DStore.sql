-- Database: DStore

-- DROP DATABASE "DStore";

CREATE DATABASE "DStore"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
	
-- Creating Address table

CREATE TABLE Address(

	AddressId SERIAL PRIMARY KEY,
	AddressLine1 VARCHAR(128) NOT NULL,
	AddressLine2 VARCHAR(64),
	City VARCHAR(64) NOT NULL,
	States VARCHAR(64) NOT NULL,
	PinCode CHAR(6) NOT NULL
);

SELECT * FROM Address;

-- Creating StaffRole table	
	
CREATE TABLE StaffRole(

	StaffRoleId SERIAL PRIMARY KEY,
	RoleName VARCHAR(64) NOT NULL,
	Description VARCHAR(1024)
);	

SELECT * FROM StaffRole;


-- Creating Staff table	
	
CREATE TABLE Staff(

	StaffId SERIAL PRIMARY KEY,
	FirstName VARCHAR(64) NOT NULL,
	LastName VARCHAR(64),
	PhoneNo CHAR(10) NOT NULL,
	Gender CHAR(1) NOT NULL,
	AddressId INT REFERENCES Address (AddressId) UNIQUE NOT NULL,
	StaffRoleId INT REFERENCES StaffRole (StaffRoleId) NOT NULL,
	Salary NUMERIC(7,2) NOT NULL
);	

DROP TABLE Staff;

SELECT * FROM Staff;

-- Creating Category table

CREATE TABLE Category(

	CategoryId SERIAL PRIMARY KEY,
	CategoryName VARCHAR(64) NOT NULL,
	Description VARCHAR(1024)
);

SELECT * FROM Category;

-- Creating Product table

CREATE TABLE Product(

	ProductId SERIAL PRIMARY KEY,
	ProductName VARCHAR(64) NOT NULL,
	ProductCode CHAR(3) NOT NULL,
	Manufacturer VARCHAR(64) NOT NULL, 
	CurrentQuantity INT NOT NULL
);

SELECT * FROM Product;

-- Creating ProductCtaegory table

CREATE TABLE ProductCategory(
	ProductId INT REFERENCES Product (ProductId) NOT NULL,
	CategoryId INT REFERENCES Category (CategoryId) NOT NULL
);

SELECT * FROM ProductCategory;

-- Creating ProductDetail table	
	
CREATE TABLE ProductDetail(

	ProductId INT REFERENCES Product (ProductId) UNIQUE NOT NULL,
	CostPrice NUMERIC(6,2) NOT NULL,
	SellingPrice NUMERIC(6,2) NOT NULL,
	DateOfManufacture DATE
);	

SELECT * FROM ProductDetail;

-- Creating Inventory table

CREATE TABLE Inventory(

	InventoryId SERIAL PRIMARY KEY,
	ProductId INT REFERENCES Product (ProductId) UNIQUE NOT NULL,
	TotalQuantity INT NOT NULL,
	InStock BOOLEAN
);

SELECT * FROM Inventory;

-- Creating Supplier table

CREATE TABLE Supplier(

	SupplierId SERIAL PRIMARY KEY,
	FirstName VARCHAR(64) NOT NULL,
	LastName VARCHAR(64),
	PhoneNo CHAR(10) NOT NULL,
	Email VARCHAR(128) NOT NULL,
	City VARCHAR(64) NOT NULL
);

SELECT * FROM Supplier;

-- Creating Supply table

CREATE TABLE Supply(

	SupplyId SERIAL PRIMARY KEY,
	ProductId INT REFERENCES Product (ProductId) NOT NULL,
	SupplierId INT REFERENCES Supplier (SupplierId) NOT NULL,
	DateOfSupply DATE NOT NULL,
	QuantitySupplied INT NOT NULL
);

SELECT * FROM Supply;

-- Inserting data into Address table

INSERT INTO Address (AddressLine1, AddressLine2, City, States, PinCode)
VALUES ('Plot no.108', 'Civil Lines', 'Pune', 'Maharashtra', '263487'),
('House no.432', 'Gyan Park', 'Ghaziabad', 'Uttar Pradesh', '366229'),
('House no.210', 'Stadium Road', 'Bareilly', 'Uttar Pradesh', '201563'),
('Plot no.325', 'Sobti Nagar', 'Gurugram', 'Haryana', '234758'),
('Plot no.652', 'Janakpuri', 'Bengaluru', 'Karnataka', '245387'),
('House no.873', 'Kailash Nagar', 'Mumbai', 'Maharashtra', '852912'),
('Plot no.328', 'Indra Puram', 'Surat', 'Gujarat', '251361'),
('House no.124', 'Professor Colony', 'Ranchi', 'Jharkhand', '319632'),
('Plot no.972', 'Krishna Park', 'Jaipur', 'Rajasthan', '987221'),
('House no.091', 'Pari Chowk', 'Ahmedabad', 'Gujarat', '214253');

SELECT * FROM Address;

-- Inserting data into StaffRole table

INSERT INTO StaffRole (RoleName, Description)
VALUES ('Manager', 'Manage the godown where the stock is piled'),
('Cashier', 'Manage at counter to prepare bill and charge'),
('Helper', 'Search and collect product based on customer requirement');

SELECT * FROM StaffRole;

-- Inserting data into Staff table

INSERT INTO Staff (FirstName, LastName, PhoneNo, Gender, AddressId, StaffRoleId, Salary)
VALUES ('Tomas','Alfredson','9872351673', 'M', 3, 1, 70500),
('Paul','Anderson','7337342992', 'M', 6, 3, 18680),
('Wes','Anderue','9132614871', 'F', 2, 1, 65200),
('Luc','Besson','8248449147', 'M', 7, 2, 25890),
('James','Cameron','9981477462', 'F', 10, 2, 23170),
('Victor','Fleming','8938743273', 'M', 1, 3, 15400),
('Florian ','Henckel','9858726582', 'F', 9, 1, 87030),
('Terry','Jones','8837563257', 'M', 4, 2, 24900),
('John','Lasseter','9872146328', 'M', 5, 3, 19205),
('George','Lucas','8325872982', 'F', 8, 2, 22780);

SELECT * FROM Staff;

-- Inserting data into Category table

INSERT INTO Category (CategoryName, Description)
VALUES ('Dairy', 'Kitchen Product'),
('Clothing', 'Grooming Product'),
('Furniture', 'Furnishing Product'),
('Cosmetics', 'Grooming Product'),
('Electric Appliances', 'Electrical Product'),
('Sports', 'Activity Product'),
('Gardening', 'Furnishing Product'),
('Bath products', 'Bathroom Product'),
('Stationary', 'Stationary Product'),
('Food', 'Kitchen Product');

SELECT * FROM Category;

-- Inserting data into Product table
	
INSERT INTO Product (ProductName, ProductCode, Manufacturer, CurrentQuantity)
VALUES ('Pen', 'PEN', 'Classmate', 1865),
('Soap', 'SOP', 'Dove', 476),
('Sofa', 'SOF', 'Godrej', 30),
('Bat', 'BAT', 'SS', 947),
('Foundation', 'FND', 'Lakme', 143),
('Shirt', 'SRT', 'John Player', 457),
('Flower Pot', 'FRP', 'Ahuja', 54),
('Shampoo', 'SMP', 'Loreal Paris', 6878),
('Bread', 'BRD', 'Britannia', 643),
('Milk', 'MLK', 'Amul', 243),
('Fan', 'FAN', 'Havels', 376),
('Table', 'TBL', 'Nilkamal', 21),
('Eye Liner', 'ELI', 'Sugar', 489),
('Jeans', 'JNS', 'Koty', 135),
('Notebook', 'NTB', 'Cursive',3657),
('Football', 'FTB', 'Riddell', 10),
('Gloves', 'GLV', 'Atlas', 287),
('Curd', 'CRD', 'Ananda', 3567),
('Biscuits', 'BSC', 'Parle', 4657),
('Bulb', 'BLB', 'Surya', 1347),
('Marker', 'MKR', 'Doms', 1974),
('Paneer', 'PNR', 'Mother Dairy', 28),
('T-Shirt', 'TST', 'Puma', 274),
('Pencil', 'PNC', 'Natraj', 7245),
('Body Wash', 'BWS', 'Biotique', 172);

SELECT * FROM Product;
	
-- Inserting data into ProductCategory table	
	
INSERT INTO ProductCategory (ProductId, CategoryId)	
VALUES (1, 9),
(2, 8),
(3, 3),
(4, 6),
(5, 4),
(6, 2),
(7, 7),
(8, 8),
(9, 10),
(10, 1),
(11, 5),
(12, 3),
(13, 4),
(14, 2),
(15, 9),
(16, 6),
(17, 7),
(18, 1),
(19, 10),
(20, 5),
(21, 9),
(22, 1),
(23, 2),
(24, 9),
(25, 8);

SELECT * FROM ProductCategory;

-- Inserting data into ProductDetail table	

INSERT INTO ProductDetail (ProductId, CostPrice, SellingPrice, DateOfManufacture)
VALUES (1, 8.2, 10, '2020-03-15'),
(2, 40.8, 45, '2021-01-19'),
(3, 1320, 1580, '2020-04-02'),
(4, 450.3, 500, '2020-06-30'),
(5, 200.5, 399, '2020-09-23'),
(6, 590.7, 699, '2019-12-05'),
(7, 180.6, 200, '2018-08-26'),
(8, 459.7, 530, '2020-05-20'),
(9, 20.2, 25, '2021-05-17'),
(10, 35.9, 45, '2020-02-14'),
(11, 390.8, 499, '2018-11-20'),
(12, 249.3, 350, '2020-10-31'),
(13, 250, 300, '2021-08-02'),
(14, 890.2, 1200, '2018-07-07'),
(15, 120.6, 150, '2019-03-25'),
(16, 260.5, 320, '2021-04-13'),
(17, 470.1, 500, '2019-12-18'),
(18, 21.8, 25, '2021-05-15'),
(19, 105.6, 130, '2020-06-29'),
(20, 39.4, 50, '2020-11-11'),
(21, 40, 50, '2018-02-09'),
(22, 300.5, 360, '2021-05-17'),
(23, 590, 780, '2019-10-04'),
(24, 10, 15, '2018-09-11'),
(25, 580.3, 600, '2020-08-30');

SELECT * FROM ProductDetail;

-- Inserting data into Inventory table

INSERT INTO Inventory (ProductId, TotalQuantity, InStock)
VALUES (1, 2864, TRUE),
(2, 873, TRUE),
(3, 42, FALSE),
(4, 1743, TRUE),
(5, 258, TRUE),
(6, 985, TRUE),
(7, 73, FALSE),
(8, 8964, TRUE),
(9, 752, TRUE),
(10, 914, TRUE),
(11, 521, TRUE),
(12, 35, FALSE),
(13, 523, TRUE),
(14, 298, TRUE),
(15, 5325, TRUE),
(16, 18, FALSE),
(17, 381, TRUE),
(18, 6847, TRUE),
(19, 5138, TRUE),
(20, 2484, TRUE),
(21, 3525, TRUE),
(22, 54, FALSE),
(23, 342, TRUE),
(24, 9816, TRUE),
(25, 218, TRUE);

SELECT * FROM Inventory;

-- Inserting data into Supplier table

INSERT INTO Supplier (FirstName, LastName, PhoneNo, Email, City)
VALUES ('Malin','Akerman', '9782355327', 'malin.akerman@gmail.com', 'Delhi'),
('Tim','Allen', '8912847376', 'tim.allen@gmail.com', 'Pune'),
('Julie','Andrews', '9832562521', 'julie.andrews@gmail.com', 'Bhopal'),
('Alice','Braga', '7386526589', 'alice.braga@gmail.com', 'Jaipur'),
('Marlon','Brando', '9283587126', 'marlon.brando@gmail.com', 'Delhi'),
('Adrien','Brody', '6587421638', 'adrien.brody@gmail.com', 'Lucknow'),
('Gemma','Chan', '9164328175', 'gemma.chan@gmail.com', 'Mumbai'),
('John','Cleese', '8164253815', 'john.cleese@gmail.com', 'Chandigarh'),
('Abbie','Cornish', '8732587128', 'abbie.cornish@gmail.com', 'Pune'),
('Brian','Cox', '9833218658', 'brian.cox@gmail.com', 'Jaipur');

SELECT * FROM Supplier;

-- Inserting data into Supply table 

INSERT INTO Supply (ProductId, SupplierId, DateOfSupply, QuantitySupplied)
VALUES (2, 5, '2021-03-19', 432),
(6, 4, '2021-04-24', 478),
(14, 6, '2021-03-22', 123),
(9, 3, '2021-05-17', 421),
(8, 7, '2021-05-13', 3367),
(13, 9, '2021-08-30', 234),
(5, 2, '2021-02-10', 123),
(18, 5, '2021-05-16', 4357),
(4, 6, '2021-03-28', 989),
(10, 8, '2021-04-17', 456),
(11, 1, '2021-09-12', 258),
(5, 4, '2021-03-24', 130),
(9, 5, '2021-05-18', 267),
(17, 10, '2021-10-05', 145),
(2, 8, '2021-03-08', 324),
(14, 2, '2021-04-02', 170),
(20, 3, '2021-05-05', 1356),
(8, 9, '2021-02-18', 2456),
(11, 7, '2021-01-16', 260),
(15, 1, '2021-06-04', 3988),
(6, 4, '2021-04-23', 342),
(8, 9, '2021-05-12', 2345),
(19, 10, '2021-03-10', 4648),
(13, 5, '2021-09-23', 270),
(20, 6, '2021-11-12', 1100),
(1, 3, '2021-04-26', 1346),
(18, 1, '2021-06-03', 2460),
(1, 8, '2021-04-21', 1466),
(17, 9, '2021-02-12', 220),
(10, 4, '2021-02-09', 376),
(21, 2, '2021-04-25', 1246),
(25, 8, '2021-08-23', 166),
(24, 4, '2021-06-24', 6546),
(21, 9, '2021-02-25', 1437),
(23, 3, '2021-10-15', 276),
(24, 10, '2021-03-01', 2767);

SELECT * FROM Supply;


-- 1.Query Staff using name or phone number or both

SElECT s.FirstName, s.LastName, s.PhoneNo, s.Gender, s.Salary,
ad.AddressLine1, ad.AddressLine2, ad.City, ad.States, ad.PinCode, r.RoleName, r.description FROM Staff s
JOIN Address ad ON s.AddressId = ad.AddressId
JOIN StaffRole r ON s.StaffRoleId = r.StaffRoleId
WHERE s.FirstName LIKE 'Victor';

SElECT s.FirstName, s.LastName, s.PhoneNo, s.Gender, s.Salary,
ad.AddressLine1, ad.AddressLine2, ad.City, ad.States, ad.PinCode, r.RoleName, r.description FROM Staff s
JOIN Address ad ON s.AddressId = ad.AddressId
JOIN StaffRole r ON s.StaffRoleId = r.StaffRoleId
WHERE s.LastName LIKE 'Anderson';
	
SElECT s.FirstName, s.LastName, s.PhoneNo, s.Gender, s.Salary,
ad.AddressLine1, ad.AddressLine2, ad.City, ad.States, ad.PinCode, r.RoleName, r.description FROM Staff s
JOIN Address ad ON s.AddressId = ad.AddressId
JOIN StaffRole r ON s.StaffRoleId = r.StaffRoleId
WHERE s.PhoneNo LIKE '8248449147';
	
-- 2.Query Staff using their Role	
	
SElECT s.FirstName, s.LastName, s.PhoneNo, s.Gender, s.Salary,
ad.AddressLine1, ad.AddressLine2, ad.City, ad.States, ad.PinCode, r.RoleName, r.description FROM Staff s
JOIN Address ad ON s.AddressId = ad.AddressId
JOIN StaffRole r ON s.StaffRoleId = r.StaffRoleId
WHERE r.RoleName LIKE 'Manager';
	
SElECT s.FirstName, s.LastName, s.PhoneNo, s.Gender, s.Salary,
ad.AddressLine1, ad.AddressLine2, ad.City, ad.States, ad.PinCode, r.RoleName, r.description FROM Staff s
JOIN Address ad ON s.AddressId = ad.AddressId
JOIN StaffRole r ON s.StaffRoleId = r.StaffRoleId
WHERE r.RoleName LIKE 'Cashier';	
	
SElECT s.FirstName, s.LastName, s.PhoneNo, s.Gender, s.Salary,
ad.AddressLine1, ad.AddressLine2, ad.City, ad.States, ad.PinCode, r.RoleName, r.description FROM Staff s
JOIN Address ad ON s.AddressId = ad.AddressId
JOIN StaffRole r ON s.StaffRoleId = r.StaffRoleId
WHERE r.RoleName LIKE 'Helper';	
	
-- 3.Query Product based on -
		-- a. Name
		
		SELECT * FROM Product
		WHERE ProductName LIKE 'Foundation';
		
		-- b. Category
		
		SELECT * FROM Product pr
		JOIN ProductCategory pc ON pr.ProductId = pc.ProductId
		JOIN Category ca ON ca.CategoryId = pc.CategoryId
		WHERE ca.CategoryName = 'Food';
		
		-- c. InStock, OutOfStock
		
		-- InStock
		SELECT pr.ProductName, pr.ProductCode, pr.Manufacturer, ca.CategoryName, ca.Description,
		inv.TotalQuantity, inv.InStock FROM Product pr
		JOIN ProductCategory pc ON pr.ProductId = pc.ProductId
		JOIN Category ca ON ca.CategoryId = pc.CategoryId
		JOIN Inventory inv ON inv.ProductId = pr.ProductId
		WHERE inv.InStock = TRUE;
		
		-- OutOfStock
		SELECT pr.ProductName, pr.ProductCode, pr.Manufacturer, ca.CategoryName, ca.Description,
		inv.TotalQuantity, inv.InStock FROM Product pr
		JOIN ProductCategory pc ON pr.ProductId = pc.ProductId
		JOIN Category ca ON ca.CategoryId = pc.CategoryId
		JOIN Inventory inv ON inv.ProductId = pr.ProductId
		WHERE inv.InStock = FALSE;
		
		-- d. SP less than, greater than or between 
		
		-- less than
		SELECT pr.ProductName, pr.ProductCode, pr.Manufacturer, 
		ca.CategoryName, ca.Description, pd.SellingPrice FROM Product pr
		JOIN ProductCategory pc ON pr.ProductId = pc.ProductId
		JOIN Category ca ON ca.CategoryId = pc.CategoryId
		JOIN ProductDetail pd ON pd.ProductId = pr.ProductId
		WHERE pd.SellingPrice < 100;
		
		-- greater than 
		SELECT pr.ProductName, pr.ProductCode, pr.Manufacturer, 
		ca.CategoryName, ca.Description, pd.SellingPrice FROM Product pr
		JOIN ProductCategory pc ON pr.ProductId = pc.ProductId
		JOIN Category ca ON ca.CategoryId = pc.CategoryId
		JOIN ProductDetail pd ON pd.ProductId = pr.ProductId
		WHERE pd.SellingPrice > 100;
	
		-- between
		SELECT pr.ProductName, pr.ProductCode, pr.Manufacturer, 
		ca.CategoryName, ca.Description, pd.SellingPrice FROM Product pr
		JOIN ProductCategory pc ON pr.ProductId = pc.ProductId
		JOIN Category ca ON ca.CategoryId = pc.CategoryId
		JOIN ProductDetail pd ON pd.ProductId = pr.ProductId
		WHERE pd.SellingPrice BETWEEN 100 AND 500;
	
-- 4.Number of Products out of stock

SELECT pr.ProductName, pr.ProductCode, pr.Manufacturer, ca.CategoryName, ca.Description,
inv.TotalQuantity, inv.InStock FROM Product pr
JOIN ProductCategory pc ON pr.ProductId = pc.ProductId
JOIN Category ca ON ca.CategoryId = pc.CategoryId
JOIN Inventory inv ON inv.ProductId = pr.ProductId
WHERE inv.InStock = FALSE;
	
-- 5.Number of Products within a category	
	
SELECT ca.CategoryName, COUNT(pr.ProductName) AS ProductCount
FROM Product pr 
JOIN ProductCategory pc ON pc.ProductId = pr.ProductId
JOIN Category ca ON ca.CategoryId = pc.CategoryId 
GROUP BY ca.CategoryName;
	
-- 6.Product-Categories listed in descending with highest number of products to the lowest number of products	
		
SELECT ca.CategoryName, COUNT(pr.ProductName) AS ProductCount
FROM Product pr 
JOIN ProductCategory pc ON pc.ProductId = pr.ProductId
JOIN Category ca ON ca.CategoryId = pc.CategoryId 
GROUP BY ca.CategoryName
ORDER BY ProductCount DESC;
	
-- 7. List of Suppliers -
	-- a. Name
	
	SELECT * FROM Supplier
	WHERE FirstName LIKE 'Gemma';
	
	SELECT * FROM Supplier
	WHERE LastName LIKE 'Akerman';
	
	-- b. Phone
	
	SELECT * FROM Supplier
	WHERE PhoneNo LIKE '7386526589';
	
	-- c. Email
	
	SELECT * FROM Supplier
	WHERE Email LIKE 'brian.cox@gmail.com';
	
	-- d. City or State	
	
	SELECT * FROM Supplier
	WHERE City LIKE 'Pune';
	
-- 8. List of Product with different suppliers, with the recent date of supply and the amount supplied on the most recent occasion. 
-- Here this can also be filtered based on -

SELECT s.FirstName, s.LastName, pr.ProductName, su.DateOfSupply FROM Product pr 
JOIN Supply su ON su.ProductId = pr.ProductId
JOIN Supplier s ON su.SupplierId = s.SupplierId
ORDER BY su.DateOfSupply DESC;

	-- a. Product Name
	
	SELECT pr.ProductName, pr.ProductCode, pr.Manufacturer, 
	ca.CategoryName, ca.Description,
	s.FirstName, s.LastName, s.Email, s.City, su.DateOfSupply, su.QuantitySupplied
	FROM Product pr JOIN ProductCategory pc ON pc.ProductId = pr.ProductId
	JOIN Category ca ON ca.CategoryId = pc.CategoryId
	JOIN Supply su ON su.ProductId = pr.ProductId
	JOIN Supplier s ON s.SupplierId = su.SupplierId
	WHERE pr.ProductName LIKE 'Bread';
	
	-- b. Supplier Name
	
	SELECT pr.ProductName, pr.ProductCode, pr.Manufacturer, 
	ca.CategoryName, ca.Description,
	s.FirstName, s.LastName, s.Email, s.City, su.DateOfSupply, su.QuantitySupplied
	FROM Product pr JOIN ProductCategory pc ON pc.ProductId = pr.ProductId
	JOIN Category ca ON ca.CategoryId = pc.CategoryId
	JOIN Supply su ON su.ProductId = pr.ProductId
	JOIN Supplier s ON s.SupplierId = su.SupplierId
	WHERE s.FirstName LIKE 'Marlon';
	
	-- c. Product Code
	
	SELECT pr.ProductName, pr.ProductCode, pr.Manufacturer, 
	ca.CategoryName, ca.Description,
	s.FirstName, s.LastName, s.Email, s.City, su.DateOfSupply, su.QuantitySupplied
	FROM Product pr JOIN ProductCategory pc ON pc.ProductId = pr.ProductId
	JOIN Category ca ON ca.CategoryId = pc.CategoryId
	JOIN Supply su ON su.ProductId = pr.ProductId
	JOIN Supplier s ON s.SupplierId = su.SupplierId
	WHERE pr.ProductCode LIKE 'ELI';
	
	-- d. Supplied after a particular date
	
	SELECT pr.ProductName, pr.ProductCode, pr.Manufacturer, 
	ca.CategoryName, ca.Description,
	s.FirstName, s.LastName, s.Email, s.City, su.DateOfSupply, su.QuantitySupplied
	FROM Product pr JOIN ProductCategory pc ON pc.ProductId = pr.ProductId
	JOIN Category ca ON ca.CategoryId = pc.CategoryId
	JOIN Supply su ON su.ProductId = pr.ProductId
	JOIN Supplier s ON s.SupplierId = su.SupplierId
	WHERE su.DateOfSupply > '2021-03-08';
	
	-- e. Supplied before a particular date
	
	SELECT pr.ProductName, pr.ProductCode, pr.Manufacturer, 
	ca.CategoryName, ca.Description,
	s.FirstName, s.LastName, s.Email, s.City, su.DateOfSupply, su.QuantitySupplied
	FROM Product pr JOIN ProductCategory pc ON pc.ProductId = pr.ProductId
	JOIN Category ca ON ca.CategoryId = pc.CategoryId
	JOIN Supply su ON su.ProductId = pr.ProductId
	JOIN Supplier s ON s.SupplierId = su.SupplierId
	WHERE su.DateOfSupply < '2021-03-08';
	
	-- f. Product has inventory more than or less than a given qty
	-- less than 
	SELECT pr.ProductName, pr.ProductCode, pr.Manufacturer, 
	ca.CategoryName, ca.Description, inv.TotalQuantity,
	s.FirstName, s.LastName, s.Email, s.City, su.DateOfSupply, su.QuantitySupplied
	FROM Product pr JOIN ProductCategory pc ON pc.ProductId = pr.ProductId
	JOIN Inventory inv ON inv.ProductId = pr.ProductId
	JOIN Category ca ON ca.CategoryId = pc.CategoryId
	JOIN Supply su ON su.ProductId = pr.ProductId
	JOIN Supplier s ON s.SupplierId = su.SupplierId	
	WHERE inv.TotalQuantity < 500;
	
	-- more than
	SELECT pr.ProductName, pr.ProductCode, pr.Manufacturer, 
	ca.CategoryName, ca.Description, inv.TotalQuantity,
	s.FirstName, s.LastName, s.Email, s.City, su.DateOfSupply, su.QuantitySupplied
	FROM Product pr JOIN ProductCategory pc ON pc.ProductId = pr.ProductId
	JOIN Inventory inv ON inv.ProductId = pr.ProductId
	JOIN Category ca ON ca.CategoryId = pc.CategoryId
	JOIN Supply su ON su.ProductId = pr.ProductId
	JOIN Supplier s ON s.SupplierId = su.SupplierId	
	WHERE inv.TotalQuantity > 500;
