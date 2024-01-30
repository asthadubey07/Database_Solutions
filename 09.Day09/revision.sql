--create data base
CREATE DATABASE Database3;

--delete database
drop DATABASE Database3;

--backup of database
BACKUP DATABASE Database3 TO DISK ='C:\backup\backupsqldata3.Bak';
-- restore the database
RESTORE DATABASE Database3 FROM DISK ='C:\backup\backupsqldata3.Bak';

--create the table
create table Customers(
Customer_ID int PRIMARY KEY,
Customer_name varchar(50) not null,
);

--one value
insert into Customers (Customer_ID,Customer_name)values(1,'Astha');


--multiple values
insert into Customers (Customer_ID,Customer_name)values(2,'Amritesh'),(3,'mohit');

--multiple value
insert into Customers values(4,'kajal'),(5,'jay');


--read value 
select * from Customers;
--read multiple columns together
select Customer_ID,Customer_name from Customers;

--create the table by schema
create table student(
Id int,
name varchar(20),
age int
);

create table class(
classId int,
classname varchar(20),
roomnumber int
);

create table teacher(
TId int,
teachername varchar(20),
teachernumber varchar(20)
);

--delete only data of table
truncate table Customers;
--delete the table
drop table Customers;


-- add column in table After Creating table
alter table Customers add age int;
--add multiple columns in table After Creating table
alter table Customers add email varchar(50),phone bigint;

-- delete any column from table
alter table Customers drop column email;

-- change data type in any column in a table
alter table Customers alter column phone varchar(15);


--Constraints
constraints are the rules that we can apply on the type of data in a table. 
By this we can specify the limit on the type of data that can be stored in a particular column in a table using constraints.

--not null Constraint
This constraint tells that we cannot store a null value in a column

-- create table using not null constraint
create table Employees(
Id int not null,
name varchar(20) not null,
age int not null,
);

--add Constrain by alter command
alter table Employees add unique(Id);

--unique Constraint
This constraint tells that all the values in the column must be unique.but in this in one cloum we get one null value

-- create table using unique constraint
create table Employees(
 Employee_Id int unique,
 Employee_name varchar(20) not null,
 Employee_age int not null,
);

-- Remove constrain 
alter table Employees drop constraint Id;

-- primary key
The PRIMARY KEY constraint uniquely identifies each record in a table. and also not allow table to store the null value(not null + unique)
-- primary key in table
create table Employees(
Id int primary key,
name varchar(20) not null,
age int not null,
);

--FOREIGN KEY
foreign key is used to link tables

-- FOREIGN KEY in table
create table Attendence(
AttendenceId int primary key,
dates date not null,
chekin time not null,
chekout time not null,
employee_id int,
FOREIGN KEY (employee_id) REFERENCES Employees(Employee_Id),
);

--create data base
CREATE DATABASE Database3;

--delete database
drop DATABASE Database3;

--backup of database
BACKUP DATABASE Database3 TO DISK ='C:\backup\backupsqldata3.Bak';
-- restore the database
RESTORE DATABASE Database3 FROM DISK ='C:\backup\backupsqldata3.Bak';

--create the table
create table Customers(
Customer_ID int PRIMARY KEY,
Customer_name varchar(50) not null,
);

--one value
insert into Customers (Customer_ID,Customer_name)values(1,'Astha');


--multiple values
insert into Customers (Customer_ID,Customer_name)values(2,'Amritesh'),(3,'mohit');

--multiple value
insert into Customers values(4,'kajal'),(5,'jay');


--read value 
select * from Customers;
--read multiple columns together
select Customer_ID,Customer_name from Customers;

--create the table by schema
create table student(
Id int,
name varchar(20),
age int
);

create table class(
classId int,
classname varchar(20),
roomnumber int
);

create table teacher(
TId int,
teachername varchar(20),
teachernumber varchar(20)
);

--delete only data of table
truncate table Customers;
--delete the table
drop table Customers;


-- add column in table After Creating table
alter table Customers add age int;
--add multiple columns in table After Creating table
alter table Customers add email varchar(50),phone bigint;

-- delete any column from table
alter table Customers drop column email;

-- change data type in any column in a table
alter table Customers alter column phone varchar(15);


--Constraints
constraints are the rules that we can apply on the type of data in a table. 
By this we can specify the limit on the type of data that can be stored in a particular column in a table using constraints.

--not null Constraint
This constraint tells that we cannot store a null value in a column

-- create table using not null constraint
create table Employees(
Id int not null,
name varchar(20) not null,
age int not null,
);

--add Constrain by alter command
alter table Employees add unique(Id);

--unique Constraint
This constraint tells that all the values in the column must be unique.but in this in one cloum we get one null value

-- create table using unique constraint
create table Employees(
 Employee_Id int unique,
 Employee_name varchar(20) not null,
 Employee_age int not null,
);

-- Remove constrain 
alter table Employees drop constraint Id;

-- primary key
The PRIMARY KEY constraint uniquely identifies each record in a table. and also not allow table to store the null value(not null + unique)
-- primary key in table
create table Employees(
Id int primary key,
name varchar(20) not null,
age int not null,
);

--FOREIGN KEY
foreign key is used to link tables

-- FOREIGN KEY in table
create table Attendence(
AttendenceId int primary key,
dates date not null,
chekin time not null,
chekout time not null,
employee_id int,
FOREIGN KEY (employee_id) REFERENCES Employees(Employee_Id),
);

--How to create primary key of two columns
create table Employees(
Id int not null,
name varchar(20) not null,
age int not null,
primary key (Id,name),
);


--How to connect composite key to other table as  foreign key
create table Attendence(
AttendenceId int primary key,
dates date not null,
chekin time not null,
chekout time not null,
employee_id int,
emp_name varchar(50),
constraint fk_e_a FOREIGN KEY (employee_id,emp_name) REFERENCES Employees(Id,name),
);

--HOw to work with check constraint 
create table Employees(
Id int not null,
name varchar(20) not null,
age int ,
CHECK (age>=18)
primary key (Id,name),
);


--How to apply multiple condition in check constraint
create table Employees(
Id int not null,
name varchar(20) not null,
age int not null,
CHECK (age>=18 AND age<100)
primary key (Id,name),
);


--How to apply constraint after creating column
create table Persons(
Id int not null,
name varchar(20) not null,
age int not null,
primary key (Id,name),
);
ALTER TABLE Persons
ADD CHECK (Age>=18 );


--How to apply constraint on more than 1 column
create table Persons(
Id int not null,
name varchar(20) not null,
age int not null,
city varchar(50),
primary key (Id,name),
);
ALTER TABLE Persons
ADD CONSTRAINT CHK_P_A CHECK (age>=18 AND city='indore');

--How to apply default constraint
create table Persons(
Id int not null,
name varchar(20) not null,
age int default 0,
city varchar(50),
primary key (Id,name),
);


--How to get the date and time automatically in any column

create table Persons(
Id int not null,
name varchar(20) not null,
age int default 0,
datetime datetime default getdate(),
city varchar(50),
primary key (Id,name),
);


--How to apply auto increment 
create table Persons(
Id int identity(1,1)primary key,
name varchar(20) not null,
age int default 0,
datetime datetime default getdate(),
city varchar(50),

);

-- create table Time, DateTime,Timestamp and datetime with timezone 

CREATE TABLE Time_Info(
CurrentTIME TIME,
Currentdatetime DATETIME,
Currenttimestamp TIMESTAMP,
Currentzone DATETIMEOFFSET
)

INSERT INTO Time_Info (CurrentTIME,Currentdatetime,Currentzone) VALUES(SYSDATETIME(),GETDATE(),SYSDATETIMEOFFSET())

SELECT * FROM Time_Info

-- update one column data of all rows together
CREATE TABLE Employees
(
ID INT,
Name VARCHAR(50),
AGE INT
);

INSERT INTO Employees VALUES (1, 'Astha', 22);
UPDATE Employees SET AGE = 20;

--update  one column data for specific row
UPDATE Employees SET Name = 'amritesh' Where ID = 1;


--update more than 1 column for that specific row
UPDATE Employees SET Name = 'astha', Age = 21 WHERE ID = 2;


-- filter data using where
SELECT * FROM Employees Where Age = 21

--Work with and and or operator
SELECT * FROM Employees Where Age > 18 OR Age < 60
SELECT * FROM Employees Where Age > 18 AND Age < 60
SELECT * FROM Employees Where Age != 25

--Create tables and join and create database diagram
CREATE TABLE One
(
	ID INT PRIMARY KEY,
	Name VARCHAR(50)
);

CREATE TABLE Two
(
	Age INT,
	Address VARCHAR(500),
	ID INT FOREIGN KEY (ID) REFERENCES One
);

--Order by ASC and DESC
SELECT * FROM Employees ORDER BY age;
SELECT * FROM Employees ORDER BY ID DESC;


-- check Null and not null entries in the table

SELECT * FROM Employees WHERE Address IS NULL;
SELECT * FROM Employees WHERE Address IS NOT NULL;


-- delete the data
DELETE FROM Employees WHERE Address IS NULL;

-- work with top
SELECT * FROM Employees;
SELECT TOP 3 * FROM Employees ORDER BY sal DESC; 


--Min and max
SELECT MAX(sal) FROM Employees;
SELECT MIN(sal) FROM Employees;


--work with sum, average, count
SELECT COUNT(*)  FROM Employees;
SELECT SUM(sal)  FROM Employees;
SELECT AVG(sal)  FROM Employees;


-- backup differential
BACKUP DATABASE Employees To Disk = 'C:\Backup\backupsqldata4.bak';
BACKUP DATABASE Employees To Disk = 'C:\Backup\backupsqldata4.bak' WITH differential;


--work with like operator
SELECT * FROM Employees WHERE Name LIKE 'a%'
SELECT * FROM Employees WHERE Name LIKE '%aa' 
SELECT * FROM Employees WHERE Name LIKE '%a%' 
SELECT * FROM Employees WHERE Name LIKE 'b%a' 
SELECT * FROM Employees WHERE Name LIKE '_la%' 
SELECT * FROM Employees WHERE Name NOT LIKE 'f%' 
SELECT * FROM Employees WHERE Name LIKE 'a%' OR Name LIKE 'b%';

--Offset
SELECT * FROM Employees ORDER BY sal OFFSET 3;