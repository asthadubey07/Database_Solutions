/*
Create product table which store product information and create order table which should store the order information
Add one 1-
i want to store the customer information and i want to in the order table which customer order the product item, for now customer can order only one item in per order
*/



create table Product(
Product_ID int PRIMARY KEY,
Product_name varchar(50) not null,
Product_type varchar(50) not null,
Product_description varchar(200) not null,
Product_money money not null
);



insert into Product values(1,'tshirt','cloth','xyz',4000);
insert into Product values(2,'shirt','cloth','xyyz',49000);

create table Customer(
Customer_ID int PRIMARY KEY,
Customer_name varchar(50) not null,
Customer_email varchar(50) not null,
Customer_number bigint not null,
Customer_Password binary not null
);

insert into Customer values(1,'astha','astha@123',237686848,010101);
insert into Customer values(2,'manisha','manisha@123',2376848,010101);



create table Orders01(
Order_ID int PRIMARY KEY,
Order_time date not null,
Order_Confirmation bit not null,
Product_id int,
FOREIGN KEY (Product_id) REFERENCES Product(Product_ID),
Customer_id int,
FOREIGN KEY (Customer_id) REFERENCES Customer(Customer_ID),

);
drop  table Orders01;

insert into  Orders01 values(1,GETDATE(),1,1,1);

insert into  Orders01 values(2,GETDATE(),1,1,1);


