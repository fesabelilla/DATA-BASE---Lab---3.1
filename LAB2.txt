use labB1;

CREATE TABLE Person
(
Id int,
Name varchar(50),
Address varchar(50),
Phone varchar(50)
);
INSERT INTO Person VALUES(1,'Hansen','Dhaka','016118899');
INSERT INTO Person VALUES(2,'Svendson','Khulna','016118899');
INSERT INTO Person VALUES(3,'Pettersen','Sylhet','017234569');
INSERT INTO Person VALUES(4,'Nilsen','Dhaka','01919876');
INSERT INTO Person VALUES(5,'Tjesswen','Rangpur','01919876');

CREATE TABLE CUSTOMER
(
CustomerId int IDENTITY(1,1) PRIMARY KEY,
LastName varchar(50) NOT NULL,
FirstName varchar(50) NOT NULL,
AreaCode int NULL,
Address varchar(200) NULL,
Birthday date NOT NULL,
Salary decimal(7,2) NULL,
Phone varchar(11) NOT NULL
);

INSERT INTO CUSTOMER VALUES('Hansen','Ola',1203,'Dhaka','2000-12-18','8000.400','016118899');
INSERT INTO CUSTOMER VALUES('Svendson','Tove',1212,'Khulna','1997-08-13',NULL,'016118899');
INSERT INTO CUSTOMER VALUES('Pettersen','Kari',NULL,'Sylhet','1992-08-28','1234.05','017234569');
INSERT INTO CUSTOMER VALUES('Svendson','Tove',1212,'Khulna','1997-08-13',NULL,'016118899');

--INSERT INTO CUSTOMER VALUES(4,'Nilsen','Dhaka','01919876');
--INSERT INTO CUSTOMER VALUES(5,'Tjesswen','Rangpur','01919876');

CREATE TABLE ORDER1
(
OrderId int IDENTITY (100, 1) PRIMARY KEY,
CustomerId int NOT NULL FOREIGN KEY REFERENCES CUSTOMER (CustomerId),
OrderDate date NULL,
OrderAmount money NOT NULL
);
INSERT INTO ORDER1 VALUES(1,'2018-12-18',102.45);
INSERT INTO ORDER1 VALUES(2,'2018-08-13',5039);
INSERT INTO ORDER1 VALUES(7,'2018-08-28',1234.00);
INSERT INTO ORDER1 VALUES(3,'2019-05-23',123.00);
INSERT INTO ORDER1 VALUES(9,'2018-11-12',102.45);
  
  
SELECT FirstName,LastName FROM  CUSTOMER;

SELECT * FROM CUSTOMER; 

SELECT DISTINCT FirstName FROM CUSTOMER;
SELECT DISTINCT Address FROM CUSTOMER;

SELECT DISTINCT * FROM Person;

SELECT *INTO Clients FROM CUSTOMER; --TABLE COPY 

SELECT * FROM Clients ;

SELECT FirstName,Lastname INTO Clieents_Customer FROM CUSTOMER;
SELECT * FROM Clieents_Customer ;

DROP TABLE Clieents_Customer; --DELETE 
SELECT * FROM Clieents_Customer ;


SELECT * FROM Clients ;
TRUNCATE TABLE Clients;
SELECT * FROM Clients ;

--add
ALTER TABLE Person ADD BirthDate date;
SELECT * FROM Person;

--modefy

ALTER TABLE Person  
ALTER COLUMN BirthDate DATETIME;
SELECT * FROM Person;

--DELETE
ALTER TABLE Person  
DROP COLUMN BirthDate;
SELECT * FROM Person;









