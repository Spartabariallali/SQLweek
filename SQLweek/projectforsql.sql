-- PROJECT--

--1.1--

SELECT c.CustomerID,c.CompanyName,c.Address,c.City,c.PostalCode,c.Country--retrieves all rows of customers from by the specified cities paris and london 
FROM customers c
WHERE c.City IN ('Paris','London')

--1.2--

SELECT p.ProductName, p.QuantityPerUnit
FROM Products p
WHERE QuantityPerUnit
LIKE '%bottle%'

--1.3--

SELECT p.ProductName AS "Product Name",p.QuantityPerUnit, s.companyName AS "Company Name",s.Country 
FROM products p JOIN suppliers s
ON p.supplierID=s.supplierID
WHERE QuantityPerUnit
LIKE '%bottle%'


--1.4-- 

SELECT c.CategoryName, COUNT(p.UnitsInStock) AS "amount of stock" -- productID 
FROM products p JOIN Categories c
ON p.CategoryID=c.CategoryID
GROUP BY c.CategoryName
ORDER BY "amount of stock" DESC



--1.5--

SELECT CONCAT(e.TitleOfCourtesy, ' ' ,e.FirstName, ' ' ,e.LastName) AS "Full name", e.City
FROM employees e
WHERE e.City IN ('London')

--1.6--


SELECT t.RegionID, 
FORMAT(SUM((od.UnitPrice*od.Quantity) * (1-od.discount)),'C') AS "total sales"  
FROM territories t JOIN employeeterritories et
ON t.territoryID=et.territoryID
JOIN employees e
ON et.employeeID=e.employeeID
JOIN orders o
ON e.employeeID=o.employeeID
JOIN [Order Details] od
ON o.OrderID=od.OrderID 
GROUP BY t.RegionID
HAVING SUM((od.UnitPrice*od.Quantity) * (1-od.discount)) >= 1000000 
ORDER BY RegionID DESC




--1.7--

SELECT  COUNT(o.Freight) AS "Freight count"
FROM orders o 
WHERE o.ShipCountry IN ('USA','UK') AND o.Freight > 100



--1.8--
/*
SELECT TOP 2 od.OrderID, od.unitprice,od.quantity,od.discount,
   SUM((od.UnitPrice*od.Quantity)*od.discount) AS "Largest Discount applied to order"
FROM [Order Details] od
GROUP BY od.OrderID
ORDER BY 'Largest Discount applied to order' DESC*/


SELECT TOP 1
FORMAT(SUM((od.Quantity * od.UnitPrice) * od.Discount),'C') AS "Highest Discount", od.OrderID
FROM [Order Details]od
GROUP BY od.OrderID
ORDER BY "Highest Discount" DESC;


SELECT TOP 1
FORMAT(SUM((od.Quantity * od.UnitPrice) * od.Discount),'C') AS "Highest Discount", od.OrderID
FROM [Order Details]od
GROUP BY od.OrderID
ORDER BY "Highest Discount" DESC;


