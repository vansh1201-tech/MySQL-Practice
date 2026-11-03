drop database if exists shopping_management;
create database shopping_management;
use shopping_management;

create table customer(
Customer_id int primary key auto_increment,
Customer_name varchar(100),
Email varchar(50),
Phone_number varchar(10),
Age tinyint unsigned check(age>=18),
Country varchar(50) default 'India',
City varchar(50),
Pincode varchar(6) default 201301,
Registration_date date default (current_date),
Registration_time time default (current_time),
Created_at timestamp default (current_timestamp),
Address varchar(250),
Customer_status  enum('Active','Inactive','Blocked') default 'Active',
Customer_notes text(1000) not null);

select * from customer;



create table orders(
Order_id int primary key auto_increment,
customer_id int,
Order_date date default (current_date),
Order_amount decimal(10,2),
Order_status enum('Pending','Processing','Shipped','Delivered','Canclled') default 'Pending',
Payment_method enum('Cash','Card','UPI','Net Banking'),
Payment_status enum('Pending','Paid','Failed') default 'Pending',
Shipping_address varchar(250),
Delivery_pincode varchar(6),
-- Quantity 
Discount_amount decimal(10,2),
-- Delivery_date NULL where order_status ('Pending','Processing','Shipped'),
Created_at timestamp default (current_timestamp),
Tracking_number varchar(30),
Delivery_status enum('Not Dispatched','Intransit','Delivered','Returened') default 'Not Dispatched',
Order_notes text(1000) not null,
foreign key (Customer_id) references customer(id) on delete cascade,
foreign key (Customer_id) references customer(id) on update cascade);

select * from orders;



