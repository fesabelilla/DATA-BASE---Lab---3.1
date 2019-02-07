create database Lab4;

CREATE TABLE CUSTOMER
(
	CustomerId int IDENTITY(1,1) PRIMARY KEY,
	Name varchar(50) NOT NULL,
	Age int NOT NULL CHECK (Age >= 18),
	Address varchar(200) NULL  DEFAULT  'Dhaka',
	Salary decimal(18,2) NULL
);

INSERT INTO CUSTOMER (Name, Age, Address, Salary) 
  VALUES ('Rahim', 32, 'Gulshan',2000.35),
       ('Karim', 25, 'Dhanmondi',1500.22),
       ('Hashim', 23, 'Mottijheel',2000.00),
       ('Khan', 25, 'Tejgaon',6500.00),
       ('Rahman', 27, 'Wari',8500.00),
       ('Mehedi', 22, 'Mohammadpur',4500.00),
       ('Kashim', 24, 'Kakrail',10000.00),
       ('Kazi', 22, 'Kakrail',1000.00)
       
       SELECT * FROM CUSTOMER;
       
       --START WITH 200
       SELECT * FROM CUSTOMER WHERE Salary  LIKE '200%';
       -- START KA
         SELECT * FROM CUSTOMER WHERE Name  LIKE 'Ka%';
         --2nd a n thakbea
           SELECT * FROM CUSTOMER WHERE Address  LIKE '_h%';
           -- only show age = g23,27,32
             SELECT * FROM CUSTOMER WHERE Age  IN (23,27,32);
             --
               SELECT * FROM CUSTOMER WHERE Age between 23 and 32;
               --end a n or d
                 SELECT * FROM CUSTOMER WHERE Address Like'%n' or Address Like 'D%';
                 
                 --23 r 27 ar baheerea
                 SELECT * FROM CUSTOMER WHERE Age not between 23 and 27;
                 
                 --23 bad a age 
                 SELECT * FROM CUSTOMER WHERE Age not IN (23) ;
                 
                 SELECT top 50 percent *FROM CUSTOMER ;
                 
                 --max Salary 
                 SELECT Age , MAX(Salary) As 'Max_Salary' from CUSTOMER 
                 GROUP BY Age;
           --name , max salary r k dia start
             SELECT Name , MAX(Salary) As 'Max_Salary' from CUSTOMER GROUP BY Name HAVING Name LIKE 'Ka%';
             
             SELECT Name ,Age, MAX(Salary) As 'Max_Salary' from CUSTOMER GROUP BY Name,Age HAVING Name LIKE 'Ka%';
             
             
                 
       