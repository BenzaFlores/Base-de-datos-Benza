-- 1. Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos. El listado deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido, segundo apellido y nombre.
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = "alumno" ORDER BY apellido1, apellido2, nombre;
-- 2. Averigua el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos.
SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = "alumno" AND telefono IS NULL;
-- 3. Devuelve el listado de los alumnos que nacieron en 1999.
SELECT * FROM persona WHERE tipo = "alumno" AND YEAR(fecha_nacimiento) = 1999;
-- 4. Devuelve el listado de profesores que no han dado de alta su número de teléfono en la base de datos y además su nif termina en K.
SELECT * FROM persona WHERE tipo = "profesor" AND telefono IS NULL AND nif LIKE "%K";
-- 5. Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado que tiene el identificador 7.
SELECT * FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
-- 6. Lista los nombres de todos los alumnos.
SELECT nombre FROM persona WHERE tipo = "alumno";
-- 7. Lista los alumnos que viven en “Madrid”.
SELECT * FROM persona WHERE tipo = "alumno" AND ciudad = "Madrid";
-- 8. Lista los alumnos cuya ciudad comience por “S”.
SELECT * FROM persona WHERE tipo = "alumno" AND ciudad LIKE "S%";
-- 9. Lista los alumnos que no viven en “Madrid”.
SELECT * FROM persona WHERE tipo = "alumno" AND ciudad != "Madrid";
-- 10. Muestra cuántos alumnos hay en total.
SELECT COUNT(*) FROM persona WHERE tipo = "alumno";
-- 11. Muestra cuántas ciudades diferentes hay entre los alumnos.
SELECT COUNT(DISTINCT ciudad) FROM persona WHERE tipo = "alumno";
-- 12. Muestra los nombres y ciudades de los alumnos ordenados alfabéticamente por ciudad.
SELECT nombre, ciudad FROM persona WHERE tipo = "alumno" ORDER BY ciudad;
-- 13. Muestra el número de alumnos por ciudad.
SELECT ciudad, COUNT(*) AS num_alumnos FROM persona WHERE tipo = "alumno" GROUP BY ciudad;
-- 14. Muestra los alumnos cuyo nombre contenga la letra “a”.
SELECT * FROM persona WHERE tipo = "alumno" AND nombre LIKE "%a%";
-- 15. Muestra los alumnos cuya ciudad tenga exactamente 5 caracteres.
SELECT * FROM persona WHERE tipo = "alumno" AND ciudad LIKE "_____";
-- 16. Lista el nombre de todos los profesores.
SELECT nombre FROM persona WHERE tipo = "profesor";
-- 17. Muestra los profesores que pertenecen al departamento 1.
SELECT p.*, d.nombre AS nombre_departamento FROM profesor p JOIN departamento d ON p.id_departamento = d.id WHERE d.id = 1;
-- 18. Muestra los profesores cuyo nombre empiece por “M”.
SELECT nombre FROM persona WHERE tipo = "profesor" AND nombre LIKE "M%";
-- 19. Muestra cuántos profesores hay por cada departamento.
SELECT id_departamento, COUNT(*) AS num_profesores FROM profesor GROUP BY id_departamento;
-- 20. Muestra el nombre del profesor que tiene el código más alto.
SELECT nombre FROM persona WHERE tipo = "profesor" ORDER BY persona.id DESC LIMIT 1;
-- 21. Muestra cuántos profesores hay en total.
SELECT COUNT(*) FROM profesor;
-- 22. Muestra los códigos de departamento distintos de los profesores.
SELECT DISTINCT id_departamento FROM profesor;
-- 23. Muestra el nombre de todas las asignaturas de 1er curso.
SELECT nombre FROM asignatura WHERE curso = 1;
-- 24. Muestra las asignaturas del primer cuatrimestre.
SELECT * FROM asignatura WHERE cuatrimestre = 1;
-- 25. Muestra las asignaturas que tengan más de 6 créditos.
SELECT * FROM asignatura WHERE creditos > 6;
-- 26. Muestra cuántas asignaturas hay por cada curso.
SELECT curso, COUNT(*) AS num_asignaturas FROM asignatura GROUP BY curso;
-- 27. Muestra las asignaturas ordenadas por número de créditos (descendente).
SELECT * FROM asignatura ORDER BY creditos DESC;
-- 28. Muestra los nombres de asignaturas que tengan la palabra "Programación".
SELECT nombre FROM asignatura WHERE nombre LIKE "%Programación%";
-- 29. Muestra cuántas asignaturas hay en total.
SELECT COUNT(*) FROM asignatura;
-- 30. Muestra cuántas matrículas hay registradas.
SELECT COUNT(*) AS total_matriculas FROM alumno_se_matricula_asignatura;