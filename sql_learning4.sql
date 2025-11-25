select * from actor;

select first_name from actor;

select lower(first_name) from actor;

select upper(first_name) from actor;


select first_name, char_length(first_name) as length from actor;

-- substring();

select first_name, concat(substring(first_name, 1, 1), lower(substring(first_name, 2, 20))) as proper_case from actor;

select first_name, reverse(first_name) as reverse_name from actor;