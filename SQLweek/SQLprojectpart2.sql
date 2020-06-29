/**/
CREATE DATABASE bari_allali_db;
USE bari_allali_db

drop table sparta_table;

Create table sparta_table
(
    title VARCHAR(100),
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    University_name VARCHAR(100), 
    course VARCHAR(100), 
    graduation_date DATE,
    grade VARCHAR(100), 
);

SELECT * FROM sparta_table


INSERT INTO sparta_table
(title, first_name, last_name, University_name, course, graduation_date, grade)
VALUES
('Mr.', 'Bari', 'Allali', 'Lancaster University', 'Business Economics', '2018/06/23', 'Upper Second'), 
('Mr.', 'Mehdi', 'Shamaa', 'University of Nottingham', 'Philosophy and Economics', '2018/09/03', 'lower Second'),
('Mr.', 'Saheed', 'Lamina', 'University of Warwick', 'Politics and International Studies', '2018/06/13', 'Upper Second'),
('Mr.', 'John', 'Byrne', 'University of Greenwich', 'Computing with games development', '2019/02/12', 'Upper Second'),
('Mr.', 'Daniel ', 'Teegan ', 'University of Brighton', 'Product Design', '2017/07/09', 'Lower Second'),
('Mr.', 'Max', 'Palmer', 'University of Birmingham', 'Anciet History', '2020/07/20', 'Upper Second'),
('Mr.', 'Sohaib', 'Sohail', 'Brunel University London', 'Communications and Media Studies', '2019/06/04', 'Upper Second'),
('Mr.', 'Man-wai', 'Tse', 'University of Hertfordshire', 'Aerospace Engineering', '2018/05/20', 'Upper Second'),
('Mrs.', 'Anais', 'Tang', 'Edingburgh', 'Modern Language', '2018/02/19', 'Upper Second'),
('Mrs.', 'Georgina', 'Bartlett', 'Newcastle University', 'Archeology', '2019/09/20', 'Upper Second'),
('Mr.', 'Humza', 'Malak', 'University of Kent', 'Computer Science', '2018/09/30', 'Lower Second'),
('Mr.', 'Ibrahim', 'Bocus', 'University of Leicester', 'Mechanical Engineering', '2019/10/25', 'Upper Second')



SELECT * FROM sparta_table

--3.1
USE  Northwind

/*SELECT e.EmployeeID, CONCAT(e.FirstName, ' ' ,e.LastName) AS "Name of Employee", 
e.ReportsTo, CONCAT(e2.FirstName, ' ' ,e2.LastName) AS "Manager Name", e.Title
FROM Employees e, Employees e2
WHERE e2.EmployeeID = e.ReportsTo OR e2.EmployeeID = 2
ORDER BY e.Title*/

SELECT 
CONCAT (ee.FirstName, ' ', ee.LastName) AS "Worker",
CONCAT (e.FirstName, ' ', e.LastName) AS "Reports to",e.Title
FROM Employees e, Employees ee
WHERE e.EmployeeID = ee.ReportsTo
ORDER BY "Reports to"

--(ROUND(SUM(od.UnitPrice*od.Quantity) * (1-od.discount))

--3.2

SELECT s.CompanyName AS "Company Name", ROUND(SUM((od.UnitPrice*od.Quantity)*(1-od.Discount)),2)AS 'Total sales'
FROM [Order Details] od JOIN products p
ON od.productID=p.productID
JOIN suppliers s
ON p.supplierID=s.supplierID
GROUP BY p.SupplierID,s.CompanyName
HAVING SUM((od.UnitPrice*od.Quantity)*(1-od.Discount)) > 10000
ORDER BY s.CompanyName ASC

--3.3--

SELECT TOP 10 c.CustomerID,c.CompanyName, FORMAT(SUM((od.UnitPrice*od.Quantity)*(1-od.Discount)),'C') AS "YTD sales"
FROM Orders o JOIN customers c
ON o.customerID=c.customerID
JOIN [Order Details] od
ON o.OrderID=od.OrderID
WHERE YEAR(o.ShippedDate) = (SELECT YEAR(MAX(o.ShippedDate))FROM orders o)
AND o.ShippedDate IS NOT NULL
GROUP BY c.CompanyName, c.CustomerID
ORDER BY SUM(UnitPrice*Quantity * (1-Discount)) DESC

SELECT TOP 10 o.ShippedDate,c.CompanyName, FORMAT(SUM((od.UnitPrice*od.Quantity)*(1-od.Discount)),'C') AS "Total sales"
FROM Orders o JOIN customers c
ON o.customerID=c.customerID
JOIN [Order Details] od
ON o.OrderID=od.OrderID
GROUP BY c.CompanyName,o.ShippedDate
HAVING YEAR(o.ShippedDate) = (SELECT YEAR(MAX(o.ShippedDate))FROM orders o)
ORDER BY SUM((od.UnitPrice*od.Quantity)*(1-od.Discount)) DESC


--3.4--

/*SELECT sq1.[Monthordered], AVG(sq1.[ship time]) AS "average ship time"

FROM

    (SELECT SUM(DATEDIFF(d,o.OrderDate,o.ShippedDate)) AS "ship time",
 MONTH(o.OrderDate) AS "Monthordered"
 FROM Orders o
GROUP BY MONTH(O.OrderDate), o.OrderDate,o.ShippedDate, o.OrderID) 
sq1
GROUP BY sq1.Monthordered
ORDER BY 'monthordered' DESC*/


SELECT 
 FORMAT(o.ShippedDate, 'MMM-yy') AS "Shipping Month", -
 AVG(DATEDIFF(DAY, o.ShippedDate, o.OrderDate)) AS "Average Ship Time" 
FROM Orders o
WHERE o.ShippedDate IS NOT NULL 
GROUP BY 
 YEAR(o.ShippedDate),
 MONTH(o.ShippedDate),
 FORMAT(o.ShippedDate, 'MMM-yy')
ORDER BY 
 YEAR(o.ShippedDate), 
 MONTH(o.ShippedDate);


SELECT MONTH(OrderDate) Month, YEAR(OrderDate) Year, AVG(CAST(DATEDIFF(d, OrderDate, ShippedDate) As DECIMAL(10,2))) As ShipTime
	FROM orders 
	WHERE ShippedDate IS NOT NULL
	GROUP BY YEAR(OrderDate),MONTH(OrderDate)
	ORDER BY Year ASC, Month ASC

