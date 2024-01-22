/*
we have many projects(name) and many employee can be assigned to one project only 
*/

create table Projects(
Project_ID int PRIMARY KEY,
Project_name varchar(50) not null,
);

create table Employees(
Employee_ID int PRIMARY KEY,
Employee_name varchar(50) not null,
);

create table Assigend_Project_Employee(
Assigend_ID int PRIMARY KEY,
Assigend_Date datetime not null,
Employee_id int,
FOREIGN KEY (Employee_id) REFERENCES Employees(Employee_ID),
Project_id int,
FOREIGN KEY (Project_id) REFERENCES Projects(Project_ID),
);