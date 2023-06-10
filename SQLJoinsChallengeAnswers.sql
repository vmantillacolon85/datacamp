--Write a query that returns artist name and track name for tracks between 5 and 10 minutes
SELECT a.Name AS Artist,t.Name AS Track, t.Milliseconds/1000/60 AS Minutes --This converts the milliseconds into minutes
FROM Artist a 
JOIN Album a2 
ON a.ArtistId = a2.AlbumId 
JOIN Track t 
ON a2.AlbumId = t.AlbumId 
WHERE Minutes BETWEEN 5 AND 10 
ORDER BY Minutes 
;
--Write a query that returns customer Firstname and Lastname, and Track name for invoices between April 1 and April 30. 
SELECT c.FirstName, c.LastName, i.InvoiceDate 
FROM Customer c 
JOIN Invoice i 
ON c.CustomerId = i.CustomerId 
WHERE i.InvoiceDate like '%-04-%'; --This one was a tricky question because it didn't specify the years. 
--If you wanted to get all the years this is the way to do it. i will take a single year as well using BETWEEN

--Write a query that returns track names and total purchase $  for customers who live in Prague
SELECT c.City,t.Name AS Track, sum(i.Total) AS TotalPurchase
FROM Customer c 
JOIN Invoice i ON c.CustomerId = i.CustomerId 
JOIN InvoiceLine il ON i.InvoiceId = il.InvoiceId 
JOIN Track t ON il.TrackId = t.TrackId 
WHERE c.City = 'Prague'
GROUP BY t.Name
--This question is also tricky. I decided to group the total sales by the track name and filter the purchases by city. 

;
--Write a query that returns all the customers (firstname, lastname) who purchased tracks of type 'Heavy Metal'
SELECT DISTINCT c.FirstName, c.LastName,g.Name AS GenreName -- if you run this without the DISTINCT you will get duplicates
--on account for the indivudual tracks purchased. 
FROM Customer c 
JOIN Invoice i ON c.CustomerId = i.CustomerId 
JOIN InvoiceLine il ON i.InvoiceId = il.InvoiceId 
JOIN Track t ON il.TrackId = t.TrackId 
JOIN Genre g ON t.GenreId = g.GenreId 
WHERE g.name = 'Heavy Metal'
;

--Write a query that lists the customers (firstname, lastname) and a count of their invoices, 
--listed from most to least invoices
SELECT c.FirstName, c.LastName, COUNT(i.invoiceid) AS TotalInvoices
FROM Customer c  
JOIN Invoice i ON c.CustomerId = i.CustomerId 
GROUP BY c.FirstName, c.LastName 
ORDER BY TotalInvoices DESC
;
--Write a query that lists the top 10 artists (name) who have appeared on the most albums from most to least.
SELECT a.Name as Artist , COUNT(a2.AlbumId) AS NumOfAlbums
FROM Artist a 
JOIN Album a2 ON a.ArtistId =a2.ArtistId 
GROUP BY a.Name 
ORDER BY NumOfAlbums DESC
LIMIT 10
;

--Write a query that lists the top 5 tracks by total invoice $ 
SELECT t.Name as Track, SUM(i.Total) AS TotalSales
FROM Invoice i 
JOIN InvoiceLine il ON i.InvoiceId = il.InvoiceId 
JOIN Track t ON il.TrackId = t.TrackId 
GROUP BY t.Name 
ORDER BY TotalSales DESC
LIMIT 5
;
