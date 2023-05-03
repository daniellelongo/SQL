--This sample database represents a digital media store, including tables for artists, albums, media tracks, invoices, and customers.

--Here I will create questions and use SQL queries to provide insight.


--Show Customers (their full names, customer ID, and country) who are not in the US. 
SELECT FirstName, LastName, CustomerId, Country FROM chinook.customers 
WHERE COUNTRY != 'USA';

--Show only the Customers from Brazil.
SELECT * FROM chinook.customers
WHERE COUNTRY = 'Brazil';

--Find the Invoices of customers who are from Brazil. The resulting table should show the customer's full name, Invoice ID, Date of the invoice, and billing country.
SELECT FirstName, LastName, InvoiceId, InvoiceDate, BillingCountry FROM chinook.invoices 
LEFT JOIN chinook.customers 
ON invoices.CustomerId = customers.CustomerId
WHERE BillingCountry = 'Brazil';

--Show the Employees who are Sales Agents.
SELECT FirstName, LastName, EmployeeId, Title FROM chinook.employees 
WHERE Title LIKE '%Sales% %Agent%';

--Find a unique/distinct list of billing countries from the Invoice table.
SELECT DISTINCT BillingCountry FROM chinook.Invoices;

--Provide a query that shows the invoices associated with each sales agent. The resulting table should include the Sales Agent's full name.
SELECT Employees.FirstName, Employees.LastName, InvoiceId FROM chinook.employees 
JOIN chinook.customers 
ON employees.EmployeeId = customers.SupportRepId 
JOIN chinook.invoices 
ON customers.CustomerId = Invoices.CustomerId 
WHERE employees.Title = 'Sales Support Agent';

--Show the Invoice Total, Customer name, Country, and Sales Agent name for all invoices and customers.
SELECT 
  employees.FirstName AS emp_first, 
  employees.LastName AS emp_last, 
  customers.FirstName AS cust_first,
  customers.LastName AS cust_last, 
  customers.Country, 
  Invoices.Total 
FROM chinook.employees 
JOIN chinook.customers 
ON employees.EmployeeId = customers.SupportRepId 
JOIN chinook.invoices 
ON customers.CustomerId = Invoices.CustomerId;

--How many Invoices were there in 2009?
SELECT COUNT(*) FROM chinook.invoices 
WHERE InvoiceDate BETWEEN '2009-01-01' AND '2009-12-31';

--What are the total sales for 2009?
SELECT SUM(total) FROM chinook.invoices
WHERE InvoiceDate BETWEEN '2009-01-01' AND '2009-12-31';

--Write a query that includes the purchased track name with each invoice line item.
SELECT tracks.name, invoice_items.InvoiceLineId FROM chinook.invoice_items 
INNER JOIN chinook.tracks 
ON invoice_items.TrackId = tracks.TrackId;

--Write a query that includes the purchased track name AND artist name with each invoice line item.
SELECT tracks.Name AS track_name, artists.Name AS artist_name, invoice_items.InvoiceLineId FROM chinook.invoice_items 
JOIN chinook.tracks 
ON invoice_items.TrackId = tracks.TrackId 
JOIN chinook.albums 
ON tracks.AlbumId = albums.AlbumId 
JOIN chinook.artists 
ON albums.ArtistId = artists.ArtistId;

--Provide a query that shows all the Tracks, and include the Album name, Media type, and Genre.
SELECT tracks.name AS track_name, albums.title AS album_title, media_types.name AS media_type, genres.name AS genre FROM chinook.tracks
JOIN chinook.albums 
ON tracks.AlbumId = albums.AlbumId
JOIN chinook.media_types 
ON tracks.MediaTypeId = media_types.MediaTypeId
JOIN chinook.genres 
ON tracks.GenreId = genres.GenreId;

--Show the total sales made by each sales agent.
SELECT employees.firstname, employees.lastname, SUM(invoices.Total) FROM chinook.employees 
JOIN chinook.customers 
ON employees.EmployeeId = customers.SupportRepId 
JOIN chinook.invoices 
ON customers.CustomerId = invoices.CustomerId 
GROUP BY employees.firstname;

--Which sales agent made the most in sales in 2009?
SELECT employees.firstname, employees.lastname, SUM(invoices.total) FROM chinook.employees 
JOIN chinook.customers 
ON employees.EmployeeId = customers.SupportRepId 
JOIN chinook.invoices 
ON customers.CustomerId = invoices.CustomerId 
WHERE InvoiceDate BETWEEN '2009-01-01' AND '2009-12-31' 
GROUP BY employees.firstname 
ORDER BY SUM(invoices.total) DESC LIMIT 1;
