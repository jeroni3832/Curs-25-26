
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

ALTER TABLE usuari MODIFY Correu VARCHAR (50) NOT NULL CHECK (correu LIKE '%@%' );

ALTER TABLE quota MODIFY Import FLOAT CHECK (Import >= 7.99);

ALTER TABLE usuari MODIFY Dta_ate DATE CHECK (Dta_ate >= 2000);

ALTER TABLE targeta MODIFY Ccv VARCHAR(10) CHECK (LENGTH(CCV) >=3 AND(LENGTH(CCV) <=4));

ALTER TABLE pelicula MODIFY Cost FLOAT(10) NOT NULL CHECK (Cost >= 0);

ALTER TABLE pelicula MODIFY Data_creacio DATE CHECK (Data_creacio > 1900);

ALTER TABLE pelicula ADD Edat_recomenada INT NOT NULL CHECK (Edat_recomenada >= 18 or Edat_recomenada <=0);

ALTER TABLE usuari ADD Importe FLOAT  NOT NULL CHECK (Importe >=0);

ALTER TABLE targeta MODIFY Numero INT(20) CHECK (LENGTH(Numero) >=13 AND (LENGTH(Numero) <=19)); 

ALTER TABLE pagament MODIFY Import FLOAT CHECK (Import >=0);

ALTER TABLE usuari MODIFY Nom VARCHAR(50) NOT NULL CHECK (TRIM(Nom));

ALTER TABLE usuari MODIFY Cog1 VARCHAR(50) NOT NULL CHECK (TRIM(Cog1));

ALTER TABLE usuari MODIFY Cog2 VARCHAR(50) NOT NULL CHECK (TRIM(Cog2));

ALTER TABLE usuari MODIFY Correu VARCHAR (50) NOT NULL CHECK (correu LIKE '_%@%');

/*tasca 2*/

ALTER TABLE director DROP CONSTRAINT fk_director_persona ;

ALTER TABLE director ADD CONSTRAINT fk_director_persona FOREIGN KEY (Id_persona) REFERENCES persona(Id) ON DELETE CASCADE;

ALTER TABLE usuari DROP CONSTRAINT fk_usuari_quota;

ALTER TABLE usuari ADD CONSTRAINT fk_usuari_quota FOREIGN KEY (Id_quota) REFERENCES quota(id) ON DELETE SET NULL;

ALTER TABLE localitat DROP CONSTRAINT fk_loca_usuari;

ALTER TABLE localitat ADD CONSTRAINT fk_loca_usuari FOREIGN KEY (Id_usuari) REFERENCES usuari(id) ON DELETE RESTRICT;

ALTER TABLE peli_actor DROP CONSTRAINT fk_peli_actor_pelicula; 

ALTER TABLE peli_actor ADD CONSTRAINT fk_peli_actor_pelicula FOREIGN KEY (Id_pelicula) REFERENCES pelicula(id) ON UPDATE CASCADE;

ALTER TABLE pagament DROP CONSTRAINT fk_pag_targ;

ALTER TABLE pagament ADD CONSTRAINT fk_pag_targ FOREIGN KEY(Id_targeta) REFERENCES targeta(id) ON DELETE NO ACTION;

ALTER TABLE peli_actor DROP CONSTRAINT fk_peli_actor_actor;

ALTER TABLE peli_actor ADD CONSTRAINT fk_peli_actor_actor FOREIGN KEY (Id_actor) REFERENCES actor(id) ON UPDATE CASCADE ON DELETE CASCADE ;

ALTER TABLE targeta DROP CONSTRAINT fk_targ_usu;

ALTER TABLE targeta ADD CONSTRAINT fk_targ_usu FOREIGN KEY (Id_usuari) REFERENCES usuari(id) ON DELETE SET NULL;

ALTER TABLE cate_peli DROP CONSTRAINT fk_cate_peli_categoria ;

ALTER TABLE cate_peli ADD CONSTRAINT fk_cate_peli_categoria FOREIGN KEY (Id_categoria) REFERENCES categoria(Id) ON UPDATE NO ACTION;

AlTER TABLE peli_dire DROP CONSTRAINT fk_peli_dire_pelicula;

ALTER TABLE peli_dire ADD  CONSTRAINT fk_peli_dire_pelicula FOREIGN KEY (Id_pelicula) REFERENCES pelicula(id) ON UPDATE CASCADE ON DELETE CASCADE;

ALTER TABLE disc_peli DROP CONSTRAINT fk_disc_peli_disclamer;

ALTER TABLE disc_peli ADD CONSTRAINT fk_disc_peli_disclamer FOREIGN KEY (Id_disclamer) REFERENCES disclamer(Id) ON DELETE CASCADE ON UPDATE RESTRICT;
    
ALTER TABLE peli_dire DROP CONSTRAINT fk_peli_dire_director;

ALTER TABLE peli_dire ADD CONSTRAINT fk_peli_dire_director FOREIGN KEY (Id_director) REFERENCES director(id) ON UPDATE CASCADE ON DELETE CASCADE;



/*tasca3*/

/*CREATE TABLE IF NOT EXISTS empleat(
Id INT(10) PRIMARY KEY,
Nom VARCHAR(50) NOT NULL,
Cognom VARCHAR(50) NOT NULL,
Data_naix DATE NOT NULL,
funcio ENUM('administratiu','tecnic')
);*/

/* insertar dades dins la taula*/
INSERT INTO usuari (id, nom, cog1, cog2, adrasa, correu, importe)
VALUES(20, 'Pablo', 'Cano', 'Serrano', 'Calle del Progreso 15', 'pablo.cano@email.com', 76.30);


INSERT INTO	targeta (id, data_caducitat, numero, ccv)
VALUE(58,'2021-10-10-','123156789123456','154');




UPDATE usuari SET Cog1= 'Payeras';
  
  
  SHOW CREATE TABLE usuari;

 DELETE FROM usuari;


