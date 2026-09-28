/* tasca 1 */
SELECT nif, nombre, apellido1, apellido2, id_departamento
FROM empleados.empleado
WHERE id_departamento IN(1, 2, 3)
ORDER BY apellido1 ASC, nombre ASC LIMIT 5;

/* tasca 2 */
SELECT nombre, presupuesto
FROM empleados.departamento
WHERE presupuesto >=10000 AND presupuesto <= 200000 AND gastos < presupuesto / 2
ORDER BY presupuesto ASC;

/* tasca 3*/

SELECT *
FROM empleados.empleado
WHERE id %2=0 AND id_departamento IS NOT NULL AND apellido2 IS NOT NULL
ORDER BY id DESC;

/* TASCA 4*/

select nombre,(presupuesto-gastos) as saldo
from departamento
order by saldo desc;

/* Tasca5 */
select nombre, apellido1, id_departamento
from empleados.empleado
where nombre in ('Juan', 'Marta') and id_departamento='5' and apellido2 is null limit 7;
/*tasca6 */
select *
from departamento
where presupuesto <>0 and nombre like'P%' or nombre like 'D%'
order by nombre asc;
/* tasca7*/
select nif, concat(nombre, ' ', apellido1,' ', apellido2) as nombre_completo
from empleado
where id between 3 and 8 and apellido1 like '%a%'
order by id asc;
/*tarea 8 */
select nombre, gastos
from departamento
where gastos=0 or gastos>20000
order by gastos asc, nombre asc;
/*tasca 9 */
select *
from empleado
where id_departamento between 4 and 5 and apellido2 is not null or id_departamento is null
order by apellido2 asc;
/*Tasca 10*/
select nombre, presupuesto
from departamento
where presupuesto > 150000 and gastos > 15000 or gastos = 0
order by presupuesto desc limit 3;
/* tasca 11*/
select concat('nombre' , 'apellido1' , 'apellido2') as nombre_completo, nif
from empleado
where nombre like '%____%' and id_departamento in(id_departamento % 2) and id >=5
order by nombre asc, apellido1 asc;
/*12*/
select nombre, round((gastos / presupuesto * 100),2) as porcentaje_gatos
from departamento
where presupuesto >0
order by porcentaje_gatos desc;
/*13*/
select * 
from empleado
where (id % 2 != 0 and apellido2 is null) or (id_departamento = 1 or nombre like '^[AEIOU]%') or id_departamento is null and id < 10
order by id asc;
/*14*/
select id, nombre, (presupuesto-gastos) as presugasto
from departamento
where presupuesto-gastos > 100000 or presupuesto-gastos < 0
order by presupuesto<>gastos desc;
/*15*/
select nif, nombre, id_departamento
from empleado
where apellido2 is null and apellido1 <>'Ruiz' 'Suárez' and id_departamento is not null;
/*16*/
select nombre, presupuesto
from departamento
where id in (3,5, 7) and  gastos <= presupuesto /2
order by gastos desc;
/*17*/
select *
from empleado
where apellido1 like'%z' and (id >10 or id_departamento= 2 or apellido2 like '%e%')
order by apellido1 desc, id desc;
/*18*/
select id, nombre, (presupuesto * 1.15) as resul
from departamento
where gastos >5000
order by id desc limit 5;
/*19*/
select concat(nombre, ' ',apellido1) as nombre, nif
from empleado
where id in (2, 12) and id_departamento != '3' '4' '5' and nombre not like 'P%';
/*20*/
select nombre, gastos
from departamento
where presupuesto>0 or presupuesto=gastos or nombre in ('Recurosos' or 'Proyectos')
order by nombre asc limit 6;
/*21*/
select distinct(id_departamento)
from empleado
order by id_departamento asc;
/*22*/
select distinct(apellido1)
from empleado
order by apellido1 asc limit 5;
/*23*/
select all nombre
from empleado
where id_departamento in(1, 2, 3)
order by nombre asc;
/*24*/
select distinct apellido1, apellido2
from empleado
where apellido2 is not null
order by apellido1, apellido2;
/*25*/
select all nombre, presupuesto
from departamento
where presupuesto > 100000
order by nombre limit 10;
/*26*/
select id_departamento
from empleado
where apellido2 is null and id_departamento is not null
order by id_departamento desc;
/*27*/
select distinct nombre, apellido1
from empleado
where id >5
order by nombre, apellido1;
/*28*/
select distinctrow nombre
from departamento	
where gastos > 0
order by nombre; 
/*29*/
select distinct id_departamento, apellido1
from empleado
where apellido2 is not null and id_departamento is not null
order by id_departamento, apellido1 limit 8;
/*30*/
select all nombre 
from empleado
where id_departamento /2 or id_departamento is null
order by nombre limit 6;
/*31*/
select distinct apellido1
from empleado
where apellido1 like'R%' or apellido1 like 'S%'
order by apellido1 desc;
/*32*/
select distinct presupuesto, gastos
from departamento
order by presupuesto asc, gastos asc limit 5;
/*33*/
select all id_departamento, nombre
from empleado
where id_departamento in (1, 10) and nombre like '%a%'
order by id_departamento;
/*34*/
select distinct apellido2
from empleado
where apellido2 is not null
order by apellido1 limit 4;
/*35*/
select distinct nombre, presupuesto
from departamento
where gastos <10000 or gastos = 0
order by presupuesto desc;
/*36*/
select distinctrow apellido1
from empleado
where id_departamento <4
order by id_departamento limit 7;
/*37*/
select distinct apellido1, apellido2
from empleado
where id % 2 = 0 and id_departamento in (1, 3, 5) and apellido2 is not null
order by apellido1, apellido2;
/*38*/
select all nombre
from departamento
where id < 6 and presupuesto <> gastos
order by nombre desc limit 5;
/*39*/
select distinct length(nombre)as nom_caract
from empleado
order by length(nombre) asc;
/*40*/
select distinct id, presupuesto div 1000 as presu_divi
from departamento
where presupuesto > 0
order by id limit 6;
/*41*/
select id_departamento, count(id) as numEmpleado
from empleado
where id_departamento is not null
group by id_departamento;
/*42*/
select id_departamento, apellido2
from empleado
where apellido2 is not null and id_departamento is not null
group by id_departamento;
/*43*/
select apellido1, count(apellido1)
from empleado
group by apellido1
order by count(apellido1) desc, apellido1 ;
/*44*/
select id_departamento, MIN(id) AS id_minimo, MAX(id) AS id_maximo
from empleado
where id_departamento is not null
group by id_departamento;
/*71*/
select count(*) as idquati, id_departamento
from empleado
group by id_departamento
having count(*) > 2
order by id_departamento desc;
/*tasca72*/
select count(*), apellido1 
from empleado
group by apellido1
having count(apellido1)>=2;
/*73*/
select id_departamento, count(*) as cuantos
from empleado
where id_departamento is not null AND apellido2 != ''
group by id_departamento
having count(apellido2) >1 
order by id_departamento asc;
/*74*/
select count(id), id_departamento
from empleado 
where apellido2 is null
group by id_departamento
having count(id)>=1
order by nombre desc;
/*75*/
select id_departamento, sum(id)
from empleado
where id_departamento is not null
group by id_departamento
having sum(id) >20
order by sum(id) desc;
/*76*/
select nombre, id
from empleado
group by nombre
having count(nombre) > 1
order by nombre desc;
/*77*/
select count(nombre)as numero_empleados, id_departamento
from empleado
group by id_departamento
having count(nombre) =3
order by id desc;
/*78*/
select id_departamento, round(avg(length(nombre))) as mitjana
from empleado
group by id_departamento
having avg(length(nombre)) > 5
order by mitjana desc limit 3;
/*79*/
select apellido1, count(id) as numeros_id, min(id) as id_min
from empleado
group by apellido1
having count(id) > 1  and min(id) >3
order by nombre desc;
/*80*/
select presupuesto, count(id) as numerodep
from departamento
group by presupuesto
having count(id) > 1
order by numerodep desc;
/*81*/
select count(id) as pares, id_departamento
from empleado
where id % 2 = 0
group by id_departamento
having count(id) >=2
order by pares desc;
/*82*/
select apellido1, apellido2, count(id) as total
from empleado
group by apellido1, apellido2
having count(id) > 1
order by total desc limit 3;
/*83*/
select id_departamento, avg(id), count(id)
from empleado
group by id_departamento
having avg(id) > 7;
/*complicades*/
/*1*/
select id, concat(nombre, ' ' , apellido1, ' ' , apellido2), nif, id_departamento, length(nombre) as nombrelar
from empleado
where id > 5 and apellido2 is not null and id % 2 = 0 and id_departamento in( 1, 2, 5) and apellido1 >= 'F' AND apellido1 < 'T' and length(nombre) > 4
order by nombrelar desc, id_departamento desc, nombre asc limit 3;
/*2*/
