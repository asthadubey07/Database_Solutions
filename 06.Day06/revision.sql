--create data base
CREATE DATABASE Database3;

--delete database
drop DATABASE Database3;

--backup of database
BACKUP DATABASE Database3 TO DISK ='C:\backup\backupsqldata2.Bak';
-- restore the database
RESTORE DATABASE Database3 FROM DISK ='C:\backup\backupsqldata2.Bak';

--create the table
create table Projects(
Project_ID int PRIMARY KEY,
Project_name varchar(50) not null,
);

--one value
insert into Projects (Project_ID,Project_name)values(1,'cod');


--multiple values
insert into Projects (Project_ID,Project_name)values(2,'HMS'),(3,'LMS');

--multiple value
insert into Projects values(4,'HL'),(5,'oms');


--read value 
select * from Projects;
--read multiple columns together
select Project_ID,Project_name from Projects;

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
truncate table Projects;
--delete the table
drop table Projects;


-- add column in table After Creating table
alter table Projects add age int;
--add multiple columns in table After Creating table
alter table Projects add email varchar(50),phone bigint;

-- delete any column from table
alter table Projects drop column email;

-- change data type in any column in a table
alter table Projects alter column phone varchar(14);


--Constraints
constraints are the rules that we can apply on the type of data in a table. 
By this we can specify the limit on the type of data that can be stored in a particular column in a table using constraints.

--not null Constraint
This constraint tells that we cannot store a null value in a column

-- create table using not null constraint
create table student(
Id int not null,
name varchar(20),
age int
);

--add Constrain by alter command
alter table student add unique(Id);

--unique Constraint
This constraint tells that all the values in the column must be unique.but in this in one cloum we get one null value

-- create table using unique constraint
create table student(
Id int unique,
name varchar(20),
age int
);

-- Remove constrain 
alter table student drop constraint Id;

-- primary key
The PRIMARY KEY constraint uniquely identifies each record in a table. and also not allow table to store the null value(not null + unique)
-- primary key in table
create table student(
Id int primary key,
name varchar(20),
age int
);

--FOREIGN KEY
foreign key is used to link tables

-- FOREIGN KEY in table
create table class(
classId int,
classname varchar(20),
roomnumber int
student_id int,
FOREIGN KEY (student_id) REFERENCES student(Id),
);
