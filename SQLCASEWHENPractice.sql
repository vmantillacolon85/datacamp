-- dvdrental questions CASE WHEN

*****************************Basic Syntax*****************************

--The CASE evaluates one or more conditions and returns the result 
--for the first condition that is true. 
--If no condition is true, the result after ELSE is 
--returned, or NULL if there is no ELSE part.
--
--General Syntax
--
--CASE
--    WHEN condition1 THEN result1
--    WHEN condition2 THEN result2
--    WHEN conditionN THEN resultN
--    ELSE result
--END AS ColumnName


Question 1:

--Select the title, description, rating and replacement_cost 
--for every movie with a title that starts with the letter 'A'

select title, description, rating, replacement_cost 
from film 
where title like 'A%'


Question 2:

--Select the title, description, rating and replacement_cost 
--for every movie about data

select title, description, rating, replacement_cost
from film 
where description ilike '%data%' or description ilike '%mysql%'--use two % because it will look for things about data front and back in list

Question 3:

--Create a table the includes the Title, The Category, Description, 
--the Rental Rate and the rating of every movie that starts with c


select f.title, c.name, f.description, f.rental_rate, f.rating
from film f
join film_category fc 
on f.film_id = fc.film_id 
join category c 
on fc.category_id = c.category_id 
where f.title ilike 'c%' or f.title ilike 'the c%' or f.title ilike 'a c%'
order by f.title ASC

Question 4:

--Create a table the includes the Title, The Category, Description, 
--the Rental Rate and the rating of every movie
--Create an additional column called recommended audience that
--designates all movies rated G, PG and PG-13 as Family Friendly and 
--all others as not family friendly

select f.title, c.name, f.description, f.rental_rate, f.rating, 
case 
	when f.rating in ('G', 'PG', 'PG-13')
	then 'Family Friendly'
	else 'Not Family Friendly'
end as recommended_audience
from film f
join film_category fc 
on f.film_id = fc.film_id 
join category c 
on fc.category_id = c.category_id 


Question 5:

--Create a table the includes the Title, The Category, 
--and the rental rate of every movie. 
--Create an additional column 'price_category' that labels
--every move with price below 2.99 as 'Discount', at least 2.99 
--but below 4.99 as 'Full Price' and anything above that as 'Premium'

select f.title, c.name, f.rental_rate,
case 
	when f.rental_rate < 2.99 then 'DISCOUNT'
	when f.rental_rate between 2.99 and 4.98 then 'Full Price'
	when f.rental_rate >= 4.99 then 'Premium' --you can also do > 4.98
	else 'Error'
end as price_category
from film f
join film_category fc 
on f.film_id = fc.film_id 
join category c 
on fc.category_id = c.category_id 
order by price_category

--Interactions with aggregate 

select f.title, c.name,
case 
	when f.rental_rate < 2.99 then 'DISCOUNT'
	when f.rental_rate between 2.99 and 4.98 then 'Full Price'
	when f.rental_rate >= 4.99 then 'Premium' --you can also do > 4.98
	else 'Error'
end as price_category,
AVG(f.rental_rate)
from film f
join film_category fc 
on f.film_id = fc.film_id 
join category c 
on fc.category_id = c.category_id 
group by f.title, c.name, price_category


Question 6:

--Create a table that includes the category, and the average
--rental rate per category from most to least expensive

select c.name as category, ROUND (AVG(f.rental_rate), 2) as avg_rental_rate
from film f
join film_category fc 
on f.film_id = fc.film_id 
join category c 
on fc.category_id = c.category_id 
group by c.name --or group by 1-- the number 1 denotes the column position
order by avg_rental_rate desc -- or order by 2 desc --the number 2 denotes the column position

---Interacting with the aggregate: more than or equal to 3 'premium', more than or equal to 2 'regular', more than or equal to 0.50 'Discount'


select c.name as category, ROUND (AVG(f.rental_rate), 2) as avg_rental_rate,
case
	when avg(f.rental_rate) >= 3 then 'Premium'
	when avg(f.rental_rate) >= 2 then 'Regular'
	when avg(f.rental_rate) >= 0.50 then 'Discount'
	else 'error'
end as price_category
from film f
join film_category fc 
on f.film_id = fc.film_id 
join category c 
on fc.category_id = c.category_id 
group by c.name --or group by 1-- the number 1 denotes the column position
order by avg_rental_rate desc -- or order by 2 desc --the number 2 denotes the column position


Question 7:

--Create a table that includes the title, the category, the rental rate and the average
--rental rate per category





Question 8: 

--Every customer that has spent at least $150 gets a coupon for 10% of the value of their total purchases
--Every customer that has spent at least $100 but less than $150 gets a coupon for 5% of the value of their total purchases
--All others get nothing
--Create a table showing the name, customer_id and sum of purchases per customer and the value of the coupon
--they will be issued


--select *
--from customer

select concat(c.first_name,' ', c.last_name) as name, c.customer_id,
ROUND(SUM(p.amount),2),
case 
	when SUM(p.amount) >= 150 then ROUND(SUM(p.amount) * 0.10, 2)
	when SUM(p.amount) between 100 and 149.99 then ROUND(SUM(p.amount) * 0.05, 2)
	else 0
end as coupon_value
from customer c 
join payment p 
on c.customer_id = p.customer_id
group by c.customer_id 
order by coupon_value DESC -- OR order by 4 DESC



