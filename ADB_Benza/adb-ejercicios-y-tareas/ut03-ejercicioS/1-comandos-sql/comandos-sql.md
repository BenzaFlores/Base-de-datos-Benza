# Comandos SQL (Ejercicios)

__Ejercicio 1__:
Muestra todas las variables del sistema disponibles en MySQL.

`SHOW VARIABLES;`

---

__Ejercicio 2__:
Muestra todas las variables del sistema que contengan la palabra _size_.

`SHOW VARIABLES LIKE '%size%';`

---

__Ejercicio 3__:
Encuentra todas las variables del sistema cuyo nombre comience con la palabra _innodb_.

`SHOW VARIABLES LIKE 'innodb%';`

---

__Ejercicio 4__:
Encuentra todas las variables del sistema cuyo nombre termine con _timeout_.

`SHOW VARIABLES LIKE '%timeout';`

---

__Ejercicio 5__:
Muestra el valor exacto de la variable _max_allowed_packet_.

`SHOW VARIABLES LIKE "max_allowed_packet";`

---

__Ejercicio 6__:
Muestra el valor exacto de la variable _bind-address_.

`SHOW VARIABLES LIKE "bind-address";`

---

__Ejercicio 7__:
Encuentra todas las variables que tengan la palabra _buffer_ en cualquier parte del nombre.

`SHOW VARIABLES LIKE "%buffer%";` 

---

__Ejercicio 8__:
Muestra todas las variables que contengan la palabra _dir_.

`SHOW VARIABLES LIKE "%dir%";`

---

__Ejercicio 9__:
Cargar el siguiente fichero `tienda-productos.sql` en Base de Datos. Para ello utiliza el comando `SOURCE` con rutas relativas:

```sql
-- Crear la base de datos solo si no existe
CREATE DATABASE IF NOT EXISTS tienda;

-- Seleccionar la base de datos
USE tienda;

-- Crear la tabla `productos` solo si no existe
CREATE TABLE IF NOT EXISTS productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    precio DECIMAL(10, 2)
);

-- Insertar 50 registros en la tabla `productos`
INSERT INTO productos (nombre, precio) VALUES
('Balón de fútbol Adidas', 29.99),
('Camiseta de running Nike', 24.99),
('Raqueta de tenis Wilson', 89.99),
('Zapatillas de baloncesto Jordan', 120.00),
('Mochila deportiva Puma', 34.99),
('Pantalones de yoga Reebok', 19.99),
('Guantes de boxeo Everlast', 49.99),
('Casco de ciclismo Giro', 79.99),
('Cinturón de levantamiento de pesas', 25.00),
('Balón de baloncesto Spalding', 39.99),
('Tabla de surf Quiksilver', 250.00),
('Patines en línea Rollerblade', 110.00),
('Palo de golf TaylorMade', 149.99),
('Reloj deportivo Garmin', 199.99),
('Gorra deportiva Under Armour', 19.99),
('Toalla deportiva absorbente', 12.99),
('Botella de agua térmica', 15.99),
('Red de voleibol profesional', 89.99),
('Rodilleras de voleibol Asics', 25.99),
('Bañador Speedo', 29.99),
('Pesa rusa (Kettlebell) 10kg', 49.99),
('Cuerda de saltar ajustable', 14.99),
('Malla térmica para ciclismo', 39.99),
('Bicicleta de montaña Trek', 899.99),
('Traje de neopreno ONeill', 199.99),
('Raqueta de pádel Babolat', 79.99),
('Balón de rugby Gilbert', 34.99),
('Kit de entrenamiento de resistencia', 24.99),
('Cinta para correr Domyos', 499.99),
('Kit de snorkel Cressi', 59.99),
('Casco para escalada Petzl', 74.99),
('Remos ajustables para kayak', 44.99),
('Balón medicinal 5kg', 29.99),
('Manoplas para boxeo', 34.99),
('Juego de discos para pesas (20kg)', 99.99),
('Set de aletas de natación', 25.99),
('Gafas de natación Arena', 19.99),
('Bomba para inflar balones', 9.99),
('Protector bucal deportivo', 14.99),
('Camiseta térmica para esquí', 29.99),
('Mochila para hidratar Camelbak', 49.99),
('Linterna frontal para senderismo', 19.99),
('Chaleco salvavidas', 34.99),
('Pantalones de trekking impermeables', 59.99),
('Zapatos de trail running Salomon', 129.99),
('Bastones de trekking ajustables', 39.99),
('Red portátil para bádminton', 44.99),
('Guantes para gimnasio Nike', 19.99),
('Banda elástica de resistencia', 12.99),
('Set de escalada con cuerda', 299.99);

-- Consultar todos los productos
SELECT * FROM productos;
```

`SOURCE tienda-productos.sql;` 

---

__Ejercicio 10__:
Cargar el siguiente fichero `tienda-clientes.sql` en Base de Datos. Para ello utiliza el comando `SOURCE` con rutas absolutas:


```sql
-- Crear la base de datos solo si no existe
CREATE DATABASE IF NOT EXISTS tienda;

-- Seleccionar la base de datos
USE tienda;

-- Crear la tabla `clientes` solo si no existe
CREATE TABLE IF NOT EXISTS clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(50),
    correo VARCHAR(100)
);

-- Insertar 50 registros en la tabla `clientes`
INSERT INTO clientes (nombre, correo) VALUES
('Carlos Mendoza', 'cmendoza@example.com'),
('Ana López', 'analopez@example.com'),
('Luis Fernández', 'lfernandez@example.com'),
('María Torres', 'mtorres@example.com'),
('Javier Pérez', 'jperez@example.com'),
('Elena Gómez', 'egomez@example.com'),
('Diego Ramírez', 'dramirez@example.com'),
('Claudia Sánchez', 'csanchez@example.com'),
('Hugo Martín', 'hmartin@example.com'),
('Lucía Díaz', 'ldiaz@example.com'),
('Manuel Castro', 'mcastro@example.com'),
('Patricia Ruiz', 'pruiz@example.com'),
('Raúl Ortiz', 'rortiz@example.com'),
('Carmen Herrera', 'cherrera@example.com'),
('Andrés Moreno', 'amoreno@example.com'),
('Laura Vega', 'lvega@example.com'),
('Miguel Domínguez', 'mdominguez@example.com'),
('Sara García', 'sgarcia@example.com'),
('Adrián Gil', 'agil@example.com'),
('Paula Campos', 'pcampos@example.com'),
('Isabel Ríos', 'irios@example.com'),
('Ricardo López', 'rlopez@example.com'),
('Cristina Serrano', 'cserrano@example.com'),
('Pablo Delgado', 'pdelgado@example.com'),
('Valeria Núñez', 'vnunez@example.com'),
('Fernando Álvarez', 'falvarez@example.com'),
('Sofía Márquez', 'smarquez@example.com'),
('David Méndez', 'dmendez@example.com'),
('Julia Flores', 'jflores@example.com'),
('Daniel Castillo', 'dcastillo@example.com'),
('Alejandra Ramos', 'aramos@example.com'),
('Iván Salas', 'isalas@example.com'),
('Carolina Medina', 'cmedina@example.com'),
('Alberto Aguirre', 'aaguirre@example.com'),
('Verónica Guzmán', 'vguzman@example.com'),
('Juan Cárdenas', 'jcardenas@example.com'),
('Marta Paredes', 'mparedes@example.com'),
('Esteban Molina', 'emolina@example.com'),
('Natalia Varela', 'nvarela@example.com'),
('Óscar Gutiérrez', 'ogutierrez@example.com'),
('Clara Suárez', 'csuarez@example.com'),
('Felipe León', 'fleon@example.com'),
('Marisol Morales', 'mmorales@example.com'),
('Guillermo Peña', 'gpena@example.com'),
('Rosa Vargas', 'rvargas@example.com'),
('Camila Espinosa', 'cespinosa@example.com'),
('Francisco Cortés', 'fcortes@example.com'),
('Lorena Santamaría', 'lsantamaria@example.com'),
('Ángel Romero', 'aromero@example.com');

-- Consultar todos los clientes
SELECT * FROM clientes;
```

`SOURCE /home/alumno/tienda-clientes.sql;`