-- 1. ¿Cuál es el título de la película con el ID 10?
SELECT titulo FROM pelicula WHERE id_pelicula = 10;
-- 2. ¿Cuántas películas hay en total en la tabla film?
SELECT COUNT(*) FROM pelicula;
-- 3. ¿Cuál es el ID de la película más cara?
SELECT id_pelicula FROM pelicula ORDER BY rental_rate DESC LIMIT 1;
-- 4. ¿Cuántos actores están asociados con la película cuyo título es "ACADEMY DINOSAUR"?
SELECT COUNT(id_actor) FROM pelicula, pelicula_actor WHERE titulo = "ACADEMY DINOSAUR" AND pelicula.id_pelicula = pelicula_actor.id_pelicula;
-- 5. ¿Cuáles son los primeros 5 títulos de películas con una clasificación de "PG"?
SELECT titulo FROM pelicula WHERE clasificacion = "PG" LIMIT 5;
-- 6. ¿Qué director tiene más películas en la base de datos?
-- Profe no hay ninguna columna o tabla de director
-- 7. ¿Cuántas películas tienen un alquiler con un costo superior a 3.50?
SELECT COUNT(*) FROM pelicula WHERE rental_rate > 3.50;
-- 8. ¿Cuál es el título de la película con el ID más bajo?
SELECT titulo FROM pelicula ORDER BY id_pelicula LIMIT 1;
-- 9. ¿Cuántas películas en total están disponibles para alquilar en la tienda?
SELECT COUNT(DISTINCT id_pelicula) FROM inventario;
-- 10. ¿Cuál es la duración promedio de las películas en la tabla film?
SELECT AVG(duracion) AS duracion_promedio FROM pelicula;
-- 11. ¿Qué actor tiene más películas asociadas a él en la tabla film_actor?
SELECT id_actor, COUNT(*) AS cantidad FROM pelicula_actor GROUP BY id_actor ORDER BY cantidad DESC LIMIT 1;
-- 12. ¿Cuáles son los 10 títulos de películas con la mayor duración?
SELECT titulo, duracion FROM pelicula ORDER BY duracion DESC LIMIT 10;
-- 13. ¿Cuál es la clasificación más común entre las películas?
SELECT clasificacion, COUNT(*) AS cantidad FROM pelicula GROUP BY clasificacion ORDER BY cantidad DESC LIMIT 1;
-- 14. ¿Qué idioma se utiliza con mayor frecuencia en las películas?
SELECT i.nombre, COUNT(*) AS cantidad FROM pelicula p JOIN idioma i ON p.id_idioma = i.id_idioma GROUP BY i.nombre ORDER BY cantidad DESC LIMIT 1;
-- 15. ¿Cuántas películas fueron estrenadas en el año 2005?
SELECT COUNT(*) FROM pelicula WHERE anyo_lanzamiento = 2005;
-- 16. ¿Cuántas películas tienen una clasificación de "R" y un costo de alquiler superior a 4.00?
SELECT COUNT(*) FROM pelicula WHERE clasificacion = "R" AND rental_rate > 4.00;
-- 17. ¿Qué película tiene el precio de alquiler más bajo?
SELECT titulo, rental_rate FROM pelicula ORDER BY rental_rate ASC LIMIT 1;
-- 18. ¿Cuál es el actor con más películas en la tabla film_actor?
SELECT id_actor, COUNT(*) AS cantidad FROM pelicula_actor GROUP BY id_actor ORDER BY cantidad DESC LIMIT 1;
-- 19. ¿Cuáles son los 3 títulos de películas que tienen la mayor cantidad de copias disponibles en inventario?
SELECT p.titulo, COUNT(*) AS copias FROM inventario i JOIN pelicula p ON i.id_pelicula = p.id_pelicula GROUP BY i.id_pelicula ORDER BY copias DESC LIMIT 3;
-- 20. ¿Cuáles son los 5 actores más comunes en las películas de la categoría "Action"?
SELECT a.id_actor, a.nombre, a.apellidos, COUNT(*) AS total FROM actor a JOIN pelicula_actor pa ON a.id_actor = pa.id_actor JOIN pelicula_categoria pc ON pa.id_pelicula = pc.id_pelicula JOIN categoria c ON pc.id_categoria = c.id_categoria WHERE c.nombre = "Action" GROUP BY a.id_actor ORDER BY total DESC LIMIT 5;
-- 21. ¿Cuántas películas están catalogadas como "Drama" y tienen una duración superior a 120 minutos?
SELECT COUNT(*) FROM pelicula p JOIN pelicula_categoria pc ON p.id_pelicula = pc.id_pelicula JOIN categoria c ON pc.id_categoria = c.id_categoria WHERE c.nombre = "Drama" AND p.duracion > 120;
-- 22. ¿Cuántas películas fueron estrenadas antes del 1 de enero de 2000?
SELECT COUNT(*) FROM pelicula WHERE anyo_lanzamiento < 2000;
-- 23. ¿Cuál es el costo promedio de alquiler de todas las películas?
SELECT AVG(rental_rate) AS alquiler_promedio FROM pelicula;
-- 24. ¿Qué película tiene el mayor precio de compra?
SELECT titulo, rental_rate  FROM pelicula ORDER BY rental_rate DESC LIMIT 1;
-- 25. ¿Cuántos actores participaron en la película con el título "CHAMPION"?
SELECT COUNT(*) FROM pelicula_actor pa JOIN pelicula p ON pa.id_pelicula = p.id_pelicula WHERE p.titulo = "CHAMPION";
-- 26. ¿Cuál es la película más reciente en la base de datos?
SELECT titulo FROM pelicula ORDER BY ultima_actualizacion DESC LIMIT 1;
-- 27. ¿Cuál es el precio promedio de las películas en la categoría "Action"?
SELECT AVG(p.rental_rate) FROM pelicula p JOIN pelicula_categoria pc ON p.id_pelicula = pc.id_pelicula JOIN categoria c ON pc.id_categoria = c.id_categoria WHERE c.nombre = "Action";
-- 28. ¿Cuáles son los 10 primeros títulos de películas cuyo título empieza con la letra "S"?
SELECT titulo FROM pelicula WHERE titulo LIKE "S%" ORDER BY titulo LIMIT 10;
-- 29. ¿Cuáles son las 5 películas que tienen la menor duración y están disponibles para alquilar?
SELECT p.titulo, p.duracion FROM pelicula p JOIN inventario i ON p.id_pelicula = i.id_pelicula WHERE p.duracion IS NOT NULL GROUP BY p.id_pelicula ORDER BY p.duracion ASC LIMIT 5;
-- 30. ¿Cuál es la película con más copias en inventario?
SELECT p.titulo, COUNT(*) AS total_copias FROM inventario i JOIN pelicula p ON i.id_pelicula = p.id_pelicula GROUP BY i.id_pelicula ORDER BY total_copias DESC LIMIT 1;