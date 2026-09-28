/*tasca 1*/
select codigo_oficina, ciudad
from oficina;

/*tasca 2*/
select ciudad, telefono
from oficina
where pais = 'España';

/*tasca 3*/
select nombre, apellido1, apellido2, email
from empleado
where codigo_jefe = 7;

/*tasca 4*/
select nombre, apellido1, apellido2, email
from empleado
where puesto='Director General';

/*tasca 5 */
select nombre , apellido1, apellido2, puesto
from empleado
where puesto <> 'Representante_Ventas';

/*tasca 6*/
select nombre_cliente
from cliente
where pais='Spain';

/*tasca 7*/
select estado
from pedido;

/* tasca 8.1*/
select distinct codigo_cliente
from pago
where year (fecha_pago)=2008;

/*tasca 8.2 */
select distinct codigo_cliente
from pago
where DATE_FORMAT(fecha_pago,'%Y')= 2008;

/* tasca 8.3 */
select codigo_cliente
from pago
where fecha_pago like 2008;