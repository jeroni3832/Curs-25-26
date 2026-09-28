/* tasca 1*/
select concat(nombre, '   ' , apellido1) as nombre_completo, o.ciudad
from empleado e
inner join oficina o
on e.codigo_oficina = o.codigo_oficina;

/*tasca 2*/
select nombre_cliente, concat(nombre_contacto, '   ' , apellido_contacto) as representante
from cliente c;

/*tasca 3*/
select nombre, descripcion
from producto
order by gama asc;

/* tasca 4 */
select codigo_pedido, fecha_pedido, c.nombre_cliente
from pedido p
inner join cliente c
on p.codigo_cliente = c.codigo_cliente;

/* tasca 5 */
select concat(e.nombre,' ', e.apellido1) as nombre_empleado, concat(j.nombre,' ', j.apellido1) as nombre_jefe
from empleado e
inner join empleado j
on e.codigo_jefe = j.codigo_empleado;

/* tasca 6 */
select p.id_transaccion, p.fecha_pago, p.total, c.nombre_cliente
from pago p
inner join cliente c
on p.codigo_cliente = c.codigo_cliente
order by fecha_pago desc;

/*tasca 7*/
select d.codigo_pedido, pro.nombre, d.cantidad, d.precio_unidad
from detalle_pedido d 
inner join producto pro
on d.codigo_producto = pro.codigo_producto
where cantidad > 10;

/*tasca 8 */
select o.ciudad, e.nombre, o.pais
from oficina o 
inner join empleado e 
on o.codigo_oficina = e.codigo_oficina
WHERE o.pais='España';

/*tasca 9 */
select c.nombre_cliente, c.ciudad, e.nombre
from cliente c 
inner join empleado e 
on c.codigo_empleado_rep_ventas = e.codigo_empleado
where ciudad = 'Madrid';

/*tasca 10 */
select p.nombre, p.precio_venta, p.gama
from producto p 
where gama = 'Frutales'
order by precio_venta desc;

/*tasca 11 */
select c.nombre_cliente, count(p.codigo_pedido) 
from cliente c 
inner join pedido p 
on c.codigo_cliente = p.codigo_cliente
group by c.codigo_cliente;

/* tasca 12*/
select c.nombre_cliente, (p.total + p.total) as total
from cliente c 
inner join pago p 
on c.codigo_cliente = p.codigo_cliente
group by p.total
order by total desc limit 10;

/* tasca 13*/
select o.ciudad, count(e.nombre) as total_empleados
from oficina o 
inner join empleado e 
on o.codigo_oficina = e.codigo_oficina
group by e.codigo_oficina;

/*tasca 14 */
select p.codigo_pedido, c.nombre_cliente, p.fecha_pedido, p.fecha_entrega
from pedido p 
inner join cliente c 
on p.codigo_cliente = c.codigo_cliente
where year (fecha_entrega)=2009
order by fecha_entrega asc;

/* tasca 15*/
select p.nombre, count(d.codigo_producto) as total_vendido
from producto p 
inner join detalle_pedido d 
on p.codigo_producto=d.codigo_producto
group by p.codigo_producto limit 5;

/* tasca 16*/
select c.nombre_cliente, c.ciudad, e.nombre, o.ciudad
from empleado e
inner join cliente c  
on c.codigo_empleado_rep_ventas=e.codigo_empleado
inner join oficina o 
on e.codigo_oficina = o.codigo_oficina
where c.ciudad <> o.ciudad;

/*tasca 17*/
select p.codigo_pedido, c.nombre_cliente, (d.cantidad * d.precio_unidad) as total
from pedido p 
inner join cliente c 
on p.codigo_cliente = c.codigo_cliente
inner join detalle_pedido d 
on p.codigo_pedido=d.codigo_pedido
group by c.nombre_cliente
order by total desc limit 10;

SELECT c.nombre_cliente, sum(dp.total * dp.cantidad)
 FROM client c
 JOIN detalle_pedido dp ON dp.client_id = c.id
 GROUP BY dp.pedido_id
 ORDER BY sum(dp.total * dp.cantidad)
 LIMIT 10
