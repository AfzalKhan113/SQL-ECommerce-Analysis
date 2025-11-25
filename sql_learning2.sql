select * from film;
select * from film_actor;
select * from actor;


select fa.*, f.title
from film_actor fa 
join film f on fa.film_id = f.film_id; 

select fa.actor_id, fa.film_id, f.title, ac.first_name, ac.last_name
from film_actor fa
join film f on fa.film_id = f.film_id
join actor ac on ac.actor_id = fa.actor_id;

select ac.first_name, ac.last_name 
from actor ac 
join film_actor fa on ac.actor_id = fa.actor_id;

(select title, rating, length from film
where length > 80 limit 3)
union
(select title, rating, length from film
where length < 80 limit 3);



-- union / union all
-- A, B, C, D, C, D, E, F
-- Union = removes duplicates A, B, C, D, E, F
-- union all = keep duplicates A, B, C, D, C, D, E, F

 -- window function row_number(), 
with cte as (
select title, length, rating,
row_number() over (partition by rating order by length desc) rn
from film)
select * from cte where rn <= 3;

 -- lag and lead function are window function 

select title, rating, length, 
lead(length,1) over (order by title) as length_next_movie 
from film;


select title, rating, length, 
lag(length,1) over (order by title) as length_next_movie 
from film;