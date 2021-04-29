--Select all the coulumns from table
SELECT * FROM actor;

--Select a particular column from table
SELECT first_name FROM actor;

--Select two columns from table
SELECT first_name, last_name FROM actor;

--Select distinct values from table
SELECT DISTINCT rental_rate FROM film;

--Filter the rows returned from the SELECT statement
SELECT * FROM  film
WHERE rental_rate > 4 AND replacement_cost >= 19.9;

--returns the rows in the order that they were inserted into the table
SELECT * FROM customer
ORDER BY store_id ASC, first_name DESC;

-- to get a subset of rows returned by the query
SELECT * FROM customer
ORDER BY store_id ASC, first_name DESC
LIMIT 5;

--to match a value against a range of values
SELECT COUNT(*) FROM payment
WHERE amount BETWEEN 8 AND 9;

SELECT COUNT(*) FROM payment
WHERE amount NOT BETWEEN 8 AND 9;

--to check if a value matches any value in a list of values
SELECT * FROM payment
WHERE amount IN (0.99, 1.99, 1.98);

--to select rows whose values do not match the values in the list
SELECT * FROM payment
WHERE amount NOT IN (0.99, 1.99, 1.98);

--divides the rows returned from the SELECT statement into groups
SELECT staff_id,customer_id, SUM(amount) FROM payment
GROUP BY staff_id,customer_id
ORDER BY SUM(amount);

--to filtergroup rows that do not satisfy a specified condition
SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
HAVING SUM(amount) > 100;