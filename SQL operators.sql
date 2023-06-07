SELECT * 
FROM Album
WHERE Title = 'Audioslave' 
AND Title = 'Body Count'
---
SELECT * FROM Employee 
WHERE (city = 'Calgary'
OR Title = 'General Manager')
AND Firstname = 'Laura'
--
SELECT * FROM Employee 
WHERE NOT Title = 'General Manager'
--
SELECT * FROM Employee 
WHERE Title != 'General Manager'
--
SELECT * FROM Employee 
WHERE Title <> 'General Manager'
--
SELECT * FROM Employee 
WHERE NOT Title = 'General Manager' 
AND NOT Title = 'IT Staff'
--
SELECT * FROM Employee 
WHERE BirthDate BETWEEN '1960-01-01' AND '1979-12-31'

SELECT * FROM Employee 
WHERE BirthDate > '1970-01-01'

--
SELECT * FROM Track 
WHERE milliseconds/1000/60 BETWEEN 5 AND 10
--
SELECT * FROM Employee e  
WHERE FirstName BETWEEN 'M' AND 'Z'
--
SELECT * FROM track
WHERE name LIKE "love%"
--
SELECT * FROM track
WHERE name LIKE '%love%'
--
SELECT * FROM Track 
WHERE name LIKE "___love"
--
SELECT * FROM Employee 
WHERE Firstname IN ('Jane','Nancy','Steve')
--
SELECT * FROM Employee 
WHERE ReportsTo IN (1,2,6) AND Title LIKE "%anag%"
--
SELECT * FROM Employee 
WHERE Title LIKE "%anag%" OR ReportsTo IN (1,2,6)

