-- INTRO TO SQL, SELECT ALL FROM actor TABLE
SELECT * FROM actor;


-- Query for the first name and last NAME
SELECT first_name, last_name
from actor;


-- Be more specific.. look for a first name which equal "Nick"
SELECT last_name
FROM actor
WHERE first_name = 'Nick';

-- Query being specific again using the "LIKE" cluase

SELECT last_name
FROM actor
WHERE first_name LIKE 'Nick';

-- Use LIKE clause and WILD CARD (%)
-- get all 3 names..
SELECT first_name, last_name
FROM actor
WHERE first_name LIKE 'J%';

-- SONGLE CHARACTER WILD CARD (_)
SELECT first_name, actor_id
FROM actor
WHERE first_name LIKE 'K___';


--Query for all first names that start with K has 2 letters, then anything goes
SELECT first_name
FROM actor
WHERE first_name LIKE 'K__%'


-- COMPARING OPERATORS
-- > Greater than
-- < Less Than
-- >= <=
-- THIS DIFFERENT: NOT EQUAL TO <>

SELECT * 
FROM payment;

--Query where amounts paid greater than $10
SELECT customer_id, amount
FROM payment
WHERE amount > 10;

--Query for payments between $10-$15
SELECT customer_id, amount
FROM payment
Where amount BETWEEN 10.99 AND 14.99;

-- Lets order the payment by amount
--ASC for ASCENDING(DEFAULT)
--DSC for DESCENDING
SELECT customer_id, amount, payment_date
FROM payment
WHERE amount > 10
ORDER BY amount DESC;

-- Lets order the payments by dats
SELECT customer_id, amount
FROM payment
WHERE amount > 10
ORDER BY payment_date DESC;


-- Query all payments not equal to 10.99
SELECT customer_id, amount
FROM payment
WHERE amount <> 10.99 
ORDER BY amount;


-- SQL aggregations => SUM(), AVG(), COUNT(), MIN(), MAX()


-- Query to display the sum of amount greater or equal to 5.99
SELECT SUM(amount)
FROM payment
WHERE amount >= 5.99;

-- Query to display the average of the amount payed great or equal to 5.99
SELECT AVG(amount)
FROM payment
WHERE amount >= 5.99;

--Count up how many amounts paid over or equal to 5.99
SELECT COUNT(amount)
FROM payment
WHERE amount >= 5.99;

-- Query to dsiaply the count of DISTINCT amounts paid
SELECT COUNT(DISTINCT amount)
FROM payment
WHERE amount >=5.99

-- Query to min amount
SELECT MIN(amount) AS min_amount_paid_greater_than_zero --can get descriptive with it
FROM payment
WHERE amount >= 0;

-- Query the max amount paid
SELECT MAX(amount) as most_money_paid
FROM payment;


-- Group by demonstration (this works with aggregators)
SELECT amount
FROM payment
WHERE amount = 7.99;

SELECT customer_id
FROM payment;

SELECT customer_id, COUNT(amount)
FROM payment
WHERE amount = 7.99
GROUP BY customer_id;

SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
ORDER BY SUM(amount)DESC
LIMIT 10 -- limits the list to 10
OFFSET 1; --skips one

-- add more specificity ot the aggregated result
-- having clause

SELECT customer_id, SUM(amount)
FROM payment
GROUP BY customer_id
HAVING SUM(amount) < 1000
ORDER BY SUM(amount)DESC
LIMIT 10 -- limits the list to 10


-- Query to display the customer_id that show up more than 1 times grouping by email
SELECT * FROM customer;

SELECT COUNT(customer_id), email
FROM customer
WHERE email LIKE 'j__w%'
GROUP BY email
HAVING COUNT(customer_id) > 6 ;