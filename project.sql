
DROP TABLE IF exists customers;
DROP TABLE IF exists administator;
drop table if exists Premiumpelates;
drop table if exists orders;
drop table if exists products;
drop table if exists offers;
drop table if exists favouriteProduct;
drop table if exists ordersHistoryList;
drop table if exists orderdetail;

create table customers(
customerId int(5) not null auto_increment PRIMARY KEY,
username varchar(18) NOT NULL ,
password varchar(18) NOT NULL ,
email varchar(255) NOT NULL,
sex   ENUM('male','female'),
Member ENUM('Free','Premium')
);

create table administator(
email  varchar(50) NOT NULL,
username varchar(18) NOT NULL,
password varchar(18) NOT NULL,
Member ENUM('Admin')
);

create table products(
productid int auto_increment not null primary key,
ProductName varchar(255) NOT NULL,
cost double,
quantity int

);

create table Premiumpelates(
customerId int,
customeremail varchar(255) NOT NULL,
points INT
);

CREATE TABLE favouriteProduct(
fCustomerId int ,
fproductName VARCHAR(100) not null,
fproductid int 
);



create table orders(
orderid int not null auto_increment PRIMARY KEY,
customeremail varchar(50) NOT NULL ,
customerName varchar(20) not null,
cost double,
orderDate date
);

create table orderdetail(
orderid int,
Name varchar(255) not null,
quantity int,
cost double
references orders(orderid)
on update cascade on delete cascade
);

create table ordersHistoryList(
customerEmail varchar(100) not null,
buyListDate date,
orderId int primary key
);



create table offers(
ProductName varchar(255) NOT NULL ,
discount int,
quantity int,
cost double,
newcost double,
FOREIGN KEY (ProductName) 
references products (ProductName)
on update cascade on delete cascade
);

INSERT INTO customers VALUES
(null,'Mixalis','mixalis97','mixalisnikolaou97@gmail.com','male','Premium'),
(null,'Andreas','Andreas97','andreas@gmail.com','male','Free'),
(null,'Giwrgos','Giwrgos97','giorgos@gmail.com','male','Premium');


insert into administator values
('Orestis98@gmail.com','Orestis','Orestis98','Admin');

insert into products values
(null,'Protein',50,30),
(null,'T-shirt',15,5),
(null,'Vitamins',10,15),
(null,'Creatine',15,5);

insert into offers values
('T-shirt',20,20,15,10);


insert into orders values
(null,'mixalisnikolaou97@gmail.com','Mixalis',120,null),
(null,'andreas@gmail.com','Andreas',50,null),
(null,'andreas@gmail.com','Andreas',100,null);




insert into orderdetail values
(1,'Protein',2,100),
(1,'Vitamins',1,20),
(2,'Protein',1,50),
(3,'Protein',2,100);

insert into Premiumpelates values
(1,'mixalisnikolaou97@gmail.com',1000);
select * from customers;
