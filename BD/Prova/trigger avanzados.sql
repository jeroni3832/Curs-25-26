DELIMITER //
create trigger prueba_clase1
before insert on pedido
for each row
begin
	if new.fecha_pedido >= new.fecha_entrega then 
    signal sqlstate '45000' 
    set message_text = "hi ha un error";
    end if;
    end//
DELIMITER ;

DELIMITER //
create or replace trigger prueba_clase2
before update on pedido
for each row
begin
	if new.fecha_pedido >= new.fecha_entrega then 
    signal sqlstate '45000' 
    set message_text ="hi ha un error";
    end if;
    end//
DELIMITER ;
/*tasca 2 */
create table if not exists auditoria(
id int(10) primary key,
precio_anterior double(10,2),
precio_nuevo double (10,2),
aumento double (10,2),
usuario varchar(50)
);
DELIMITER //
create or replace trigger prueba_clase3
after update on pedido
for each row
begin
	if old.precio_anterior
  end if;
    end//
DELIMITER ;

/*tasca3*/
drop trigger prueba_clase4
delimiter //
create trigger prueba_clase4
before insert on empleado
for each row
begin
	declare nom varchar(50);
    declare cognom1 varchar(50);
	declare cognom2 varchar(50);
    declare email varchar(100);
	
    SET nom = CONCAT(UPPER(SUBSTRING(NEW.nombre, 1, 1)), LOWER(SUBTRING(NEW.nombre,2)));
	set congnom1 = concat(upper(substring(new.apellido1, 1, 1)), lower(subtring(new.apellido1, 2)));
    if apellido2 = null then
		set apellido2 = null;
	else  set cognom2 = concat(upper(substring(new.apellido1, 1, 1)), lower(subtring(new.apellido1, 2)));
    end if;
    set email = trim(email);

END //
delimiter ;
