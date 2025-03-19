-- Ejercicio 3 

-- Crear la base de datos 'biblioteca' con collation utf8mb4_unicode_ci
CREATE DATABASE biblioteca CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Cambiar el collation de la base de datos a utf8mb4_general_ci
ALTER DATABASE biblioteca CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- Usar la base de datos 'biblioteca'
USE biblioteca;

-- Crear la tabla 'bibliotecas'
CREATE TABLE bibliotecas (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Crear la tabla 'libros'
CREATE TABLE libros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    biblioteca_id INT UNSIGNED,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    anio_publicacion YEAR NOT NULL,
    FOREIGN KEY (biblioteca_id) REFERENCES bibliotecas(id)
);

-- Modificar la tabla 'libros' para agregar una columna 'genero'
ALTER TABLE libros ADD COLUMN genero VARCHAR(50);

-- Cambiar el tamaño del campo 'nombre' en la tabla 'bibliotecas' a 150 caracteres
ALTER TABLE bibliotecas MODIFY nombre VARCHAR(150) NOT NULL;

-- Eliminar la columna 'genero' de la tabla 'libros'
ALTER TABLE libros DROP COLUMN genero;

-- Añadir una nueva columna 'isbn' de tipo VARCHAR(20) después de 'titulo' en 'libros'
ALTER TABLE libros ADD COLUMN isbn VARCHAR(20) AFTER titulo;

-- Cambiar el tipo de dato de 'isbn' en 'libros' para que sea CHAR(13)
ALTER TABLE libros MODIFY isbn CHAR(13);

-- Insertar una biblioteca llamada "Biblioteca Central"
INSERT INTO bibliotecas (nombre) VALUES ('Biblioteca Central');

-- Añadir un libro "El Quijote" de "Miguel de Cervantes" en la Biblioteca Central
INSERT INTO libros (biblioteca_id, titulo, isbn, autor, anio_publicacion) 
VALUES (1, 'El Quijote', '9781234567890', 'Miguel de Cervantes', 1605);

-- Registrar dos libros adicionales en la Biblioteca Central
INSERT INTO libros (biblioteca_id, titulo, isbn, autor, anio_publicacion) 
VALUES 
(1, '1984', '9780451524935', 'George Orwell', 1949),
(1, 'Cien años de soledad', '9788437604947', 'Gabriel García Márquez', 1967);

-- Consultar todos los libros con su biblioteca
SELECT b.nombre AS biblioteca, l.titulo, l.autor, l.anio_publicacion
FROM libros l
JOIN bibliotecas b ON l.biblioteca_id = b.id;

-- Mostrar todas las bibliotecas sin libros registrados
SELECT b.nombre
FROM bibliotecas b
LEFT JOIN libros l ON b.id = l.biblioteca_id
WHERE l.id IS NULL;

-- Actualizar el año de publicación de "1984" a 1950
UPDATE libros 
SET anio_publicacion = 1950
WHERE titulo = '1984';

-- Eliminar un libro con id = 1
DELETE FROM libros WHERE id = 1;

-- Eliminar la Biblioteca Central y todos sus libros
DELETE FROM libros WHERE biblioteca_id = 1;
DELETE FROM bibliotecas WHERE id = 1;

-- Consultar la estructura de la tabla 'libros'
DESCRIBE libros;

-- Eliminar la tabla 'libros' y 'bibliotecas'
DROP TABLE libros;
DROP TABLE bibliotecas;

-- Eliminar la base de datos 'biblioteca'
DROP DATABASE biblioteca;

----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

-- Ejercicio 4

-- Crear la base de datos 'universidad' con collation utf8mb4_unicode_ci
CREATE DATABASE universidad CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Cambiar el collation de la base de datos a utf8mb4_general_ci
ALTER DATABASE universidad CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- Usar la base de datos 'universidad'
USE universidad;

-- Crear la tabla 'alumnos'
CREATE TABLE alumnos (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Crear la tabla 'asignaturas'
CREATE TABLE asignaturas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);

-- Crear la tabla 'matriculas' para gestionar la relación muchos a muchos
CREATE TABLE matriculas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    alumno_id INT UNSIGNED,
    asignatura_id INT UNSIGNED,
    fecha_matricula DATE NOT NULL,
    FOREIGN KEY (alumno_id) REFERENCES alumnos(id),
    FOREIGN KEY (asignatura_id) REFERENCES asignaturas(id)
);

-- Modificar la tabla 'matriculas' para agregar una columna 'nota'
ALTER TABLE matriculas ADD COLUMN nota DECIMAL(4,2);

-- Cambiar el tamaño del campo 'nombre' en la tabla 'asignaturas' a 150 caracteres
ALTER TABLE asignaturas MODIFY nombre VARCHAR(150) NOT NULL;

-- Eliminar la columna 'nota' de la tabla 'matriculas'
ALTER TABLE matriculas DROP COLUMN nota;

-- Añadir un índice a la columna 'nombre' en la tabla 'asignaturas'
CREATE INDEX idx_nombre ON asignaturas(nombre);

-- Insertar un alumno llamado "Luis Gómez"
INSERT INTO alumnos (nombre) VALUES ('Luis Gómez');

-- Añadir una asignatura llamada "Matemáticas"
INSERT INTO asignaturas (nombre) VALUES ('Matemáticas');

-- Matricular al alumno "Luis Gómez" en "Matemáticas" con fecha de matrícula de hoy
INSERT INTO matriculas (alumno_id, asignatura_id, fecha_matricula) 
VALUES (1, 1, CURDATE());

-- Insertar dos alumnos adicionales
INSERT INTO alumnos (nombre) VALUES ('María Fernández'), ('Carlos Ruiz');

-- Añadir tres asignaturas adicionales
INSERT INTO asignaturas (nombre) VALUES ('Física'), ('Historia'), ('Química');

-- Matricular a los alumnos en distintas asignaturas
-- Ejemplo: Matricular a María Fernández en Física y Historia, y a Carlos Ruiz en Química
INSERT INTO matriculas (alumno_id, asignatura_id, fecha_matricula) 
VALUES 
(2, 2, CURDATE()), -- María Fernández en Física
(2, 3, CURDATE()), -- María Fernández en Historia
(3, 4, CURDATE()); -- Carlos Ruiz en Química

-- Consultar todas las asignaturas en las que está inscrito el alumno "Luis Gómez"
SELECT a.nombre 
FROM asignaturas a
JOIN matriculas m ON a.id = m.asignatura_id
JOIN alumnos al ON m.alumno_id = al.id
WHERE al.nombre = 'Luis Gómez';

-- Consultar todos los alumnos que están inscritos en la asignatura "Matemáticas"
SELECT al.nombre 
FROM alumnos al
JOIN matriculas m ON al.id = m.alumno_id
JOIN asignaturas a ON m.asignatura_id = a.id
WHERE a.nombre = 'Matemáticas';

-- Eliminar la inscripción de un alumno en una asignatura específica
-- Ejemplo: Eliminar la matrícula de Luis Gómez en Matemáticas
DELETE FROM matriculas 
WHERE alumno_id = 1 AND asignatura_id = 1;

-- Eliminar un alumno y sus matrículas asociadas
-- Ejemplo: Eliminar a Carlos Ruiz y sus matrículas
DELETE FROM matriculas WHERE alumno_id = 3;
DELETE FROM alumnos WHERE id = 3;

-- Eliminar la base de datos 'universidad'
DROP DATABASE universidad;