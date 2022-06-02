--In this SQL code, I'm querying a database that's holding Furniture Store Transaction data to answer questions about the data. 

--Top five countries with the highest number of transactions
SELECT country, COUNT(transaction_date) AS number_of_transactions  FROM sales GROUP BY country ORDER BY COUNT(transaction_date) DESC LIMIT 5;

--Highest priced product within a transaction
SELECT product, price, MAX(price) FROM sales;

--Lowest priced product within a transaction
SELECT product, price, MIN(price) FROM sales;

--Average price in all transactions
SELECT AVG(price) FROM sales;

--Which countries have had transaction prices totalling over 5000?
SELECT country, SUM(price) FROM sales GROUP BY country HAVING SUM(price) > 5000;

--What are the top 5 credit card payment types with the highest number of transactions per country
SELECT country, payment_type, COUNT(payment_type) FROM sales GROUP BY country, payment_type ORDER BY COUNT(payment_type) DESC LIMIT 5;

--What is the total price of all transactions from each payment type?
SELECT payment_type, SUM(price) FROM sales GROUP BY payment_type;

--Display all transactions that occurred using a Diners payment type in the United States
SELECT * FROM sales WHERE payment_type = "Diners" AND price > (SELECT MIN(price) FROM sales);

--Display the average price in all transactions from the cities including their states, in United States 
SELECT city, state, AVG(price) FROM sales WHERE country = "United states" GROUP BY city;
