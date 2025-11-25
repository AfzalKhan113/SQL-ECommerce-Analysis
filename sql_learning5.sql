use adventureworks;
select * from production_product;
select Name, ListPrice from production_product order by 2 desc limit 5;  
select count(name) from production_product;

select * from production_productsubcategory;

select productsubcategoryID, name, count(productsubcategoryID) from production_productsubcategory group by name;

-- productsubcategoryID, name, count(productsubcategoryID) 
select s.productsubcategoryID, s.name, count(s.productsubcategoryID) 
from production_productsubcategory as s							
join production_product as p 
on s.productsubcategoryID = p.productsubcategoryID group by Name;
 
 
 select * from sales_customer;
 select * from sales_salesorderheader;
 
 
 select sc.CustomerID, sum(soh.SubTotal)
 from sales_customer as sc 
 join sales_salesorderheader as soh
 on sc.customerid = soh.customerid group by CustomerID order by 2 desc limit 10;
 
 
 select * from production_productsubcategory;
 select * from production_product;

with cte as (
select p.Name as product_name, p.ListPrice, s.Name as subcategory_name,
rank() over(partition by s.Name order by p.ListPrice desc) as rnl
from production_product as p
join production_productsubcategory as s
on p.productsubcategoryid = s.productsubcategoryid)
select * from cte where rnl <= 3;


