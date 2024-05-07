/*Miguel Nillas
04/05/2024
Assignment 5*/

 -- 1
 
 select OrderID, CustomerID, OrderDate Freight
 from northwind_mysql_2019.orders
 where Freight > (select avg(Freight) from northwind_mysql_2019.orders);
 
 -- 2
 
 select p.ProductID, p.ProductName, FORMAT(p.UnitPrice, 2) as Price
 from northwind_mysql_2019.products as p
 join northwind_mysql_2019.suppliers as s on p.SupplierID = s.SupplierID
 where s.Country in ('Germany', 'Italy')
 order by p.ProductName;
 
 -- 3 
 
 select ProductId, ProductName, Format(UnitPrice, 2) as price
 from northwind_mysql_2019.products
 where SupplierId in (
	select SupplierID
    from northwind_mysql_2019.suppliers
    where Country in ('Germany', 'Italy')
    )
order by ProductName;
 
 -- 4 
 
 select ProductID, ProductName, UnitsInStock, CategoryID
 from northwind_mysql_2019.products
 where CategoryID = 2
 and UnitsInStock > (
	select avg(UnitsInStock)
    from northwind_mysql_2019.products
    );
 
 
 -- 5 
 
 select productID, ProductName, UnitsInStock, CategoryID
 from northwind_mysql_2019.products
 where UnitsInStock > (
	select avg(UnitsInStock)
    from northwind_mysql_2019.products
    where categoryID = 2
    );
 
 -- 6 
 
 select ProductName, UnitPrice
 from northwind_mysql_2019.products
 where UnitPrice < all 
 (
	select UnitPrice
    from northwind_mysql_2019.products as p
    join northwind_mysql_2019.suppliers as s on p.SupplierID = s.SupplierID
    where s.CompanyName = 'Mayumi''s'
    
 );
 
 -- 7 
 
 select OrderID, ShippedDate, CompanyName
 from northwind_mysql_2019.orders as o
 join northwind_mysql_2019.customers as c on o.CustomerID = c.CustomerID
 where ShippedDate = any 
 (
	select ShippedDate
    from northwind_mysql_2019.orders as o2
    join northwind_mysql_2019.customers as c2 on o2.CustomerID = c2.CustomerID
    where c2.Country = 'Norway'
 );
 
 -- 8
 
 select SupplierID, ProductID, ProductName, UnitPrice
 from northwind_mysql_2019.products as p
 where UnitPrice > 
 (
	select avg(UnitPrice)
    from northwind_mysql_2019.products as p2
    where p.SupplierID = p2.SupplierID
 )
 order by SupplierID;
 
 -- 9
 
 select SupplierID, ProductID, ProductName, UnitPrice, 
	round(
		(select avg(unitPrice)
        from northwind_mysql_2019.products as p2
        where p.SupplierID = p2.SupplierID
        ), 2
        )as "Supplier Average Price"
	from northwind_mysql_2019.products as p
    where UnitPrice > (
		select avg(UnitPrice)
        from northwind_mysql_2019.products as p2
        where p.SupplierID = p2.SupplierID
 )
 order by SupplierID;
 
 
 -- 10
 
 with ProductSummary as (
	select s.CompanyName, count(p.ProductID) as ProductCount,
		round(min(p.UnitPrice), 2) as MinPrice,
        round(max(p.UnitPrice), 2) as MaxPrice
	from northwind_mysql_2019.products as p
    join northwind_mysql_2019.suppliers as s on p.SupplierID = s.SupplierID
    group by s.CompanyName
    )
	
    select CompanyName, ProductCount, MinPrice, MaxPrice
    from ProductSummary
    where ProductCount > 3 and MaxPrice > 50.00;
 
 