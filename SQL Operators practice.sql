SELECT * 
FROM Album 
WHERE Title = 'Audioslave'
AND Title = 'Body Count'

--

SELECT *
FROM Employee
WHERE city = 'Calgary'

--

SELECT *
FROM Employee
WHERE city = 'Calgary'
AND Title = "Sales Support Agent"
--

SELECT *
FROM Employee
WHERE city = 'Calgary'
AND Title = "Sales Support Agent"
AND FirstName = 'Steve'
--

SELECT *
FROM Employee
WHERE city = 'Calgary'
OR Title = 'General Manager'
--AND Title = "Sales Support Agent"
--AND FirstName = 'Steve'

--
SELECT *
FROM Employee
WHERE city = 'Calgary'
OR Title = 'General Manager'
OR FirstName = 'Laura'
--
SELECT *
FROM Employee
WHERE city = 'Calgary'
OR Title = 'General Manager'
AND FirstName = 'Laura'

--
SELECT *
FROM Employee
WHERE (city = 'Calgary'
OR Title = 'General Manager')
AND FirstName = 'Laura'

--
SELECT *
FROM Employee 
WHERE NOT FirstName = 'Laura'

--

SELECT *
FROM Employee 
WHERE NOT Title = 'General Manager'

-- These three statements above and below are equal 

SELECT *
FROM Employee 
WHERE Title !='General Manager'
--

SELECT *
FROM Employee 
WHERE Title <> 'General Manager'

--

SELECT *
FROM Employee 
WHERE Title <> 'General Manager'
AND NOT Title = 'IT Staff'

--

SELECT *
FROM Employee
WHERE BirthDate 
BETWEEN '1960-01-01' AND '1979-12-31'
--

SELECT *
FROM Employee
WHERE NOT BirthDate 
BETWEEN '1960-01-01' AND '1979-12-31'
--
SELECT *
FROM Employee
WHERE BirthDate > '1970-01-01'

--

SELECT *
FROM Employee
WHERE FirstName 
BETWEEN 'M' AND 'Z'

--
SELECT *
FROM Track 
WHERE Milliseconds/1000/60 BETWEEN 5 AND 10

--

SELECT *
FROM Track 
WHERE Name 
Like "%love" --will look for tracks that end with the word love. If you make it 'love%' it will look for tracks that begin with love. 

--

SELECT *
FROM Track 
WHERE Name 
Like "%love%" --will allow any track name that has the word love in it.

--

SELECT *
FROM Track 
WHERE Name 
BETWEEN 'A' AND 'E'

--

SELECT *
FROM Track  
WHERE Name LIKE "love"

--
SELECT *
FROM Track  
WHERE Name LIKE "___love" --this triple underscored variable is looking for tracks that have exactly three characters before the word love. It replicates the number of underscores as characters before a word it precedes.
--
SELECT *
FROM Track  
WHERE Name LIKE "%love%"--


SELECT *
FROM Employee 
WHERE FirstName IN ('Jane', 'Nancy', 'Steve') --it will retrieve the employees namaed Jane, Nancy or Steve

--

SELECT *
FROM Employee 
WHERE ReportsTo  IN (1,2,6) --it will retrieve all the employee that ReportsTo another from the data stored in the ReportsTo column

--

SELECT *
FROM Employee 
WHERE ReportsTo  IN (1,2,6) OR Title LIKE '%anag%' --it will show Andrew because he is LIKE %anag%

--

SELECT *
FROM Employee 
WHERE ReportsTo  IN (1,2,6) AND Title LIKE '%anag%'

--

SELECT *
FROM Employee
WHERE Title LIKE '%anag' 
OR ReportsTo IN (1,2)

--

SELECT *
FROM Employee
WHERE Title LIKE '%anag' 
OR ReportsTo IN (1,2,6)


SELECT *
FROM Employee
WHERE Title LIKE '%anag' 
OR ReportsTo IN (1,2)




