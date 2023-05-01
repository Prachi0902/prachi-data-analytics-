use sakila;

-- Which actors have the first name 'Scarlett'.
select *
from actor
where first_name  = ("Scarlett");


-- Which actors have the last name 'Johansson'.
select *
from actor
where last_name  = "Johansson";

desc actor;
select*from actor;

-- How many distinct actors' last names are there?
select count(distinct last_name) from actor;


-- Which last names are not repeated?
select last_name from actor group by last_name having count(*) = 1;


-- Which last names appear more than once?
select last_name from actor group by last_name having count(*)>1;


-- Which actor has appeared in the most films?
select count(film_actor.actor_id),actor.first_name, actor.last_name
from actor inner join film_actor on actor.actor_id=film_actor.actor_id
group by film_actor.actor_id;


-- What is the average length of all the films in the sakila DB?
select avg(length)
from film;


-- What is the average length of films by category?
SELECT category. name, avg(length)
from film join film_category using (film_id) join category using (category_id)
group by category.name
order by avg(length)desc;


-- Which film categories are long? (compare with avg length).

select category.name,avg(length)
from film join film_category using (film_id) join category using (category_id)
group by category.name
having avg(length) > (select avg(length) from film)
order by avg(length) desc;