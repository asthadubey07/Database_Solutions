--create data base
CREATE DATABASE data;

--delete database
drop DATABASE data;

--backup of database
BACKUP DATABASE data TO DISK ='C:\backup\backupsqldata.Bak';
-- restore the database
RESTORE DATABASE Database3 FROM DISK ='C:\backup\backupsql1.Bak';

--create the table
create table LeadInformations(
Lead_ID int PRIMARY KEY,
Lead_name varchar(20) not null,
Lead_phone varchar(20) not null,
Lead_email text not null
);


--one value
insert into LeadInformations (Lead_ID,Lead_name,Lead_phone,Lead_email)values(1,'abhishek','1234567890','abhi@123');


--multiple values
insert into LeadInformations (Lead_ID,Lead_name,Lead_phone,Lead_email)values(5,'manisha','1234566890','manisha@123'),(2,'raja','1234569890','raja@123'),(3,'komal','1235567890','komal@123'),(4,'rani','1244567890','rani@123');


--multiple value
insert into LeadInformations values (7,'jiya','1234566590','jiya@123'),(6,'kajal','1234566990','kajal@123');


--read value 
select * from LeadInformations;
select Lead_ID,Lead_name,Lead_phone from LeadInformations;

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
truncate table LeadInformations;
--delete the table
drop table LeadInformations;



--create table by probleam statement

create table Leadinformation(
Lead_ID int PRIMARY KEY,
name varchar(20) not null,
location varchar(50) not null,
budget money not null,
property varchar(50) not null,
createdate datetime not null
);
drop table Leadinformation;

insert into Leadinformation (Lead_ID,name,location,budget,property,createdate)values(1,'abhishek','1234567890',500000,'2BHK','2023-05-08 12:35:29.123'),(2,'manisha','delhi',50000000,'3BHK',GETDATE());
select * from leadinformation;

create table Numbers(
ID int PRIMARY KEY,
phone_numbers text not null,
Lead_id int,
CONSTRAINT  FK_Numbers_Leadinformation  FOREIGN KEY (Lead_id)
REFERENCES Leadinformation(Lead_ID)
);

insert into Numbers (ID,phone_numbers,Lead_id)values(10,'1234567890',1),(30,'1234565890',1),(20,'123456687890',1);
select * from Numbers;