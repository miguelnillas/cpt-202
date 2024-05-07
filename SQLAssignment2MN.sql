/*Miguel Nillas
Assignment 2
3/22/2024 */

-- Question 1

SELECT * FROM northwind_mysql_2019.suppliers;

-- Question 2

SELECT * FROM northwind_mysql_2019.products
ORDER BY UnitPrice, ProductName;

-- Question 3

SELECT ProductID, ProductName, UnitPrice, UnitsInStock, UnitsOnOrder
FROM northwind_mysql_2019.products
WHERE Discontinued = 1;

-- Question 4

SELECT CustomerID, CompanyName, LEFT(CompanyName, 8) AS ShortName
FROM northwind_mysql_2019.customers;

-- Question 5

SELECT CustomerID, Freight
FROM northwind_mysql_2019.orders
ORDER BY Freight DESC
LIMIT 25;

-- Question 6

SELECT CustomerID, CompanyName
FROM northwind_mysql_2019.customers
WHERE Country = 'USA' AND CompanyName LIKE '%Market%';

-- Question 7

SELECT
	concat(LOWER(LEFT(FirstName, 1)), '.', LOWER(LastName), '@northwind.com') AS Email,
    FirstName,
    LastName
FROM northwind_mysql_2019.employees
ORDER BY 
	LastName ASC;

-- Question 8

SELECT * 
FROM northwind_mysql_2019.customers
WHERE Country IN ('Mexico', 'Canada', 'USA', 'Brazil')
ORDER BY Country;

-- Question 9

SELECT round((50 + 100.25) * 3.5, 2) AS Result;

-- Question 10

SELECT LastName, HomePhone, Notes
FROM northwind_mysql_2019.employees
WHERE Notes LIKE '%French%';

-- Question 11

SELECT *
FROM northwind_mysql_2019.orders
WHERE OrderDate BETWEEN '2020-04-1' AND '2020-04-30';

-- Question 12

SELECT *
FROM northwind_mysql_2019.orders
WHERE Orderdate >= '2020-04-01' AND OrderDate < '2020-05-01';

-- Question 13

SELECT *
FROM northwind_mysql_2019.orders
WHERE ShippedDate IS NULL;

-- Question 14

SELECT DISTINCT CustomerID
FROM northwind_mysql_2019.orders
ORDER BY CustomerID DESC;

-- Question 15

SELECT DISTINCT CustomerID
FROM northwind_mysql_2019.orders
ORDER BY CustomerID DESC;
