-- 1. Crear bbdd
CREATE DATABASE IF NOT EXISTS usuarios_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
-- 2. Cambiar collation
ALTER DATABASE usuarios_db COLLATE utf8mb4_general_ci;
-- 3. Crear tabla usuarios
USE usuarios_db;
CREATE TABLE IF NOT EXISTS usuarios (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);
-- 4. Crear tabla direcciones
CREATE TABLE IF NOT EXISTS direcciones (
	id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    usuario_id INT UNSIGNED UNIQUE,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(id),
    direccion VARCHAR(255) NOT NULL
);
-- 5. Modificar tabla direcciones. Hacer que usuario_id sea PK y FK
USE usuarios_db;
ALTER TABLE direcciones DROP PRIMARY KEY, ADD PRIMARY KEY(usuario_id);
-- 6. Modificar tabla usuarios. Aumentar tamaño campo nombre a 150 caracteres
USE usuarios_db;
ALTER TABLE usuarios MODIFY nombre VARCHAR(150) NOT NULL;
-- 7. Modificar tabla usuarios. Añadir columna telefono varchar(15) despues de columna nombre
USE usuarios_db;
ALTER TABLE usuarios ADD telefono VARCHAR(15) AFTER nombre;
-- 8. Modificar tabla usuarios. Telefono tipo BIGINT
USE usuarios_db; 
ALTER TABLE usuarios MODIFY telefono BIGINT;
-- 9. Modificar tabla usuarios. Eliminar columna telefono
USE usuarios_db;
ALTER TABLE usuarios DROP telefono;
-- 10. Insertar un usuario "Juan Pérez"
USE usuarios_db;
INSERT INTO usuarios (nombre) VALUES ("Juan Pérez");
-- 11. Insertar una direccion "Calle Mayor 123" para "Juan Pérez"
USE usuarios_db;
INSERT INTO direcciones (usuario_id, direccion) 
VALUES ((SELECT id FROM usuarios WHERE nombre = "Juan Pérez"), "Calle Mayor 123");
-- 12. Insertar dos usuarios ("Ana Gómez" y "Carlos Ruiz")
USE usuarios_db;
INSERT INTO usuarios (nombre) VALUES ("Ana Gómez"), ("Carlos Ruiz");
-- 13. Añade direcciones para los nuevos usuarios
USE usuarios_db;
INSERT INTO direcciones (usuario_id, direccion) 
VALUES ((SELECT id FROM usuarios WHERE nombre = "Ana Gómez"), "Calle Secundaria 456"), ((SELECT id FROM usuarios WHERE nombre = "Carlos Ruiz"), "Avenida Tercera 789");
-- 14. Consulta todas las direcciones junto con el nombre del usuario
USE usuarios_db;
SELECT * FROM direcciones;
SELECT * FROM usuarios;
-- 15. Muestra todos los usuarios que no tienen dirección registrada 
USE usuarios_db;
SELECT u.id, u.nombre FROM usuarios u LEFT JOIN direcciones d ON u.id = d.usuario_id WHERE d.usuario_id IS NULL;
-- 16. Actualiza la dirección de "Juan Pérez" a "Avenida Central 456"
USE usuarios_db;
UPDATE direcciones SET direccion = "Avenida Central 456" WHERE usuario_id = (SELECT id FROM usuarios WHERE nombre = "Juan Pérez");
-- 17. Elimina la dirección de "Carlos Ruiz"
USE usuarios_db;
DELETE FROM direcciones WHERE usuario_id = (SELECT id FROM usuarios WHERE nombre = "Carlos Ruiz");
-- 18. Consulta la estructura de la tabla direcciones
USE usuarios_db;
DESCRIBE direcciones;
-- 19. Elimina las tablas direcciones y usuarios
USE usuarios_db;
DROP TABLE IF EXISTS direcciones, usuarios;
-- 20. Elimina la base de datos usuarios_db.
USE usuarios_db;
DROP DATABASE IF EXISTS usuarios_db;