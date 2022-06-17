-- These basis of these scenarios will be that I've been hired at as a SQL consultant at a DVD rental store. 
-- The database being used mimics one that may exist for a DVD rental store with tables containing Customer info, Movie Info, Actor info, Staff info, Payment info etc.
-- The prompts and resulting queries will reflect possible real life examples of what a SQL consultant may be asked to do in this work environment.

-- Here are some example scenarios and what queries I would run to gather the necessary data/information:

-- We want to send out a promotional email to our existing customers
SELECT first_name, last_name, email FROM customer;

-- A foreign visitor isn't familiar with our MPAA movie ratings (PG, PG-13, R, etc).  We want to get all rating types we have within our system.
SELECT DISTINCT rating FROM film;

-- We are launching a platinum service for our most loyal customers that have had 40 or more transactions.  Which customers are eligible (Give their ID's)
SELECT customer_id, COUNT(payment_id) FROM payment 
GROUP BY customer_id 
HAVING COUNT(payment_id) >= 40;

-- A customer walks in and is a huge fan of the actor Nick Wahlberg.  Get them a list of all movies with Nick Wahlberg in them.
SELECT title FROM film 
INNER JOIN film_actor 
ON film.film_id = film_actor.film_id 
INNER JOIN actor
ON actor.actor_id = film_actor.actor_id 
WHERE actor.first_name = 'Nick' 
AND actor.last_name = 'Wahlberg';

-- How many payments occurred on a Monday?
SELECT COUNT(payment_id) FROM payment WHERE EXTRACT(DOW FROM payment_date) = 1;


-- What customer has the highest customer ID number whose name starts with an 'E' and has an address ID lower than 500?
SELECT first_name, last_name FROM customer 
WHERE first_name LIKE 'E%' 
AND address_id < 500 
ORDER BY customer_id DESC LIMIT 1;

-- A customer named Nancy Thomas forgot their wallet at our store.  We need to track down their email and inform them.
SELECT email FROM customer 
WHERE first_name = 'Nancy' 
AND last_name = 'Thomas';

-- A customer wants to know what the movie "Outlaw Hanky" is about. 
SELECT description FROM film 
WHERE title = 'Outlaw Hanky';

-- A customer is late on their movie return.  
-- We've already mailed a letter to their address at "259 Ipoh Drive" but we also want to call them.  Get the phone number for the person using their address.
SELECT phone FROM address 
WHERE address = '259 Ipoh Drive' 
OR address2 = '259 Ipoh Drive';

-- California sales tax laws have changed and we need to alert our customers of this. Get the name and emails of all customers who live in California.
SELECT first_name, last_name, email, district FROM customer
INNER JOIN address 
ON customer.address_id = address.address_id 
WHERE district = 'California';

-- We want to reward our first 10 paying customers! Get those customers names and customer ids.
SELECT customer_id FROM payment 
WHERE amount != 0 
ORDER BY payment_date ASC LIMIT 10;

-- We want to know and compare the amount of films we have per movie rating.
SELECT 
SUM(
CASE rating
	WHEN 'PG' THEN 1 ELSE 0
	END
) AS "PG",
SUM(
CASE rating
	WHEN 'PG-13' THEN 1 ELSE 0
	END
) AS "PG-13",
SUM(
CASE rating
	WHEN 'R' THEN 1 ELSE 0
	END
) AS "R",
SUM(
CASE rating
	WHEN 'NC-17' THEN 1 ELSE 0
	END
) AS "NC-17"
FROM film;

-- What are the customer ids of customers who have spent more than $100 in payment transactions with our staff member with staff ID of 2?
SELECT customer_id, SUM(amount) FROM payment 
WHERE staff_id = 2 
GROUP BY customer_id 
HAVING SUM(amount) > 100.00;

-- During which months did payments occur?
SELECT DISTINCT(TO_CHAR(payment_date, 'Month')) FROM payment;

-- A customer wants to rent a short video to watch over a lunch break.  Give them the 5 shortest movies available.
SELECT title, length FROM film 
ORDER BY length ASC LIMIT 5;

-- The same customer can watch any movie that is 50 minutes or less in run time. How many options do they have?
SELECT COUNT(title) FROM film 
WHERE length <= 50;

-- How many transactions were greater than $5.00?
SELECT COUNT(amount) FROM payment 
WHERE amount > 5.00;

-- How many actors have a first name that starts with the letter P?
SELECT COUNT(first_name) FROM actor 
WHERE first_name LIKE 'P%';

-- How many unique districts are our customers from?
SELECT COUNT(DISTINCT(district)) FROM address;

-- Retrieve a list of names for those distinct distrincts.
SELECT DISTINCT district FROM address;

-- How many films have a rating of R and a replacement cost between $5 and $15?
SELECT COUNT(title) FROM film 
WHERE rating = 'R' 
AND replacement_cost BETWEEN 5.00 AND 15.00;

-- How many films have the word "Truman" somewhere in the title?
SELECT COUNT(title) FROM film 
WHERE title LIKE '%Truman%';

-- We want to give a bonus to the staff member that processed the most payments. 
SELECT staff_id, COUNT (payment_id) FROM payment GROUP BY staff_id
ORDER BY COUNT(payment_id) DESC LIMIT 1;

-- Corporate HQ wants to see if there is a relationship between replacement cost of a movie and its rating.  
SELECT rating, ROUND(AVG(replacement_cost), 2) FROM film 
GROUP BY rating;

-- We are running a promotion to reward our top 5 biggest spending customers. Get the ID's of these customers in order to reward them with coupons.
SELECT customer_id, SUM(amount) FROM payment 
GROUP BY customer_id 
ORDER BY SUM(amount) DESC LIMIT 5;

-- Return the customer IDs of customers who have spent at least $110 with the staff member who has an ID of 2.
SELECT customer_id, SUM(amount) FROM payment
WHERE staff_id = 2 
GROUP BY customer_id 
HAVING SUM(amount) > 110.00;

-- How many films begin with the letter J?
SELECT COUNT(title) FROM film 
WHERE title LIKE 'J%';

