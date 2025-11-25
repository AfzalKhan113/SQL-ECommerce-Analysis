create database olist_db;
use olist_db;

select * from olist_customers_dataset;
select * from olist_geolocation_dataset;


 -- Question 1 (The JOIN): "What are the names of the top 10 products that have the highest price?"
 
 select * from olist_products_dataset;
 select * from olist_order_items_dataset;
 
 select pd.product_category_name, oi.price from
 olist_products_dataset as pd 
 join olist_order_items_dataset as oi on
 pd.product_id = oi.product_id order by 2 desc limit 10;
 
 
-- Question 2 (The GROUP BY & Dates): "What is our monthly sales trend? I need to see 
 -- the Year, the Month, and the Total Number of Orders, ordered from most recent to oldest."
 
 select * from olist_orders_dataset;
 select month(order_approved_at) as order_date, count(order_id) as Totat_number_of_orders from olist_orders_dataset group by order_date order by 1; -- wrong

select month(order_purchase_timestamp) order_month, year(order_purchase_timestamp) as order_year, count(order_id) as total_orders 
from olist_orders_dataset group by order_month, order_year order by 1 desc,2 desc;

select date_format(order_purchase_timestamp, '%Y-%m') as yearmonth,
COUNT(order_id) AS TotalOrders FROM olist_orders_dataset GROUP BY YearMonth ORDER BY YearMonth DESC; 

 -- Question 3 (The CASE Statement): "Can you show me a breakdown of our customers by state? I want to see the state and a new column 
  -- called Region that says 'Southeast' for states like 'SP' and 'RJ', and 'Other' for everything else."
 
 select * from olist_customers_dataset;
 select distinct customer_state,
case 
	when customer_state = 'SP' then 'Southeast'
    when customer_state = 'RJ' then 'Southeast'
    when customer_state = 'MG' then 'Southeast'
    when customer_state = 'ES' then 'Southeast'
    else 'Other'
    End as region
from olist_customers_dataset
order by region, customer_state;
 -- WHEN customer_state IN ('SP', 'RJ', 'MG', 'ES') THEN 'Southeast' you can also use this query.
 
 -- Question 4 (The LEFT JOIN): "Are there any products that have never been sold?
select * from olist_products_dataset;
select * from olist_order_items_dataset;

 select pd.product_category_name as product_name, count(od.price) as product_sold
 from olist_products_dataset as pd left join
 olist_order_items_dataset as od on pd.product_id = od.product_id group by product_name order by product_name, product_sold;
 
select pd.product_id as pid , pd.product_category_name as product_name 
from olist_products_dataset as pd left join
olist_order_items_dataset as od on pd.product_id = od.product_id where od.order_item_id is null;


 -- if you just want to know "How many unsold products are there in total?":
SELECT count(pd.product_id)
FROM olist_products_dataset AS pd
LEFT JOIN olist_order_items_dataset AS od 
ON pd.product_id = od.product_id
WHERE od.order_item_id IS NULL; 
 