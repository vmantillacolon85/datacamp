/*SELECT CustomerId, InvoiceDate 
Total AS pre_tax, Total*.06 AS sales_tax, Total*1.06 AS total_with_tax
FROM Invoice*/

--SELECT * FROM Album--
--
--SELECT * FROM Genre--
--
--SELECT * FROM Employee--
--
--SELECT FirstName || " " || LastName FROM Employee--
--
--SELECT FirstName || " " || LastName AS Name FROM Employee--
--
--SELECT * FROM Customer--
--SELECT 5*4 AS Twenty FROM Employee
--SELECT c.city FROM Customer AS c-- an example of an alias using the c as the customer name 
--SELECT city FROM Customer
--SELECT DISTINCT city FROM Customer
--SELECT DISTINCT * FROM Customer

--SELECT * FROM Customer
--WHERE Country = 'Brazil'

--SELECT * FROM Customer
--WHERE Country Like 'Bra_il'


--SELECT * FROM Customer
--WHERE Country < 'Brazil'

--SELECT * FROM Customer
--WHERE Country > 'Brazil'

--SELECT * FROM Track 
--SELECT milliseconds, milliseconds/1000 AS seconds
--FROM Track 

--SELECT milliseconds, Name
--FROM Track 
--WHERE milliseconds > 300000

/*SELECT milliseconds, Name
FROM Track 
WHERE milliseconds/1000/60 >= 10*/

/*SELECT Name, Composer
FROM Track 
WHERE Composer = 'Miles Davis'*/

/*SELECT Composer, UnitPrice
FROM Track 
WHERE UnitPrice > 0.99*/

/*SELECT Name, UnitPrice
FROM Track 
WHERE UnitPrice > 0.99*/


/*SELECT *
FROM Track 
WHERE Name = 'Princess of the Dawn'*/



/*SELECT *
FROM Track 
--WHERE Name = 'Princess of the Dawn'
WHERE Name = "C.O.D." */
