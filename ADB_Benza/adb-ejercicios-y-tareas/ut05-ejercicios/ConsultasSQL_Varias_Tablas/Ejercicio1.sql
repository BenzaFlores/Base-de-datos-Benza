-- 1. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
SELECT producto.nombre, precio, fabricante.nombre FROM producto, fabricante WHERE producto.id_fabricante = fabricante.id;
-- 2. Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.
SELECT producto.nombre, precio, fabricante.nombre FROM producto, fabricante WHERE producto.id_fabricante = fabricante.id ORDER BY fabricante.nombre;
-- 3. Devuelve una lista con el identificador del producto, nombre del producto, identificador del fabricante y nombre del fabricante, de todos los productos de la base de datos.
SELECT producto.id, producto.nombre, id_fabricante, fabricante.nombre FROM producto, fabricante WHERE id_fabricante = fabricante.id;
-- 4. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
SELECT producto.nombre, precio, fabricante.nombre FROM producto, fabricante WHERE id_fabricante = fabricante.id ORDER BY precio LIMIT 1;
-- 5. Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
SELECT producto.nombre, precio, fabricante.nombre FROM producto, fabricante WHERE id_fabricante = fabricante.id  ORDER BY precio DESC LIMIT 1;
-- 6. Devuelve una lista de todos los productos del fabricante Lenovo.
SELECT * FROM producto, fabricante WHERE id_fabricante = fabricante.id AND fabricante.nombre = "Lenovo";
-- 7. Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
SELECT * FROM producto, fabricante WHERE id_fabricante = fabricante.id AND fabricante.nombre = "Crucial" AND precio > 200;
-- 8. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.
SELECT * FROM producto, fabricante WHERE id_fabricante = fabricante.id AND (fabricante.nombre = "Asus" OR fabricante.nombre = "Hewlett-Packardy" OR fabricante.nombre = "Seagate");
-- 9. Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.
SELECT * FROM producto, fabricante WHERE id_fabricante = fabricante.id AND fabricante.nombre IN ("Asus", "Hewlett-Packardy", "Seagate");
-- 10. Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.
SELECT producto.nombre, precio FROM producto, fabricante WHERE id_fabricante = fabricante.id AND fabricante.nombre LIKE "%e";
-- 11. Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
SELECT producto.nombre, precio FROM producto, fabricante WHERE id_fabricante = fabricante.id AND fabricante.nombre LIKE "%w%";
-- 12. Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)
SELECT producto.nombre, precio, fabricante.nombre FROM producto, fabricante WHERE id_fabricante = fabricante.id AND precio >= 180 ORDER BY precio DESC, producto.nombre;
-- 13. Devuelve un listado con el identificador y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.
SELECT DISTINCT fabricante.id, fabricante.nombre FROM fabricante, producto WHERE fabricante.id = producto.id_fabricante;