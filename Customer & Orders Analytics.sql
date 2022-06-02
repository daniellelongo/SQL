--In this SQL, I'm querying a database with multiple tables in it to quantify statistics about customer and order data. 

--How many orders were placed in January? 
SELECT COUNT(*) FROM BIT_DB.JanSales

--How many of those orders were for an iPhone? 
SELECT COUNT(*) FROM BIT_DB.JanSales 
WHERE Product = 'iPhone';

--Select the customer account numbers for all the orders that were placed in February. 
SELECT acctnum FROM BIT_DB.customers
INNER JOIN BIT_DB.FebSales
ON customers.order_id = FebSales.orderID;

--Which product was the cheapest one sold in January, and what was the price?
SELECT DISTINCT product, MIN(price) FROM BIT_DB.JanSales
GROUP BY product, price O
RDER BY price ASC LIMIT 1

--What is the total revenue for each product sold in January?
SELECT SUM(Quantity)*price AS total_revenue, Product FROM BIT_DB.JanSales
GROUP BY Product;

--Which products were sold in February at 548 Lincoln St, Seattle, WA 98101, how many of each were sold, and what was the total revenue?
SELECT Product,SUM(Quantity), SUM(Quantity)*price AS total_revenue FROM BIT_DB.FebSales 
WHERE location = '548 Lincoln St, Seattle, WA 98101' 
GROUP BY product;

--How many customers ordered more than 2 products at a time, and what was the average amount spent for those customers? 
SELECT count(acctnum), AVG(Quantity)*price FROM BIT_DB.FebSales 
LEFT JOIN BIT_DB.customers 
ON FebSales.orderID = customers.order_id WHERE Quantity > 2;

--List all the products sold in Los Angeles in February, and include how many of each were sold.
SELECT Product, SUM(Quantity) FROM BIT_DB.FebSales 
WHERE location LIKE '%Los Angeles%' GROUP BY Product;

