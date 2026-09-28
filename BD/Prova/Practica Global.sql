CREATE DATABASE IF NOT EXISTS practicas_global;

CREATE TABLE IF NOT EXISTS malalt (
	Inscripcio INT(5) PRIMARY KEY,
    Congnom VARCHAR (15) NOT NULL,
    Adresa VARCHAR (20),
    Data_neix DATE,
    Sexe CHAR(1) NOT NULL,
    Nss CHAR(9)
);

CREATE TABLE IF NOT EXISTS hospital (
	Hospital_cod TINYINT (2) PRIMARY KEY,
	Nom VARCHAR (10) NOT NULL,
    Adresa VARCHAR (20),
    Telefon VARCHAR (8),
    Qtat_llits SMALLINT (3)
);

CREATE TABLE IF NOT EXISTS sala (
	Hospital_cod TINYINT(2),
    Sala_cod TINYINT(2),
    PRIMARY KEY (Hospital_cod, Sala_cod),
    Nom VARCHAR (20) NOT NULL,
	Qtat_llits SMALLINT(3)
);

CREATE TABLE IF NOT EXISTS ingressos(
	Inscripcio INT(5) PRIMARY KEY,
	Hospital_cod TINYINT(2),
    Sala_cod TINYINT(2),
    Llit SMALLINT(4),
    CONSTRAINT fk_ingressos_sala FOREIGN KEY (Hospital_cod, Sala_cod) REFERENCES sala (Hospital_cod, Sala_cod)
);
/*1 PONER DEFAULT A LA ESPECIALIDAD*/
CREATE TABLE IF NOT EXISTS doctor(
	Hospital_cod TINYINT(2),
    Doctor_no SMALLINT (3),
    PRIMARY KEY (Hospital_cod, Doctor_no),
    Cognom VARCHAR(13),
    Especialitat VARCHAR(16) DEFAULT 'metge capsalera'
);

CREATE TABLE IF NOT EXISTS plantilla(
	Hospital_cod TINYINT(2),
    Sala_cod TINYINT(2),
    Empleat_no SMALLINT(4),
    PRIMARY KEY (Hospital_cod, Sala_cod, Empleat_no),
    Cognom VARCHAR(15) NOT NULL,
    Funcio VARCHAR(10),
    Torn VARCHAR(1),
    Salari INT(10)
);

SHOW CREATE TABLE sala;
SHOW CREATE TABLE plantilla;
SHOW CREATE TABLE ingressos;

ALTER TABLE doctor ADD CONSTRAINT fk_hospital_doctor FOREIGN KEY (Hospital_cod) REFERENCES Hospital (Hospital_cod);

ALTER TABLE plantilla ADD CONSTRAINT fk_plantilla_sala FOREIGN KEY (Hospital_cod, Sala_cod) REFERENCES sala (Hospital_cod, Sala_cod);

ALTER TABLE sala ADD CONSTRAINT fk_sala_hospital FOREIGN KEY (Hospital_cod) REFERENCES hospital (Hospital_cod);

ALTER TABLE ingressos ADD Inscripcio_malalt INT(5);

ALTER TABLE ingressos ADD CONSTRAINT fk_ingresos_malalt FOREIGN KEY (Inscripcio_malalt) REFERENCES malalt (Inscripcio);
ALTER TABLE ingressos DROP CONSTRAINT fk_ingresos_malalt;
/*2 MODIFICAR VARCHAR*/
ALTER TABLE hospital MODIFY Telefon VARCHAR (20);
/*3 PONER SALARIO EN POSITIVO Y IGUAL O MAYOR*/
ALTER TABLE plantilla MODIFY Salari INT(10) CHECK( Salari>=1000);
/*4 USAR IN PARA ESPECIFICAR UNOS ATRIBUTOS*/
ALTER TABLE plantilla ADD CHECK (Funcio IN ( 'Infermer', 'Infermera', 'Auxiliar', 'Administratiu', 'Administrativa'));
ALTER TABLE plantilla MODIFY Funcio VARCHAR(20);
/*5 usar el <> para decirle que no sea pendiente*/
ALTER TABLE sala ADD CONSTRAINT no_pendent CHECK( nom <> 'Pendent');
/*6 añardir m t v con or para decir que sea uno de los 3*/
ALTER TABLE plantilla ADD CONSTRAINT torn_indicar CHECK(Torn='M' OR Torn='T' OR Torn='V');
/*7 ANADIR VALIDACION CON OR Y MODIFICAR CON UN DEFAULT*/
ALTER TABLE malalt ADD CONSTRAINT sexe_validacio CHECK( Sexe='M' OR Sexe='F');
ALTER TABLE malalt MODIFY Sexe CHAR(1) NOT NULL DEFAULT 'M';
/*8 peta per foreign*/
INSERT INTO plantilla (Hospital_cod, Sala_cod, Empleat_no, Cognom, Funcio, Torn, Salari)
VALUE ('MANAROR', 'CURES', 'JUAN', 'SUREDA', 'INFERMER', 'V', 1500);
/*9 modificar foreign */
ALTER TABLE ingressos ADD CONSTRAINT fk_ingresos_malalt FOREIGN KEY (Inscripcio_malalt) REFERENCES malalt (Inscripcio) ON UPDATE CASCADE ON DELETE RESTRICT;
/*10 EL MATEIX QUE EL 9*/
ALTER TABLE ingressos DROP CONSTRAINT fk_ingressos_sala;
ALTER TABLE ingressos ADD  CONSTRAINT fk_ingressos_sala FOREIGN KEY (Hospital_cod, Sala_cod) REFERENCES sala (Hospital_cod, Sala_cod) ON UPDATE CASCADE ON DELETE RESTRICT;
/*11 NO PERMETRE LA ACTUALI*/
ALTER TABLE sala DROP CONSTRAINT fk_sala_hospital;
ALTER TABLE sala ADD CONSTRAINT fk_sala_hospital FOREIGN KEY (Hospital_cod) REFERENCES hospital (Hospital_cod) ON UPDATE RESTRICT ON DELETE RESTRICT;