
-- 1.1
SELECT CompanyName, sum(quantity) FROM Customers as c
INNER JOIN Orders as o ON o.CustomerID=c.CustomerID
INNER JOIN [Order Details] as d ON d.OrderID=o.OrderID
GROUP BY o.OrderID, CompanyName

-- 1.2
SELECT CompanyName, sum(quantity) FROM Customers as c
INNER JOIN Orders as o ON o.CustomerID=c.CustomerID
INNER JOIN [Order Details] as d ON d.OrderID=o.OrderID
GROUP BY o.OrderID, CompanyName
HAVING sum(quantity)>250

-- 1.3
SELECT CompanyName, round(sum(quantity*d.UnitPrice*(1-Discount)),2) FROM Customers as c
INNER JOIN Orders as o ON o.CustomerID=c.CustomerID
INNER JOIN [Order Details] as d ON d.OrderID=o.OrderID
INNER JOIN Products as p ON p.ProductID=d.ProductID
GROUP BY d.OrderID, CompanyName

-- 1.4
SELECT CompanyName, round(sum(quantity*d.UnitPrice*(1-Discount)),2) FROM Customers as c
INNER JOIN Orders as o ON o.CustomerID=c.CustomerID
INNER JOIN [Order Details] as d ON d.OrderID=o.OrderID
INNER JOIN Products as p ON p.ProductID=d.ProductID
GROUP BY d.OrderID, CompanyName
HAVING sum(Quantity)>250

-- 1.5
SELECT CompanyName, round(sum(quantity*d.UnitPrice*(1-Discount)),2), LastName+' '+FirstName as Employee FROM Customers as c
INNER JOIN Orders as o ON o.CustomerID=c.CustomerID
INNER JOIN [Order Details] as d ON d.OrderID=o.OrderID
INNER JOIN Products as p ON p.ProductID=d.ProductID
INNER JOIN Employees as e ON o.EmployeeID=e.EmployeeID
GROUP BY d.OrderID, CompanyName, LastName, FirstName
HAVING sum(Quantity)>250

-- 2.1
SELECT CategoryName, sum(quantity) as quantity FROM Categories as c
INNER JOIN Products as p ON c.CategoryID=p.CategoryID
INNER JOIN [Order Details] as d ON d.ProductID=p.ProductID
GROUP BY CategoryName


-- 2.2
SELECT CategoryName, round(sum(quantity*d.UnitPrice*(1-Discount)),2) as sumary FROM Categories as c
INNER JOIN Products as p ON c.CategoryID=p.CategoryID
INNER JOIN [Order Details] as d ON d.ProductID=p.ProductID
GROUP BY CategoryName

-- 2.3
SELECT CategoryName, round(sum(quantity*d.UnitPrice*(1-Discount)),2) as sumary FROM Categories as c
INNER JOIN Products as p ON c.CategoryID=p.CategoryID
INNER JOIN [Order Details] as d ON d.ProductID=p.ProductID
GROUP BY CategoryName
ORDER BY sum(quantity*d.UnitPrice*(1-Discount))

SELECT CategoryName, sum(quantity) as quantity FROM Categories as c
INNER JOIN Products as p ON c.CategoryID=p.CategoryID
INNER JOIN [Order Details] as d ON d.ProductID=p.ProductID
GROUP BY CategoryName
ORDER BY sum(quantity)

-- 3.1
SELECT  CompanyName, count(*) as shippings FROM Shippers as s
LEFT JOIN Orders as o ON o.ShipVia=s.ShipperID AND YEAR(ShippedDate)=1997
GROUP BY CompanyName

-- 3.2
SELECT TOP 1  CompanyName FROM Shippers as s
LEFT JOIN Orders as o ON o.ShipVia=s.ShipperID AND YEAR(ShippedDate)=1997
GROUP BY CompanyName
ORDER BY count(*) DESC

-- 3.3
SELECT  TOP 1 lastname+' '+firstname FROM Employees as e
INNER JOIN Orders as o ON o.EmployeeID=e.EmployeeID
GROUP BY LastName, FirstName, e.EmployeeID
ORDER BY count(*) DESC

-- 4.1
SELECT lastname+' '+firstname, round(sum(quantity*d.UnitPrice*(1-Discount)),2) as summary FROM Employees as e
LEFT JOIN Orders as o ON o.EmployeeID=e.EmployeeID
LEFT JOIN [Order Details] as d ON d.OrderID=o.OrderID
GROUP BY LastName, FirstName,e.EmployeeID

-- 4.2
SELECT TOP 1 lastname+' '+firstname, round(sum(quantity*d.UnitPrice*(1-Discount)),2) as summary FROM Employees as e
LEFT JOIN Orders as o ON o.EmployeeID=e.EmployeeID
LEFT JOIN [Order Details] as d ON d.OrderID=o.OrderID
GROUP BY LastName, FirstName,e.EmployeeID
ORDER BY 2 DESC

-- 4.3
SELECT  e.lastname+' '+e.firstname, round(sum(quantity*d.UnitPrice*(1-Discount)),2) FROM Employees as e
LEFT JOIN Employees as r ON e.EmployeeID=r.ReportsTo
LEFT JOIN Orders as o ON o.EmployeeID=e.EmployeeID
LEFT JOIN [Order Details] as d ON d.OrderID=o.OrderID 
WHERE r.EmployeeID IS NOT NULL
GROUP BY e.LastName, e.FirstName,e.EmployeeID

SELECT  e.lastname+' '+e.firstname, round(sum(quantity*d.UnitPrice*(1-Discount)),2) FROM Employees as e
LEFT JOIN Employees as r ON e.EmployeeID=r.ReportsTo
LEFT JOIN Orders as o ON o.EmployeeID=e.EmployeeID
LEFT JOIN [Order Details] as d ON d.OrderID=o.OrderID 
WHERE r.EmployeeID IS  NULL
GROUP BY e.LastName, e.FirstName,e.EmployeeID


