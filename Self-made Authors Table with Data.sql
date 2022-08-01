--Create your own Table consisting of some small set of “famous people”, then make more tables about things they do and join them.
--I gathered information about popular authors and a handful of their popular books and used this data to create a database.

CREATE TABLE authors(id INTEGER PRIMARY KEY AUTOINCREMENT, fullname TEXT, nationality TEXT, age INTEGER, books_written INTEGER, books_sold INTEGER);

INSERT INTO authors (fullname, nationality, age, books_written, books_sold ) VALUES ("Stephan King", "American", 74, 62, 350000000);
INSERT INTO authors (fullname, nationality, age, books_written, books_sold ) VALUES ("J.K Rowling", "British", 56, 47, 500000000);
INSERT INTO authors (fullname, nationality, age, books_written, books_sold ) VALUES ("Amy Tan", "Chinese-American", 70, 39, NULL);
INSERT INTO authors (fullname, nationality, age, books_written, books_sold ) VALUES ("Khaled Hosseini", "Afghan-American", 57, 62, 38000000);
INSERT INTO authors (fullname, nationality, age, books_written, books_sold ) VALUES ("Tana French", "American-Irish", 49, 11, 7000000);
INSERT INTO authors (fullname, nationality, age, books_written, books_sold ) VALUES ("George R.R Martin", "American", 73, 50, 90000000);

CREATE TABLE books(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, release INTEGER, pages INTEGER, author_id INTEGER);

INSERT INTO books (title, release, pages, author_id) VALUES ("Nightmares in the Sky", 1988, 558, 1);
INSERT INTO books (title, release, pages, author_id) VALUES ("Faithful", 2004, 432, 1);
INSERT INTO books (title, release, pages, author_id) VALUES ("Doctor Sleep", 2013, 544, 1);
INSERT INTO books (title, release, pages, author_id) VALUES ("Harry Potter and the Philosopher's Stone", 1997, 544, 2);
INSERT INTO books (title, release, pages, author_id) VALUES ("The Casual Vacancy", 2012, 503, 2);
INSERT INTO books (title, release, pages, author_id) VALUES ("Fantastic Beasts and Where To Find Them", 2001, 128, 2);
INSERT INTO books (title, release, pages, author_id) VALUES ("The Joy Luck Club", 2006, 352, 3);
INSERT INTO books (title, release, pages, author_id) VALUES ("The Kitchen God's Wife", 2006, 416, 3);
INSERT INTO books (title, release, pages, author_id) VALUES ("The Bonesetter's Daughter", 2002, 416, 3);
INSERT INTO books (title, release, pages, author_id) VALUES ("The Kite Runner", 2004, 372, 4);
INSERT INTO books (title, release, pages, author_id) VALUES ("A Thousand Spendid Suns", 2008, 432, 4);
INSERT INTO books (title, release, pages, author_id) VALUES ("And The Mountains Echoed", 2014, 448, 4);
INSERT INTO books (title, release, pages, author_id) VALUES ("In the Woods", 2008, 496, 5);
INSERT INTO books (title, release, pages, author_id) VALUES ("Faithful Place", 2010, 400, 5);
INSERT INTO books (title, release, pages, author_id) VALUES ("The Trespasser", 2016, 464, 5);
INSERT INTO books (title, release, pages, author_id) VALUES ("Game of Thrones", 1996, 694, 6);
INSERT INTO books (title, release, pages, author_id) VALUES ("Fire and Blood", 2018, 736, 6);
INSERT INTO books (title, release, pages, author_id) VALUES ("A Dance with Dragons", 2011, 1016, 6);

--Display all authors and their corresponding books including their length.
SELECT authors.fullname AS author, books.title as books_written, books.pages AS pages FROM authors INNER JOIN books ON authors.id = books.author_id;

--Display the author and titles of all books that start with the word "The".
SELECT authors.fullname AS author, books.title as books_written FROM authors INNER JOIN books ON authors.id = books.author_id WHERE books.title LIKE "The%";

--What is the name of the author and the book with the most/least pages?
SELECT authors.fullname, books.title, MAX(books.pages) AS pages FROM authors INNER JOIN books ON authors.id = books.author_id;
SELECT authors.fullname, books.title, MIN(books.pages) AS pages FROM authors INNER JOIN books ON authors.id = books.author_id;

--What are the names of the authors and their corresponding book that were released after 2010?
SELECT authors.fullname, books.title, books.release FROM authors INNER JOIN books ON authors.id = books.author_id WHERE books.release > 2010; 

--Which 2 authors on average write the wordiest books?
SELECT authors.fullname, ROUND(AVG(books.pages)) as total_pages FROM authors INNER JOIN books ON authors.id = books.author_id GROUP BY authors.fullname ORDER BY total_pages DESC LIMIT 2;



