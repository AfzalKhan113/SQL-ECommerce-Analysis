-- How many sales orders did we get each month in 2011? Show the month and the total number of orders

select * from sales_salesorderheader;

select month(orderdate) as monthnumber, count(SalesOrderID) from sales_salesorderheader 
where year(orderdate) = 2011 group by monthnumber order by monthnumber;

 -- I want to categorize our products. Show the product's Name, ListPrice, and a new column called PriceCategory that says
 -- Cheap' if the price is under $50
 -- Moderate' if the price is between $50 and $250
 -- Expensive' if the price is over $250
 
 select * from production_product;
 
select name, ListPrice, 
case
	when listprice < 50 then 'cheap'
    when ListPrice >= 50 and ListPrice <= 250 then 'Moderate'
    when ListPrice > 250 then 'expensive'
end as pricecategory 
 from production_product;
 
 -- Are there any products that do not belong to a subcategory? Show me their names."
 -- "Are there any products that don't have a subcategory? Show me their names."
 
select name, productsubcategoryid from production_product where productsubcategoryid is null;

 -- Challenge (HAVING Clause): "Find all customers who have placed more than 20 orders in total. Show the CustomerID and the total_orders."
 
 select * from sales_salesorderheader;
 select customerid, count(salesorderid) as total_orders from sales_salesorderheader group by CustomerID having total_orders > 20;
 
  -- Challenge (LEFT JOIN): "Show me ALL product subcategories, and for each one, 
  -- show how many products are in it. If a subcategory has zero products, it should still be in the list with a 0."
 
 select * from production_product;
 select * from production_productsubcategory;
select s.Name as subcategory, count(p.ProductID)
from production_product as p
left join production_productsubcategory as s 
on p.productsubcategoryid = s.productsubcategoryid group by subcategory;
 
