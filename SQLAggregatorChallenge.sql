SELECT *
FROM commission
---

--1. 
SELECT AVG(YearsWorked) 
from commission 
--6.75 years

--2.
SELECT MAX(TotalCommission)
FROM commission
--$66,000

--3.
SELECT Count(TotalCommission) 
FROM commission 
WHERE TotalCommission > 12000
--There are 4 records that have a total commission value of greater than $12000

--4.
SELECT MIN(TotalCommission)
FROM commission
--$1,650

--5. 
SELECT AVG(TotalCommission)
FROM commission
--$14,212.50

--6.
SELECT SUM(YearsWorked)
FROM commission
--81 years

