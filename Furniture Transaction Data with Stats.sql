--Query database holding Furniture Store Transaction data to answer business questions.

--Top five countries with the highest number of transactions
SELECT country, COUNT(transaction_date) AS number_of_transactions FROM sales 
GROUP BY country 
ORDER BY COUNT(transaction_date) DESC LIMIT 5;

--Highest priced product within a transaction
SELECT product, price, MAX(price) FROM sales;

--Lowest priced product within a transaction
SELECT product, price, MIN(price) FROM sales;

--Average price in all transactions
SELECT AVG(price) FROM sales;

--Total sales in each country
SELECT country, SUM(price) AS total_sales FROM sales 
GROUP BY country;

--Top five countries with the highest total sales?
SELECT country, SUM(price) as total_sales FROM sales 
GROUP BY country 
ORDER BY SUM(price) DESC LIMIT 5;

--Least profitable country?
SELECT country, SUM(price) as total_sales FROM sales 
GROUP BY country 
ORDER BY SUM(price) ASC LIMIT 1;

--Display the number of transactions for each payment type
SELECT payment_type, COUNT(payment_type) FROM sales 
GROUP BY payment_type 
ORDER BY COUNT(payment_type) DESC;

--What is the total sales of all transactions from each payment type?
SELECT payment_type, SUM(price) FROM sales 
GROUP BY payment_type;

--Display the total sales in all transactions from the cities including their states, in United States 
SELECT city, state, SUM(price) FROM sales 
WHERE country = "United states" 
GROUP BY city;
