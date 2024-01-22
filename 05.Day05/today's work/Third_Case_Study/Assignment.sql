create table Employee(
Employee_ID int PRIMARY KEY,
Employee_name varchar(50) not null,
);

insert into Employee values(1,'Astha'),(2,'harsha'),(3,'deepak');
select * from Employee;


create table Attendnace(
Attendnace_ID int PRIMARY KEY,
Chekin_time datetime not null,
Chekout_time datetime not null,
employee_id int,
FOREIGN KEY (employee_id) REFERENCES Employee(Employee_ID),
);
drop table Attendnace;
select * from Attendnace;
insert into Attendnace values(4,GETDATE(),GETDATE(),1),(2,GETDATE(),GETDATE(),1),(3,GETDATE(),GETDATE(),2);
