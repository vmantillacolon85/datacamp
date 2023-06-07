dvdrental questions 
***************BASIC***************

Question 1:

-- grab all data from the film table
select *
from film 


Question 2:

-- English films only : return all films that have a language ID of 1
-- (note: we already know this happens to be all the films in the database
-- but let's make sure we know how to do this IF there was multiple languages)

select title
from film 
where language_id = 1

Question 3:

-- English films for toddlers
-- return all films with language ID of 1 and is rated G

select title, language_id, rating
from film 
where language_id = 1 and rating = 'G'

Question 4:

-- Family friendly English films
-- return all films with language ID of 1 and is rated G, PG, or PG-13
select title, language_id, rating
from film
where language_id =1 and rating in ('G','PG','PG-13')
order by rating, title asc;

Question 5:

-- Per employee, how much revenue has each employee realized from DVD rentals, 
-- and how many transactions have each employee handled?

select first_name, SUM(amount) as revenue, count(payment_id) as number_of_transactions
from staff s
join payment p
on s.staff_id =p.staff_id 
group by first_name 
order by revenue desc

------------
SELECT first_name, sum(amount) AS revenue, count(payment_id) AS number_transaction
FROM payment p
JOIN staff s
ON s.staff_id = p.staff_id
GROUP BY first_name
ORDER BY revenue DESC ;


------------
SELECT staff_id, SUM(amount) AS revenue, COUNT(staff_id) number_of_transactions
FROM payment
GROUP BY staff_id;


--or 

------




Question 6:

-- Family friendly English films on a budget:
-- return all films with language ID of 1 and is rated G, PG, or PG-13,
-- and have a rental rate less than $3 and a replacement cost less than $10

select title, language_id, rating, rental_rate, replacement_cost
from film 
where language_id =1 and rating in ('G','PG','PG-13')
group by
having rental_rate < 3 and replacement_cost < 10 
order by rating, rental_rate, replacement_cost asc

-------------------------------

select title, language_id, rating, rental_rate, replacement_cost
from film 
where language_id =1 and rating in ('G','PG','PG-13')
group by  film_id --not sure why this is here. 
having rental_rate < 3 and replacement_cost < 10 
order by rating, rental_rate, replacement_cost asc

--or 
SELECT title, LANGUAGE_id, rating, rental_rate, replacement_cost
FROM film
WHERE language_id =‘1’ AND rating IN (‘G’,‘PG’,‘PG-13’)
GROUP BY language_id, title ,rating, rental_rate , replacement_cost
HAVING rental_rate < ‘3’ AND replacement_cost < ‘10’;


SELECT title, language_id, rating, rental_rate , replacement_cost
FROM film f
WHERE language_id = 1 AND rating IN ('G','PG','PG-13') AND rental_rate < 3 AND replacement_cost <10;



