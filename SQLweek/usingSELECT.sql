

SELECT * FROM customers
WHERE City='Paris'

SELECT COUNT(*) AS "Number of employees in London" FROM Employees --4--
WHERE City='London'

SELECT COUNT(*) AS " Number of people with title of Dr." FROM Employees 
WHERE TitleOfCourtesy='Dr.'

SELECT * FROM Products

SELECT COUNT(*) AS "Number of product that discontinued" FROM Products
WHERE Discontinued=1


--------------------TOP - AND, OR, WILDCARDS----------------------

SELECT CompanyName, city, country, Region
FROM Customers WHERE region='bc'

SELECT c.CompanyName, c.City, c.Country, c.Region
FROM customers c -- table alias giving a short hand name for the table
WHERE c.Region='bc'

 
---- TOP - returns the top 100 results

SELECT COUNT(*) FROM customers WHERE Country='FRANCE'

--- AND - all the criteria needs to be fulfilled 
---OR - either of the criterias need to be fulfilled 

SELECT p.ProductName,p.UnitPrice, p.CategoryID, p.Discontinued
FROM products p
WHERE CategoryID= 1 AND Discontinued = 0

SELECT p.ProductName,p.UnitPrice, p.CategoryID, p.Discontinued
FROM products p
WHERE CategoryID= 1 OR Discontinued = 0


---------OPERATORS--------------------------

/* 
<> or != not equal to
< less than
> greater than
<= less than or equal to
>= greater than or equal to
*/

SELECT p.ProductName, p.UnitPrice
FROM Products p
WHERE p.UnitsInStock > 0 AND p.UnitPrice > 29.99

SELECT p.ProductName, p.UnitPrice
FROM Products p
WHERE p.UnitsInStock > 0 OR p.UnitPrice > 29.99

------- DISTINCT----------------------
-- DISTINCT - removes duplicates from the data 

SELECT DISTINCT c.country
FROM Customers c

---------- WILDCARD----------------
-- WILDCARDS - can be used as a substitute for any other characters in a string when using the LIKE operator

SELECT c.Country
FROM customers c 
WHERE Country LIKE 'B%'

--- countries that end with letter A example-------

SELECT DISTINCT c.Country
FROM customers c 
WHERE Country LIKE '%A'

---- countries beginning with U and ending with A example-----

SELECT DISTINCT c.Country
FROM customers c 
WHERE Country LIKE 'U%A'

---- countries starting with U or A or M---------

SELECT DISTINCT c.Country
FROM customers c 
WHERE Country LIKE '[UAM]%' -


---- countries ending with U or A or M---------

SELECT DISTINCT c.Country
FROM customers c 
WHERE c.Country LIKE '%[UAM]' 

----- countries that do not start with U, A or M-------------

SELECT DISTINCT c.Country
FROM customers c 
WHERE c.Country LIKE '[^UAM]%' 

--- countries whose third letter is A---------

SELECT DISTINCT c.Country
FROM customers c 
WHERE c.Country LIKE '__A%'

SELECT p.ProductName
FROM Products p
WHERE p.ProductName LIKE '%Ch'


SELECT * FROM Customers c WHERE c.region LIKE '%A'


--------- IN ---------------

SELECT p.ProductName,p.UnitPrice, p.CategoryID, p.Discontinued
FROM products p
WHERE p.CategoryID IN (1,2,3,4,5) 

--- how can we re-write the IN statement wihtout using the IN operator------
---- include country: BRAZIL------------

SELECT * FROM Customers WHERE (Region = 'WA' OR Region= 'SP') AND country='brazil'

SELECT * FROM customers WHERE Region IN ('WA','SP') AND Country IN ('BRAZIL','USA')


------BETWEEN----- used to find territories and includes the boundaries----------- 

SELECT * FROM EmployeeTerritories
WHERE TerritoryID BETWEEN 06800 AND 09999

SELECT p.ProductID, UnitPrice
FROM Products p
WHERE UnitPrice < 5.00


SELECT c.CategoryName
FROM Categories c
WHERE c.CategoryName LIKE 'B%' OR c.CategoryName LIKE 'S%'

SELECT c.CategoryName
FROM Categories c 
WHERE c.CategoryName LIKE '[BS%]'

SELECT * FROM Employees
WHERE EmployeeID IN ('5','7')

SELECT * FROM Orders
WHERE EmployeeID IN 5 AND 7 


------------- How many orders placed by employeeID -5 and 7---------


SELECT COUNT(*) AS "count of orders placed by employees"
FROM Orders
WHERE EmployeeID IN (5,7)
GROUP BY EmployeeID 

----- concatenate --------------

SELECT CompanyName AS 'Company Name', ---- Changing the name of CompanyName to Company Name 
CONCAT (city,  ', ' ,country) AS "city" --- 
FROM Customers


SELECT * FROM Employees

SELECT FirstName, LastName 
CONCAT (FirstName, ' ' ,LastName) AS "Employee Name"
FROM Employees

SELECT CompanyName AS 'Company Name', 
CONCAT (city, ',' Country) AS "City"
WHERE region is NULL

SELECT TOP 6 c.Country, C.Region
FROM Customers c
WHERE region is NOT NULL

------- ARTIHMETIC OPERATORS-----------
/*

+
-
*
/
% 

*/



--------------- GROSS TOTAL------------------
-- £20
-- £15

SELECT * FROM [Order Details]

SELECT od.UnitPrice, od.Quantity, od.Discount,
    unitprice * quantity AS "Gross Total",
   ROUND((unitprice * quantity) - (unitprice * Discount),2)  AS "Net Total"
FROM [Order Details] od
ORDER BY 'Gross Total' DESC ---- sorts the data by descending 

SELECT TOP 2 od.UnitPrice, od.Quantity, od.Discount, od.OrderID,
    unitprice * quantity AS "Gross Total",
   ROUND((unitprice * quantity) - (unitprice * Discount),2)  AS "Net Total"
FROM [Order Details] od
ORDER BY 'Net Total' DESC ---- sorts the data by descending 


------------- STRING FUNCTIONS----------------------------------

/* SUBSTRING(expression, start, length)
   SUBSTRING(name,1,1) for the initial
*/

SELECT c.Postalcode "post code", ---- change column to post code from PostalCode-----
LEFT(c.Postalcode, CHARINDEX(' ',c.PostalCode)-1) AS "Post code Region", --- 
    CHARINDEX(' ',c.PostalCode) AS "Space Found", c.Country
FROM Customers c
WHERE c.country ='UK'

SELECT p.ProductName, p.ProductID,
CHARINDEX
FROM Products p


SELECT p.ProductName "Product Names",
CHARINDEX('''',p.ProductName) AS "Index of Quote"
FROM Products p 
WHERE CHARINDEX('''',p.ProductName) > 0




/*STRING FUNCTIONS*/

DROP TABLE film_table

CREATE TABLE film_table(
    film_id INT IDENTITY(1,1) PRIMARY KEY,
    film_name VARCHAR(50) NOT NULL,
    film_type VARCHAR(50)
)

INSERT INTO film_table VALUES
('    Star Wars', 'Sci fi'),
('Star Trek    ', 'Sci fi')

INSERT INTO film_table VALUES
('Batman', 'Action')


INSERT INTO film_table
(film_name) VALUES
('Superman')


SELECT * FROM film_table

SELECT * FROM film_table

------- STRING FUNCTION-----------------------

SELECT film_name, CHARINDEX('s', film_name) AS "Position of Character" FROM film_table ; --- lets you know the position of the index of the character you're looking for 

SELECT film_name, SUBSTRING(film_name, 1, 3) AS "Extracted String" FROM film_table ---- substring (1,3) begin with 1 and then do the length of 3 characters and return that character 

SELECT film_name, RIGHT(film_name, 3) AS "Extracted String" FROM film_table ---- extract characters from the right --- depending on the number for example - 2 extracts the last 2 characters from the string

SELECT film_name, LEFT(film_name, 2) AS "Extracted String" FROM film_table ---- extract characters from the left-hand-side -- depending on the number chosen for example 2 extracts the first 2 characters of a string 

SELECT film_name, RTRIM(film_name) AS "Trimmed String" FROM film_table ---- used to remove spaces at the beginning or at the end of a string -- right trimmed string

SELECT film_name, LTRIM(film_name) AS "Trimmed String" FROM film_table ---- used to remove spaces at the beginning or at the end of a string -- left trimmed string

SELECT film_name, REPLACE(film_name,'A','Z') AS "Replaced String" FROM film_table --- replaces the spaces with character  - the characters within the speech mark with the chosen character 


SELECT film_name, LEN(film_name) AS "LENGTH of String" FROM film_table --- returns the length (of characters, including spaces) of the string

SELECT film_name, UPPER(film_name) AS "Uppercase String", LOWER(film_name) AS "Lowercase String" FROM film_table --- puts the whole content of the table in in either UPPER case or LOWER case 




SELECT postalcode "post code",
LEFT(postalcode, CHARINDEX('',PostalCode)-1)AS "Post code Region",
    CHARINDEX('',PostalCode)AS "Space Found", Country
FROM customers
WHERE country ='UK'


SELECT PostalCode "Post Code",
LEFT(PostalCode,CHARINDEX('',PostalCode)-1)AS "Post code Region",
    CHARINDEX('',PostalCode) AS "Space Found", Country
FROM customers
WHERE country='UK'




-------------- DATE FUNCTIONS-------------------------

/*
GETDATE --- returns the current date 
SYSDATETIME --- returns the data and time of the sytem the command is run on 
DATEADD --- (d,5,OrderDate) AS "Due Date" --- add 5 days 
DATEDIFF --- calculates the difference between dates 
YEAR-- Extracts year from a date 
MONTH--- extracts month from a date 
DAY-- extract a day from a date 
*/

SELECT DATEADD(d,5,OrderDate) AS"Due date",
DATEDIFF(d,OrderDate,ShippedDate) AS "Ship days"
FROM Orders

SELECT * FROM Employees

SELECT
CONCAT(e.FirstName, ' ', e.LastName) AS 'Full Name',
DATEDIFF(YEAR, e.BirthDate, GetDate())  as Age
FROM Employees e


SELECT
CONCAT(e.FirstName, ' ', e.LastName) AS 'Full Name',
(DATEDIFF(DAY, e.BirthDate, GetDate()) / 365.25)  as Age
FROM Employees e



-------- SELECT CASE STATEMENTS-----------------------


SELECT CASE
WHEN DATEDIFF(d,OrderDate,ShippedDate)<10 THEN 'ON TIME'
ELSE 'over due'
END AS 'status'
FROM Orders




SELECT FirstName,LastName, 
CONCAT(FirstName, ',' ,LastName) AS 'Full Name',
CASE
WHEN DATEDIFF(YEAR,BirthDate,GETDATE()) > 65 THEN 'retired'
WHEN DATEDIFF(YEAR,BirthDate,GETDATE()) >= 65 THEN 'retirement due'
ELSE 'more than 5 years to go'
END AS "Retirement status"
FROM Employees


------ AGGREGATE FUNCTIONS---------------------

SELECT SUM(UnitsOnOrder) AS "Total on order",
AVG(UnitsOnOrder) AS "Average on order",
MIN(UnitsOnOrder) AS "Min on Order",
MAX(UnitsOnOrder) AS "Max on Order"
FROM Products

SELECT * FROM Products


/* Calculate UnitsOnOrder using aggregate functions per supplier */ 

SELECT SupplierID, SUM(UnitsOnOrder) AS "Total on order",
AVG(UnitsOnOrder) AS "Average on order",
MIN(UnitsOnOrder) AS "Min on Order",
MAX(UnitsOnOrder) AS "Max on Order"
FROM Products
GROUP BY SupplierID
HAVING AVG(UnitsOnOrder) >5 -----

SELECT * FROM Products


SELECT TOP 10 SUM(UnitsOnOrder) AS "Total on order",
AVG(ReorderLevel) AS "Average ReorderLevel",
MIN(ReorderLevel) AS "Min ReorderLevel",
MAX(ReorderLevel) AS "Max ReorderLevel"
FROM Products
GROUP BY SupplierID

SELECT p.CategoryID,
AVG(p.reorderlevel) AS "AVG reorder level"
From Products p 
GROUP BY p.CategoryID 
ORDER BY "AVG reorder level" DESC;
HAVING AVG()





SELECT * FROM Customers -- took customerID and ContactName from CUSTOMERS database
SELECT * FROM Orders -- employeeID and ship city for orders database

--Left Join
SELECT c.customerID, c.contactName, o.employeeID, o.ShipCity
FROM orders o 
LEFT JOIN customers c
ON c.customerID = o.CustomerID -- linking the primary key in table 1 to foregin key in table 2 
ORDER BY EmployeeID;





------ joins----------

-- Combine matched rows from two or more tables-----






SELECT 
SupplierID,
AVG(p.UnitsOnOrder) AS "Avg on order"
FROM Products p
GROUP BY SupplierID




--FUll Join
SELECT c.customerID, c.contactName, o.employeeID, o.ShipCity
FROM orders o 
FULL JOIN customers c
ON c.customerID = o.CustomerID
ORDER BY EmployeeID;
 
--INNER JOIN 
SELECT c.customerID, c.contactName, o.employeeID, o.ShipCity
FROM orders o 
INNER JOIN customers c
ON c.customerID = o.CustomerID
ORDER BY EmployeeID;
 
--Left Join
SELECT c.customerID, c.contactName, o.employeeID, o.ShipCity
FROM orders o 
LEFT JOIN customers c
ON c.customerID = o.CustomerID
ORDER BY EmployeeID;
 
--Right Join
SELECT c.customerID, c.contactName, o.employeeID, o.ShipCity
FROM orders o 
RIGHT JOIN customers c
ON c.customerID = o.CustomerID
ORDER BY EmployeeID;