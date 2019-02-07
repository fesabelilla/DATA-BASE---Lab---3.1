CREATE DATABASE Test01;

--TABLE-01--
CREATE TABLE SALESMAN
(
SalesmanId int IDENTITY(1001,1) PRIMARY KEY,
FirstName varchar(50) not null,
LastName varchar(50) Not null,
Area Varchar(15) not null,
YearOfService int not null,
Selary decimal(5,2)
);
--INSERT DATA IN TABLE 1
INSERT INTO SALESMAN VALUES('Nicholas','Garham','Mirpur',5,200.00);
INSERT INTO SALESMAN VALUES('Rachel','Wood','Dhanmondi',9,400.00);
INSERT INTO SALESMAN VALUES('Emily','Blunt','Shantinagar',8,350.00);
INSERT INTO SALESMAN VALUES('Robert','Smith','Gulshan',11,500.00);
INSERT INTO SALESMAN VALUES('Amy','Watson','banani',3,150.00);

SELECT * FROM SALESMAN;

--TABLE-02
CREATE TABLE CUSTOMER
(
CustomerId int IDENTITY(2001,1) PRIMARY KEY,
CustomerName varchar(50) not null,
Location varchar(15) not null,
PinCode decimal(8),
Class char default 'A'
);
--INSERT DATA IN TABLE 2

INSERT INTO CUSTOMER VALUES('Jannat Ahmed','Banani',28612940,'A');
INSERT INTO CUSTOMER VALUES('Karim Rahaman','Gulshan',67289016,'B');
INSERT INTO CUSTOMER VALUES('Reema Chowdhury','Badda',13450983,'A');
INSERT INTO CUSTOMER VALUES('Mrittika Hasan','Gulshan',53429876,'A');
INSERT INTO CUSTOMER VALUES('Siam Ishtiak','Mirpur',22780925,'C');

SELECT * FROM CUSTOMER; 

--CREAT TABLE 3
CREATE TABLE SALESORDER
(
OrderId  int  IDENTITY(2001,1) PRIMARY KEY,
CustomerId int NOT NULL FOREIGN KEY REFERENCES CUSTOMER(CustomerId),
SalesmanId int NOT NULL FOREIGN KEY REFERENCES SALESMAN(SalesmanId),
Quantity decimal(5) ,
OrderDate date not null,
OrderAmount decimal(8,2) CHECK(OrderAmount>=0)
);
--INSERT DATA IN TABLE 3
INSERT INTO SALESORDER VALUES(2005,1002,2,'2018-12-24',1000.50);
INSERT INTO SALESORDER VALUES(2003,1005,1,'2018-11-18',200.75);
INSERT INTO SALESORDER VALUES(2001,1003,3,'2019-01-01',5000.88);
INSERT INTO SALESORDER VALUES(2004,1001,4,'2019-01-10',500.45);
INSERT INTO SALESORDER VALUES(2002,1004,6,'2019-01-07',70000);

SELECT * FROM SALESORDER;

--QUERIE-1
SELECT 
SalesmanId AS 'Selesman Identification',
FirstName+' '+LastName AS 'Salesma Name',
Area AS 'City',
Selary as 'Salary Earned' 
from  SALESMAN;

--QUERIE-2

SELECT *FROM SALESMAN 
WHERE Area <> 'Dhanmondi';

--QUERIE-3
SELECT CustomerId,CustomerName FROM CUSTOMER
WHERE Class='A';

--QUERIE-5
UPDATE CUSTOMER 
SET Location ='cumilla'
where CustomerName = 'Karim Rahaman';

--QUERIE-6
SELECT * FROM CUSTOMER
WHERE Location ='Gulshan';

----QUERIE-7
SELECT * FROM SALESMAN
WHERE Selary>200.00;

--QUERIE-8
UPDATE






