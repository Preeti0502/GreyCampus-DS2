
-----------------------Assignment1---------------------------

--Q1)Do we have actors in the actor table that share the full name and if
--yes display those shared names.
SELECT COUNT(*) FROM actor;
--Output: 200   
---Implies total 200 rows in the table.

SELECT COUNT(DISTINCT(first_name,last_name)) FROM actor;
--Output: 199   
---Implies 199 actors with distinct name

SELECT first_name, last_name FROM actor
GROUP BY first_name, last_name HAVING COUNT(*)>1;
--Output: "Susan"	"Davis"
---The name Susan Davis is being shared.

--Q2) Return the customer IDs of customers who have spent at least $110 
--with the staff member who has an ID of 2.
SELECT customer_id FROM payment 
GROUP BY customer_id,staff_id
HAVING SUM(amount)>=110 AND staff_id=2;
--Output: "customer_id"
--             187
--             148
---Customers having customer_id 187 and 148 spent atleast $110 on staff_id 2.

--3) How many films begin with the letter J?
SELECT COUNT(title) FROM film
WHERE title LIKE 'J%';
--Output: 20
---There are 20 films whose name starts with J.

--4) What customer has the highest customer ID number whose name starts 
--with an 'E' and has an address ID lower than 500?
SELECT * FROM customer
WHERE customer_id = (SELECT MAX(customer_id) FROM CUSTOMER
WHERE address_id<500 AND first_name LIKE 'E%');
--Output:
--"customer_id" "store_id" "first_name" "last_name"	"email"	                         "address_id" "activebool"	"create_date"	    "last_update"	         "active"
-- 434            	1	    "Eddie"	    "Tomlin"	"eddie.tomlin@sakilacustomer.org"	439          true	     "2006-02-14"	 "2013-05-26 14:49:45.738"	    1

--Q5) How many films have the word Truman somewhere in the title?
SELECT COUNT(*) FROM film
WHERE title ILIKE '%truman%';
--Output: 5

--Q6)Display the total amount payed by all customers in the payment table.
SELECT SUM(amount) FROM payment;
--Output: 61312.04

--Q7)Display the total amount payed by each customers in the payment table.
SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id;
--Output:
--"customer_id"	"sum"
--  184	        80.80
--  87	     	137.72
--  477	     	106.79
--  273	     	130.72
--  550	     	151.69
--  51			123.70
---
---
---Total 599 rows were displayed with distinct customer_id along with 
---total amount paid.

--Q8) What is the highest total_payment done?
SELECT customer_id, SUM(amount) FROM payment
GROUP BY customer_id
ORDER BY SUM(amount) DESC
LIMIT 1;
--Output:
--"customer_id"	 "sum"
--    148	     211.55
--- The customer having customer id 148 pays highest amount worth $211.5.

--Q9) Which customers have not rented any movies so far?
---Check number of customer in rental table and customer table.
SELECT COUNT(DISTINCT(customer_id)) FROM rental;
--Output: 599
SELECT COUNT(customer_id) FROM customer;
--Output: 599

---We find that both tables have same number of customers. Hence we check if
---all customers in both table are same beacause a customer not renting a movie 
---would not have any record in rental table.

SELECT DISTINCT(customer_id) FROM rental
EXCEPT
SELECT customer_id FROM customer;

---Here we find output as column customer_id with zero rows implying that both
---tables have same customers. Therefore, we can conclude that every customer has 
---rented a film atleast once.

--Q10) How many payment transactions were greater than $5.00?
SELECT COUNT(amount) FROM payment 
WHERE amount>5;
--Output: 3618
---Total 3618 transactions were done above $5.


