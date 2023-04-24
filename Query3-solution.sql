SELECT name, standard_quartile,
COUNT(standard_quartile)
FROM ( /*subquery*/
SELECT c.name, f.rental_duration,
NTILE(4) OVER (ORDER BY f.rental_duration) AS standard_quartile /* Percentiles */
FROM category AS c
JOIN film_category AS filmc
ON c.category_id = filmc.category_id
JOIN film AS f
ON filmc.film_id = f.film_id
WHERE c.name = 'Animation' OR c.name ='Children' OR c.name = 'Classics' OR c.name = 'Comedy' OR c.name = 'Family' OR c.name = 'Music') AS Movie /* Case statements */
GROUP BY 1, 2
ORDER BY 1, 2;
