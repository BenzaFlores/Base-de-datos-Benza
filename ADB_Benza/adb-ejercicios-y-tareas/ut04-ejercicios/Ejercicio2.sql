-- 1. Crear la base de datos
CREATE DATABASE IF NOT EXISTS hospital CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
--  2. Modificar la collation de la base de datos
ALTER DATABASE hospital COLLATE utf8mb4_general_ci;
-- 3. Crear la tabla pacientes
USE hospital;
CREATE TABLE pacientes (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL
);
-- 4. Crear la tabla historias_clinicas
CREATE TABLE historias_clinicas (
    paciente_id INT UNSIGNED PRIMARY KEY,
    diagnostico TEXT NOT NULL,
    fecha_registro DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (paciente_id) REFERENCES pacientes(id)
);
-- 5. Modificar la tabla historias_clinicas para agregar la columna tratamiento
ALTER TABLE historias_clinicas ADD tratamiento TEXT;
-- 6. Cambiar el tamaño del campo nombre en la tabla pacientes
ALTER TABLE pacientes MODIFY nombre VARCHAR(150) NOT NULL;
-- 7. Agregar una nueva columna telefono
ALTER TABLE pacientes ADD telefono VARCHAR(15) AFTER nombre;
-- 8. Cambiar el tipo de dato de telefono
ALTER TABLE pacientes MODIFY telefono BIGINT;
-- 9. Eliminar la columna telefono
ALTER TABLE pacientes DROP COLUMN telefono;
-- 10. Insertar un paciente llamado "Juan Pérez"
INSERT INTO pacientes (nombre) VALUES ("Juan Pérez");
-- 11. Insertar una historia clínica para "Juan Pérez"
INSERT INTO historias_clinicas (paciente_id, diagnostico)  VALUES ((SELECT id FROM pacientes WHERE nombre = "Juan Pérez"), "Hipertensión");
-- 12. Insertar dos pacientes adicionales
INSERT INTO pacientes (nombre) VALUES ("Ana Gómez"), ("Carlos Ruiz");
-- 13. Añadir historias clínicas para los nuevos pacientes
INSERT INTO historias_clinicas (paciente_id, diagnostico) VALUES ((SELECT id FROM pacientes WHERE nombre = "Ana Gómez"), "Diabetes"), ((SELECT id FROM pacientes WHERE nombre = "Carlos Ruiz"), "Asma");
-- 14. Consultar todas las historias clínicas junto con el nombre del paciente
SELECT p.nombre, h.diagnostico, h.fecha_registro  FROM pacientes p JOIN historias_clinicas h ON p.id = h.paciente_id;
-- 15. Mostrar todos los pacientes que no tienen historia clínica registrada
SELECT p.nombre FROM pacientes p LEFT JOIN historias_clinicas h ON p.id = h.paciente_id WHERE h.paciente_id IS NULL;
-- 16. Actualizar el diagnóstico de "Juan Pérez"
UPDATE historias_clinicas SET diagnostico = "Hipertensión crónica"  WHERE paciente_id = (SELECT id FROM pacientes WHERE nombre = "Juan Pérez");
-- 17. Eliminar la historia clínica de "Carlos Ruiz"
DELETE FROM historias_clinicas WHERE paciente_id = (SELECT id FROM pacientes WHERE nombre = "Carlos Ruiz");
-- 18. Consultar la estructura de la tabla historias_clinicas
DESCRIBE historias_clinicas;
-- 19. Eliminar las tablas historias_clinicas y pacientes
DROP TABLE IF EXISTS historias_clinicas;
DROP TABLE IF EXISTS pacientes;
-- 20. Eliminar la base de datos hospital
DROP DATABASE IF EXISTS hospital;