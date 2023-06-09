--5. Write a query that will list all of the genre names 
--and a count of the tracks for each genre.   
--Sort the list by largest track count to smallest. 

SELECT g.Name , COUNT(t.GenreId) AS GenreTrackCount
FROM Genre g  
JOIN Track t 
ON g.GenreId  = t.GenreId  
GROUP BY g.name
ORDER BY GenreTrackCount DESC


--6.Write a query that will list all of the track names 
--and the album names from the artist named ‘Jamiroquai’.

SELECT a.name as Artist,t.name as Track, al.Title as Album
FROM Artist a 
JOIN Album al 
ON a.ArtistId = al.AlbumId
JOIN Track t 
ON al.AlbumId = t.AlbumId 
WHERE Artist= 'Jamiroquai'

----7. Write a query that will determine the top 5 countries measured 
--by total revenue (dollars) sold by billing country.   
--Include country and total revenue.


SELECT i.BillingCountry as Country, SUM(i.total) AS TotalRevenue
FROM Invoice i 
JOIN InvoiceLine il 
ON i.InvoiceId = il.InvoiceId
GROUP BY Country
ORDER BY TotalRevenue DESC
LIMIT 5

----------

--8. Write a query that determines the total sales by global region.  
--Use ‘Asia Pacific’ for India and Australia, 
--‘North America’ for Canada and the USA, 
--‘South America’ for Chile, Brazil and Argentina,
--and ‘Europe’ for the rest.


SELECT SUM(i.total), i.BillingCountry, 
CASE WHEN IN ('India', 'Australia') then 'Asia Pacific',
CASE WHEN IN ('Canada', 'USA') then 'North America',
CASE WHEN IN ('Chile', 'Brazil', 'Argentina') then 'South America'
else 'Europe' end as CustomerLocation 
FROM Invoice i 



--9. Write a query that lists the artists that don’t have albums. 

SELECT a.Name AS Artist,a.ArtistId, al.Title AS Album
FROM Artist a
LEFT JOIN Album al
ON a.ArtistId = al.ArtistId
WHERE Album IS NULL



--10.  Write a query that lists all the invoice amounts, their billing country, 
--and total amount of revenue from that country.  
--Sort largest to smallest


SELECT i.InvoiceId, i.BillingCountry, SUM(i.total) as TotalRevenue
FROM Invoice i 
GROUP BY BillingCountry
ORDER by TotalRevenue DESC




