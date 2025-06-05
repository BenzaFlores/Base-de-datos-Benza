-- 1. Crea una base de datos llamada biblioteca con utf8mb4_unicode_ci.
CREATE DATABASE IF NOT EXISTS biblioteca CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
-- 2. Modifica la base de datos biblioteca para cambiar su collation a utf8mb4_general_ci.
ALTER DATABASE biblioteca COLLATE utf8mb4_general_ci;
-- 3. Crea una tabla bibliotecas con los siguientes campos: id y nombre.
USE biblioteca;
CREATE TABLE IF NOT EXISTS bibliotecas (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);
-- 4. Crea una tabla libros con los siguientes campos: id, biblioteca_id, titulo, autor, anio_publicacion
USE biblioteca;
CREATE TABLE IF NOT EXISTS libros (
	id INT AUTO_INCREMENT PRIMARY KEY,
    biblioteca_id INT UNSIGNED,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    anio_publicacion YEAR NOT NULL,
    FOREIGN KEY (biblioteca_id) REFERENCES bibliotecas(id) ON DELETE CASCADE
);
-- 5. Modifica la tabla libros agregando una columna genero (VARCHAR(50)).
USE biblioteca;
ALTER TABLE libros ADD genero VARCHAR(50);
-- 6. Cambia el tamaño de nombre en bibliotecas a 150 caracteres.
USE biblioteca;
ALTER TABLE bibliotecas MODIFY nombre VARCHAR(150) NOT NULL;
-- 7. Elimina la columna genero de libros.
USE biblioteca;
ALTER TABLE libros DROP genero;
-- 8. Añade una nueva columna isbn de tipo VARCHAR(20) después de titulo en libros.
USE biblioteca;
ALTER TABLE libros ADD isbn VARCHAR(20) AFTER titulo;
-- 9. Cambia el tipo de dato de isbn en libros para que sea CHAR(13).
USE biblioteca;
ALTER TABLE libros MODIFY isbn CHAR(13) AFTER titulo;
-- 10. Inserta una biblioteca llamada "Biblioteca Central".
USE biblioteca;
INSERT INTO bibliotecas (nombre) VALUES ("Biblioteca Central");
-- 11. Añade un libro "El Quijote" de "Miguel de Cervantes" en la Biblioteca Central.
USE biblioteca;
INSERT INTO libros (biblioteca_id, titulo, autor, anio_publicacion) VALUES ((SELECT id FROM bibliotecas WHERE nombre = "Biblioteca Central"), "El Quijote", "Miguel de Cervantes", 2000);
-- 12. Registra dos libros adicionales en la Biblioteca Central.
USE biblioteca;
INSERT INTO libros (biblioteca_id, titulo, autor, anio_publicacion) VALUES ((SELECT id FROM bibliotecas WHERE nombre = "Biblioteca Central"), "Sherlock Holmes", "Arthur Conan Doyle", 2000), ((SELECT id FROM bibliotecas WHERE nombre = "Biblioteca Central"), "Miss Marple", "Agatha Christie", 2000);
-- 13. Consulta todos los libros con su biblioteca.
USE biblioteca;
SELECT * FROM libros;
-- 14. Muestra todas las bibliotecas sin libros registrados
SELECT l.titulo, l.autor, b.nombre AS biblioteca FROM libros l JOIN bibliotecas b ON l.biblioteca_id = b.id;
-- 15. Actualiza el año de publicación de "1984" a 1950.
USE biblioteca;
UPDATE libros SET anio_publicacion = 1950 WHERE titulo = "Sherlock Holmes";
-- 16. Elimina un libro con id = 1.
USE biblioteca;
DELETE FROM libros WHERE id = 1;
-- 17. Elimina la Biblioteca Central y todos sus libros.
USE biblioteca;
DELETE FROM bibliotecas WHERE biblioteca_id = (SELECT id FROM bibliotecas WHERE nombre = "Biblioteca Central");
-- 18. Consulta la estructura de la tabla libros.
USE biblioteca;
DESCRIBE libros;
-- 19. Elimina la tabla libros y bibliotecas.
USE biblioteca;
DROP TABLE IF EXISTS libros, bibliotecas;
-- 20. Elimina la base de datos biblioteca.
USE biblioteca;
DROP DATABASE IF EXISTS biblioteca;