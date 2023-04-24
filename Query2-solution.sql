SELECT title, name, rental_duration, NTILE(1) OVER (ORDER BY f.rental_duration) AS standard_quartile 
FROM( /*subquery*/
SELECT f.title AS title, c.name AS name, f.rental_duration AS rental_duration
FROM film_category filmc
JOIN category c
ON c.category_id = filmc.category_id
JOIN film f
ON f.film_id = filmc.film_id
WHERE c.name = 'Animation' OR c.name ='Children' OR c.name = 'Classics' OR c.name = 'Comedy' OR c.name = 'Family' OR c.name = 'Music' ) AS Movie
ORDER BY 3
