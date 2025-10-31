SELECT 
    c.name AS categoria,
    COUNT(film_id) AS cantidad_peliculas
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
GROUP BY c.name
ORDER BY cantidad_peliculas DESC;

SELECT 
    s.store_id,
    ci.city,
    co.country
FROM store s
JOIN address a ON s.address_id = a.address_id
JOIN city ci ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id;

SELECT 
    st.store_id,
    SUM(p.amount) AS ingresos_totales
FROM payment p
JOIN staff sf ON p.staff_id = sf.staff_id
JOIN store st ON sf.store_id = st.store_id
GROUP BY st.store_id;

SELECT 
    c.name AS categoria,
    ROUND(AVG(f.length), 2) AS duracion_promedio
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY duracion_promedio DESC;

SELECT 
    c.name AS categoria,
    ROUND(AVG(f.length), 2) AS duracion_promedio
FROM film f
JOIN film_category fc ON f.film_id = fc.film_id
JOIN category c ON fc.category_id = c.category_id
GROUP BY c.name
ORDER BY duracion_promedio DESC
LIMIT 10;

SELECT 
    f.title AS pelicula,
    COUNT(r.rental_id) AS veces_alquilada
FROM rental r
JOIN inventory i ON r.inventory_id = i.inventory_id
JOIN film f ON i.film_id = f.film_id
GROUP BY f.title
ORDER BY veces_alquilada DESC
LIMIT 10;

SELECT 
    f.title,
    i.store_id,
    COUNT(i.inventory_id) AS copias_disponibles
FROM film f
JOIN inventory i ON f.film_id = i.film_id
WHERE f.title = 'Academy Dinosaur' AND i.store_id = 1
GROUP BY f.title, i.store_id;

