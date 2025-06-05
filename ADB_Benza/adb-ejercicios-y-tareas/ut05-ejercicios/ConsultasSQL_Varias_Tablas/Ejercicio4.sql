-- 1. Obtén un listado con el nombre de cada cliente y el nombre y apellido de su representante de ventas.
SELECT cliente.nombre_cliente, empleado.nombre, empleado.apellido1 FROM cliente, empleado WHERE cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado;
-- 2. Muestra el nombre de los clientes que hayan realizado pagos junto con el nombre de sus representantes de ventas.
SELECT cliente.nombre_cliente, empleado.nombre, empleado.apellido1 FROM cliente, empleado, pago WHERE cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado AND cliente.codigo_cliente = pago.codigo_cliente;
-- 3. Muestra el nombre de los clientes que no hayan realizado pagos junto con el nombre de sus representantes de ventas.
SELECT cliente.nombre_cliente, empleado.nombre, empleado.apellido1 FROM cliente, empleado WHERE cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado AND cliente.codigo_cliente NOT IN (SELECT codigo_cliente FROM pago);
-- 4. Devuelve el nombre de los clientes que han hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
SELECT cliente.nombre_cliente, empleado.nombre, empleado.apellido1, oficina.ciudad FROM cliente, empleado, pago, oficina WHERE cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado AND cliente.codigo_cliente = pago.codigo_cliente AND empleado.codigo_oficina = oficina.codigo_oficina;
-- 5. Devuelve el nombre de los clientes que no hayan hecho pagos y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
SELECT cliente.nombre_cliente, empleado.nombre, empleado.apellido1, oficina.ciudad FROM cliente, empleado, oficina WHERE cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado AND cliente.codigo_cliente NOT IN (SELECT codigo_cliente FROM pago) AND empleado.codigo_oficina = oficina.codigo_oficina;
-- 6. Lista la dirección de las oficinas que tengan clientes en Fuenlabrada.
SELECT oficina.linea_direccion1, oficina.linea_direccion2 FROM oficina WHERE oficina.codigo_oficina IN (SELECT empleado.codigo_oficina FROM cliente, empleado WHERE cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado AND cliente.ciudad = "Fuenlabrada");
-- 7. Devuelve el nombre de los clientes y el nombre de sus representantes junto con la ciudad de la oficina a la que pertenece el representante.
SELECT cliente.nombre_cliente, empleado.nombre, empleado.apellido1, oficina.ciudad FROM cliente, empleado, oficina WHERE cliente.codigo_empleado_rep_ventas = empleado.codigo_empleado AND empleado.codigo_oficina = oficina.codigo_oficina;
-- 8. Devuelve un listado con el nombre de los empleados junto con el nombre de sus jefes.
SELECT empleado.nombre, empleado.apellido1, jefe.nombre, jefe.apellido1 FROM empleado, empleado AS jefe WHERE empleado.codigo_jefe = jefe.codigo_empleado;
-- 9. Devuelve un listado que muestre el nombre de cada empleados, el nombre de su jefe y el nombre del jefe de sus jefe.
SELECT empleado.nombre, empleado.apellido1, jefe.nombre, jefe.apellido1, jefe_jefe.nombre, jefe_jefe.apellido1 FROM empleado, empleado AS jefe, empleado AS jefe_jefe WHERE empleado.codigo_jefe = jefe.codigo_empleado AND jefe.codigo_jefe = jefe_jefe.codigo_empleado;
-- 10. Devuelve el nombre de los clientes a los que no se les ha entregado a tiempo un pedido.
SELECT cliente.nombre_cliente FROM cliente, pedido WHERE cliente.codigo_cliente = pedido.codigo_cliente AND pedido.fecha_entrega > pedido.fecha_esperada;
-- 11. Devuelve un listado de las diferentes gamas de producto que ha comprado cada cliente.
SELECT DISTINCT cliente.nombre_cliente, producto.gama FROM cliente, pedido, detalle_pedido, producto WHERE cliente.codigo_cliente = pedido.codigo_cliente AND pedido.codigo_pedido = detalle_pedido.codigo_pedido AND detalle_pedido.codigo_producto = producto.codigo_producto;