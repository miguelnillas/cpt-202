/* Miguel Nillas
*  04/112024
*  Assignment 6
*/

DROP DATABASE IF EXISTS mytestdb;
CREATE DATABASE mytestdb;

-- 1

use mytestdb;
CREATE TABLE zipcode (
    ZipCode VARCHAR(10) PRIMARY KEY,
    City VARCHAR(20),
    StateCode VARCHAR(2)
);


-- 2

create table customers (
	CustomerID int PRIMARY KEY,
    CustomerName VARCHAR(30),
    Address VARCHAR(30),
    ZipCode VARCHAR(10),
    CreditLimit DECIMAL(9,2),
    Balance DECIMAL(9,2),
    foreign key (ZipCode) REFERENCES zipcode(ZipCode)

);

-- 3

create table orders (
	OrderID INT,
    OrderDate DATE,
    CustomerID INT
);

-- 4

ALTER TABLE orders
add primary key (OrderID);

-- 5

alter table orders
add constraint fk_customer_id
foreign key (CustomerID) references customers(CustomerID);

-- 6

create table products (
	ProductID int primary key,
    Description VARCHAR(30),
    UnitsOnHand int,
    UnitsOnOrder int,
    UnitOfMeasure int,
    ReorderPoint INT,
    UnitCost Decimal(9,2),
    UnitPrice Decimal(9,2)
    );

-- 7

create table orderedproducts (
	OrderID int,
    ProductID int,
    NumberedOrdered int,
    QuotedPrice decimal(9,2),
    primary key (OrderID, ProductID),
    foreign key (OrderID) references orders(OrderID),
    foreign key(ProductID) references products(ProductID)
    );

-- 8

create INDEX idx_orderdate on orders (OrderDate);


