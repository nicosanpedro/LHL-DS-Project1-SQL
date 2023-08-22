--products purchased with 
SELECT *
FROM products;

SELECT productid
FROM order_details;

--quantity purchased 

SELECT productname, quantity
FROM order_details
JOIN products
ON products.productid = order_details.productid;



--total revenue made by the product
SELECT productid, quantity
FROM order_details;

SELECT productname, quantity, o.unitprice, o.quantity, o.discount
FROM order_details o
JOIN products pr
ON pr.productid = o.productid;

SELECT productname,SUM(o.quantity) as totalsum, SUM((o.unitprice * o.quantity) * (1 - o.discount)) as totalrev
FROM order_details o
JOIN products pr
ON pr.productid = o.productid
GROUP BY productname
ORDER BY productname;

-- sort the results in alphabetical order
SELECT productname,SUM(o.quantity) as totalsum, SUM((o.unitprice * o.quantity) * (1 - o.discount)) as totalrev
FROM order_details o
JOIN products pr
ON pr.productid = o.productid
GROUP BY productname
ORDER BY productname ASC;





--top 5 most popular product with

WITH cte_productsales AS(
	SELECT productname,SUM(o.quantity) as totalsum, SUM((o.unitprice * o.quantity) * (1 - o.discount)) as totalrev
	FROM order_details o
	JOIN products pr
	ON pr.productid = o.productid
	GROUP BY productname
	ORDER BY productname ASC
)

SELECT productname, totalsum as quantity
FROM cte_productsales
ORDER BY quantity DESC
LIMIT 5;



--GET ALL ORDERS MADE ON NOVERMBER 1996

WITH cte_nov1996_cust as(
	SELECT customerid
	FROM orders
	WHERE orderdate BETWEEN '1996-11-01' AND '1996-11-30'
)

--

SELECT *
FROM customers cus
JOIN cte_nov1996_cust cid
ON cus.customerid = cid.customerid;

--






--most expensive product
-- use the unit price
WITH cte_productprice AS(
	SELECT pr.productname, MAX(o.unitprice)
	FROM order_details o
	JOIN products pr
	ON pr.productid = o.productid
	GROUP BY productname, o.unitprice
	ORDER BY o.unitprice DESC
	LIMIT 1
)

SELECT *
FROM cte_productprice;



--customers who made an order along with their company name and their number of orders

--COMPANY NAME AND NUMBER OF ORDERS
SELECT cus
FROM orders;

WITH cte_custid AS(
	SELECT customerid, COUNT(customerid) AS ordernumer
	FROM orders
	GROUP BY customerid
)

SELECT companyname, ordernumer, cus.contactname
FROM customers cus
JOIN cte_custid cid
ON cus.customerid = cid.customerid
ORDER BY companyname ASC;


SELECT 

--SORT BY CONTACT NAME ALPH

--EXCLUDE DUPLICATES
--COMPANY, CONTACT NAME 


--show the number of orders shipped
SELECT *
FROM orders
WHERE shippeddate IS NOT NULL
ORDER BY shippeddate ASC;


SELECT COUNT(ORDERID)
FROM orders
WHERE shippeddate IS NOT NULL
ORDER BY shippeddate ASC;


--convert date to month format
TO_CHAR(shippeddate, 'MONTH') as somethingmonth

WITH cte_month(
		SELECT *
		FROM orders
		WHERE shippeddate IS NOT NULL
	)
ORDER BY shippeddate ASC;


