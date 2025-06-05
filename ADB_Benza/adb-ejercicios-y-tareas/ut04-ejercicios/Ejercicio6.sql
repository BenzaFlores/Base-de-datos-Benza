-- 1. Crea una base de datos llamada instituto con utf8mb4_unicode_ci.
CREATE DATABASE IF NOT EXISTS instituto CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
-- 2. Modifica la base de datos instituto para cambiar su collation a utf8mb4_general_ci.
ALTER DATABASE instituto COLLATE utf8mb4_general_ci;
-- 3. Crea una tabla profesores con los siguientes campos: id: UNSIGNED INT, auto incremental, clave primaria, nombre: VARCHAR(100), no nulo.
USE instituto;
CREATE TABLE IF NOT EXISTS profesores (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);
-- 4. Crea una tabla cursos con los siguientes campos: id: AUTO_INCREMENT, clave primaria, nombre: VARCHAR(150), no nulo, descripcion: TEXT, opcional.
USE instituto;
CREATE TABLE IF NOT EXISTS cursos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(150) NOT NULL,
    descripcion TEXT
);
-- 5. Crea la tabla intermedia profesores_cursos para gestionar la relación muchos a muchos entre profesores y cursos, con los campos: id: AUTO_INCREMENT, clave primaria, profesor_id: UNSIGNED INT, clave foránea a profesores(id), curso_id: UNSIGNED INT, clave foránea a cursos(id), fecha_asignacion: DATE, no nulo.
USE instituto;
CREATE TABLE IF NOT EXISTS profesores_cursos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    profesor_id INT UNSIGNED,
    curso_id INT UNSIGNED,
    fecha_asignacion DATE NOT NULL,
    FOREIGN KEY (profesor_id) REFERENCES profesores(id) ON DELETE CASCADE,
    FOREIGN KEY (curso_id) REFERENCES cursos(id) ON DELETE CASCADE
);
-- 6. Modifica la tabla profesores_cursos para agregar una columna horas_clase de tipo INT.
USE instituto;
ALTER TABLE profesores_cursos ADD horas_clase INT;
-- 7. Cambia el tamaño del campo nombre en la tabla cursos a 200 caracteres.
USE instituto;
ALTER TABLE cursos MODIFY nombre VARCHAR(200) NOT NULL;
-- 8. Elimina la columna horas_clase de la tabla profesores_cursos.
USE instituto;
ALTER TABLE profesores_cursos DROP horas_clase IF EXISTS;
-- 9. Añade un índice a la columna nombre en cursos para mejorar la búsqueda.
USE instituto;
CREATE INDEX indice_nombre ON cursos(nombre);
-- 10. Inserta un profesor llamado "Juan Pérez".
USE instituto;
INSERT INTO profesores (nombre) VALUES ("Juan Pérez");
-- 11. Añade un curso llamado "Matemáticas" con una descripción "Curso de álgebra y geometría".
USE instituto;
INSERT INTO cursos (nombre, descripcion) VALUES ("Matemáticas", "Curso de álgebra y geometría");
-- 12. Asigna el profesor "Juan Pérez" al curso "Matemáticas" con fecha de asignación de hoy.
USE instituto;
INSERT INTO profesores_cursos (profesor_id, curso_id, fecha_asignacion) VALUES ((SELECT id FROM profesores WHERE nombre = "Juan Pérez"), (SELECT id FROM cursos WHERE nombre = "Matemáticas"), CURDATE());
-- 13. Inserta dos profesores adicionales ("Ana Rodríguez" y "Luis Gómez").
USE instituto;
INSERT INTO profesores (nombre) VALUES ("Ana Rodríguez"), ("Luis Gómez");
-- 14. Añade tres cursos adicionales ("Física", "Historia", "Química").
USE instituto;
INSERT INTO cursos (nombre) VALUES ("Física"), ("Historia"), ("Química");
-- 15. Asigna a los profesores a distintos cursos.
USE instituto;
INSERT INTO profesores_cursos (profesor_id, curso_id, fecha_asignacion) VALUES ((SELECT id FROM profesores WHERE nombre = "Ana Rodríguez"), (SELECT id FROM cursos WHERE nombre = "Física"), CURDATE()), ((SELECT id FROM profesores WHERE nombre = "Luis Gómez"), (SELECT id FROM cursos WHERE nombre = "Historia"), CURDATE()), ((SELECT id FROM profesores WHERE nombre = "Juan Pérez"), (SELECT id FROM cursos WHERE nombre = "Química"), CURDATE());
-- 16. Consulta todos los cursos en los que imparte clases "Juan Pérez".
USE instituto;
SELECT c.nombre FROM cursos c JOIN profesores_cursos pc ON c.id = pc.curso_id
JOIN profesores p ON pc.profesor_id = p.id WHERE p.nombre = "Juan Pérez";
-- 17. Consulta todos los profesores que enseñan el curso "Matemáticas".
USE instituto;
SELECT p.nombre FROM profesores p JOIN profesores_cursos pc ON p.id = pc.profesor_id JOIN cursos c ON pc.curso_id = c.id WHERE c.nombre = "Matemáticas";
-- 18. Elimina la asignación de un profesor en un curso específico.
USE instituto;
DELETE FROM profesores_cursos WHERE profesor_id = (SELECT id FROM profesores WHERE nombre = "Juan Pérez");
-- 19. Elimina un profesor y sus registros de cursos.
USE instituto;
DELETE FROM profesores WHERE profesor_id = (SELECT id FROM profesores WHERE nombre = "Ana Rodríguez") ;
-- 20. Elimina la base de datos instituto.
USE instituto;
DROP DATABASE IF EXISTS instituto;