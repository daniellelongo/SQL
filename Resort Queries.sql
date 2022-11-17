--In this scenario I will be a SQL consultant for a vacation resort.
--The database consists of three tables, one for booking, one for facilities and one for members.

--The following queries will reflect what could be asked of me as a SQL consultant in this work environment:

--Retrieve all information about the facilities.
SELECT * FROM cd.facilities;

--Print out a list of all of the facilities and their cost to members.
SELECT name, membercost FROM cd.facilities;

--Produce a list with all information regarding the facilities that charge a fee to members.
SELECT * FROM cd.facilities 
WHERE membercost > 0;

--Produce a list of facilities that charge a fee to members, and that fee is less than 1/50th of the monthly maintenance cost.
SELECT facid, name, membercost, monthlymaintenance FROM cd.facilities 
WHERE membercost > 0 
AND membercost < ((1/50.0) * monthlymaintenance);

--Produce a list with all information regarding the facilities with the word 'Tennis' in their name.
SELECT * FROM cd.facilities 
WHERE name ILIKE '%Tennis%';

--Retrieve the details of facilities with ID 1 and 5.
SELECT * FROM cd.facilities 
WHERE facid IN (1,5);

--Produce a list of members who joined after the start of September 2012.
SELECT memid, surname, firstname, joindate FROM cd.members 
WHERE joindate >= '2012-09-01' 

--Produce an ordered list of the first 10 surnames in the members table.
SELECT DISTINCT surname FROM cd.members 
ORDER BY surname ASC LIMIT 10;

--Retrieve the signup date of your last member.
SELECT MAX(joindate) FROM cd.members;

--Produce a count of the number of facilities that have a cost to guests of 10 or more.
SELECT COUNT(facid) FROM cd.facilities 
WHERE guestcost >= 10;

--Produce a list of the total number of slots booked per facility in the month of September 2012
SELECT facid, SUM(slots) AS total_slots FROM cd.bookings 
WHERE starttime BETWEEN '2012-09-01' AND '2012-10-01' 
GROUP BY facid  
ORDER BY SUM(slots);

--Produce a list of facilities with more than 1000 slots booked.
SELECT facid, SUM(slots) AS total_slots FROM cd.bookings 
GROUP BY facid 
HAVING SUM(slots) > 1000 
ORDER BY facid ASC;

--Produce a list of the start times for bookings for tennis courts, for the date '2012-09-21'.
SELECT cd.bookings.starttime, cd.facilities.name FROM cd.bookings 
INNER JOIN cd.facilities 
ON cd.bookings.facid = cd.facilities.facid
WHERE DATE(starttime) = '2012-09-21' 
AND facilities.name IN ('Tennis Court 1','Tennis Court 2')
ORDER BY starttime;

--Produce a list of the start times for bookings by members named 'David Farrell'
SELECT cd.bookings.starttime FROM cd.bookings 
INNER JOIN cd.members 
ON cd.bookings.memid = cd.members.memid
WHERE (firstname || ' ' || surname) = 'David Farrell';

