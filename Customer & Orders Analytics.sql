--SQL queries that quantify statistics about customer and order data. 

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

--Which locations in New York received at least 3 orders in January, and how many orders did they each receive?
SELECT DISTINCT location, COUNT(orderID) FROM BIT_DB.JanSales
WHERE location LIKE '%NY%' 
GROUP BY location 
HAVING COUNT(orderID) >= 3;

--How many of each type of headphone were sold in February?
SELECT Product, SUM(Quantity) FROM BIT_DB.FebSales 
WHERE Product LIKE '%Headphones%' 
GROUP BY Product;

--What was the average amount spent per account in February? 
SELECT SUM(Quantity * price)/COUNT(customers.acctnum) AS avg_spent_per_acc FROM BIT_DB.FebSales 
LEFT JOIN BIT_DB.customers 
ON FebSales.orderID = customers.order_id;

--What was the average quantity of products purchased per account in February?
SELECT SUM(Quantity)/COUNT(customers.acctnum) AS avg_qty_per_acc FROM BIT_DB.FebSales 
LEFT JOIN BIT_DB.customers 
ON FebSales.orderID = customers.order_id;

--Which product brought in the most revenue in January and how much revenue did it bring in total? 
SELECT Product, SUM(Quantity*price) AS most_revenue FROM BIT_DB.JanSales 
GROUP BY Product 
ORDER BY SUM(Quantity*price) DESC LIMIT 1
