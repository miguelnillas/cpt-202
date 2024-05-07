/* Miguel Nillas
Assignment 3
03/25/2024 */


-- Question 1

SELECT c.CustomerID, c.ContactName, c.Address, c.City, c.Region, c.PostalCode, o.OrderID, o.Orderdate
FROM northwind_mysql_2019.customers c 
INNER JOIN northwind_mysql_2019.orders o ON c.CustomerID = o.CustomerID
WHERE YEAR(o.OrderDate) = 2020 AND MONTH(o.OrderDate) = 7;

-- Question 2

SELECT c.CustomerID, c.ContactName, c.Address, c.City, c.Region, c.PostalCode, o.OrderID, o.OrderDate
FROM northwind_mysql_2019.customers c, northwind_mysql_2019.orders o
WHERE c.CustomerID = o.CustomerID
	AND YEAR(o.OrderDate) = 2020 AND MONTH(o.OrderDate) = 7;
    
-- Question 3

SELECT e.EmployeeID, e.FirstName, e.LastName, j.JobDescription
FROM northwind_mysql_2019.employees e
inner join northwind_mysql_2019.jobs j on e.JobID = j.JobID
order by e.LastName ASC;

-- Question 4

select o.OrderID, o.CustomerID, c.ContactName, o.Freight, s.CompanyName as Shipper
from northwind_mysql_2019.orders o
inner join northwind_mysql_2019.customers c on o.CustomerID = c.CustomerID
inner join northwind_mysql_2019.Shippers s on o.ShipVia = s.ShipperID
where s.CompanyName = 'Speedy Express' and o.Freight > 25.00;

-- Question 5

SELECT c.CustomerID, c.CompanyName, o.OrderID
FROM northwind_mysql_2019.customers c
left outer join northwind_mysql_2019.orders o ON c.CustomerID = o.CustomerID
ORDER BY o.OrderID;

-- Question 6

select e.FirstName AS EmployeeFirstName, e.LastName AS EmployeeLastName, c.CompanyName AS CustomerCompanyName, o.OrderID, o.ShippedDate, od.ProductID, p.ProductName, s.SupplierID, s.CompanyName AS SupplierCompanyName, o.ShipVia AS ShipperID, sh.CompanyName AS ShipperCompanyName
FROM northwind_mysql_2019.orders o
INNER JOIN northwind_mysql_2019.employees e ON o.EmployeeID = e.EmployeeID
INNER JOIN northwind_mysql_2019.customers c ON o.CustomerID = c.CustomerID
INNER JOIN northwind_mysql_2019.orderdetails od ON o.OrderID = od.OrderID
INNER JOIN northwind_mysql_2019.products p ON od.ProductID = p.ProductID
INNER JOIN northwind_mysql_2019.suppliers s ON p.SupplierID = s.SupplierID
INNER JOIN northwind_mysql_2019.shippers sh ON o.ShipVia = sh.ShipperID
WHERE s.SupplierID = 12 AND o.EmployeeID = 2
ORDER BY o.OrderDate, o.CustomerID;

-- Question 7

SELECT ProductID, ProductName, UnitPrice, CompanyName AS SupplierCompanyName, ContactName AS SupplierContactName
FROM northwind_mysql_2019.products
JOIN suppliers USING(SupplierID);

-- Question 8

SELECT o.OrderID, o.CustomerID, c.CompanyName, c.ContactName, CONCAT(e.FirstName, ' ', e.LastName) AS EmployeeName
FROM northwind_mysql_2019.orders o 
Inner join northwind_mysql_2019.customers c ON o.CustomerID = c.CustomerID
Inner Join northwind_mysql_2019.employees e ON o.EmployeeID = e.EmployeeID
Where o.OrderDate < '2020-09-01'
Order by c.CompanyName;

-- Question 9

SELECT DISTINCT c.CustomerID, c.CompanyName, p.ProductName
FROM northwind_mysql_2019.customers c
INNER JOIN northwind_mysql_2019.orders o on c.CustomerID = o.CustomerID
INNER JOIN northwind_mysql_2019.orderdetails od on o.OrderID = od.OrderID
INNER JOIN northwind_mysql_2019.products p ON od.ProductID = p.ProductID
WHERE p.Discontinued=1;

-- Question 10

SELECT CompanyName,
	Case 
		when Country = 'USA' then 'Inside USA'
        ELSE 'Outside USA'
	END AS Location
FROM northwind_mysql_2019.customers
WHERE Country = 'USA'

UNION 
SELECT CompanyName,
	CASE 
		WHEN Country != 'USA' THEN 'Outside USA'
        ELSE 'Inside USA'
	END AS Location
FROM northwind_mysql_2019.customers
WHERE Country != 'USA';


