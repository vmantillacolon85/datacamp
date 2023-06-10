select *
from customer

---
select COUNT(customer_id)
from customer 
---

select customer_id, count(rental_id)
from rental 
group by customer_id 
having count(customer_id) = 12
---
select customer_id, last_name
from customer
where customer_id = 318

--

select inventory_id, customer_id
from rental
where rental_date between '2005-07-06 12:00:00.00' and '2005-07-06 23:59:59.00'
and customer_id = 318

--

select *
from inventory 
where inventory_id = 4282

------

select title
from film 
where film_id = 932

----

select actor_id, count(film_id)
from film_actor
group by actor_id 
having count(film_id) = 19

select actor_id, film_id
from film_actor
where film_id = 932

--or which is Rosana's method--

select actor_id
from film_actor
where film_id = 932

select actor_id, count(film_id)
from film_actor
where actor_id in (42,63,83, 101)
group by actor_id 
having count(film_id) = 19

---------
select * 
from actor
where actor_id = 63




