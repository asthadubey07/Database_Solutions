/*
we have many projects(name) and many employee can be assigned to one project only 
*/

create table Projects(
Project_ID int PRIMARY KEY,
Project_name varchar(50) not null,
);

insert into Projects values(1,'COD'),(2,'AOD');


create table Employees(
Employee_ID int PRIMARY KEY,
Employee_name varchar(50) not null,
Project_id int,
FOREIGN KEY (Project_id) REFERENCES Projects(Project_ID),
);

insert into Employees values(1,'kajal',1),(2,'jay',1),(3,'jay',2);


/*
Create product table which store product information and create order table which should store the order information
*/

create table Orders(
Order_ID int PRIMARY KEY,
Order_datetime datetime not null,
Order_Confirmation bit not null,
);

insert into Orders values(1,GETDATE(),0);

create table Product(
Product_ID int PRIMARY KEY,
Product_name varchar(50) not null,
Product_type varchar(50) not null,
Product_description varchar(200) not null,
Product_money money not null,
Order_id int,
FOREIGN KEY (Order_id) REFERENCES Orders(Order_ID),
);

insert into Product values(1,'kitkat','choc','cream',50,1);