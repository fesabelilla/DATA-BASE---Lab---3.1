CREATE DATABASE Lab10;
USE Lab10;

DROP TABLE Customer;
CREATE TABLE Customer(
	
	CustomerID int IDENTITY(1,1) NOT NULL PRIMARY KEY,
	FirstName varchar (50) ,
	LastName varchar (50) ,
	CustomerAddress varchar (50) ,
	City varchar (50) ,
	Country varchar (50)
);

INSERT INTO CUSTOMER 
VALUES ('Amy', 'Johnson', '11000 Beecher', 'Joliet',  'USA'),
       ('Bill', 'Brown', '7312 Bettis Ave.', 'Pittsburg','USA'),
       ('Janna', 'Smith', '200 E. Elm Apt. #32', 'Sparks','USA'),
       ('Evette', 'LeBlanc', '207 Queens Quay West', 'Toronto','CA'),
       ('Drew', 'Brisco', '1690 Hollis Street', 'Ottawa','CA')

SELECT * FROM CUSTOMER;

DROP TABLE CustomerOrder;

CREATE TABLE CustomerOrder(
	
	OrderID int IDENTITY(101,1) NOT NULL PRIMARY KEY,
	OrderDate date ,
	CustomerID int NOT NULL,
	Bill money ,
	Country varchar (50) ,
	SalesmanId int NOT NULL
);


INSERT INTO CustomerOrder
VALUES  ('2019-01-13' , 3, 12.9500, 'USA',1005),
		('2019-01-12' , 5, 7.9500 , 'CA',1002),
		('2019-01-05' , 2, 9.9500 , 'USA',1003),
		('2019-01-07' , 1, 12.9500 , 'USA',1001),
		('2019-01-09' , 5, 7.9500 , 'CA',1005),
		('2019-01-04' , 1, 7.9500 , 'USA',1003),
		('2019-01-04' , 5, 7.9500 , 'CA',1004),
		('2019-01-06' , 2, 12.9500 , 'USA',1004),
		('2019-01-07' , 3,  9.9500 , 'USA',1005),
		('2019-01-08' , 3,  5.9500 , 'USA',1001),
		('2018-11-11' , 9, 8.9500 , 'CA',1004),
		('2018-12-12' , 8, 9.9500 , 'CA',1002)

Select * From CUSTOMERORDER;

Drop table Salesman
CREATE TABLE  Salesman(
	SalesmanId Int PRIMARY KEY IDENTITY(1001,1),
	FirstName varchar(50) ,
	LastName varchar(50) ,
	Area varchar(15) ,
	YearOfService Int ,
	Salary Decimal(7,2)
)


INSERT INTO Salesman VALUES ('Nicholas', 'Graham', 'Mirpur', 5, 20000),
							('Rachel', 'Wood', 'Dhanmondi', 9, 40000),
							('Emily', 'Blunt', 'Shantinagar', 8, 35000),
							('Robert', 'Smith', 'Gulshan', 11, 50000),
							('Amy', 'Watson', 'Banani', 3, 15000);

select * from Salesman;

select * from Customer where 
CustomerID = (select CustomerID from CustomerOrder where OrderDate = '2019-01-13');
 
 select * from CustomerOrder;

 select * from Customer where
 CustomerID <= (select CustomerID from CustomerOrder where
 OrderDate = '2019-01-13');

 select * from Customer where
 CustomerID between (select CustomerID from CustomerOrder
 where OrderDate = '2019-01-13') and 5;

select * from Customer where CustomerID
between (select CustomerID from CustomerOrder where
OrderDate = '2019-01-12') and (select CustomerID from 
CustomerOrder where OrderDate = '2019-01-12');

select * from Customer where CustomerID
in (select CustomerID from CustomerOrder where Bill>10);

select * from Customer where CustomerID >any(select CustomerID from CustomerOrder
where Bill>10);

select * from Customer where CustomerID > some(select CustomerID from CustomerOrder 
where Bill>10);

select * from Customer where CustomerID > all (select CustomerId from CustomerOrder 
where Bill>10);

select * from Customer where CustomerID in (select CustomerID from CustomerOrder where Bill>10 Group By CustomerID);

select CustomerID from CustomerOrder group by CustomerID
having AVG(Bill) > (select avg(Bill) from CustomerOrder);


select OrderID from CustomerOrder where SalesmanId in (select SalesmanId 
from Salesman where Salary>(select avg(Salary) from Salesman));

select FirstName , LastName from Customer where CustomerID in (
select CustomerID from CustomerOrder where SalesmanId = any(
select SalesmanId from Salesman where Salary>30000));

select * from Customer where exists (select CustomerID from
CustomerOrder where Bill>10);

select * from Customer where not exists (select CustomerID from
CustomerOrder where Bill>10);

select CustomerId ,FirstName,(select sum(Bill) from CustomerOrder
where Customer.CustomerID = CustomerOrder.CustomerID group by CustomerID) as
TotalBill from Customer; 

select CustomerID , FirstName , (select sum(Bill) from CustomerOrder c2 where c1.CustomerID = c2.CustomerID group by CustomerID) 
as TotalBill from Customer c1;

select Customer.CustomerID ,subquery.total_amt
 from Customer,(select CustomerOrder.CustomerID,
 sum(CustomerOrder.Bill) as total_amt from CustomerOrder
 group by CustomerID ) subquery where subquery.CustomerID =
 Customer.CustomerID;

 insert into Customer (FirstName,LastName)
 select FirstName , LastName from Customer
 where CustomerID in(select CustomerID from CustomerOrder
 group by CustomerID having avg(Bill)>10);

 select * from Customer; 

 update Customer set Country = 'usa'
 where FirstName in (select FirstName from Customer
 where CustomerID>5);

 Delete from Customer where CustomerID not in (
 select CustomerID from CustomerOrder);