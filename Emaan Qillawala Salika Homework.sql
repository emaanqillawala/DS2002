-- Emaan Qillawala Salika Homework

-- 1. List of Actors in a Specific Film
SELECT first_name, last_name FROM actor JOIN film_actor ON film_actor.actor_id = actor.actor_id WHERE film_id LIKE 1;

-- 2. Count of Films in Each Category
SELECT name AS category_name, COUNT(film_id) AS movie_count FROM category, film_category WHERE film_category.category_id = category.category_id GROUP BY category.name;

-- 3. Average Rental Duration for Each Rating
SELECT rating, AVG(rental_duration) AS average_rental_duration FROM film GROUP BY film.rating;

-- 4. Total Number of Rentals for Each Customer
SELECT first_name, last_name, COUNT(rental_id) AS rental_count FROM customer, rental WHERE customer.customer_id = rental.customer_id GROUP BY first_name, last_name;

-- 5. Stores with the Highest Number of Rentals
SELECT store_id, COUNT(rental_id) AS rental_number FROM store, rental WHERE store.manager_staff_id = rental.staff_id GROUP BY store_id ORDER BY count(rental_id) DESC LIMIT 1;

-- 6. Most Popular Film Category Among Customers
SELECT name AS category_name, COUNT(rental_id) AS rental_count FROM category, rental, inventory, film_category WHERE rental.inventory_id = inventory.inventory_id AND inventory.film_id = film_category.film_id AND film_category.category_id = category.category_id GROUP BY category_name ORDER BY rental_count DESC LIMIT 1;

-- 7. Average Rental Cost of Films by Category
SELECT name AS category_name, AVG(rental_rate) AS avg_rental_cost FROM category, film, film_category WHERE category.category_id = film_category.category_id AND film_category.film_id = film.film_id GROUP BY category_name;

-- 8. List of Films Not Rented in the Last Month (which will be all of them)
SELECT title AS film_title, MAX(rental_date) AS last_rental_date FROM film LEFT JOIN inventory ON inventory.film_id = film.film_id LEFT JOIN rental ON rental.inventory_id = inventory.inventory_id GROUP BY film_title;

-- 9. Customer Spending on Rentals
SELECT first_name, last_name, SUM(amount) AS total_paid FROM customer, payment WHERE customer.customer_id = payment.customer_id GROUP BY first_name, last_name;

-- 10. Average Length of Films in Each Language
SELECT name AS language_name, AVG(length) AS avg_movie_length FROM language, film WHERE language.language_id = film.language_id GROUP BY language_name;
