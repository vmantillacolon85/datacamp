select * from products
select * from categories

--query that calculates the average price
--per category, and returns a table with
--the category, number of products in the category,
--and average price for that category.


select c.category_name, count(p.product_id), ROUND(cast(avg(p.unit_price) as numeric), 2) as average_price
from categories c 
join products p 
	on p.category_id = c.category_id 
group by c.category_name


--PART 2--

--query that determines the category with 
--the maximum average price, and also the category name
-- and the count of products in that category. 

with category_average as (
select c.category_name, count(p.product_id) as ProductCount, ROUND(cast(avg(p.unit_price) as numeric), 2) as average_price
from categories c 
join products p 
	on p.category_id = c.category_id 
group by c.category_name
)
select category_name, ProductCount, average_price
from category_average
where average_price = (select MAX(average_price) from category_average)





