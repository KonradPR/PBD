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

/*waroœci null w tych kolumnach oznaczaj¹ wiersze w których wartoœci 
by³y sumowane wedlug danej kolumny
*/

SELECT productid, GROUPING(productid), orderid, GROUPING(orderid), SUM(quantity) as 'total quantity' FROM [Order Details] GROUP BY ProductID, orderid WITH CUBE ORDER BY productid, orderid

/*W tym przypadku wiersze podsumowane maj¹ w kolumnach utworzonych 
funkcj¹ GROUPING wartoœæ 1, wartoœci szczegó³owe maj¹ wartoœæ 0*/

