CREATE DATABASE ONLINE2;

CREATE TABLE Customer(
	CustomerID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	FirstName varchar (50) NOT NULL,
	LastName varchar (50) NOT NULL,
	CustomerAddress varchar (50) NOT NULL,
	City varchar (50) NOT NULL,
	StateProvince varchar (50) NOT NULL,
	PostalCode varchar (50) NOT NULL,
	Country varchar (50) NOT NULL
);

INSERT INTO CUSTOMER 
VALUES ('Jim', 'Taylor', '123 E. Main', 'Shawnee', 'KS', '72044', 'USA'),
       ('Amy', 'Johnson', '11000 Beecher', 'Joliet', 'IL', '60555', 'USA'),
	   ('Shawn', 'Black', '201 W. Preston', 'Plano', 'TX', '75032', 'USA'),
       ('Bill', 'Brown', '7312 Bettis Ave.', 'Pittsburg', 'PA', '20034', 'USA'),
       ('Janna', 'Smith', '200 E. Elm Apt. #32', 'Sparks', 'V', '91355', 'USA'),
       ('Evette', 'LeBlanc', '207 Queens Quay West', 'Toronto', 'OT', 'M5J 1A7', 'CA'),
       ('Drew', 'Brisco', '1690 Hollis Street', 'Ottawa', 'S', 'B3J 2Y3', 'CA'),
       ('Angela', 'Smith', '4110 ottingham', 'Burbank', 'CA', '90230', 'USA');

SELECT * FROM CUSTOMER;

--DROP TABLE CustomerOrder;

CREATE TABLE CustomerOrder(
	
	OrderID int IDENTITY(101,1) NOT NULL PRIMARY KEY,
	OrderDateTime datetime NOT NULL,
	CustomerID int NOT NULL FOREIGN KEY REFERENCES Customer(CustomerID),
	Tax money NOT NULL,
	Shipping money NOT NULL

);


INSERT INTO CustomerOrder
VALUES  ('2006-01-13 07:00:00' , 3, 3.9500, 12.9500),
		('2006-01-12 07:45:00' , 5, 4.9500, 7.9500),
		('2006-01-05 12:15:00' , 7, 6.7100, 9.9500),
		('2006-01-07 02:45:00' , 6, 12.4400, 12.9500),
		('2006-01-09 06:00:00' , 3, 4.9700, 7.9500),
		('2006-01-04 08:34:00' , 1, 3.9500, 7.9500),
		('2006-01-04 10:47:00' , 4, 6.7100, 7.9500),
		('2006-01-06 20:00:00' , 2, 4.9500, 12.9500),
		('2006-01-07 17:00:00' , 5, 12.4400, 9.9500),
		('2005-01-08 04:00:00' , 6, 3.9500, 5.9500),
		('2006-01-08 00:00:00' , 7, 4.9500, 9.9500),
		('2006-01-09 16:35:00' , 2, 7.8100, 12.9500),
		('2006-01-09 21:03:00' , 1, 4.9500, 9.9500),
		('2006-01-10 08:33:00' , 3, 6.9500, 8.9500),
		('2006-01-10 11:49:00' , 4, 4.9500, 12.9500),
		('2006-01-11 14:05:00' , 7, 3.9500, 8.9500),
		('2006-01-12 17:26:00' , 6, 4.9500, 9.9500);




CREATE TABLE ProductType(
	
	ProductTypeID int IDENTITY(201,1) NOT NULL PRIMARY KEY,
	ProductTypeName varchar (50) NOT NULL

);

INSERT INTO ProductType  
VALUES ('Books'),
	   ('Movies'),
	   ('Music');

SELECT * FROM ProductType;

--DROP TABLE PRODUCT;
CREATE TABLE Product(
	ProductID int IDENTITY(301,1) NOT NULL PRIMARY KEY,
	ProductName varchar(100) NOT NULL,
	ProductPrice money NOT NULL,
	ProductDescription varchar(100)  NOT NULL,
	ProductShippingOunces int NOT NULL,
	ProductTypeID int NOT NULL FOREIGN KEY REFERENCES ProductType(ProductTypeID)
);

INSERT INTO Product
VALUES ('Introducing Widgets 1.0', 29.9500, 'An introduction to the latest technology craze: Widgets!', 12, 201),
('Widgets Virtual Training', 49.9500, 'These videos will help you get the most out of your experience with widgets by watching videos.', 14, 202),
 ('Attack of the Monster Widgets', 9.9500, 'Classic tale of Widgets gone bad.', 8, 202),
('Inspired By Widgets', 14.9500, 'Combine classic chello arrangements with thoughts of Widgets.', 6, 203),
 ('Rocking to the Widgets', 15.9500, 'Modern rock inspired by Widgets', 6, 203),
('Complete Widgets Training Multipack', 99.9500, 'A compendium of works by thought leaders in Widget development.', 46, 201),
('LearnVisualWidgets Video Training', 69.9500, 'From the creators of LearnVisualStudio.NET, the next great video serious on a timely topic.', 18, 202);

SELECT * FROM PRODUCT;


--1
SELECT * FROM PRODUCT WHERE ProductPrice>30;

--2
SELECT * FROM PRODUCT WHERE ProductTypeID<>202;

--3
SELECT * FROM CustomerOrder WHERE OrderDateTime BETWEEN '2006-1-10' AND '2006-1-13';

--4
SELECT SUM(Tax) FROM CustomerOrder;

--5
SELECT COUNT(OrderID) FROM CustomerOrder;

--6


--7
SELECT ProductName, MAX(ProductShippingOunces)
FROM PRODUCT
WHERE ProductName LIKE 'in%' and ProductShippingOunces>10; 

--8
SELECT AVG(ProductPrice) FROM PRODUCT;

--9
SELECT * FROM Customer WHERE FirstName LIKE 'J%';

---10
SELECT * FROM Customer WHERE City LIKE '%IK%' OR City LIKE '%IK%' OR City LIKE'%PA%';

--11
SELECT * FROM Customer ORDER BY LastName;

--12


--14
SELECT TOP 3 * FROM Customer;

--15
select  * from CustomerOrder max(Tax) 
GROUP BY * CustomerOrder;
 

