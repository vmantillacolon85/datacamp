--1. List product_name, product category,  unit_price, 
--and average unit price for that category

SELECT p.product_name, c.category_name, p.unit_price,
round(CAST(avg(unit_price) OVER (PARTITION BY c.category_id) AS NUMERIC),2) AS avg_unit_price
FROM products p
JOIN categories c ON p.category_id = c.category_id


--2. For each product, list the product name, the units on order, 
--the supplier company name, and the total units on order for that supplier

select 
from products p 





--3. For each customer, list the customer company name, 
--the counter of orders for that customer, and the total
--number of orders for that supplier 

with customer_orders as 
(
select c.company_name, c.country, count(o.order_id) as num_orders
from customers c
left join orders o 
on c.customer_id = o.customer_id 
group by c.company_name, c.country 
)
select company_name, country, num_orders,



--4.  For each order, list the customer, calculate the total $ for the order, 
--and the total $ for spent by that customer.
--the total $ for each order will use the order_details table and 
--be the sum of (unit_price * quantity * (1-discount))

with order_total as
(
select o.order_id, c.company_name, 
sum(od.unit_price * od.quantity*(1-od.discount)) as order_amount
from orders o 
join customers c
on o.customer_id = c.customer_id 
join order_details od 
on o.order_id = od.order_id 
group by o.order_id, c.company_name 
order by o.order_id 
)
select order_id, company_name, order_amount,
round(cast(sum(order_amount) over (partition by company_name) as numeric), 2)
from order_total 


--5. For each product list the name, the category, the total amount of $ spent by customers for that product, 
--and the total amount of $ spent by customers for its category. 


with total_sales as 
(
select p.product_name, c.category_name, 
sum(od.unit_price*od.quantity*(1-od.discount)) as product_sales
from products p
join categories c 
on p.category_id = c.category_id 
left join order_details od 
on od.product_id = p.product_id 
group by p.product_name, c.category_name
)
select product_name, category_name, product_sales,
sum(product_sales) over (partition by category_name) as category_total
from total_sales

--6.Use ROW_NUMBER to assign a value (1, 2, 3, 4) to each of our shipping companies, 
--from most orders to least orders.  
--*note that the ship_via field in ‘orders’ maps to the shipper_id field in ‘shippers’

select s.company_name, 
count(o.order_id),
row_number() over (order by count(o.order_id) desc)
from shippers s 
left join orders o 
on s.shipper_id = o.ship_via
group by s.company_name 

--7. Use DENSE_RANK() to designate our top customers from each country, 
--from most money spent to least amount of money spent.  


select c.country, c.company_name,
sum(od.unit_price * od.quantity * (1-od.discount)) as customer_total,
dense_rank () over (partition by c.country order by sum(od.unit_price * od.quantity * (1-od.discount)))
from customers c
join orders o 
on c.customer_id = o.customer_id 
join order_details od 
on o.order_id = od.order_id 
group by c.country, c.company_name 
order by c.country









