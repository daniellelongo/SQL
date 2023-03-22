--For this project, I downloaded Spotify data from Kaggle, created a table and inserted the Spotify data and performed analytics on the data using SQL. 

--Using the pre-existing columns in the data from kaggle, I created a table and added relevent data types and constraints.

CREATE TABLE BIT_DB.SpotifyData (
id integer PRIMARY KEY,
artist_name varchar NOT NULL,
track_name varchar NOT NULL,
track_id varchar NOT NULL,
popularity integer NOT NULL,
danceability decimal(4,3) NOT NULL,
energy decimal(4,3) NOT NULL,
key integer NOT NULL,
loudness decimal(5,3) NOT NULL,
mode integer NOT NULL,
speechiness decimal(5,4) NOT NULL,
acousticness decimal(6,5) NOT NULL,
instrumentalness text NOT NULL,
liveness decimal(5,4) NOT NULL,
valence decimal(4,3) NOT NULL,
tempo decimal(6,3) NOT NULL,
duration_ms integer NOT NULL,
time_signature integer NOT NULL 
)

--Once the table was created I inserted the Spotify Data .csv into the table.

--Finally, I explored the data using the following SQL: 

--Determine the Top 10 songs and corresponding artists by popularity
SELECT track_name, artist_name, popularity FROM BIT_DB.SpotifyData 
ORDER BY popularity DESC LIMIT 10;

--Which song has the most energy and the least energy?
SELECT track_name, MAX(energy) FROM BIT_DB.SpotifyData;
SELECT track_name, MIN(energy) FROM BIT_DB.SpotifyData;

--what is the average length of song in minutes?
SELECT ROUND(((AVG(duration_ms)/1000)/60),2) AS duration_mins FROM BIT_DB.SpotifyData;

--How many songs feature another artist? 
SELECT COUNT(track_name) FROM BIT_DB.SpotifyData WHERE track_name LIKE '%feat.%';

--which artist has the most/least danceable song?
SELECT artist_name, track_name, MAX(danceability) FROM BIT_DB.SpotifyData;
SELECT artist_name, track_name, MIN(danceability) FROM BIT_DB.SpotifyData;

--Top 5 songs with higher than average loudness?
SELECT track_name, loudness FROM BIT_DB.SpotifyData
WHERE loudness > (SELECT AVG(loudness) FROM BIT_DB.SpotifyData)
ORDER BY loudness DESC LIMIT 5;

--Which song involves the most spoken words?
SELECT track_name, MAX(speechiness) FROM BIT_DB.SpotifyData;

--Show the popularity of each individual song along with the overall average popularity of the artist.
SELECT artist_name, track_name, popularity,
AVG(popularity) OVER (PARTITION BY artist_name) AS "avg_popularity"
FROM SpotifyData;

--Label all artists with an average of 90 and up as "Top star".
WITH popularity_average AS (
  
SELECT artist_name,
AVG(popularity) AS average_popularity
FROM SpotifyData
GROUP BY artist_name
)

SELECT  artist_name, average_popularity, 'Top Star' AS tag
FROM popularity_average
WHERE average_popularity>=90;


