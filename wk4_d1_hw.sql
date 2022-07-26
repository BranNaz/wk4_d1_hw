-- 1. How many actors are there with the last name ‘Wahlberg’?
-- 2
SELECT last_name
FROM actor
WHERE last_name LIKE 'Wahlb___';


-- 2. How many payments were made between $3.99 and $5.99?
-- 3,214
SELECT COUNT(amount)
FROM payment
WHERE amount > 3.99 
and amount < 5.99;


-- 3. What film does the store have the most of? (search in inventory)
-- The store has 9 copies of film 200
SELECT film_id, COUNT(film_id)
FROM inventory
GROUP BY film_id
ORDER BY COUNT(film_id) DESC;

-- 4. How many customers have the last name ‘William’?
--0
SELECT COUNT(last_name)
FROM customer
WHERE last_name = 'William';


-- 5. What store employee (get the id) sold the most rentals?
-- Employee #1 sold the most rentals
SELECT staff_id, SUM(rental_id)
FROM rental
GROUP BY staff_id
ORDER BY SUM(rental_id)DESC;


-- 6. How many different district names are there?
-- 378
SELECT COUNT(DISTINCT district)
FROM address;


-- 7. What film has the most actors in it? (use film_actor table and get film_id)
-- Film 508 has the most actors in it
SELECT film_id, COUNT(actor_id)
FROM film_actor
GROUP BY film_id
ORDER BY COUNT(actor_id) DESC;


-- 8. From store_id, how many customers have a last name ending with ‘es’? (use customer table)
--21
SELECT COUNT(customer_id)
FROM customer
WHERE last_name LIKE '%es';


-- 9. How many payment amounts (4.99, 5.99, etc.) had a number of rentals above 250 for customers
-- with ids between 380 and 430? (use group by and having > 250)
-- 0 
SELECT amount, COUNT(amount)
FROM payment
WHERE rental_id BETWEEN 380 AND 430
GROUP BY amount
HAVING COUNT(amount)>250
ORDER BY amount


-- 10. Within the film table, how many rating categories are there? And what rating has the most
-- movies total?
-- There are 5 different film rating catergories and PG-13 has the most movies with 223
SELECT count(DISTINCT rating)
FROM film;

SELECT rating, count(title)
FROM film 
GROUP BY rating
ORDER BY count(title) DESC;