/* Miguel Nillas
* Final Exam Part 1
* 04/20/2024
*/

-- 1

SELECT
	CustomerID, CompanyName,
    concat(
		Address, ' ',
        City, ' ',
        IFNULL(Region, ''), ' ',
        PostalCode, ' ',
        Country
        ) as 'Complete Address'
	from 
		northwind_mysql_2019.Customers
	where 
		CustomerID REGEXP '^[J-N]'
	order by
		CompanyName;


-- 2

Select
	Concat(e.FirstName, ' ', e.LastName) as EmployeeName,
    Round(j.PayRate * 2080, 0) as YearlySalary
From
	northwind_mysql_2019.employees e 
Join 
	northwind_mysql_2019.Jobs j on e.JobId = j.JobId
Where 
	j.Hourly = 1
Order By
	e.LastName;
    
-- 3

Select
	ProductName As Products,
    Round(UnitPrice * UnitsInStock, 2) as 'Inventory Value'
From
	northwind_mysql_2019.Products
Order By
	Round(UnitPrice * UnitsInStock, 2) desc
Limit 10;

-- 4

Select CompanyName, ContactName, Country, Phone
From northwind_mysql_2019.customers
where Fax is null or Fax = ''
Order By Country;

-- 5

select 
	p.ProductName,
    s.CompanyName as Supplier,
    od.Quantity as UnitsOnOrder
from
	northwind_mysql_2019.products p 
join 
	northwind_mysql_2019.suppliers s on p.SupplierID = s.SupplierID
join
	northwind_mysql_2019.orderdetails od on p.ProductID = od.ProductID
where
	od.Quantity > 0
Order By
	s.CompanyName,
    p.ProductName;

-- 6

use northwind_mysql_2019;
select 
	ProductID,
    ProductName
From
	northwind_mysql_2019.products
where
	ProductID not in (select distinct ProductID from OrderDetails);

-- 7

Select 
	e.LastName,
    Round(Sum(od.UnitPrice * od.Quantity * (1 - od.Discount) * 0.05), 2) as CommissionPaid,
    Round((j.PayRate * 2080), 2) as EstimatedSalary,
    Round(Sum(od.UnitPrice * od.Quantity * (1 - od.Discount) * 0.05), 2) + Round((j.PayRate *2080), 2) as TotalCompensation
From
	northwind_mysql_2019.employees e
Join
	northwind_mysql_2019.orders o On e.EmployeeID = o.EmployeeID
Join
	northwind_mysql_2019.orderdetails od On o.OrderID = od.OrderID
Join
	northwind_mysql_2019.jobs j on e.Jobid = j.JobId
Where 
	year(o.OrderDate) = 2020 and j.Hourly = 1
group by
	e.EmployeeID
Order by 
	 Round(Sum(od.UnitPrice * od.Quantity * (1 - od.Discount) * 0.05), 2) + Round((j.PayRate *2080), 2) Desc;

-- 8

Select 
	s.ShipperID as 'Shipper ID',
    s.CompanyName as 'Shipper Name',
    Count(o.OrderID) as 'Number of Orders',
    Sum(o.Freight) as 'Total Freight Cost'
From
	northwind_mysql_2019.shippers s
Join
	northwind_mysql_2019.orders o On s.ShipperID = o.ShipVia
Group By
	s.ShipperID, s.CompanyName
Order By
	'Total Freight Cost' desc;
