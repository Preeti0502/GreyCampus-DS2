--Q1)1. My partner and I want to come by each of the stores in person and meet the 
--managers. Please send over the managers’ names at each store, with the full address of 
--each property (street address, district, city, and country please).

SELECT s.first_name AS manager_firstname,s.last_name AS manager_last_name,
a.address,a.district,c.city,c1.country
FROM staff s
INNER JOIN store st ON
s.store_id=st.store_id
INNER JOIN address a
ON st.address_id=a.address_id
INNER JOIN city c
ON a.city_id=c.city_id
INNER JOIN country c1
ON c1.country_id = c.country_id;

--2.  I would like to get a better understanding of all of the inventory that 
--would come along with the business. Please pull together a list of each inventory item 
--you have stocked, including the store_id number, the inventory_id , 
--the name of the film, the film’s rating, its rental rate and replacement cost.

SELECT st.store_id,i.inventory_id,f.title,f.rating,f.rental_rate,f.replacement_cost
FROM inventory i
INNER JOIN store st
ON st.store_id=i.store_id
INNER JOIN film f
ON f.film_id=i.film_id;

--3. From the same list of films you just pulled, please roll that data up and provide
--a summary level overview of your inventory. We would like to know how many inventory 
--items you have with each rating at each store.

SELECT st.store_id,f.rating,COUNT(*) AS inventory_items
FROM inventory i
INNER JOIN store st
ON st.store_id=i.store_id
INNER JOIN film f
ON
f.film_id=i.film_id
GROUP BY st.store_id,f.rating
ORDER BY f.rating ASC,st.store_id ASC,inventory_items DESC;

--4) Similarly, we want to understand how diversified the inventory is in terms of 
--replacement cost. We want to see how big of a hit it would be if a certain category of 
--film became unpopular at a certain store. We would like to see the number of films, as
--well as the average replacement cost, and total replacement cost, sliced by store and 
--film category.

SELECT inventory.store_id, category.name AS "category", COUNT(film.film_id) AS "films", 
AVG(film.replacement_cost) AS "avg_replacement_cost", SUM(film.replacement_cost) AS "total_replacement_cost"
FROM film_category
INNER JOIN category ON film_category.category_id=category.category_id
INNER JOIN film ON film_category.film_id=film.film_id
INNER JOIN inventory ON film.film_id=inventory.film_id
GROUP BY inventory.store_id, category.name;

--5. We want to make sure you folks have a good handle on who your customers are. 
--Please provide a list of all customer names, which store they go to, whether or not
--they are currently active, and their full addresses street address, city, and country.
SELECT 
 customer.first_name,
 customer.last_name,
 customer.store_id,
 customer.active,
 address.address,
 city.city,
 country.country
 FROM customer
  LEFT JOIN address ON customer.address_id = address.address_id
  LEFT JOIN city ON address.city_id = city.city_id
  LEFT JOIN country ON city.country_id = country.country_id;

--Q6)We would like to understand how much your customers are spending with you, 
--and also to know who your most valuable customers are. Please pull together a list
--of customer names, their total lifetime rentals, and the sum of all payments you have 
--collected from them. It would be great to see this ordered on total lifetime value,
--with the most valuable customers at the top of the list.


SELECT 
  customer.first_name,
  customer.last_name,
  COUNT(rental.rental_id) AS total_rentals,
  SUM(payment.amount) AS total_payment_amount
 FROM customer
   LEFT JOIN rental ON customer.customer_id = rental.customer_id
   LEFT JOIN payment ON rental.rental_id = payment.rental_id
   GROUP BY 
     customer.first_name,
     customer.last_name
ORDER BY 
  SUM(payment.amount) DESC;



