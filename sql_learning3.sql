select title, length, rating,
dense_rank() over (order by length) as rnk
from film ;

select title, length, rating,
rank() over (order by length) as rnk
from film ;

