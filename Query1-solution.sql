SELECT film_title, Category_name, COUNT(*) AS rental_count
FROM ( /*subquery*/
SELECT c.name AS Category_name, f.title AS film_title
FROM category c
JOIN film_category fc
ON fc.category_id = c.category_id
JOIN film f
ON f.film_id = fc.film_id
JOIN inventory i
ON i.film_id = f.film_id
JOIN rental r 
ON r.inventory_id = i.inventory_id
WHERE c.name IN ('Animation', 'Children', 'Classics', 'Comedy', 'Family', 'Music')
ORDER BY title ) AS Movie
GROUP BY 1, 2
ORDER BY 2, 1
