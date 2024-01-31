
--create data base
CREATE DATABASE Database1;
              -------------11 september------------------------
--delete database
drop DATABASE Database1;

--backup of database
BACKUP DATABASE Database1 TO DISK ='C:\backup\backupsqldata1.Bak';
-- restore the database
RESTORE DATABASE Database1 FROM DISK ='C:\backup\backupsqldata1.Bak';

--create the table
create table Student(
Student_ID int PRIMARY KEY,
Student_name varchar(50) not null,
);

--one value
insert into Student (Student_ID,Student_name)values(1,'Astha');


--multiple values
insert into Student (Student_ID,Student_name)values(2,'rahul'),(3,'mohit');

--multiple value
insert into Student values(4,'payal'),(5,'jay');


--read value 
select * from Student;
--read multiple columns together
select Student_ID,Student_name from Student;

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
truncate table Student;
--delete the table
drop table Student;


             ---------------------12 september-------------------------------

--create the table
create table Student(
Student_ID int PRIMARY KEY,
Student_name varchar(50) not null,
);

-- add column in table After Creating table
alter table Student add age int;
--add multiple columns in table After Creating table
alter table Student add email varchar(50),phone bigint;

-- delete any column from table
alter table Student drop column email;

-- change data type in any column in a table
alter table Student alter column phone varchar(15);


--Constraints
constraints are the rules that we can apply on the type of data in a table. 
By this we can specify the limit on the type of data that can be stored in a particular column in a table using constraints.

--not null Constraint
This constraint tells that we cannot store a null value in a column

-- create table using not null constraint
create table Student(
Id int not null,
name varchar(20) not null,
age int not null,
);

--add Constrain by alter command
alter table Student add unique(Id);

--unique Constraint
This constraint tells that all the values in the column must be unique.but in this in one cloum we get one null value

-- create table using unique constraint
create table Employee(
 Employee_Id int unique,
 Employee_name varchar(20) not null,
 Employee_age int not null,
);

-- Remove constrain 
alter table Employee drop constraint Id;

-- primary key
The PRIMARY KEY constraint uniquely identifies each record in a table. and also not allow table to store the null value(not null + unique)
-- primary key in table
create table Employee(
Id int primary key,
name varchar(20) not null,
age int not null,
);

--FOREIGN KEY
foreign key is used to link tables

-- FOREIGN KEY in table
create table sal(
sal_Id int primary key
sal_amount money not null,
sal_month month month(september),
employee_id int,
FOREIGN KEY (employee_id) REFERENCES Employees(Employee_Id),
);



         ---------------------- 14 september------------------------------


--How to create primary key of two columns
create table student(
Id int not null,
name varchar(20) not null,
age int not null,
primary key (Id,name),
);


--How to connect composite key to other table as  foreign key
create table class(
class_Id int primary key,
class_number int not null,
student_id int,
student_name varchar(50),
constraint fk_c_s FOREIGN KEY (student_id,student_name) REFERENCES student(Id,name),
);


--HOw to work with check constraint 
create table Employee(
Id int not null,
name varchar(20) not null,
age int ,
CHECK (age>=18)
primary key (Id,name),
);


--How to apply multiple condition in check constraint
create table Employee(
Id int not null,
name varchar(20) not null,
age int not null,
CHECK (age>=18 AND age<100)
primary key (Id,name),
);


--How to apply constraint after creating column
create table Person(
Id int not null,
name varchar(20) not null,
age int not null,
primary key (Id,name),
);
ALTER TABLE Persons
ADD CHECK (Age>=18 );


--How to apply constraint on more than 1 column
create table Person(
Id int not null,
name varchar(20) not null,
age int not null,
city varchar(50),
primary key (Id,name),
);
ALTER TABLE Person
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

create table Person(
Id int not null,
name varchar(20) not null,
age int default 0,
datetime datetime default getdate(),
primary key (Id,name),
);


--How to apply auto increment 
create table Person(
Id int identity(1,1)primary key,
name varchar(20) not null,
age int default 0,
datetime datetime default getdate(),
);

-- create table Time, DateTime,Timestamp and datetime with timezone 

CREATE TABLE Time_Info(
Time_id int identity(1,1) primary key,
CurrentTIME TIME,
Currentdatetime DATETIME,
Currenttimestamp TIMESTAMP,
Currentzone DATETIMEOFFSET
)

INSERT INTO Time_Info (CurrentTIME,Currentdatetime,Currentzone) VALUES(SYSDATETIME(),GETDATE(),SYSDATETIMEOFFSET())

SELECT * FROM Time_Info




--------------------------15 september---------------------------------


-- update one column data of all rows together
CREATE TABLE student
(
ID int identity(1,1) primary key,
Name VARCHAR(50) not null,
AGE int not null
);

INSERT INTO student VALUES ('Astha', 22);
INSERT INTO student VALUES ('Astha', 22);
UPDATE student SET AGE = 20;

--update  one column data for specific row
UPDATE student SET Name = 'amritesh' Where ID = 1;


--update more than 1 column for that specific row
UPDATE student SET Name = 'jiya', Age = 15 WHERE ID = 2;


-- filter data using where
SELECT * FROM student Where Age = 21

--Work with and and or operator
SELECT * FROM student Where Age > 5 OR Age < 18
SELECT * FROM student Where Age > 5 AND Age < 18
SELECT * FROM student Where Age != 20

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
SELECT * FROM student ORDER BY age;
SELECT * FROM student ORDER BY ID DESC;



---------------------------------16 september------------------------------

CREATE TABLE student
(
ID int identity(1,1) primary key,
Name VARCHAR(50) not null,
Age int not null,
Address varchar(200)
);
-- check Null and not null entries in the table

SELECT * FROM student WHERE Address IS NULL;
SELECT * FROM student WHERE Address IS NOT NULL;


-- delete the data
DELETE FROM student WHERE Address IS NULL;

-- work with top
SELECT * FROM student;
SELECT TOP 3 * FROM student ORDER BY Age DESC; 

CREATE TABLE employee
(
ID int identity(1,1) primary key,
Name VARCHAR(50) not null,
Age int not null,
Address varchar(200),
sal money not null,
);


--Min and max
SELECT MAX(sal) FROM employee;
SELECT MIN(sal) FROM employee;


--work with sum, average, count
SELECT COUNT(*)  FROM employee;
SELECT SUM(sal)  FROM employee;
SELECT AVG(sal)  FROM employee;


-- backup differential
BACKUP DATABASE employee To Disk = 'C:\Backup\backupsqldata5.bak';
BACKUP DATABASE employee To Disk = 'C:\Backup\backupsqldata5.bak' WITH differential;


--work with like operator
SELECT * FROM employee WHERE Name LIKE 'b%'
SELECT * FROM employee WHERE Name LIKE '%aa' 
SELECT * FROM employee WHERE Name LIKE '%l%' 
SELECT * FROM employee WHERE Name LIKE 'b%a' 
SELECT * FROM employee WHERE Name LIKE '_sa%' 
SELECT * FROM employee WHERE Name NOT LIKE 'f%' 
SELECT * FROM employee WHERE Name LIKE 'a%' OR Name LIKE 'b%';

--Offset
SELECT * FROM employee ORDER BY sal OFFSET 2;






--------------------------17 september---------------------------


CREATE TABLE Emp_info
(
	id int identity(1,1),
	name varchar(50) not null, 
	age int not null,
	address varchar(200) not null,
	sal money not null

);
INSERT INTO Emp_info VALUES ('Amritesh', 22,'fgfd',50000);
INSERT INTO Emp_info VALUES ('palak', 22,'fgfd',50000);
INSERT INTO Emp_info VALUES ('nitesh', 35,'fgfd',50000);
INSERT INTO Emp_info VALUES ('mitesh', 43,'fgfd',50000);
-- Show me the data about 3 names-in
select * from Emp_info where name in ('mitesh' ,'palak');

--Show me the data where two any names not present -not in
select * from Emp_info where name not in ('mitesh' ,'palak');


--Filter the data between two range- Between
select * from Emp_info where age  between 20 and 30

--Union 
--when two table has same structure
CREATE TABLE Emp_info2
(
	id int identity(1,1) primary key,
	name varchar(50) not null, 
	age int not null,
);

CREATE TABLE Emp_info3
(
	id int identity(1,1) primary key,
	name varchar(50) not null, 
	age int not null,
);

select * from Emp_info2 union all select * from Emp_info3
select name from Emp_info2 union  select name from Emp_info3;
select age from Emp_info2 union  select age from Emp_info3;



--SQl Aliases
--gives the temprary name to coulum or table
select * from Emp_info2 as information union all select * from Emp_info3


--join connect two table 
CREATE TABLE Customer
(
	Customer_Id int identity(1,1) primary key,
	Customer_name varchar(200) not null, 
);

INSERT INTO Customer VALUES ('kanchan');
INSERT INTO Customer VALUES ('sandhya');
INSERT INTO Customer VALUES ('karan');

CREATE TABLE Customer_Order
(
	Order_id int identity(1,1) primary key,
	cus_id int FOREIGN KEY REFERENCES Customer(Customer_Id),
);

drop table Customer_Order;
insert into  Customer_Order values (1),(1),(2);
--Inner join
-- inner join is used when we have to retrive the comon data from both the table 

select Customer_Order.Order_id ,Customer.Customer_Id,Customer.Customer_name from Customer inner join Customer_Order on Customer.Customer_Id = Customer_Order.cus_id;


--Left join
-- left join is used when we have to retrive the comon data from both the table and all data from left table

select Customer_Order.Order_id ,Customer.Customer_Id,Customer.Customer_name from Customer Left join Customer_Order on Customer.Customer_Id = Customer_Order.cus_id;


--right join
select Customer_Order.Order_id ,Customer.Customer_Id,Customer.Customer_name from Customer right join Customer_Order on Customer.Customer_Id = Customer_Order.cus_id;


--Outer join
select Customer_Order.Order_id ,Customer.Customer_Id,Customer.Customer_name from Customer Outer join Customer_Order on Customer.Customer_Id = Customer_Order.cus_id;


--Group by
select count(*), Customer_Id as Customer_Id from Customer group by Customer_Id;


--HAving
select count(Customer_name), Customer_Id as Customer_Id from Customer group by Customer_Id having count(Customer_name)>1;

--Exists
 SELECT Customer_name FROM Customers where exists(select Order_id FROM Customer_Orders WHERE Order_id=4);


--Copy of table
select * into Customers1 from Customers;
select * from Customers1;

-- Insert into
create table Custumer_order_table5(
C_O_Id int identity(1,1) primary key,
Cus_id int not null,
Cus_name varchar(50) not null,
Order_id int ,
O_T_A money not null
);


insert into Custumer_order_table5 (Cus_id,Cus_name,Order_id,O_T_A) values (3,'udugfi',3,54138953965)
insert into Custumer_order_table5 (Cus_id,Cus_name,Order_id,O_T_A) select Customers2.Cus_Id,Customers2.Cus_name,Customer_Orders2.Order_id,Customer_Orders2.Order_total_amount

from Customers2 inner join Customer_Orders2 on Customers2.Cus_Id=Customer_Orders2.cus_id;
select * from Custumer_order_table5;



--Case
create table Customers4(
 Cus_Id int identity(1,1) primary key,
 Cus_name varchar(50) not null,
 Cus_age int not null,
 Cus_number bigint not null,
 Cus_address varchar(200) not null
)


insert into Customers4 values ('Astha', 91,1234567890,'ggfg');
insert into Customers4 values ('kajal', 28,1234567890,'ggfg');
insert into Customers4 values ('mitesh', 23,1234547890,'ggfg');

select Cus_name,
case
 when Cus_name='Astha' then 'hello its me'
 when Cus_name ='Kajal' then 'hii its my sister'
else 'dont know who is she/he'
end response
from Customers4

