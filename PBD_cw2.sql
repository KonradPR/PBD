USE Northwind

-- zadanie 1

SELECT orderid, SUM(Unitprice*quantity) as 'Value' FROM [Order Details] GROUP BY orderid ORDER BY 2 DESC

SELECT TOP 10 orderid, SUM(Unitprice*quantity) as 'Value' FROM [Order Details] GROUP BY orderid ORDER BY 2 DESC

SELECT TOP 10  WITH TIES orderid, SUM(Unitprice*quantity) as 'Value' FROM [Order Details] GROUP BY orderid ORDER BY 2 DESC

-- zadanie2 2

SELECT productid, SUM(Quantity) as 'Ordered' FROM [Order Details] WHERE productid<3 GROUP BY productID

SELECT productid, SUM(Quantity) as 'Ordered' FROM [Order Details] GROUP BY productID 

SELECT productid, SUM(Quantity) as 'Ordered' FROM [Order Details] GROUP BY productID Having SUM(Quantity)>250

-- zadanie 3

SELECT productid, orderid, SUM(quantity) as 'total quantity' FROM [Order Details] GROUP BY ProductID, orderid WITH ROLLUP

SELECT productid, orderid, SUM(quantity) as 'total quantity' FROM [Order Details] GROUP BY ProductID, orderid WITH ROLLUP HAVING productid=50

/*waro�ci null w tych kolumnach oznaczaj� wiersze w kt�rych warto�ci 
by�y sumowane wedlug danej kolumny
*/

SELECT productid, GROUPING(productid), orderid, GROUPING(orderid), SUM(quantity) as 'total quantity' FROM [Order Details] GROUP BY ProductID, orderid WITH CUBE ORDER BY productid, orderid

/*W tym przypadku wiersze podsumowane maj� w kolumnach utworzonych 
funkcj� GROUPING warto�� 1, warto�ci szczeg�owe maj� warto�� 0*/

