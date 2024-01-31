--view
--view is used to create a table for the long query to use that query again and again( it work on only single statement)
create table Customers7(
 Cus_Id int identity(1,1) primary key,
 Cus_name varchar(50) not null,
 Cus_age int not null,
 Cus_number bigint not null,
 Cus_address varchar(200) not null
)
insert into Customers7 values ('Astha', 91,1234567890,'ggfg');
insert into Customers7 values ('kajal', 28,1234567890,'ggfg');
insert into Customers7 values ('mitesh', 23,1234547890,'ggfg');


CREATE TABLE Customer_Orders7
(
Order_id int identity(1,1) primary key,
Order_datetime datetime default getdate(),
cus_id int FOREIGN KEY REFERENCES Customers1(Cus_Id),
);
insert into  Customer_Orders7 (cus_id ) values (1),(2);

-- first approach
select Customers7.Cus_Id, Customers7.Cus_name,Customer_Orders7.Order_id 
from Customers7 inner join Customer_Orders7
on Customers7.Cus_Id=Customer_Orders7.cus_id;

--second approach
create view see_info as 
select Customers7.Cus_Id, Customers7.Cus_name,Customer_Orders7.Order_id from Customers7 inner join Customer_Orders7
on Customers7.Cus_Id=Customer_Orders7.cus_id;
select * from see_info;



-- when we multiple statement to run for that we use storeed PROCEDURE

CREATE PROCEDURE Insert_Customers
as
insert into Customers7 values ('Astha', 91,1234567890,'ggfg')
insert into Customers7 values ('kajal', 28,1234567890,'ggfg')
insert into Customers7 values ('mitesh', 23,1234547890,'ggfg')
go
EXEC Insert_Customers;


CREATE PROCEDURE Select_All_Customers 
AS
SELECT * FROM Customers7
GO
EXEC Select_All_Customers;





-- dynamic storeed PROCEDURE
CREATE PROCEDURE Insert_Customers1 (@name varchar(50),@age int,@number bigint,@address varchar(200))
as
insert into Customers7 values (@name,@age,@number,@address)
go
EXEC Insert_Customers1 @name ='pankal',@age=50,@number=1234567890,@address ='gygfiyi';



CREATE PROCEDURE Select_All_Customers1 
AS
SELECT * FROM Customers7
GO
EXEC Select_All_Customers1;


CREATE PROCEDURE Select_All_Customers2 
AS
SELECT * FROM Customers7 order by Cus_Id desc
GO
EXEC Select_All_Customers2;





--decraler the variable
declare @name varchar(50)
-- set variable 
set @name ='Amritesh'
-- search the variable
select CHARINDEX ('s',@name);






--task
create table student1(
id int identity(1,1) primary key,
firstname varchar(50) not null,
lastname varchar(50) not null,
name varchar(50)not null,
age int not null,
number bigint not null,
address varchar(200),
date date 
)

drop table student1;


insert into student1 values('rahul','tiwari','rahultiwari',15,5673546764,'laalnagr kymore','2023/05/12')
insert into student1 values('rahul','tiwari','rahultiwari',15,5673546764,'laalnagr kymore                          ','2023/05/12')
select * from student1;

--Concat
--it add two or more string or cloum
SELECT CONCAT(firstname,lastname) AS fullname
FROM student1;


--Lower 
-- it convert text in lower later
SELECT LOWER(name) as fullname
from student1;

SELECT LOWER('ASTHA DWIVEDI') as fullname

--Replace
-- replace one string to another
 select REPLACE (name, firstname, lastname)
 from student1;

select REPLACE ('abcd', 'a', 'b')

--Trim
-- reduce the extra spaces
SELECT TRIM(address) 
from student1;

SELECT TRIM('hduyhfuiogy                ') ;

--Length
--count the length of given expression
SELECT LEN(address)
from student1;
SELECT LEN('uyfjdysfjg');


--Numeric function
--Checks whether an expression can be converted to a numeric  or a numeric
 SELECT ISNUMERIC(4567);
 SELECT ISNUMERIC(number) from student1;
 SELECT ISNUMERIC(address) from student1;


--Floor
---- convert the given number into perfect number (gives 5)
SELECT Floor(5.44);


--Celing
-- convert the given number into perfect number(gives 6)
SELECT ceiling (5.22);


--Square
--gives the square of givent number
SELECT SQUARE(number)
from student1;
SELECT SQUARE(64);



--Date ADD
--Adds a time/date interval to a date and then returns the date
SELECT DATEADD(month, 5, '2023/09/19') AS DateAdd;
SELECT DATEADD(month, -5, '2023/09/19') AS DateAdd;
SELECT DATEADD(year, -5, date) AS DateAdd
from student1;


--DateDiff
--Returns the number of days between two date values
SELECT DATEDIFF(month, '2023/09/19', date) AS DateDiff
from student1;
SELECT DATEDIFF(month, '2023/09/19', '2011/08/25') AS DateDiff;
SELECT DATEDIFF(year, '2023/09/19', '2011/08/25') AS DateDiff;


--DateFormats
--	Formats a date
SELECT DATEFROMPARTS(2023,9, 9) AS DateFromParts;

--DateName
--Returns the name for a given date
SELECT DATENAME(year, '2023/09/19') AS DatePartString;
SELECT DATENAME(month, '2023/09/19') AS DatePartString;
SELECT DATENAME(day, '2023/09/19') AS DatePartString;
SELECT DATENAME(day, date) AS DatePartString from student1;
SELECT DATENAME(month, date) AS DatePartString from student1;
SELECT DATENAME(year, date) AS DatePartString from student1;



--GetDate
-- gives the current date and time
SELECT GETDATE() from student1;
SELECT GETDATE();


--Isdate
--Checks whether an expression can be converted to a date or a date
SELECT ISDATE('2017-08-25');
SELECT ISDATE('date') from student1;


