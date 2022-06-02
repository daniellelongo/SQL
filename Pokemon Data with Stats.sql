--In this SQL code, I'm querying a database that's Pokemon Nexflix data to answer questions about the data. 


--What is the highest, lowest and average total stats for ONLY legendary pokemon.
SELECT MAX(Total) FROM pokemon WHERE Legendary ="True";
SELECT MIN(Total) FROM pokemon WHERE Legendary ="True";
SELECT ROUND(AVG(Total)) FROM pokemon WHERE Legendary ="True";

--What is the highest, lowest and average total stats for ALL pokemon.
SELECT MAX(Total) FROM pokemon; 
SELECT MIN(Total) FROM pokemon; 
SELECT ROUND(AVG(Total)) FROM pokemon;

--Using the average total stats for all pokemon found previously, group together the primary pokemon types that have pokemon whose average total stats that are higher and lower than the general average.
SELECT Type_1, ROUND(AVG(Total)) as average_type_stat_greater FROM pokemon GROUP BY Type_1 HAVING average_type_stat_greater > (SELECT ROUND(AVG(Total)) FROM pokemon);
SELECT Type_1, ROUND(AVG(Total)) as average_type_stat_less FROM pokemon GROUP BY Type_1 HAVING average_type_stat_less < (SELECT ROUND(AVG(Total)) FROM pokemon);

--How many pokemon can be grouped into each of Smogon's fundamental usage-based tiers based on their overall stats (Does not have to match smogens categorization) 
SELECT COUNT(*),
    CASE
        WHEN Total > 600 THEN "Ubers"
        WHEN Total > 500 THEN "Overused"
        WHEN Total > 400 THEN "Underused"
        WHEN total > 300 THEN "Rarely-Used"
        ELSE "Neverused"
    END as "battle_formats"
FROM pokemon GROUP BY battle_formats; 

--Show the name, total stats and legendary status of all pokemon with fire type as primary or secondary typing in generation 6.
SELECT Name, Total FROM pokemon WHERE (Type_1 = "Fire" OR Type_2 = "Fire") AND Generation = 6;

--How many pokemon only have one type?
SELECT COUNT(*) FROM pokemon WHERE Type_2 is NULL;

--Being the least common typing in the franchise, display the name of all ice type pokemon
SELECT Name FROM pokemon Type_1 = "Ice" OR Type_2 = "Ice";
