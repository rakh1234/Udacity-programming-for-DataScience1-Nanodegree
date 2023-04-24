SELECT DATE_PART('month', r.rental_date) AS Rental_month,
DATE_PART('year', r.rental_date) AS Rental_year, s.store_id AS Store_id,
COUNT(*) AS Count_rentals

FROM rental AS r JOIN staff AS s
ON r.staff_id = s.staff_id
GROUP BY 1, 2, 3
ORDER BY 4 DESC;
