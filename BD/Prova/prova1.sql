DROP DATABASE IF EXISTS empleados;
CREATE DATABASE empleados CHARACTER SET utf8mb4;
USE empleados;

CREATE TABLE departamento (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
presupuesto DOUBLE UNSIGNED NOT NULL,
gastos DOUBLE UNSIGNED NOT NULL
);

CREATE TABLE empleado (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nif VARCHAR(9) NOT NULL UNIQUE,
nombre VARCHAR(100) NOT NULL,
apellido1 VARCHAR(100) NOT NULL,
apellido2 VARCHAR(100),
id_departamento INT UNSIGNED,
FOREIGN KEY (id_departamento) REFERENCES departamento(id)
);

INSERT INTO departamento VALUES(1, 'Desarrollo', 120000, 6000);
INSERT INTO departamento VALUES(2, 'Sistemas', 150000, 21000);
INSERT INTO departamento VALUES(3, 'Recursos Humanos', 280000, 25000);
INSERT INTO departamento VALUES(4, 'Contabilidad', 110000, 3000);
INSERT INTO departamento VALUES(5, 'I+D', 375000, 380000);
INSERT INTO departamento VALUES(6, 'Proyectos', 0, 0);
INSERT INTO departamento VALUES(7, 'Publicidad', 0, 1000);

INSERT INTO empleado VALUES(1, '32481596F', 'Aarón', 'Rivero', 'Gómez', 1);
INSERT INTO empleado VALUES(2, 'Y5575632D', 'Adela', 'Salas', 'Díaz', 2);
INSERT INTO empleado VALUES(3, 'R6970642B', 'Adolfo', 'Rubio', 'Flores', 3);
INSERT INTO empleado VALUES(4, '77705545E', 'Adrián', 'Suárez', NULL, 4);
INSERT INTO empleado VALUES(5, '17087203C', 'Marcos', 'Loyola', 'Méndez', 5);
INSERT INTO empleado VALUES(6, '38382980M', 'María', 'Santana', 'Moreno', 1);
INSERT INTO empleado VALUES(7, '80576669X', 'Pilar', 'Ruiz', NULL, 2);
INSERT INTO empleado VALUES(8, '71651431Z', 'Pepe', 'Ruiz', 'Santana', 3);
INSERT INTO empleado VALUES(9, '56399183D', 'Juan', 'Gómez', 'López', 2);
INSERT INTO empleado VALUES(10, '46384486H', 'Diego','Flores', 'Salas', 5);
INSERT INTO empleado VALUES(11, '67389283A', 'Marta','Herrera', 'Gil', 1);
INSERT INTO empleado VALUES(12, '41234836R', 'Irene','Salas', 'Flores', NULL);
INSERT INTO empleado VALUES(13, '82635162B', 'Juan Antonio','Sáez', 'Guerrero', NULL);

/*TASTA 1*/
SELECT  apellido1
FROM empleados.empleado;
/*TASCA 2*/
SELECT DISTINCT apellido1
FROM empleados.empleado;
/*TASCA 3  utilitzant* per posaro tot lo de sa taula*/
SELECT *
FROM empleados.empleado;
/*tasca 4 */
SELECT nombre, apellido1, apellido2
FROM empleados.empleado;
/* tasca 5*/
SELECT id_departamento
FROM empleados.empleado;
/*TASCA 6 */
SELECT DISTINCT id_departamento
FROM empleados.empleado;
/*TASCA 7 al usar el concat con el ' ' para que ponga un espacio*/
SELECT CONCAT(nombre, ' ', apellido1)
FROM empleados.empleado;
/* tasca 8 TRANSFOMAR EN MAYUSCULAS*/
SELECT UPPER( CONCAT(nombre, ' ', apellido1))
FROM empleados.empleado;
/*TASCA 9*/
SELECT LOWER( CONCAT(nombre, ' ', apellido1))
FROM empleados.empleado;
/*TASCA 10 SELECT CON OPERACION Y CREACION DE ALIAS*/
SELECT presupuesto, gastos, 
(presupuesto - gastos) AS totalpresu
FROM empleados.departamento;
/*TASCA 11 ORDANAR ASCENDENTE*/
SELECT (presupuesto - gastos) AS presu_actu
FROM empleados.departamento
ORDER BY presu_actu ASC;
/* TASCA 12 */
SELECT nombre
FROM empleados.departamento
ORDER BY nombre ASC;
/* tasca 13 */
SELECT nombre
FROM empleados.departamento
ORDER BY nombre DESC;
/* TASCA 14 */
SELECT apellido1, nombre
FROM empleados.empleado
ORDER BY apellido1 ASC;
/*TASCA 15 ORDENACION DE MAYOR A MENOR, MAS LOS 3 MAYORES */
SELECT nombre, presupuesto
FROM empleados.departamento
ORDER BY presupuesto DESC LIMIT 3;
/*TASCA 16 */
SELECT nombre, presupuesto
FROM empleados.departamento
ORDER BY presupuesto ASC LIMIT 3;
/*TASCA 17*/
SELECT nombre, gastos
FROM empleados.departamento
ORDER BY gastos DESC LIMIT 2;
/*TASCA 18 */
SELECT nombre, gastos
FROM empleados.departamento
ORDER BY gastos ASC LIMIT 2;

/* PESTANYA 2*/

/*TASCA 1 */
SELECT *
FROM empleados.empleado
WHERE id_departamento= '1';
/*Tasca 2*/
SELECT apellido1
FROM empleados.empleado
WHERE nombre= 'Juan';
/*tasca 3*/
SELECT nombre
FROM empleados.departamento	
WHERE presupuesto>= 200000;
/*tarea 4*/
SELECT *
FROM empleados.empleado
WHERE apellido2 IS NULL;
/*tasca5*/
SELECT *
FROM empleados.departamento
WHERE gastos= 0;
/*tasca 6 */
SELECT *
FROM empleados.empleado
ORDER BY nombre ASC;
/* tasca 7 */
SELECT *
FROM empleados.empleado
LIMIT 5;
/* TASCA 8 */
SELECT nombre
FROM empleados.departamento
WHERE gastos > '20000';
/*tasca 9 */
SELECT nombre, apellido1
FROM empleados.empleado
WHERE id_departamento= 2;
/* tasca 10 */
SELECT *
FROM empleados.empleado 
WHERE id_departamento is null;
/* tasca 11 */
SELECT nombre
FROM empleados.empleado
WHERE apellido1= 'RUIZ';
/*tasca 12 */
SELECT nombre
FROM empleados.departamento
WHERE presupuesto < 150000;
/*tasca 13 */
SELECT nif nombre
FROM empleados.empleado
WHERE id_departamento=3;
/*tasca 14 */
SELECT nombre
FROM empleados.departamento
ORDER BY presupuesto DESC LIMIT 3;
/*tarea 15 */
SELECT nombre, apellido1, apellido2
FROM empleados.empleado
WHERE apellido2 IS NOT NULL;
/* tasca 16*/
SELECT nombre
FROM empleados.departamento
WHERE gastos > presupuesto;
/*TASCAS 17 */
SELECT nombre
FROM empleados.empleado
WHERE id = 5;
/*tasca 18*/
SELECT nombre
FROM empleados.empleado
WHERE apellido1= 'Salas';
/*tasca 19*/
SELECT *
FROM empleados.departamento
ORDER BY nombre ASC;
/* TASCA 20*/
SELECT apellido1, nombre
FROM empleados.empleado
WHERE id_departamento= 5
ORDER BY apellido1 ASC;
/*tasca 21 */
SELECT  apellido2, nombre
FROM empleados.empleado
WHERE id_departamento=1;
/*tasca 22*/
SELECT nombre, presupuesto, gastos
FROM empleados.departamento
WHERE presupuesto > 100000 and gastos < 10000;
/*tasca 23 consegir dos ver dos ids*/
SELECT nombre, id_departamento
FROM empleados.empleado
WHERE id_departamento IN (2, 3);
/*tasca 24 */
SELECT nombre, apellido1
FROM empleados.empleado
WHERE nombre='Juan' and apellido1='Gómez';
/*tasca25*/
SELECT *
FROM empleados.departamento
WHERE presupuesto<150000 OR gastos=0;
/*tasca 26*/
SELECT nombre
FROM empleados.empleado
WHERE id_departamento= 2 and apellido2 IS NULL;
/*tasca 27 usar in para selecionar varios valores de una columna*/
SELECT nombre, id_departamento
FROM empleados.empleado
WHERE id_departamento IN(1, 5);
/*tasca 28*/
SELECT nombre
FROM empleados.departamento
WHERE presupuesto > 200000 and gastos > 2000;
/*tasca 29*/
SELECT nombre, apellido1	
FROM empleados.empleado
WHERE apellido1 IN ('Ruiz','Salas');
/*tasca 30 */
SELECT *
FROM empleados.empleado
WHERE id_departamento IS NULL AND apellido2 IS NULL;
/*TASCA 31*/
SELECT nombre
FROM empleados.departamento
WHERE presupuesto =0 and gastos=0;
/*tasca 32*/
SELECT nombre
FROM empleados.empleado
WHERE id_departamento= 3 AND apellido2 IS NOT NULL;
/*tasca 33*/
SELECT *
FROM empleados.departamento
WHERE presupuesto > 300000 OR gastos < 5000;
/*tarea 34*/
SELECT nombre
FROM empleados.empleado
WHERE nombre IN('Pepe', 'Pilar');
/*TASCA 35*/
SELECT nombre
FROM empleados.empleado
WHERE id_departamento = 2 
ORDER BY nombre ASC LIMIT 2;
/*TASCA 36*/
SELECT nombre
FROM empleados.departamento
WHERE presupuesto<=120000 AND gastos>0;

/*37*/

select id, apellido2
from empleado
where id >= 10 and apellido2 is not null;
/*38*/
select nombre, id_departamento
from empleado
where id_departamento=1 or id_departamento is null;
/*39*/
select nombre, gastos
from departamento
where gastos >=1000 and gastos <=25000;
/*40*/
select id, nombre
from empleado
where id < 5 and id_departamento in(1, 4);
/*41*/
select id_departamento, apellido2
from empleado
where id <10 and apellido2 is not null;
/*42*/
select *
from departamento
where presupuesto >100000 and gastos<30000 and nombre <>'Proyectos';
/*43*/
select *
from empleado
where id_departamento in(2, 3) and apellido1 in ('Ruiz' , 'Salas') and id >5;
/*44*/
select *
from empleado
where apellido2 is null and id_departamento in(2, 4) and id % 2 = 0;
/*45*/
select nombre
from departamento
where presupuesto > 0 and gastos < presupuesto and id <5;
/*46*/
select nombre
from empleado
where nombre='Juan' or apellido1='Flores' or id_departamento=3;
/*