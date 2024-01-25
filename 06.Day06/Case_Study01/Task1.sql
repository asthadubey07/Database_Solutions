use data1;
create table Customers(
Customer_ID int PRIMARY KEY,
Customer_name varchar(50) not null,
Customer_email varchar(50) not null,
Customer_password varchar(200) not null,
);



insert into Customers values(1,'Astha','Astha@123','A@123');
insert into Customers values(2,'Manisha','Manisha@123','M@123');


create table Restrorents(
Restrorent_ID int PRIMARY KEY,
Restrorent_name varchar(50) not null,
Restrorent_email varchar(50) not null,
Restrorent_type varchar(50) not null,
Restrorent_number bigint not null
);

insert into Restrorents values(1,'ABC','ABC@123','veg',1234567890),(2,'XYZ','XYZ@123','thai',0987654321);

create table Orders(
Order_ID int PRIMARY KEY,
Order_date date not null,
Order_time time not null,
Restro_id int,
FOREIGN KEY (Restro_id) REFERENCES Restrorents(Restrorent_ID),
Customer_id int,
FOREIGN KEY (Customer_id) REFERENCES Customers(Customer_ID)
);

insert into Orders values(1,GETDATE(),'23:59:59.999999',1,2),(2,GETDATE(),'23:59:59.999999',2,2);


create table Dishs(
Dish_ID int PRIMARY KEY,
Dish_name varchar(50) not null,
Dish_type varchar(50) not null,
Dish_description varchar(50) not null,
Dish_price money not null,
);

insert into Dishs values(1,'pasta','chinese','Good food',200),(2,'thali','indian','xyx',2000);

create table Restro_Dish(
ID int PRIMARY KEY,
Restro_id int,
FOREIGN KEY (Restro_id) REFERENCES Orders(Order_ID),
Dish_id int,
FOREIGN KEY (Dish_id) REFERENCES Dishs(Dish_ID)
);


insert into Restro_Dish values(1,1,2),(2,1,1),(3,2,1);



create table Order_Dish(
ID int PRIMARY KEY,
Order_id int,
FOREIGN KEY (Order_id) REFERENCES Restrorents(Restrorent_ID),
Dish_id int,
FOREIGN KEY (Dish_id) REFERENCES Dishs(Dish_ID)
);

insert into Order_Dish values(1,1,2),(2,1,1),(3,2,1);

create table Ratings(
Rating_ID int PRIMARY KEY,
Rating_start varchar(50) not null,
Rating_comment varchar(50) not null,
Dish_id int,
FOREIGN KEY (Dish_id) REFERENCES Dishs(Dish_ID)
);

insert into Ratings values(1,'****','good',1),(2,'**','notgood',2),(3,'*','bad',2);

select * from Customers;
select * from Restrorents;
select * from Orders;
select * from Dishs;
select * from Restro_Dish;
select * from Order_Dish;
select * from Ratings;
