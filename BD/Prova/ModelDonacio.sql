CREATE TABLE IF NOT EXISTS donant (
	Id INT(10)PRIMARY KEY,
    Dni VARCHAR(50) NOT NULL,
	Nom VARCHAR(50) NOT NULL,
    Cognom1 VARCHAR(50) NOT NULL,
    Cognom2 VARCHAR(50) NOT NULL,
    Telefon VARCHAR(50) NOT NULL
    );
   
CREATE TABLE IF NOT EXISTS 	VIA_CONTACTE(
	Id INT(10) PRIMARY KEY,
    Contacte VARCHAR(50) NOT NULL,
    Data DATE NOT NULL,
    Id_donant INT,
    CONSTRAINT fk_donant FOREIGN KEY (id_donant) REFERENCES donant(id)
);   
CREATE TABLE IF NOT EXISTS tipus_sang(
	Id INT(10) PRIMARY KEY,
    Nom VARCHAR(50) NOT NULL,
    Rh VARCHAR(50) NOT NULL,
    Id_tipus_sang INT,
    CONSTRAINT fk_tipus_sang FOREIGN KEY (Id_tipus_sang) REFERENCES tipus_sang(id)
);
CREATE TABLE IF NOT EXISTS compatibilitat(
	Id_donant INT(10) ,
    Id_receptor INT(10),
    PRIMARY KEY(Id_receptor, Id_donant),
    CONSTRAINT fk_donants FOREIGN KEY (id_donant) REFERENCES tipus_sang(id),
    CONSTRAINT fk_receptor FOREIGN KEY (id_receptor) REFERENCES tipus_sang(id)
);
CREATE TABLE IF NOT EXISTS bossa(
	Id INT(10) PRIMARY KEY,
    Id_tipus_sang INT,
    Id_donant INT,
    Id_jornada INT,
    CONSTRAINT fk_tipus_bossa FOREIGN KEY (Id_tipus_sang) REFERENCES tipus_sang(id),
    CONSTRAINT fk_dontant_bossa FOREIGN KEY (Id_donant) REFERENCES donant(id),
    CONSTRAINT fk_jornada_bossa FOREIGN KEY (Id_jornada) REFERENCES jornada(id)
);

