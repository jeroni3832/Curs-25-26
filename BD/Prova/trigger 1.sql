DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;
CREATE TABLE fabricante (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
precio DOUBLE NOT NULL,
id_fabricante INT UNSIGNED NOT NULL,
FOREIGN KEY (id_fabricante) REFERENCES fabricante(id)
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');
INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

/*tasca 1*/
drop trigger borrar_registre
delimiter //
create or replace trigger precio_negativo
before insert on tienda.producto
for each row
begin
	if new. precio <0 then
    set new. precio = 0;
    end if;
end //
delimiter ;

INSERT INTO producto(id , precio , id_fabricante) VALUES(13 , -1 , 1);

/*tasca2*/
create table if not exists log_productos(
id int(10) primary key,
nombre varchar(50) not null,
fecha date not null
);
drop table log_productos
delimiter //
create trigger log_productos
after insert on tienda.producto
for each row
begin
	insert into log_productos(id, nombre, fecha) value(new.id, new.nombre, current_date());
end //
delimiter ;
insert into producto (id, nombre, precio , id_fabricante) VALUES(14 , "hola", 41 , 5);

/*3*/
create table if not exists producte_borrat(
id int (10) primary key,
nombre varchar(50) not null,
precio float  not null,
id_fabricante varchar(50) not null
);
delimiter //
create trigger borrar_registre
after delete on tienda.producto
for each row
begin
	insert into producte_borrat (id, nombre, precio, id_fabricante) value(old.id, old.nombre, old.precio, old.id_fabricante);
end //
delimiter ;
delete from producto where id=14;
SELECT * FROM producte_borrat;