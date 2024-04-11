-- Instructions
use sakila ;

-- - How many films are there for each of the categories in the category table. Use appropriate join to write this query.
select c.name as category, count(f.film_id) as films
from category c
join film_category f
using (category_id)
group by category; 

-- Display the total amount rung up by each staff member in August of 2005.
select concat(first_name, " ",last_name) as staff, sum(amount) as amount
from payment p 
join staff s 
using(staff_id)
group by staff; 

-- Which actor has appeared in the most films?
SELECT CONCAT(a.first_name, ' ', a.last_name) AS actor_appeared_most_film
FROM film_actor fa
JOIN actor a USING(actor_id)
GROUP BY fa.actor_id
ORDER BY COUNT(fa.actor_id) DESC
LIMIT 1;

 
-- Most active customer (the customer that has rented the most number of films)


select CONCAT(c.first_name, ' ', c.last_name) AS customer, count(r.rental_id) as rental
from rental r
join customer c
using (customer_id)
group by r.customer_id
order by count(r.customer_id) desc; 

-- Display the first and last names, as well as the address, of each staff member.

select CONCAT(s.first_name, ' ', s.last_name) AS staff, a.address as address 
from staff s
join  address a
using (address_id);
 
-- List each film and the number of actors who are listed for that film.
select f.title as film, count(a.actor_id) as actors
from film f
join film_actor a
using (film_id)
Group by film_id;

-- Using the tables payment and customer and the JOIN command, list the total paid by each customer. List the customers alphabetically by last name.
select  CONCAT(c.first_name, ' ', c.last_name) AS customer, sum(p.amount) as paid
from payment p
join customer c
using(customer_id)
Group by customer_id
order by c.last_name; 

-- List the titles of films per category.
select c.name as category, f.title as title
from film f
join film_category fc
using(film_id)
join category c
using(category_id); 
