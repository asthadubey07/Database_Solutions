/*
Create product table which store product information and create order table which should store the order information
*/

create table Orders01(
Order_ID int PRIMARY KEY,
Order_time datetime not null,
Order_Confirmation bit not null,
);

create table Product(
Product_ID int PRIMARY KEY,
Product_name varchar(50) not null,
Product_type varchar(50) not null,
Product_description varchar(200) not null,
Product_money money not null,
Order_id int,
FOREIGN KEY (Order_id) REFERENCES Orders01(Order_ID),
);


