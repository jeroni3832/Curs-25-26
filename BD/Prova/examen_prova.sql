/*create database if not exists examen_prova*/
/*creacio de taules*/

create table if not exists clients(
id int (10) primary key,
name varchar(50) not null,
email varchar(50) not null unique,
phone varchar(20),
adress varchar(50) 
);

create table if not exists destinations(
id int(10) primary key,
name varchar(50) not null,
country varchar(30) not null,
description varchar(50)
);

create table if not exists packages(
id int(10) primary key auto_increment,
name varchar(50) not null,
id_destinations int,
constraint pack_desti foreign key (id_destinations) references destinations(id),
price float not null,
duration_day int(10) not null
);

create table if not exists bookings(
id int(10) primary key auto_increment,
id_clients int,
id_packages int,
booking_date date not null,
status varchar (50) not null,
constraint book_client foreign key (id_clients) references clients(id),
constraint book_pack foreign key (id_packages) references packages(id)
);

create table if not exists reviews(
id int(10) primary key auto_increment,
id_clients int,
id_packages int,
rating int(10) check (rating between 1 and 5),
comment varchar(50),
constraint revi_client foreign key (id_clients) references clients(id),
constraint revi_pack foreign key (id_packages) references packages(id)
);

/*2*/
alter table packages add package_type enum('adventur', 'relaxation', 'cultural', 'family') default 'adventur';
/*3*/
alter table packages drop foreign key pack_desti;
alter table packages add constraint pack_desti foreign key (id_destinations) references destinations(id) on delete cascade;
/*4*/
alter table bookings drop foreign key book_clients;
alter table reviews drop foreign key revi_clients;
alter table clients drop id;
alter table clients add dni int (10)primary key;
alter table reviews change id_clients dni_clients int;
alter table bookings change id_clients dni_clients int;
alter table bookings add constraint book_clients foreign key (dni_clients) references clients(dni);
alter table reviews add constraint revi_clients foreign key (dni_clients) references clients(dni);
/*6*/
alter table clients modify email varchar(50) not null unique CHECK(email='_%@_%.%');