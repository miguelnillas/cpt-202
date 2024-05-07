/*Miguel Nillas
Assignment 4
04/02/2024*/

-- Question 1

SELECT
	avg(UnitPrice) as average_price,
    min(UnitPrice) as minimum_price,
    max(UnitPrice) as maximum_price
from northwind_mysql_2019.products;

-- Question 2

select
	CustomerID,
    round(avg(Freight), 2) as "Average Freigh Cost"
from 
	northwind_mysql_2019.orders
group by 
	CustomerID;
    
-- Question 3

select 
	CustomerID, 
    round(avg(Freight), 2) as "Average Freight Cost"
from 
	northwind_mysql_2019.orders
group by
	CustomerID
having 
	avg(Freight) > 100;
    
-- Question 4

select 
	employees.EmployeeID,
    employees.FirstName,
    employees.LastName,
    (select MAX(OrderDate) from northwind_mysql_2019.orders where EmployeeID = employees.EmployeeID) as "Most Recent Order"
from 
	northwind_mysql_2019.employees;

-- Question 5

select
	ProductID,
    count(*) as "Number of Orders"
from
	northwind_mysql_2019.orderdetails
group by
	ProductID
Having
	count(*) > 50;

-- Question 6

select 
	c.Country,
    count(o.OrderID) as "Numbe of Orders"
from
	northwind_mysql_2019.orders o 
join 
	northwind_mysql_2019.customers c ON o.CustomerID = c.customerID
group by
	c.Country
order by 
	c.Country asc;

-- Question 7

select
	OrderID,
    sum(UnitPrice * Quantity) as "Full Retail Price", 
    round(sum(UnitPrice * Quantity * (1 - Discount)), 2) as "Final Price"
from 
	northwind_mysql_2019.orderdetails
group by
	OrderID;

-- Question 8

select 
	od.ProductID,
    p.ProductName,
    o.ShipVia as ShipperID,
    s.CompanyName as ShipperName,
    count(*) as "Times Used"
from
	northwind_mysql_2019.orderdetails od
join
	northwind_mysql_2019.orders o on od.OrderID = o.OrderID
join
	northwind_mysql_2019.shippers s on o.ShipVia = s.ShipperID
join 
	northwind_mysql_2019.products p on od.ProductID = p.ProductID
group by
	od.ProductID, o.ShipVia
order by
	od.ProductID;

