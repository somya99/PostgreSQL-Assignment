-- Database: departmental_store

-- DROP DATABASE departmental_store;

CREATE DATABASE departmental_store
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    LC_COLLATE = 'English_United States.1252'
    LC_CTYPE = 'English_United States.1252'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
	
-- Creating staffs table

CREATE TABLE staffs(

	staff_id SERIAL PRIMARY KEY,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	date_of_birth DATE,
	gender CHAR(1),
	phone VARCHAR(20),
	email VARCHAR(50),
	city VARCHAR(30),
	staff_role VARCHAR(30)
);

SELECT * FROM staffs;

-- Creating category table

CREATE TABLE category(

	category_id SERIAL PRIMARY KEY,
	category_name VARCHAR(50)
);

SELECT * FROM category;

-- Creating products table	

CREATE TABLE products(

	product_id SERIAL PRIMARY KEY,
	product_name VARCHAR(50),
	category_id INT REFERENCES category (category_id),
	manufacturer VARCHAR(50)
);

SELECT * FROM products;

-- Creating product_detail table

CREATE TABLE product_details(

	product_id INT REFERENCES products (product_id),
	cost_price NUMERIC(6,2),
	selling_price NUMERIC(6,2),
	date_of_manufacture DATE
);

SELECT * FROM product_details;

DROP TABLE product_deatils;
-- Creating inventory table

CREATE TABLE inventory(

	inventory_id SERIAL PRIMARY KEY,
	product_id INT REFERENCES products (product_id),
	qunatity INT,
	instock BOOLEAN 
);

SELECT * FROM inventory;

-- Creating supplier table	

CREATE TABLE supplier(

	supplier_id SERIAL PRIMARY KEY,
	first_name VARCHAR(30),
	last_name VARCHAR(30),
	phone VARCHAR(20),
	email VARCHAR(50),
	city VARCHAR(30)
);

SELECT * FROM supplier;

-- Creating order table
	
CREATE TABLE orders(

	order_id SERIAL PRIMARY KEY,
	product_id INT REFERENCES products (product_id),
	supplier_id INT REFERENCES supplier (supplier_id),
	date_of_order DATE
);	
	
SELECT * FROM orders;	
-- Add a column name quantity
ALTER TABLE orders
ADD COLUMN quantity INT NOT NULL;

-- Inserting data into staffs table	
	
INSERT INTO staffs(first_name, last_name, date_of_birth, gender, phone, email, city, staff_role)
VALUES ('Tomas','Alfredson','1985-04-01', 'M', '9872351673', 'thomas.alfredson@gmail.com', 'Delhi', 'Manager'),
('Paul','Anderson','1982-06-26', 'M', '7337342992', 'paul.anderson@gmail.com', 'Hyderabad', 'Cashier'),
('Wes','Anderue','1996-05-01', 'F', '9132614871', 'wes.anderue@gmail.com', 'Pune', 'Helper'),
('Luc','Besson','1981-03-18', 'M', '8248449147', 'luc.besson@gmail.com', 'Bareilly', 'Manager'),
('James','Cameron','1990-08-16', 'F', '9981477462', 'james.cameron@gmail.com', 'Delhi', 'Manager'),
('Victor','Fleming','1889-02-23', 'M', '8938743273', 'victor.fleming@gmail.com', 'Pune', 'Cashier'),
('Florian ','Henckel','1983-05-02', 'F', '9858726582', 'florian.henckel@gmail.com', 'Chandigarh', 'Helper'),
('Terry','Jones','1992-02-01', 'M', '8837563257', 'terry.jones@gmail.com', 'Hyderabad', 'Cashier'),
('John','Lasseter','1995-01-12', 'M', '9872146328', 'john.lasseter@gmail.com', 'Chandigarh', 'Helper'),
('George','Lucas','1987-05-14', 'F', '8325872982', 'george.lucas@gmail.com', 'Bhopal', 'Manager');

SELECT * FROM staffs;

-- Inserting data into category table	
	
INSERT INTO category(category_name)
VALUES ('Dairy'),
('Clothing'),
('Furniture'),
('Cosmetics'),
('Electric Appliances'),
('Sports'),
('Gardening'),
('Bath products'),
('Stationary'),
('Food');

SELECT * FROM category;

-- Inserting data into products table	
	
INSERT INTO products(product_name, category_id, manufacturer)
VALUES ('Pen', 9, 'Classmate'),
('Soap', 8, 'Dove'),
('Sofa', 3, 'Godrej'),
('Bat', 6, 'SS'),
('Foundation', 4, 'Lakme'),
('Shirt', 2, 'John Player'),
('Flower Pot', 7, 'Ahuja'),
('Shampoo', 8, 'Loreal Paris'),
('Bread', 10, 'Britannia'),
('Milk', 1, 'Amul'),
('Fan', 5, 'Havels'),
('Table', 3, 'Nilkamal'),
('Eye Liner', 4, 'Sugar'),
('Jeans', 2, 'Koty'),
('Notebook', 9, 'Cursive'),
('Football', 6, 'Riddell'),
('Gloves', 7, 'Atlas'),
('Curd', 1, 'Ananda'),
('Biscuits', 10, 'Parle'),
('Bulb', 5, 'Surya');

SELECT * FROM products;

-- Inserting data into product_details table	
	
INSERT INTO product_details(product_id, cost_price, selling_price, date_of_manufacture)
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
(20, 39.4, 50, '2020-11-11');

SELECT * FROM product_details;

-- Inserting data into inventory table	
	
INSERT INTO inventory(product_id, qunatity, instock)
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
(20, 2484, TRUE);

SELECT * FROM inventory;

-- Inserting data into supplier table	
	
INSERT INTO supplier(first_name, last_name, phone, email, city)	
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

SELECT * FROM supplier;

-- Inserting data into orders table	
	
INSERT INTO orders(product_id, supplier_id, date_of_order, quantity)
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
(10, 4, '2021-02-09', 376);
	
SELECT * FROM orders;	
	
-- Queries	
	
-- 1.Query Staff using name or phone number or both

SELECT * FROM staffs
WHERE first_name LIKE 'Victor';

SELECT * FROM staffs
WHERE last_name LIKE 'Anderson';
	
SELECT * FROM staffs
WHERE phone LIKE '8248449147';
	
-- 2.Query Staff using their Role	
	
SElECT * FROM staffs
WHERE staff_role LIKE 'Manager';
	
SElECT * FROM staffs
WHERE staff_role LIKE 'Cashier';	
	
SElECT * FROM staffs
WHERE staff_role LIKE 'Helper';	
	
-- 3.Query Product based on -
		-- a. Name
		
		SELECT * FROM products
		WHERE product_name LIKE 'Foundation';
		
		-- b. Category
		
		SELECT * FROM products
		WHERE category_id = 5;
		
		-- c. InStock, OutOfStock
		
		-- InStock
		SELECT pr.product_name, pr.category_id, pr.manufacturer FROM products pr
		JOIN inventory inv ON inv.product_id = pr.product_id
		WHERE inv.instock = TRUE;
		
		-- OutOfStock
		SELECT pr.product_name, pr.category_id, pr.manufacturer FROM products pr
		JOIN inventory inv ON inv.product_id = pr.product_id
		WHERE inv.instock = FALSE;
		
		-- d. SP less than, greater than or between 
		
		-- less than
		SELECT pr.product_name, pr.category_id, pr.manufacturer, pd.selling_price FROM products pr
		JOIN product_details pd ON pd.product_id = pr.product_id
		WHERE pd.selling_price < 100;
		
		-- greater than 
		SELECT pr.product_name, pr.category_id, pr.manufacturer, pd.selling_price FROM products pr
		JOIN product_details pd ON pd.product_id = pr.product_id
		WHERE pd.selling_price > 100;
	
		-- between
		SELECT pr.product_name, pr.category_id, pr.manufacturer, pd.selling_price FROM products pr
		JOIN product_details pd ON pd.product_id = pr.product_id
		WHERE pd.selling_price BETWEEN 100 AND 500;
	
-- 4.Number of Products out of stock

SELECT pr.product_name, pr.category_id, pr.manufacturer, inv.instock FROM products pr
JOIN inventory inv ON inv.product_id = pr.product_id
WHERE inv.instock = FALSE;
	
-- 5.Number of Products within a category	
	
SELECT ca.category_name, COUNT(pr.product_name) AS product_count
FROM products pr JOIN category ca ON ca.category_id = pr.category_id 
GROUP BY ca.category_name;
	
-- 6.Product-Categories listed in descending with highest number of products to the lowest number of products	
		
SELECT ca.category_name, COUNT(pr.product_name) AS product_count
FROM products pr JOIN category ca ON ca.category_id = pr.category_id 
GROUP BY ca.category_name
ORDER BY product_count DESC;
	
-- 7. List of Suppliers -
	-- a. Name
	
	SELECT * FROM supplier
	WHERE first_name LIKE 'Gemma';
	
	SELECT * FROM supplier
	WHERE last_name LIKE 'Akerman';
	
	-- b. Phone
	
	SELECT * FROM supplier
	WHERE phone LIKE '7386526589';
	
	-- c. Email
	
	SELECT * FROM supplier
	WHERE email LIKE 'brian.cox@gmail.com';
	
	-- d. City or State	
	
	SELECT * FROM supplier
	WHERE city LIKE 'Pune';
	
-- 8. List of Product with different suppliers, with the recent date of supply and the amount supplied on the most recent occasion. 
-- Here this can also be filtered based on -

SELECT s.first_name, s.last_name,pr.product_name, o.date_of_order FROM products pr 
JOIN orders o ON o.product_id = pr.product_id
JOIN supplier s ON o.supplier_id = s.supplier_id
ORDER BY o.date_of_order DESC;

	-- a. Product Name
	
	SELECT pr.product_name, pr.category_id, s.first_name, s.last_name, s.email, s.city, o.date_of_order, o.quantity
	FROM products pr JOIN orders o ON pr.product_id = o.product_id
	JOIN supplier s ON o.supplier_id = s.supplier_id
	WHERE pr.product_name LIKE 'Bread';
	
	-- b. Supplier Name
	
	SELECT pr.product_name, pr.category_id, s.first_name, s.last_name, s.email, s.city, o.date_of_order, o.quantity
	FROM products pr JOIN orders o ON pr.product_id = o.product_id
	JOIN supplier s ON o.supplier_id = s.supplier_id
	WHERE s.first_name LIKE 'Marlon';
	
	-- c. Product Code
	-- adding product code column in products table as missed during table creation
	ALTER TABLE products
	ADD COLUMN product_code CHAR(3);
	
	SELECT * FROM products;
	
	UPDATE products
	SET product_code = 'PEN'
	WHERE product_id = 1;
	UPDATE products
	SET product_code = 'SOP'
	WHERE product_id = 2;
	UPDATE products
	SET product_code = 'SFA'
	WHERE product_id = 3;
	UPDATE products
	SET product_code = 'BAT'
	WHERE product_id = 4;
	UPDATE products
	SET product_code = 'FDN'
	WHERE product_id = 5;
	UPDATE products
	SET product_code = 'SRT'
	WHERE product_id = 6;
	UPDATE products
	SET product_code = 'FLP'
	WHERE product_id = 7;
	UPDATE products
	SET product_code = 'SPO'
	WHERE product_id = 8;
	UPDATE products
	SET product_code = 'BRD'
	WHERE product_id = 9;
	UPDATE products
	SET product_code = 'MLK'
	WHERE product_id = 10;
	UPDATE products
	SET product_code = 'FAN'
	WHERE product_id = 11;
	UPDATE products
	SET product_code = 'TBL'
	WHERE product_id = 12;
	UPDATE products
	SET product_code = 'ELI'
	WHERE product_id = 13;
	UPDATE products
	SET product_code = 'JNS'
	WHERE product_id = 14;
	UPDATE products
	SET product_code = 'NTB'
	WHERE product_id = 15;
	UPDATE products
	SET product_code = 'FBL'
	WHERE product_id = 16;
	UPDATE products
	SET product_code = 'GLV'
	WHERE product_id = 17;
	UPDATE products
	SET product_code = 'CRD'
	WHERE product_id = 18;
	UPDATE products
	SET product_code = 'BIS'
	WHERE product_id = 19;
	UPDATE products
	SET product_code = 'BLB'
	WHERE product_id = 20;
	
	SELECT pr.product_name, pr.category_id, s.first_name, s.last_name, s.email, s.city, o.date_of_order, o.quantity
	FROM products pr JOIN orders o ON pr.product_id = o.product_id
	JOIN supplier s ON o.supplier_id = s.supplier_id
	WHERE pr.product_code LIKE 'ELI';
	
	-- d. Supplied after a particular date
	
	SELECT pr.product_name, pr.category_id, s.first_name, s.last_name, s.email, s.city, o.date_of_order, o.quantity
	FROM products pr JOIN orders o ON pr.product_id = o.product_id
	JOIN supplier s ON o.supplier_id = s.supplier_id
	WHERE o.date_of_order > '2021-03-08';
	
	-- e. Supplied before a particular date
	
	SELECT pr.product_name, pr.category_id, s.first_name, s.last_name, s.email, s.city, o.date_of_order, o.quantity
	FROM products pr JOIN orders o ON pr.product_id = o.product_id
	JOIN supplier s ON o.supplier_id = s.supplier_id
	WHERE o.date_of_order < '2021-03-08';
	
	-- f. Product has inventory more than or less than a given qty
	-- less than 
	SELECT pr.product_name, pr.category_id, inv.qunatity, s.first_name, s.last_name, s.email, s.city, o.date_of_order, o.quantity
	FROM products pr JOIN orders o ON pr.product_id = o.product_id
	JOIN inventory inv ON inv.product_id = pr.product_id
	JOIN supplier s ON o.supplier_id = s.supplier_id	
	WHERE inv.qunatity < 500;
	
	-- more than
	SELECT pr.product_name, pr.category_id, inv.qunatity, s.first_name, s.last_name, s.email, s.city, o.date_of_order, o.quantity
	FROM products pr JOIN orders o ON pr.product_id = o.product_id
	JOIN inventory inv ON inv.product_id = pr.product_id
	JOIN supplier s ON o.supplier_id = s.supplier_id	
	WHERE inv.qunatity > 500;

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
		