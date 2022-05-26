--Create a fake clothing store database

CREATE TABLE clothing_store(id INTEGER PRIMARY KEY, item TEXT, quantity INTEGER, price INTEGER, aisle INTEGER);

INSERT INTO clothing_store VALUES(1,"T-Shirt", 20, 19.99, 1);
INSERT INTO clothing_store VALUES(2,"Tank Top", 18, 14.99, 1);
INSERT INTO clothing_store VALUES(3,"Crop Tops", 12, 10.69, 1);
INSERT INTO clothing_store VALUES(4,"Hoodies", 30, 26.49, 3);
INSERT INTO clothing_store VALUES(5,"Jackets", 10, 115.69, 5);
INSERT INTO clothing_store VALUES(6,"Long Sleeve Shirt", 15, 20.95, 2);
INSERT INTO clothing_store VALUES(7,"Flannels", 18, 22.49, 2);
INSERT INTO clothing_store VALUES(8,"Zip Ups", 22, 24.95, 3);
INSERT INTO clothing_store VALUES(9,"Rain Coat", 11, 30.99, 4);
INSERT INTO clothing_store VALUES(10,"Winter Coat", 19, 200.49, 4);
INSERT INTO clothing_store VALUES(11,"Sneakers", 29, 49.69, 6);
INSERT INTO clothing_store VALUES(12,"Boots", 13, 79.49, 5);
INSERT INTO clothing_store VALUES(13,"Shorts", 27, 35.89, 7);
INSERT INTO clothing_store VALUES(14,"Jeans", 30, 50.15, 7);
INSERT INTO clothing_store VALUES(15,"Long Pants", 7, 48.62, 7);

--display the database ordered by price.
SELECT * FROM clothing_store ORDER BY price ASC;

--Which items and their prices are in the first 3 aisles?
SELECT item, price FROM clothing_store WHERE aisle IN (1,2,3) ORDER BY price ASC;

--which which aisles hold items that are more than 50 dollars?
SELECT aisle, item FROM clothing_store WHERE price > 50.00 GROUP BY item; 

--what is the most expensive item in the store?
SELECT item, MAX(price) FROM clothing_store;

--what is the least expensive item in the store?
SELECT item, MIN(price) FROM clothing_store;

--what is the average price of all items in the store?
SELECT ROUND(AVG(price), 2) FROM clothing_store;

--(Assuming more quantity means an item is being bought less) What are the top 5 least popular items?
SELECT item, price, quantity FROM clothing_store ORDER BY quantity DESC LIMIT 5;
