-- songs that were ranked #1
SELECT song, "year"
FROM billboard_top 
WHERE "rank"=1 AND "year">2001
GROUP BY song
ORDER BY "year" DESC

--customers who bought on more than one date
SELECT user_id, count(DISTINCT created_at)  
FROM amazon_transactions
GROUP BY  user_id
HAVING count(DISTINCT created_at) > 1

-- most 'cool' votes
SELECT business_name, cool, review_text 
FROM yelp_reviews 
WHERE cool=(SELECT MAX(cool) FROM yelp_reviews)
 
-- most oscars
WITH winners AS(
SELECT nominee, COUNT(winner) as oscars
FROM oscar_nominees 
WHERE winner='TRUE'
GROUP BY nominee
)
SELECT nominee, oscars 
FROM winners
WHERE oscars=(SELECT MAX(oscars) FROM winners) 

--sales revenue
SELECT salesperson, sales_revenue, 
SUM(sales_revenue) OVER() as total_sales_revenue
FROM sales_performance 

-- dates with likes
SELECT fp.post_date, 
COUNT(fr.reaction) AS count_likes
FROM facebook_posts fp 
JOIN facebook_reactions fr 
ON fp.post_id=fr.post_id 
WHERE fr.reaction= 'like'
GROUP BY fp.post_date
