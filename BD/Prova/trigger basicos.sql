delimiter // 
create trigger tasca1
before insert on producto
for each row
begin
	set new.codigo_producto = upper(new.codigo_producto);
    end //
delimiter ;

INSERT INTO producto (codigo_producto, nombre, gama, proveedor, precio_venta)
VALUES ('abc123', 'Producto de Prueba', 'Herramientas', 'Proveedor S.A.', 10.50);

delimiter ))

delimiter //
create trigger tasca2
before insert on cliente
for each row
begin
	declare nomMayu varchar(50);
    declare nomMinu varchar(50);
    set nomMayu = concat(upper(substring(new.nombre_contacto, 1, 1)), lower(substring(new.nombre_contacto, 2)));
 end //
 delimiter ;
 
 delimiter //
 create trigger tasca3
 before insert on pedido
 for each row
 begin
	if new.fecha_pedido is null then
	set new.fecha_hora = current_timestamp;
end if;
end //
    delimiter ;

delimiter //
create trigger tasca4 
before insert on detalle_pedido
for each row
begin
	declare precio_temp decimal (15,2);
    
	if new.precio_unidad is null then
    
	select precio_venta into precio_temp 
	from producto 
	where codigo_producto= new.codigo_producto;
    
	set new.precio_unidad = precio_temp;
 end if;
 end //
    delimiter ;
    
INSERT INTO producto (codigo_producto, nombre, gama, precio_venta, cantidad_en_stock) 
VALUES ('TEST-001', 'Producto de Prueba', 'Herramientas', 29.95, 100);

INSERT INTO detalle_pedido (codigo_pedido, codigo_producto, cantidad, precio_unidad, numero_linea) 
VALUES (1, 'TEST-001', 2, NULL, 1);

SELECT * FROM detalle_pedido WHERE codigo_producto = 'TEST-001';