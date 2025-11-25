select * from film;

select title, rental_rate, length, rating from film;

-- select title, rental_rate, rating, length from film;

-- select distinct rating from film;

-- select distinct rating from film 
-- order by rating;

-- select title, length from film
-- order by title desc;

-- select title, length from film
-- order by length desc;

-- select title, length from film
-- order by 2;

-- select title, rental_rate, length, rating from film
-- where rating = 'G';

-- select title, rental_rate, length, rating from film
-- where rating = 'G' and rental_rate = 2.99;

-- select title, rental_rate, length, rating from film
-- where rating = 'G' or rating = 'PG';

-- select title, rental_rate, length, rating from film
-- where rating in ('G','PG','PG-13');

-- select title, rental_rate, length, rating from film 
-- where length > 100 and rating in ('G', 'R');

-- select title, rental_rate, length, rating from film 
-- where length > 100 and rating not in ('G', 'R');

-- select title, rental_rate, length, rating from film
-- where title like 'S%';

-- select title, rental_rate, length, rating from film
-- where title like '%S';

-- select title, rental_rate, length, rating from film
-- where title like '%t_s';

-- select * from film
-- limit 5;

-- select * from film;

-- select rating, count(title) from film
-- group by rating;

select rating, count(title) as num_of_movies from film
group by rating order by 2 desc;

select rating, count(title) as num_of_movies from film
group by rating;

select rating, count(title) as num_of_movies from film
group by rating
having num_of_movies > 200
order by 2 desc;

with cte_g as (
select title, length, rating from film
where rating = 'G' and length < 100)

select * from cte_g;

select title, rating , length from 
(select title, length, rating from film
where rating = 'G' and length < 100) as sub
where length > 80;


select * from film;
select * from film_actor;
select * from actor;


