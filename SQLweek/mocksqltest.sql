/*1. Create a report showing the title of courtesy and the first and last name
of all employees whose title of courtesy is not "Ms." or "Mrs.".*/

SELECT*FROM Employees

SELECT e.TitleOfCourtesy, e.FirstName,e.LastName
FROM employees e
WHERE e.TitleOfCourtesy NOT IN ('Ms','Mrs')


/*2. Create a report that shows the company name, contact title, city and country of all customers 
in Mexico or in any city in Spain except Madrid(in Spain).*/

SELECT c.CompanyName,c.ContactTitle,c.City,c.Country
FROM customers c
WHERE c.Country IN ('Mexico', 'Spain') AND c.City NOT IN ('madrid')


/*3. Create a report showing the title of courtesy and the first and
last name of all employees whose title of courtesy begins with "M" and
is followed by any character and a period (.).*/

SELECT e.TitleOfCourtesy,e.FirstName,e.LastName
FROM Employees e
WHERE e.TitleOfCourtesy LIKE 'M%.'  



/*4. Create a report showing the first and last names of
all employees whose region is defined.*/


SELECT e.FirstName,e.LastName
FROM employees e 
WHERE e.Region != 'NULL' --FROM employees e WHERE e.region IS NOT NULL 


/*5. Select the Title, FirstName and LastName columns from the Employees table.
Sort first by Title in ascending order and then by LastName 
in descending order.*/


SELECT e.Title,e.FirstName,e.LastName
FROM employees e
ORDER BY e.Title, e.LastName DESC --- 

SELECT e.Title,e.FirstName,e.LastName
FROM employees e
ORDER BY e.LastName DESC

/*6. Write a query to get the number of employees with the same job title.*/



SELECT e.Title,
COUNT (e.EmployeeId) AS "Same ID"
FROM Employees e
GROUP BY e.Title

/*7.
Create a report showing the Order ID, the name of the company that placed the order,
and the first and last name of the associated employee.
Only show orders placed after January 1, 1998 that shipped after they were required.
Sort by Company Name.
*/


SELECT o.OrderID,o.OrderDate,o.ShippedDate,c.CompanyName,e.FirstName,e.LastName
FROM orders o INNER JOIN employees e
ON e.employeeID=o.employeeID
INNER JOIN customers c
ON o.CustomerID=c.CustomerID
WHERE o.OrderDate > '1998-01-10' AND o.ShippedDate > o.RequiredDate
ORDER BY c.CompanyName




/*8.
Create a report that shows the total quantity per products (from the OrderDetails table) ordered. Only show records for products for which the quantity ordered is fewer than 200. 
The report should return*/


SELECT p.ProductName, SUM(od.quantity) AS "Total units"
FROM [Order Details] od JOIN Products p 
ON p.ProductID=od.ProductID
GROUP BY p.ProductID, p.ProductName
HAVING SUM(od.Quantity) < 200

SELECT p.ProductName, SUM(od.Quantity) AS "TotalUnits"
FROM [Order Details] od JOIN Products p ON
	(p.ProductID = od.ProductID)
GROUP BY p.ProductID,p.ProductName
HAVING SUM(od.Quantity) < 200;  



/*9.Create a report that shows the total number of orders by Customer since December 31, 1996. The report should only return rows for which the NumOrders is greater than 15. 
*/

SELECT c.customerid, COUNT(o.OrderID) AS "number of orders"
FROM orders o INNER JOIN customers c
ON o.CustomerID=c.CustomerID
WHERE o.OrderDate >= '1996/12/31' -- where queries are performed on the actual table 
GROUP BY c.CustomerID
HAVING COUNT(o.OrderID) > 15 



/*10.  SQL statement will return all customers, and number of orders they might have placed. 
Include those customers as well who have not placed any orders.*/



SELECT c.CustomerID, COUNT(o.OrderID) AS "Number of orders"
FROM orders o RIGHT JOIN customers c 
ON o.customerid=c.customerid
GROUP BY c.CustomerID
ORDER BY COUNT(o.OrderID) 


