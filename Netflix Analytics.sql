--Query a database that contains Nexflix data to answer business questions.

--How many movie titles are there in the database? (movies only, not tv shows) 
SELECT COUNT(*) FROM "CharlotteChaze/BreakIntoTech"."netflix_titles_info" 
WHERE type = 'Movie';

--When was the most recent batch of tv shows and/or movies added to the database? 
SELECT DATE(date_added) FROM "CharlotteChaze/BreakIntoTech"."netflix_titles_info" 
WHERE date_added IS NOT NULL ORDER BY date_added DESC LIMIT 1;

--List all the movies and tv shows in alphabetical order. 
SELECT title, type FROM "CharlotteChaze/BreakIntoTech"."netflix_titles_info" 
ORDER BY title ASC;

--Who was the Director for the movie Bright Star? 
SELECT director FROM "CharlotteChaze/BreakIntoTech"."netflix_people" AS people 
LEFT JOIN "CharlotteChaze/BreakIntoTech"."netflix_titles_info" AS title 
ON people.show_id = title.show_id WHERE title.title = 'Bright Star';

--What is the oldest movie in the database? 
SELECT title, MIN(release_year) FROM "CharlotteChaze/BreakIntoTech"."netflix_titles_info" 
WHERE type ='Movie'
GROUP BY title, release_year 
ORDER BY release_year ASC LIMIT 1;

