select * 
from payment

select
from payment
----------
--1. Per employee, how much revenue has each employee realized from DVD rentals,
-- and how many transactions have each employee handled?
*
select p.staff_id, sum(p.amount) as revenue, count(p.payment_id) as number_transactions
from payment p
group by p.staff_id

----
--2. Figure out the average replacement cost of our movies, by rating.

select f.film_id, f.title, f.rating, avg(f.replacement_cost) as Avg_Replacment_Cost
from film f
group by f.film_id
order by rating 

--------
--3. Get the customer ID's of the top 5 customers, by money spent.


select p.customer_id, sum(p.amount) as money_spent
from payment p
group by p.customer_id
order by 2 desc
limit 5

-----
--4. Return the customer IDs of customers who have spent at least $110 
-- with the staff member who has an ID of 2.

select p.customer_id, p.staff_id, sum(p.amount) as money_spent
from payment p
where p.amount >= '110' and p.staff_id = '2' 
group by p.customer_id, p.staff_id

select p.customer_id, p.staff_id, sum(p.amount) as money_spent
from payment p
where p.staff_id = '2'
group by p.customer_id, p.staff_id 
having sum(p.amount) >= 110
order by 2 DESC



---
--5. Find the names and the payment amounts for customers 
-- with a lifetime purchase amount of greater than $150.

select c.first_name , c.last_name, sum(p.amount) as money_spent
from customer c 
join payment p 
on c.customer_id = p.customer_id 
group by c.first_name, c.last_name 
having sum(p.amount) > 150
order by sum(p.amount) desc



--
--6. Which store has served the most customers?

select s.store_id, count(p.customer_id)
from store s 
join staff s2
on s.store_id = s2.store_id 
join payment p 
on s2.staff_id = p.staff_id 
group by s.store_id, p.customer_id 
order by s.store_id desc
--HOW TO GET A SUM TOTAL FOR ALL NOT INDIVIDUAL ONES??



-----
--7. Which store has made the most money from renting dvds?


select c.store_id, sum(p.amount)
from customer c 
join payment p
on c.customer_id = p.customer_id 
group by c.store_id 

--
--8. What is the name and email of the manager of the store 
--that has the customer with the highest lifetime purchase amount?


with cte as (
select concat(c.first_name, ' ', c.last_name) as names, c.customer_id, p.staff_id, sum(p.amount)
from payment p 
join customer c 
on p.customer_id = c.customer_id 
group by names, 2, 3
order by 4 desc ---highest customer_id = 137
)
select distinct concat(s.first_name, ' ', s.last_name), s.email  
from cte
join staff s 
on s.staff_id = cte.staff_id
--where customer_id = 137


--9. On average, except for NC-17 films,how much does each film rent for, by rating?



select f.film_id, f.title, f.rating, avg(f.rental_rate) as Avg_Rental_Rate
from film f
where f.rating in ('G', 'PG-13', 'R')
group by f.film_id
order by rating 



---
--10. Do NC-17 films rent for more or 
-- less than the average of other films?


--
--11. When was the first movie rated R rented by each store? 
-- What was the title of the movie?

-- 
--12. Which store has made more money from all movies 
-- except those rated R and NC-17? How much money has each made?


--
--13. What is the date of the first time each customer rented a movie from our store? 
-- What movie did they rent? How much did they pay for it?

--
--14. When is "Academy Dinosaur" due?





 
