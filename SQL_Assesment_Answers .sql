--Sql Assessment--

--Write a query that will list all of the genre names and a count of the tracks for each genre.   
--Sort the list by largest track count to smallest.  

Select g.Name, Count(t.TrackId) AS NumOfTracks
FROM Genre g 
JOIN Track t on g.GenreId = t.GenreId 
GROUP BY 1
ORDER BY 2 DESC ;

--Write a query that will list all of the track names 
--and the album names from the artist named ‘Jamiroquai’.

Select a2.Name as ArtistName, t.Name as TrackName, a.Title as AlbumName
FROM Track t 
JOIN Album a on t.AlbumId = a.AlbumId 
JOIN Artist a2 on a.ArtistId = a2.ArtistId 
WHERE a2.Name = 'Jamiroquai'; 

--Write a query that will determine the top 5 countries measured by total revenue (dollars) 
--sold by billing country.   Include country and total revenue. 

select BillingCountry, SUM(Total) as TotalRevenue 
from Invoice i 
GROUP BY BillingCountry 
ORDER BY TotalRevenue Desc
LIMIT 5;

--Write a query that determines the total sales by global region.  
--Use ‘Asia Pacific’ for India and Australia, ‘North America’ for Canada and the USA, 
--‘South America’ for Chile, Brazil and Argentina, and ‘Europe’ for the rest. 

SELECT 
CASE WHEN BillingCountry IN ('India', 'Australia') THEN 'Asia Pacific'
WHEN BillingCountry IN ('Canada', 'USA') THEN 'North America'
WHEN BillingCountry IN ('Chile', 'Brazil','Argentina') THEN 'South America'
ELSE 'Europe'
END AS GlobalRegion,
SUM(Total) as TotalRevenue
FROM Invoice i 
GROUP by GlobalRegion;

--Write a query that lists the employees that support customers.   
--Include the employee first name, last name, their supervisor’s last name, 
--and the number of customers supported.  

select e.LastName as Supervisor, e2.LastName, e2.LastName , count(c.CustomerId) as NumCustSupported
from Employee e 
join Employee e2 on e.EmployeeId = e2.ReportsTo 
join Customer c on e2.EmployeeId = c.SupportRepId 
group by c.SupportRepId 

select e2.Title,  e2.FirstName, e2.LastName, e.Title,  e.LastName 
from Employee e 
inner join Employee e2 on e.EmployeeId = e2.ReportsTo 

--Show the list of artists in our database that don't have albums 
SELECT *
FROM Artist a
LEFT JOIN Album ab
ON a.ArtistId = ab.ArtistId
WHERE AlbumID IS NULL

--Write a query that lists the top 10 largest invoice amounts, 
--their billing country, and total amount of revenue from that country.  

with InvoiceCountry as (select BillingCountry, total
from Invoice i 
)
select BillingCountry,Total, SUM(Total) OVER(PARTITION BY BillingCountry) AS TotalCountryRevenue
from InvoiceCountry
order by total DESC; 






