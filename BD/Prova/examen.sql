
CREATE TABLE IF NOT EXISTS persona(
	Id INT(10) PRIMARY KEY,
	Cognom1 VARCHAR(50),
	Cognom2 VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS actor(
	Id INT(10) PRIMARY KEY,
	Id_persona INT,
	CONSTRAINT fk_actor_persona FOREIGN KEY (Id_persona) REFERENCES persona(Id)
);

CREATE TABLE IF NOT EXISTS director(
	Id INT(10) PRIMARY KEY,
	Id_persona INT,
	CONSTRAINT fk_director_persona FOREIGN KEY (Id_persona) REFERENCES persona(Id)
);

CREATE TABLE IF NOT EXISTS disclamer(
	Id INT(10) PRIMARY KEY,
	Nom VARCHAR (50) NOT NULL
);

CREATE TABLE IF NOT EXISTS pelicula(
	Id INT(10) PRIMARY KEY,
	Cost INt(10) NOT NULL,
	Edat_recomena INT(10) NOT NULL,
	Data_creacio DATE 
);

CREATE TABLE IF NOT EXISTS disc_peli(
	Id INT(10) PRIMARY KEY,
	Id_pelicula INT,
	Id_disclamer INT,
	CONSTRAINT fk_disc_peli_pelicula FOREIGN KEY (Id_pelicula) REFERENCES pelicula(Id),
	CONSTRAINT fk_disc_peli_disclamer FOREIGN KEY (Id_disclamer) REFERENCES disclamer(Id)
);

CREATE TABLE IF NOT EXISTS categoria(
	Id INT(10) PRIMARY KEY,
	Nom VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS cate_peli(
	Id_pelicula INT,
    Id_categoria INT,
	PRIMARY KEY (id_pelicula, id_categoria),
	CONSTRAINT fk_cate_peli_pelicula FOREIGN KEY (Id_pelicula) REFERENCES pelicula(Id),
	CONSTRAINT fk_cate_peli_categoria FOREIGN KEY (Id_categoria) REFERENCES categoria(Id)
);

CREATE TABLE IF NOT EXISTS peli_actor(
	Id_pelicula INT,
	Id_actor INT,
	PRIMARY KEY(Id_pelicula, Id_actor),
	CONSTRAINT fk_peli_actor_pelicula FOREIGN KEY (Id_pelicula) REFERENCES pelicula(id),
	CONSTRAINT fk_peli_actor_actor FOREIGN KEY (Id_actor) REFERENCES actor(id)
);

CREATE TABLE IF NOT EXISTS quota(
	Id INT(10)PRIMARY KEY,
	Dta_quota DATE,
	Import FLOAT
);

CREATE TABLE IF NOT EXISTS usuari(
	Id INT(10) PRIMARY KEY,
	Nom VARCHAR(50) NOT NULL,
	Cog1 VARCHAR(50) NOT NULL,
	Cog2 VARCHAR(50) NOT NULL,
	Adrasa VARCHAR(50) NOT NULL,
	Correu VARCHAR(50) NOT NULL,
	Dta_ate DATE,
    Id_quota INT,
    CONSTRAINT fk_usuari_quota FOREIGN KEY (Id_quota) REFERENCES quota(id)
);
CREATE TABLE IF NOT EXISTS usu_peli(
	Id_usuari INT,
	Id_pelicula INT,
	PRIMARY KEY(Id_usuari, Id_pelicula),
	CONSTRAINT fk_usu_peli_usuari FOREIGN KEY (Id_usuari) REFERENCES usuari(id),
    CONSTRAINT fk_usu_peli_pelicula FOREIGN KEY (Id_pelicula) REFERENCES pelicula(id)
);

CREATE TABLE IF NOT EXISTS peli_dire(
	Id_pelicula INT,
    Id_director INT,
    PRIMARY KEY (Id_pelicula, Id_director),
    CONSTRAINT fk_peli_dire_pelicula FOREIGN KEY (Id_pelicula) REFERENCES pelicula(id),
    CONSTRAINT fk_peli_dire_director FOREIGN KEY (Id_director) REFERENCES director(id)
);

CREATE TABLE IF NOT EXISTS localitat(
	Id INT(10) PRIMARY KEY,
    Nom VARCHAR(50) NOT NULL,
	Id_usuari INT,
    CONSTRAINT fk_loca_usuari FOREIGN KEY (Id_usuari) REFERENCES usuari(id)
);

CREATE TABLE IF NOT EXISTS targeta(
	Id INT (10) PRIMARY KEY,
    Data_caducitat DATE,
    Numero INT(20),
    Ccv INT(10),
    Vigent BOOLEAN,
    Id_usuari INT,
    CONSTRAINT fk_targ_usu FOREIGN KEY (Id_usuari) REFERENCES usuari(id)
);

CREATE TABLE IF NOT EXISTS pagament(
	Id INT(10) PRIMARY KEY,
    Import FLOAT,
    Id_targeta INT,
    CONSTRAINT fk_pag_targ FOREIGN KEY(Id_targeta) REFERENCES targeta(id)
);
/*1*/
alter table usuari modify Correu VARCHAR(50) NOT NULL check (Correu like '%@%');
/*2*/
alter table quota modify Import float check (Import >= 7.99);
/*3*/
alter table usuari modify Dta_ate date check (Dta_ate>= 2000);
/*4*/
alter table targeta modify Ccv int (10) check (length(Ccv)>=3 and length(Ccv)<=4);
/*5*/
alter table pelicula modify Cost float check( Cost >= 0);
/*6*/
alter table pelicula modify Data_creacio DATE check (Data_creacio>1900);
/*7*/
ALTER TABLE Pelicula ADD CONSTRAINT chk_edat CHECK (Edat_recomena BETWEEN 0 AND 18);
/*8*/
alter table quota modify Import float check (Import>=0); 
/*9*/
alter table targeta modify numero int(20) check (char_length(numero) <= 19 and char_length(numero) >= 13);
/*10*/
alter table pagament modify Import float check ( Import >=0); 
/*11*/
ALTER TABLE usuari MODIFY Nom VARCHAR(50) NOT NULL CHECK (TRIM(Nom));
ALTER TABLE usuari MODIFY Cog1 VARCHAR(50) NOT NULL CHECK (TRIM(Cog1));
ALTER TABLE usuari MODIFY Cog2 VARCHAR(50) NOT NULL CHECK (TRIM(Cog2));
/*12*/
alter table usuari modify correu varchar(50) not null check( correu ='_%@_%.%');

/*fks*/
/*1*/
alter table director drop foreign key fk_director_persona;
alter table director add CONSTRAINT fk_director_persona FOREIGN KEY (Id_persona) REFERENCES persona(Id) on delete cascade;
/*2*/
alter table usuari drop foreign key fk_usuari_quota;
alter table usuari add CONSTRAINT fk_usuari_quota FOREIGN KEY (Id_quota) REFERENCES quota(id) on delete set null;
/*3*/
alter table localitat drop foreign key fk_loca_usuari;
alter table localitat add CONSTRAINT fk_loca_usuari FOREIGN KEY (Id_usuari) REFERENCES usuari(id) on delete restrict;
/*4*/
alter table peli_actor drop foreign key fk_peli_actor_pelicula; 
ALTER TABLE peli_actor ADD CONSTRAINT fk_peli_actor_pelicula FOREIGN KEY (Id_pelicula) REFERENCES pelicula(id) ON UPDATE CASCADE;
/*5*/
alter table pagament drop foreign key fk_pag_targ;
alter table pagament add CONSTRAINT fk_pag_targ FOREIGN KEY(Id_targeta) REFERENCES targeta(id) on delete no action;
/*6*/
alter table peli_actor drop foreign key fk_peli_actor_actor;
alter table peli_actor add CONSTRAINT fk_peli_actor_actor FOREIGN KEY (Id_actor) REFERENCES actor(id) on update cascade on delete cascade;
/*7*/
alter table targeta drop foreign key fk_targ_usu;
alter table targeta add  CONSTRAINT fk_targ_usu FOREIGN KEY (Id_usuari) REFERENCES usuari(id) on delete set null;
/*8*/
alter table cate_peli drop foreign key fk_cate_peli_pelicula;
alter table cate_peli add  CONSTRAINT fk_cate_peli_pelicula FOREIGN KEY (Id_pelicula) REFERENCES pelicula(Id) on update no action;
/*9*/
ALTER TABLE disc_peli DROP FOREIGN KEY fk_disc_peli_disclamer;
alter table disc_peli add CONSTRAINT fk_disc_peli_disclamer FOREIGN KEY (Id_disclamer) REFERENCES disclamer(Id) on delete cascade on update restrict; 
/*10*/
alter table peli_dire drop foreign key fk_peli_dire_pelicula;
alter table peli_dire add CONSTRAINT fk_peli_dire_pelicula FOREIGN KEY (Id_pelicula) REFERENCES pelicula(id) on update cascade on delete cascade;
alter table peli_dire drop foreign key  fk_peli_dire_director;
alter table peli_dire add CONSTRAINT fk_peli_dire_director FOREIGN KEY (Id_director) REFERENCES director(id) on update cascade on delete cascade;
    

