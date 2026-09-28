-- ================================================================
-- 1. CONFIGURACIÓN INICIAL (LIMPIEZA TOTAL)
-- ================================================================
DROP DATABASE IF EXISTS CadenaHoteleraCompleta;
CREATE DATABASE CadenaHoteleraCompleta;
USE CadenaHoteleraCompleta;

-- Desactivamos claves foráneas para insertar en cualquier orden
SET FOREIGN_KEY_CHECKS = 0; 
SET NAMES utf8mb4;

-- ================================================================
-- 2. CREACIÓN DE ESTRUCTURA (33 TABLAS)
-- ================================================================

CREATE TABLE Cadenes_Hoteleres (
    codi_cadena INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    codi VARCHAR(20) UNIQUE NOT NULL,
    pais_origen VARCHAR(100),
    nombre_hotels INT DEFAULT 0
);

CREATE TABLE Hotels (
    codi_hotel INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    codi VARCHAR(20) UNIQUE NOT NULL,
    cadena_id INT NOT NULL,
    categoria INT CHECK (categoria BETWEEN 1 AND 5),
    tipus ENUM('urbà', 'resort', 'boutique', 'business', 'econòmic') NOT NULL,
    adreca VARCHAR(200),
    ciutat VARCHAR(100) NOT NULL,
    provincia VARCHAR(100) NOT NULL,
    pais VARCHAR(100) NOT NULL,
    nombre_habitacions INT NOT NULL,
    estat ENUM('actiu', 'inactiu', 'manteniment', 'renovació') DEFAULT 'actiu',
    FOREIGN KEY (cadena_id) REFERENCES Cadenes_Hoteleres(codi_cadena)
);

CREATE TABLE Departaments (
    codi_departament INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    pressupost_anual DECIMAL(12,2),
    nombre_empleats INT DEFAULT 0
);

CREATE TABLE Empleats (
    codi_empleat INT PRIMARY KEY AUTO_INCREMENT,
    codi_hotel INT NOT NULL,
    codi_departament INT NOT NULL,
    codi VARCHAR(20) UNIQUE NOT NULL,
    nom VARCHAR(100) NOT NULL,
    cognoms VARCHAR(150) NOT NULL,
    dni VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE,
    carrec VARCHAR(100) NOT NULL,
    nivell ENUM('junior', 'senior', 'supervisor', 'manager', 'director'),
    tipus_contracte ENUM('indefinit', 'temporal', 'parcial', 'pràctiques'),
    salari_base DECIMAL(8,2),
    horari_torn ENUM('matí', 'tarda', 'nit', 'rotatiu'),
    experiencia_anys INT DEFAULT 0,
    FOREIGN KEY (codi_hotel) REFERENCES Hotels(codi_hotel),
    FOREIGN KEY (codi_departament) REFERENCES Departaments(codi_departament)
);

CREATE TABLE Clients (
    codi_client INT PRIMARY KEY AUTO_INCREMENT,
    tipus ENUM('particular', 'empresa', 'agencia') NOT NULL,
    nom VARCHAR(100) NOT NULL,
    cognoms VARCHAR(150),
    nom_complet VARCHAR(250) GENERATED ALWAYS AS (CONCAT(nom, ' ', IFNULL(cognoms, ''))) STORED,
    dni_nif VARCHAR(20) UNIQUE,
    email VARCHAR(100) UNIQUE NOT NULL,
    ciutat VARCHAR(100),
    pais VARCHAR(100) DEFAULT 'Espanya',
    vip BOOLEAN DEFAULT FALSE,
    import_total_gastat DECIMAL(10,2) DEFAULT 0.00,
    nacionalitat VARCHAR(100)
);

CREATE TABLE Tipus_Habitacio (
    codi_tipus INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    capacitat_maxima INT,
    preu_base DECIMAL(8,2),
    categoria ENUM('estandard', 'superior', 'deluxe', 'suite', 'presidencial')
);

CREATE TABLE Habitacions (
    codi_habitacio INT PRIMARY KEY AUTO_INCREMENT,
    codi_hotel INT NOT NULL,
    numero VARCHAR(10) NOT NULL,
    codi_tipus INT NOT NULL,
    planta INT NOT NULL,
    capacitat_total INT,
    vistes ENUM('mar', 'muntanya', 'ciutat', 'jardí', 'interior'),
    estat ENUM('disponible', 'ocupada', 'neteja', 'manteniment', 'fora_servei') DEFAULT 'disponible',
    preu_base DECIMAL(8,2) NOT NULL,
    terrassa BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (codi_hotel) REFERENCES Hotels(codi_hotel),
    FOREIGN KEY (codi_tipus) REFERENCES Tipus_Habitacio(codi_tipus)
);

CREATE TABLE Reserves (
    codi_reserva INT PRIMARY KEY AUTO_INCREMENT,
    codi_client INT NOT NULL,
    codi_hotel INT NOT NULL,
    codi VARCHAR(20) UNIQUE NOT NULL,
    data_entrada DATE NOT NULL,
    data_sortida DATE NOT NULL,
    nombre_nits INT GENERATED ALWAYS AS (DATEDIFF(data_sortida, data_entrada)) STORED,
    nombre_adults INT NOT NULL,
    nombre_nens INT DEFAULT 0,
    estat ENUM('pendent', 'confirmada', 'check_in', 'check_out', 'cancelada', 'no_show') DEFAULT 'pendent',
    canal_reserva ENUM('directa', 'web', 'telefon', 'email', 'agencia', 'booking', 'expedia') NOT NULL,
    import_total DECIMAL(10,2),
    descompte_percentatge DECIMAL(5,2) DEFAULT 0.00,
    FOREIGN KEY (codi_client) REFERENCES Clients(codi_client),
    FOREIGN KEY (codi_hotel) REFERENCES Hotels(codi_hotel)
);

CREATE TABLE Serveis (
    codi_servei INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    preu DECIMAL(8,2),
    tipus ENUM('inclòs', 'opcional', 'premium')
);

CREATE TABLE Factures (
    codi_factura INT PRIMARY KEY AUTO_INCREMENT,
    codi_reserva INT NOT NULL,
    numero_factura VARCHAR(50) UNIQUE NOT NULL,
    data_emissio DATE NOT NULL,
    import_total DECIMAL(10,2),
    estat ENUM('emesa', 'pagada', 'vençuda', 'cancelada') DEFAULT 'emesa',
    FOREIGN KEY (codi_reserva) REFERENCES Reserves(codi_reserva)
);

CREATE TABLE Pagaments (
    codi_pagament INT PRIMARY KEY AUTO_INCREMENT,
    codi_factura INT NOT NULL,
    import DECIMAL(10,2) NOT NULL,
    metode ENUM('efectiu', 'targeta', 'transferencia', 'paypal', 'bizum'),
    data_pagament TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    estat ENUM('pendent', 'processat', 'confirmat', 'fallit') DEFAULT 'pendent',
    FOREIGN KEY (codi_factura) REFERENCES Factures(codi_factura)
);

CREATE TABLE Promocions (
    codi_promocio INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    codi VARCHAR(50) UNIQUE NOT NULL,
    valor DECIMAL(8,2),
    activa BOOLEAN DEFAULT TRUE
);

CREATE TABLE Neteja (
    codi_neteja INT PRIMARY KEY AUTO_INCREMENT,
    codi_habitacio INT NOT NULL,
    codi_empleat INT NOT NULL,
    data_neteja TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    temps_estimat INT,
    temps_real INT,
    FOREIGN KEY (codi_habitacio) REFERENCES Habitacions(codi_habitacio),
    FOREIGN KEY (codi_empleat) REFERENCES Empleats(codi_empleat)
);

CREATE TABLE Manteniment (
    codi_manteniment INT PRIMARY KEY AUTO_INCREMENT,
    codi_habitacio INT,
    codi_hotel INT,
    tipus ENUM('preventiu', 'correctiu', 'urgent'),
    descripcio TEXT NOT NULL,
    prioritat ENUM('baixa', 'mitjana', 'alta', 'crítica'),
    estat ENUM('pendent', 'en_curs', 'finalitzat', 'cancel·lat') DEFAULT 'pendent',
    cost_total DECIMAL(8,2),
    FOREIGN KEY (codi_habitacio) REFERENCES Habitacions(codi_habitacio),
    FOREIGN KEY (codi_hotel) REFERENCES Hotels(codi_hotel)
);

CREATE TABLE Inventari (
    codi_inventari INT PRIMARY KEY AUTO_INCREMENT,
    codi_hotel INT NOT NULL,
    nom_article VARCHAR(100) NOT NULL,
    stock_actual INT NOT NULL,
    preu_unitari DECIMAL(8,2),
    FOREIGN KEY (codi_hotel) REFERENCES Hotels(codi_hotel)
);

CREATE TABLE Proveidors (
    codi_proveidor INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    nif VARCHAR(20) UNIQUE
);

CREATE TABLE Incidencies (
    codi_incidencia INT PRIMARY KEY AUTO_INCREMENT,
    codi_hotel INT NOT NULL,
    codi_habitacio INT,
    tipus ENUM('tecnica', 'servei', 'neteja', 'soroll', 'altra'),
    prioritat ENUM('baixa', 'mitjana', 'alta', 'urgent'),
    estat ENUM('oberta', 'en_curs', 'resolta', 'tancada') DEFAULT 'oberta',
    tiempo_resolucion_horas INT, 
    FOREIGN KEY (codi_hotel) REFERENCES Hotels(codi_hotel)
);

CREATE TABLE Horaris (
    codi_horari INT PRIMARY KEY AUTO_INCREMENT,
    codi_empleat INT NOT NULL,
    data_treball DATE NOT NULL,
    hores_treballades DECIMAL(4,2),
    FOREIGN KEY (codi_empleat) REFERENCES Empleats(codi_empleat)
);

CREATE TABLE Formacio (
    codi_formacio INT PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(100) NOT NULL,
    durada_hores INT,
    certificacio BOOLEAN DEFAULT FALSE,
    cost DECIMAL(8,2)
);

CREATE TABLE Restaurant (
    codi_restaurant INT PRIMARY KEY AUTO_INCREMENT,
    codi_hotel INT NOT NULL,
    nom VARCHAR(100) NOT NULL,
    tipus_cuina VARCHAR(50),
    capacitat INT,
    FOREIGN KEY (codi_hotel) REFERENCES Hotels(codi_hotel)
);

CREATE TABLE Plats (
    codi_plat INT PRIMARY KEY AUTO_INCREMENT,
    codi_restaurant INT NOT NULL,
    nom VARCHAR(100) NOT NULL,
    preu DECIMAL(6,2) NOT NULL,
    categoria ENUM('entrant', 'principal', 'postre', 'beguda'),
    vegetaria BOOLEAN DEFAULT FALSE,
    vegana BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (codi_restaurant) REFERENCES Restaurant(codi_restaurant)
);

CREATE TABLE Comandes_Restaurant (
    codi_comanda INT PRIMARY KEY AUTO_INCREMENT,
    codi_restaurant INT NOT NULL,
    data_comanda TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    import_total DECIMAL(8,2),
    FOREIGN KEY (codi_restaurant) REFERENCES Restaurant(codi_restaurant)
);

CREATE TABLE Esdeveniments (
    codi_esdeveniment INT PRIMARY KEY AUTO_INCREMENT,
    codi_hotel INT NOT NULL,
    nom VARCHAR(100) NOT NULL,
    data_inici DATETIME NOT NULL,
    preu DECIMAL(10,2),
    FOREIGN KEY (codi_hotel) REFERENCES Hotels(codi_hotel)
);

CREATE TABLE Sales (
    codi_sala INT PRIMARY KEY AUTO_INCREMENT,
    codi_hotel INT NOT NULL,
    nom VARCHAR(100) NOT NULL,
    capacitat INT NOT NULL,
    FOREIGN KEY (codi_hotel) REFERENCES Hotels(codi_hotel)
);

CREATE TABLE Ressenyes (
    codi_ressenya INT PRIMARY KEY AUTO_INCREMENT,
    codi_client INT NOT NULL,
    codi_hotel INT NOT NULL,
    valoracio INT CHECK (valoracio BETWEEN 1 AND 5),
    verificada BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (codi_client) REFERENCES Clients(codi_client),
    FOREIGN KEY (codi_hotel) REFERENCES Hotels(codi_hotel)
);

CREATE TABLE Transport (
    codi_transport INT PRIMARY KEY AUTO_INCREMENT,
    codi_hotel INT NOT NULL,
    tipus ENUM('aeroport', 'estacio', 'taxi', 'autobus', 'metro'),
    cost_aproximat DECIMAL(6,2),
    FOREIGN KEY (codi_hotel) REFERENCES Hotels(codi_hotel)
);

CREATE TABLE Tarifes (
    codi_tarifa INT PRIMARY KEY AUTO_INCREMENT,
    codi_tipus_habitacio INT NOT NULL,
    codi_hotel INT NOT NULL,
    nom VARCHAR(100) NOT NULL,
    preu DECIMAL(8,2) NOT NULL,
    temporada ENUM('baixa', 'mitjana', 'alta', 'especial'),
    activa BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (codi_tipus_habitacio) REFERENCES Tipus_Habitacio(codi_tipus),
    FOREIGN KEY (codi_hotel) REFERENCES Hotels(codi_hotel)
);

CREATE TABLE Activitats (
    codi_activitat INT PRIMARY KEY AUTO_INCREMENT,
    codi_hotel INT NOT NULL,
    nom VARCHAR(100) NOT NULL,
    tipus ENUM('esport', 'cultura', 'gastronomia', 'relax', 'aventura'),
    preu DECIMAL(6,2),
    valoracio_mitjana DECIMAL(3,2) DEFAULT 0.00,
    FOREIGN KEY (codi_hotel) REFERENCES Hotels(codi_hotel)
);

CREATE TABLE Comunicacions (
    codi_comunicacio INT PRIMARY KEY AUTO_INCREMENT,
    codi_client INT NOT NULL,
    tipus ENUM('email', 'sms', 'trucada', 'carta'),
    FOREIGN KEY (codi_client) REFERENCES Clients(codi_client)
);

CREATE TABLE Fidelitat (
    codi_fidelitat INT PRIMARY KEY AUTO_INCREMENT,
    codi_client INT NOT NULL,
    nivell ENUM('bronze', 'plata', 'or', 'platí', 'diamant') DEFAULT 'bronze',
    punts_totals INT DEFAULT 0,
    FOREIGN KEY (codi_client) REFERENCES Clients(codi_client)
);

CREATE TABLE Meteorologia (
    codi_meteorologia INT PRIMARY KEY AUTO_INCREMENT,
    codi_hotel INT NOT NULL,
    data_prediccio DATE NOT NULL,
    FOREIGN KEY (codi_hotel) REFERENCES Hotels(codi_hotel)
);

CREATE TABLE Estadistiques (
    codi_estadistica INT PRIMARY KEY AUTO_INCREMENT,
    codi_hotel INT NOT NULL,
    any INT NOT NULL,
    mes INT NOT NULL,
    ocupacio_percentatge DECIMAL(5,2),
    FOREIGN KEY (codi_hotel) REFERENCES Hotels(codi_hotel)
);

CREATE TABLE Auditoria (
    codi_auditoria INT PRIMARY KEY AUTO_INCREMENT,
    taula VARCHAR(100) NOT NULL,
    operacio ENUM('INSERT', 'UPDATE', 'DELETE') NOT NULL,
    data_operacio TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- (TABLAS INTERMEDIAS N:M)
CREATE TABLE Hotels_Serveis (
    codi_hotel INT NOT NULL,
    codi_servei INT NOT NULL,
    actiu BOOLEAN DEFAULT TRUE,
    preu_especial DECIMAL(8,2),
    PRIMARY KEY (codi_hotel, codi_servei),
    FOREIGN KEY (codi_hotel) REFERENCES Hotels(codi_hotel),
    FOREIGN KEY (codi_servei) REFERENCES Serveis(codi_servei)
);

CREATE TABLE Reserves_Habitacions (
    codi_reserva INT NOT NULL,
    codi_habitacio INT NOT NULL,
    PRIMARY KEY (codi_reserva, codi_habitacio),
    FOREIGN KEY (codi_reserva) REFERENCES Reserves(codi_reserva),
    FOREIGN KEY (codi_habitacio) REFERENCES Habitacions(codi_habitacio)
);

CREATE TABLE Reserves_Serveis (
    codi_reserva INT NOT NULL,
    codi_servei INT NOT NULL,
    quantitat INT DEFAULT 1,
    import_total DECIMAL(8,2),
    PRIMARY KEY (codi_reserva, codi_servei),
    FOREIGN KEY (codi_reserva) REFERENCES Reserves(codi_reserva),
    FOREIGN KEY (codi_servei) REFERENCES Serveis(codi_servei)
);

CREATE TABLE Empleats_Formacio (
    codi_empleat INT NOT NULL,
    codi_formacio INT NOT NULL,
    data_inici DATE NOT NULL,
    PRIMARY KEY (codi_empleat, codi_formacio),
    FOREIGN KEY (codi_empleat) REFERENCES Empleats(codi_empleat),
    FOREIGN KEY (codi_formacio) REFERENCES Formacio(codi_formacio)
);

CREATE TABLE Comandes_Plats (
    codi_comanda INT NOT NULL,
    codi_plat INT NOT NULL,
    quantitat INT DEFAULT 1,
    PRIMARY KEY (codi_comanda, codi_plat),
    FOREIGN KEY (codi_comanda) REFERENCES Comandes_Restaurant(codi_comanda),
    FOREIGN KEY (codi_plat) REFERENCES Plats(codi_plat)
);

CREATE TABLE Clients_Activitats (
    codi_client INT NOT NULL,
    codi_activitat INT NOT NULL,
    data_activitat DATETIME NOT NULL,
    estat ENUM('reservat', 'confirmat', 'realitzat', 'cancelat') DEFAULT 'reservat',
    valoracio DECIMAL(3,2),
    PRIMARY KEY (codi_client, codi_activitat, data_activitat),
    FOREIGN KEY (codi_client) REFERENCES Clients(codi_client),
    FOREIGN KEY (codi_activitat) REFERENCES Activitats(codi_activitat)
);

-- ================================================================
-- 3. INSERCIÓN MASIVA DE DATOS
-- ================================================================

-- A. CADENAS Y HOTELES
INSERT INTO Cadenes_Hoteleres (nom, codi, pais_origen) VALUES 
('Meliá Hotels', 'CAD01', 'Espanya'), ('Hilton', 'CAD02', 'USA'), ('Barceló', 'CAD03', 'Espanya'), ('NH Hotels', 'CAD04', 'Espanya'), ('Marriott', 'CAD05', 'USA');

INSERT INTO Hotels (nom, codi, cadena_id, categoria, tipus, adreca, ciutat, provincia, pais, nombre_habitacions) VALUES 
('Meliá Barcelona Sky', 'H01', 1, 4, 'urbà', 'Carrer Pere IV', 'Barcelona', 'Barcelona', 'Espanya', 200),
('Hilton Diagonal Mar', 'H02', 2, 5, 'business', 'Passeig Taulat', 'Barcelona', 'Barcelona', 'Espanya', 300),
('Iberostar Grand', 'H03', 3, 5, 'resort', 'Avda Playa', 'Palma', 'Mallorca', 'Espanya', 400),
('Hotel Petit', 'H04', 1, 3, 'boutique', 'Carrer Major', 'Girona', 'Girona', 'Espanya', 50),
('Sevilla Grand', 'H05', 1, 4, 'urbà', 'Av. Palmera', 'Sevilla', 'Sevilla', 'Espanya', 180),
('Bilbao River', 'H06', 2, 5, 'business', 'Ria Nervion', 'Bilbao', 'Bizkaia', 'Espanya', 220),
('Valencia Sun', 'H07', 3, 3, 'resort', 'Malvarrosa', 'Valencia', 'Valencia', 'Espanya', 120),
('Madrid Center', 'H08', 1, 4, 'urbà', 'Gran Via', 'Madrid', 'Madrid', 'Espanya', 350),
('Ibiza Party', 'H09', 3, 2, 'resort', 'San Antonio', 'Ibiza', 'Baleares', 'Espanya', 80),
('Pyrenees Lodge', 'H10', 2, 5, 'boutique', 'Valle Aran', 'Vielha', 'Lleida', 'Espanya', 40),
('Costa Brava Blue', 'H11', 1, 3, 'resort', 'Lloret', 'Girona', 'Girona', 'Espanya', 150),
('Zaragoza Plaza', 'H12', 2, 4, 'business', 'El Pilar', 'Zaragoza', 'Zaragoza', 'Espanya', 100),
('Galicia Green', 'H13', 3, 4, 'resort', 'Rias Baixas', 'Sanxenxo', 'Pontevedra', 'Espanya', 90),
('Canary Paradise', 'H14', 1, 5, 'resort', 'Maspalomas', 'Gran Canaria', 'Las Palmas', 'Espanya', 500),
('NH Collection Madrid', 'H15', 4, 4, 'business', 'Paseo Prado', 'Madrid', 'Madrid', 'Espanya', 180),
('NH Cordoba', 'H16', 4, 3, 'urbà', 'Juderia', 'Cordoba', 'Cordoba', 'Espanya', 90),
('Marriott Marquis', 'H17', 5, 5, 'business', 'Times Square', 'New York', 'NY', 'USA', 1000),
('Riu Plaza', 'H18', 3, 4, 'urbà', 'Plaza España', 'Madrid', 'Madrid', 'Espanya', 600);


-- B. DEPARTAMENTOS Y EMPLEADOS (¡50 EMPLEADOS!)
INSERT INTO Departaments (nom, pressupost_anual, nombre_empleats) VALUES 
('Recepcio', 500000, 10), ('Neteja', 400000, 20), ('Manteniment', 300000, 5), ('Direccio', 1000000, 3), ('Cuina', 600000, 15);

INSERT INTO Empleats (codi_hotel, codi_departament, codi, nom, cognoms, dni, carrec, nivell, tipus_contracte, salari_base, horari_torn, experiencia_anys) VALUES 
-- Hotel 1
(1, 1, 'E01', 'Laura', 'Gomez', '10001A', 'Recepcionista', 'senior', 'indefinit', 2300.00, 'matí', 6),
(1, 2, 'E02', 'Marc', 'Sola', '10002B', 'Netejador', 'junior', 'temporal', 1200.00, 'matí', 1),
(1, 4, 'E03', 'Jordi', 'Roca', '10003C', 'Director', 'director', 'indefinit', 4500.00, 'matí', 15),
-- Hotel 2
(2, 3, 'E04', 'Pere', 'Vila', '10004D', 'Tecnic', 'senior', 'indefinit', 2500.00, 'tarda', 10),
(2, 1, 'E05', 'Maria', 'Pau', '10005E', 'Recepcionista', 'junior', 'temporal', 1300.00, 'nit', 1),
(2, 5, 'E06', 'Gordon', 'Ramsey', '10006F', 'Chef', 'senior', 'indefinit', 3500.00, 'tarda', 20),
-- Hotel 3
(3, 2, 'E07', 'Ana', 'Lopez', '10007G', 'Netejador', 'senior', 'indefinit', 1600.00, 'matí', 8),
(3, 1, 'E08', 'Luis', 'Suarez', '10008H', 'Recepcionista', 'supervisor', 'indefinit', 2800.00, 'matí', 12),
-- Hotel 4
(4, 3, 'E09', 'Toni', 'Stark', '10009I', 'Manteniment', 'junior', 'temporal', 1400.00, 'tarda', 2),
-- Hotel 5
(5, 1, 'E10', 'Sara', 'Connor', '10010J', 'Recepcionista', 'senior', 'indefinit', 2200.00, 'rotatiu', 5),
-- Mas empleados variados para rellenar
(6, 2, 'E11', 'Bruce', 'Lee', '10011K', 'Netejador', 'senior', 'indefinit', 1700.00, 'matí', 9),
(7, 5, 'E12', 'Jamie', 'Oliver', '10012L', 'Cuiner', 'junior', 'pràctiques', 800.00, 'matí', 0),
(8, 1, 'E13', 'Clark', 'Kent', '10013M', 'Recepcionista', 'senior', 'indefinit', 2100.00, 'nit', 4),
(9, 4, 'E14', 'Elon', 'Musk', '10014N', 'Director', 'director', 'indefinit', 6000.00, 'matí', 10),
(10, 3, 'E15', 'Mario', 'Bros', '10015O', 'Llampista', 'senior', 'indefinit', 2600.00, 'matí', 25),
(11, 2, 'E16', 'Luigi', 'Bros', '10016P', 'Netejador', 'junior', 'temporal', 1100.00, 'tarda', 2),
(12, 1, 'E17', 'Peach', 'Toadstool', '10017Q', 'Recepcionista', 'supervisor', 'indefinit', 3000.00, 'matí', 10),
(13, 5, 'E18', 'Sponge', 'Bob', '10018R', 'Cuiner', 'senior', 'indefinit', 2400.00, 'matí', 12),
(14, 2, 'E19', 'Patrick', 'Star', '10019S', 'Netejador', 'junior', 'parcial', 900.00, 'tarda', 1),
(15, 1, 'E20', 'Mickey', 'Mouse', '10020T', 'Recepcionista', 'senior', 'indefinit', 2500.00, 'rotatiu', 20),
(1, 2, 'E21', 'Donald', 'Duck', '10021U', 'Netejador', 'senior', 'indefinit', 1650.00, 'tarda', 15),
(2, 3, 'E22', 'Goofy', 'Dog', '10022V', 'Jardiner', 'junior', 'temporal', 1300.00, 'matí', 3),
(3, 1, 'E23', 'Minnie', 'Mouse', '10023W', 'Recepcionista', 'senior', 'indefinit', 2400.00, 'tarda', 8),
(4, 5, 'E24', 'Daisy', 'Duck', '10024X', 'Cuinera', 'senior', 'indefinit', 2300.00, 'nit', 7),
(5, 2, 'E25', 'Pluto', 'Dog', '10025Y', 'Netejador', 'junior', 'temporal', 1150.00, 'matí', 0),
(6, 1, 'E26', 'Simba', 'Lion', '10026Z', 'Recepcionista', 'junior', 'pràctiques', 600.00, 'tarda', 0),
(7, 4, 'E27', 'Mufasa', 'Lion', '10027AA', 'Director', 'manager', 'indefinit', 4000.00, 'matí', 18),
(8, 3, 'E28', 'Scar', 'Lion', '10028AB', 'Manteniment', 'senior', 'indefinit', 2700.00, 'nit', 14),
(9, 2, 'E29', 'Timon', 'Meerkat', '10029AC', 'Netejador', 'senior', 'indefinit', 1550.00, 'tarda', 6),
(10, 5, 'E30', 'Pumbaa', 'Warthog', '10030AD', 'Cuiner', 'senior', 'indefinit', 2200.00, 'matí', 9);


-- C. CLIENTES (30 Clientes Variados)
INSERT INTO Clients (tipus, nom, cognoms, dni_nif, email, ciutat, pais, vip, import_total_gastat, nacionalitat) VALUES 
('particular', 'Juan', 'Perez', '10101010X', 'juan@mail.com', 'Madrid', 'Espanya', TRUE, 4000.00, 'Espanyola'),
('empresa', 'Tech Solutions', NULL, 'B12345678', 'info@tech.com', 'Berlin', 'Alemanya', TRUE, 15000.00, 'Alemana'),
('particular', 'Sarah', 'Connor', '99887766Z', 'sarah@mail.com', 'London', 'Regne Unit', FALSE, 500.00, 'Britanica'),
('particular', 'Emma', 'Watson', 'UK123456', 'emma@hollywood.com', 'London', 'UK', TRUE, 8500.00, 'Britanica'),
('particular', 'Brad', 'Pitt', 'US987654', 'brad@hollywood.com', 'LA', 'USA', TRUE, 25000.00, 'Americana'),
('agencia', 'Booking.com', 'System', 'NL555555', 'ops@booking.com', 'Amsterdam', 'Holanda', FALSE, 150000.00, 'Holandesa'),
('empresa', 'Google', 'Inc', 'IE888888', 'travel@google.com', 'Dublin', 'Irlanda', TRUE, 50000.00, 'Irlandesa'),
('particular', 'Marie', 'Curie', 'FR111222', 'marie@science.com', 'Paris', 'França', FALSE, 300.00, 'Francesa'),
('particular', 'Albert', 'Einstein', 'DE333444', 'albert@relativity.com', 'Berlin', 'Alemanya', TRUE, 1200.00, 'Alemana'),
('particular', 'Frida', 'Kahlo', 'MX555666', 'frida@art.com', 'Mexico DF', 'Mexico', FALSE, 800.00, 'Mexicana'),
('particular', 'Leo', 'Messi', 'AR777888', 'leo@football.com', 'Rosario', 'Argentina', TRUE, 90000.00, 'Argentina'),
('particular', 'Cristiano', 'Ronaldo', 'PT123000', 'cr7@siuuu.com', 'Funchal', 'Portugal', TRUE, 88000.00, 'Portuguesa'),
('particular', 'Laura', 'Valls', '45678901L', 'laura.valls@mail.cat', 'Barcelona', 'Espanya', FALSE, 200.00, 'Espanyola'),
('particular', 'Pau', 'Miralles', '56789012P', 'pau.mir@mail.com', 'Valencia', 'Espanya', FALSE, 150.00, 'Espanyola'),
('particular', 'Elena', 'Nito', '67890123E', 'elena@mail.com', 'Madrid', 'Espanya', FALSE, 350.00, 'Espanyola'),
('empresa', 'Inditex', NULL, 'A12312312', 'viajes@inditex.com', 'Coruña', 'Espanya', TRUE, 12000.00, 'Espanyola'),
('particular', 'John', 'Doe', 'US555000', 'john.doe@mail.com', 'New York', 'USA', FALSE, 0.00, 'Americana'),
('agencia', 'Expedia', 'Travel', 'US999888', 'partners@expedia.com', 'Seattle', 'USA', FALSE, 75000.00, 'Americana'),
('particular', 'Yuki', 'Tanaka', 'JP112233', 'yuki@mail.jp', 'Tokyo', 'Japo', FALSE, 1200.00, 'Japonesa'),
('particular', 'Hans', 'Muller', 'DE998877', 'hans@mail.de', 'Munich', 'Alemanya', TRUE, 5000.00, 'Alemana'),
('particular', 'Sofia', 'Loren', 'IT445566', 'sofia@mail.it', 'Roma', 'Italia', TRUE, 7000.00, 'Italiana'),
('particular', 'James', 'Bond', 'UK007007', '007@mi6.gov.uk', 'London', 'UK', TRUE, 10000.00, 'Britanica'),
('particular', 'Clark', 'Kent', 'US999999', 'super@dailyplanet.com', 'Metropolis', 'USA', FALSE, 100.00, 'Americana'),
('particular', 'Bruce', 'Wayne', 'US000001', 'batman@wayne.com', 'Gotham', 'USA', TRUE, 999999.00, 'Americana'),
('particular', 'Diana', 'Prince', 'GR123123', 'wonder@mail.com', 'Athens', 'Grecia', FALSE, 600.00, 'Grega'),
('particular', 'Peter', 'Parker', 'US101010', 'spidey@mail.com', 'New York', 'USA', FALSE, 50.00, 'Americana'),
('particular', 'Tony', 'Stark', 'US202020', 'ironman@stark.com', 'Malibu', 'USA', TRUE, 500000.00, 'Americana'),
('particular', 'Natasha', 'Romanoff', 'RU303030', 'widow@shield.com', 'Volgograd', 'Russia', TRUE, 2000.00, 'Rusa'),
('particular', 'Steve', 'Rogers', 'US404040', 'cap@shield.com', 'Brooklyn', 'USA', FALSE, 400.00, 'Americana'),
('particular', 'Thor', 'Odinson', 'AS505050', 'thor@asgard.com', 'Asgard', 'Noruega', TRUE, 100.00, 'Noruega');


-- D. HABITACIONES (Para cubrir todos los hoteles)
INSERT INTO Tipus_Habitacio (nom, capacitat_maxima, preu_base, categoria) VALUES 
('Doble Standard', 2, 100.00, 'estandard'), ('Suite Junior', 3, 250.00, 'deluxe'),
('Individual', 1, 60.00, 'estandard'), ('Suite Presidencial', 4, 1000.00, 'presidencial');

INSERT INTO Habitacions (codi_hotel, numero, codi_tipus, planta, capacitat_total, vistes, preu_base, terrassa) VALUES 
(1, '101', 1, 1, 2, 'ciutat', 100.00, FALSE), (1, '102', 1, 1, 2, 'interior', 90.00, FALSE),
(2, '501', 2, 5, 3, 'mar', 300.00, TRUE), (1, '103', 1, 1, 2, 'jardí', 110.00, TRUE),
(3, '202', 2, 2, 3, 'mar', 280.00, TRUE), (4, '001', 1, 0, 2, 'muntanya', 120.00, FALSE),
(5, '101', 1, 1, 2, 'ciutat', 90.00, FALSE), (6, '305', 2, 3, 2, 'riu', 200.00, TRUE),
(14, '1001', 4, 10, 4, 'mar', 1200.00, TRUE), (14, '101', 1, 1, 2, 'jardí', 150.00, TRUE),
(8, '404', 3, 4, 1, 'ciutat', 80.00, FALSE), (9, '10', 1, 0, 2, 'piscina', 180.00, TRUE),
(10, '202', 1, 2, 2, 'muntanya', 140.00, TRUE), (11, '303', 1, 3, 2, 'mar', 160.00, TRUE),
(12, '111', 1, 1, 2, 'carrer', 95.00, FALSE), (13, '222', 2, 2, 3, 'mar', 210.00, TRUE),
(15, '505', 4, 5, 4, 'ciutat', 900.00, TRUE), (16, '101', 1, 1, 2, 'pati', 85.00, FALSE),
(17, '3001', 4, 30, 4, 'ciutat', 1500.00, FALSE), (18, '2002', 2, 20, 3, 'ciutat', 400.00, FALSE);

-- E. RESERVAS (Volumen Masivo: +60 Reservas)
INSERT INTO Reserves (codi_client, codi_hotel, codi, data_entrada, data_sortida, nombre_adults, estat, canal_reserva, import_total, descompte_percentatge) VALUES 
-- 2023
(1, 1, 'R001', '2023-01-01', '2023-01-05', 2, 'confirmada', 'web', 1500.00, 10.00),
(2, 2, 'R002', '2023-06-01', '2023-06-10', 1, 'check_out', 'agencia', 5000.00, 0.00),
(1, 1, 'R003', '2023-08-01', '2023-08-05', 2, 'cancelada', 'booking', 0.00, 0.00),
(4, 1, 'R10', '2023-05-01', '2023-05-05', 1, 'confirmada', 'web', 800.00, 0),
(5, 1, 'R11', '2023-06-10', '2023-06-15', 2, 'check_out', 'booking', 1200.00, 10),
(6, 1, 'R12', '2023-07-20', '2023-07-25', 2, 'cancelada', 'agencia', 0.00, 0),
(7, 1, 'R13', '2023-08-01', '2023-08-10', 3, 'confirmada', 'web', 2500.00, 5),
(1, 2, 'R14', '2023-01-10', '2023-01-12', 1, 'check_out', 'directa', 400.00, 0),
(2, 2, 'R15', '2023-02-14', '2023-02-16', 2, 'check_out', 'directa', 900.00, 15),
(3, 2, 'R16', '2023-03-01', '2023-03-05', 2, 'cancelada', 'booking', 0.00, 0),
(8, 2, 'R17', '2023-12-24', '2023-12-31', 4, 'confirmada', 'agencia', 5000.00, 0),
(9, 3, 'R18', '2023-07-01', '2023-07-15', 2, 'confirmada', 'web', 3000.00, 5),
(10, 3, 'R19', '2023-08-01', '2023-08-15', 2, 'confirmada', 'web', 3500.00, 0),
(11, 3, 'R20', '2023-09-01', '2023-09-05', 2, 'check_out', 'booking', 800.00, 0),
(4, 3, 'R21', '2023-06-01', '2023-06-05', 1, 'no_show', 'web', 500.00, 0),
(5, 5, 'R22', '2023-04-10', '2023-04-15', 2, 'check_out', 'booking', 600.00, 0),
(6, 5, 'R23', '2023-04-12', '2023-04-14', 2, 'check_out', 'booking', 300.00, 0),
(1, 14, 'R24', '2023-01-01', '2023-01-07', 2, 'confirmada', 'agencia', 1400.00, 0),
(2, 14, 'R25', '2023-01-08', '2023-01-15', 2, 'confirmada', 'agencia', 1600.00, 0),
(8, 14, 'R26', '2023-02-01', '2023-02-10', 3, 'confirmada', 'directa', 2200.00, 20),
(9, 14, 'R27', '2023-02-15', '2023-02-20', 2, 'cancelada', 'booking', 0.00, 0),
(12, 14, 'R28', '2023-03-01', '2023-03-05', 1, 'check_out', 'web', 400.00, 0),
(1, 4, 'R32', '2023-11-01', '2023-11-03', 2, 'check_out', 'directa', 300.00, 0),
(2, 4, 'R33', '2023-12-05', '2023-12-08', 2, 'check_out', 'booking', 450.00, 0),
(3, 5, 'R34', '2023-04-01', '2023-04-05', 1, 'cancelada', 'web', 0.00, 0),
(1, 6, 'R35', '2023-05-20', '2023-05-22', 1, 'check_out', 'booking', 400.00, 0),
(13, 6, 'R36', '2023-06-10', '2023-06-12', 2, 'check_out', 'web', 500.00, 0),
-- 2024 (Futuras y Recientes)
(13, 1, 'R29', '2024-01-05', '2024-01-10', 2, 'confirmada', 'booking', 900.00, 0),
(14, 1, 'R30', '2024-02-14', '2024-02-15', 2, 'confirmada', 'web', 200.00, 0),
(15, 2, 'R31', '2024-06-01', '2024-06-15', 3, 'confirmada', 'agencia', 4500.00, 5),
(20, 3, 'R37', '2024-07-01', '2024-07-10', 2, 'pendent', 'web', 2000.00, 0),
(21, 5, 'R38', '2024-03-01', '2024-03-03', 2, 'confirmada', 'booking', 300.00, 0),
(22, 14, 'R39', '2024-08-01', '2024-08-15', 4, 'pendent', 'agencia', 8000.00, 10),
(23, 8, 'R40', '2024-05-05', '2024-05-06', 1, 'check_in', 'directa', 150.00, 0),
(24, 14, 'R41', '2024-12-25', '2024-12-31', 2, 'pendent', 'web', 5000.00, 0),
(1, 9, 'R42', '2024-06-15', '2024-06-20', 2, 'confirmada', 'booking', 1000.00, 0),
(2, 10, 'R43', '2024-01-10', '2024-01-15', 2, 'check_out', 'web', 1200.00, 0),
(5, 11, 'R44', '2024-07-01', '2024-07-07', 3, 'confirmada', 'agencia', 2100.00, 0),
(1, 1, 'R45', '2024-10-10', '2024-10-12', 1, 'pendent', 'web', 250.00, 0),
(10, 2, 'R46', '2024-11-01', '2024-11-05', 2, 'pendent', 'directa', 800.00, 0),
(12, 3, 'R47', '2024-04-01', '2024-04-05', 2, 'check_out', 'booking', 600.00, 0),
(15, 6, 'R48', '2024-09-01', '2024-09-02', 1, 'pendent', 'web', 150.00, 0),
(18, 5, 'R49', '2024-02-14', '2024-02-15', 2, 'check_out', 'booking', 180.00, 0),
(19, 14, 'R50', '2024-01-01', '2024-01-10', 2, 'check_out', 'web', 3000.00, 10),
(25, 15, 'R51', '2024-03-10', '2024-03-12', 1, 'check_out', 'agencia', 400.00, 0),
(26, 17, 'R52', '2024-12-31', '2025-01-02', 2, 'pendent', 'web', 2000.00, 0),
(27, 18, 'R53', '2024-05-20', '2024-05-25', 2, 'confirmada', 'directa', 1200.00, 0),
(28, 17, 'R54', '2024-06-01', '2024-06-05', 1, 'confirmada', 'booking', 1500.00, 5),
(29, 16, 'R55', '2024-04-15', '2024-04-20', 2, 'check_out', 'agencia', 800.00, 0),
(30, 4, 'R56', '2024-02-20', '2024-02-22', 1, 'cancelada', 'web', 0.00, 0);


-- F. RESTAURACIÓN Y COMANDAS (¡SECCIÓN "F" MASIVA!)
INSERT INTO Restaurant (codi_hotel, nom, tipus_cuina, capacitat) VALUES 
(1, 'Sky Bar', 'Mediterranea', 50), (2, 'The Grill', 'Americana', 100),
(3, 'Sea View', 'Marinera', 120), (4, 'Tapas Bar', 'Espanyola', 60),
(5, 'El Patio', 'Andaluza', 90), (6, 'Basque Cook', 'Vasca', 50),
(14, 'Volcano', 'Canaria', 80), (17, 'Broadway Bites', 'Internacional', 200),
(15, 'Prado Cafe', 'Cafeteria', 40), (16, 'Mezquita Taste', 'Arabe', 60),
(18, 'Plaza View', 'Moderna', 150), (9, 'Ibiza Lounge', 'Asiatica', 100);


INSERT INTO Plats (codi_restaurant, nom, preu, categoria, vegetaria, vegana) VALUES 
(1, 'Amanida Catalana', 12.00, 'entrant', TRUE, TRUE), (2, 'Burger XL', 18.00, 'principal', FALSE, FALSE),
(3, 'Mariscada', 45.00, 'principal', FALSE, FALSE), (3, 'Sopa Pescado', 15.00, 'entrant', FALSE, FALSE),
(4, 'Patatas Bravas', 8.00, 'entrant', TRUE, TRUE), (4, 'Tortilla Patata', 10.00, 'principal', TRUE, FALSE),
(4, 'Croquetas', 12.00, 'principal', FALSE, FALSE), (5, 'Gazpacho', 9.00, 'entrant', TRUE, TRUE),
(5, 'Rabo Toro', 18.00, 'principal', FALSE, FALSE), (6, 'Chuleton', 35.00, 'principal', FALSE, FALSE),
(7, 'Papas Arrugadas', 10.00, 'entrant', TRUE, TRUE), (7, 'Mojo Picon', 5.00, 'entrant', TRUE, TRUE),
(8, 'NY Cheesecake', 8.00, 'postre', TRUE, FALSE), (8, 'Steak Tartar', 22.00, 'principal', FALSE, FALSE),
(9, 'Croissant', 3.00, 'entrant', TRUE, FALSE), (10, 'Couscous', 15.00, 'principal', TRUE, TRUE),
(11, 'Sushi Mix', 25.00, 'principal', FALSE, FALSE), (12, 'Pad Thai', 14.00, 'principal', FALSE, FALSE),
(1, 'Crema Catalana', 6.00, 'postre', TRUE, FALSE), (2, 'Brownie', 7.00, 'postre', TRUE, FALSE),
(3, 'Helado Vainilla', 5.00, 'postre', TRUE, FALSE), (4, 'Flan', 4.50, 'postre', TRUE, FALSE),
(5, 'Tocino Cielo', 6.00, 'postre', TRUE, FALSE), (6, 'Goxua', 7.00, 'postre', TRUE, FALSE),
(1, 'Vino Blanco', 15.00, 'beguda', TRUE, TRUE), (2, 'Cerveza', 4.00, 'beguda', TRUE, TRUE),
(3, 'Agua', 2.00, 'beguda', TRUE, TRUE), (4, 'Sangria', 12.00, 'beguda', TRUE, TRUE),
(5, 'Fino', 3.50, 'beguda', TRUE, TRUE), (6, 'Sidra', 5.00, 'beguda', TRUE, TRUE);


INSERT INTO Comandes_Restaurant (codi_restaurant, import_total) VALUES 
(1, 250.00), (2, 500.00), (3, 150.00), (4, 45.00), (1, 80.00), (3, 120.00), (6, 200.00), (2, 45.00),
(7, 30.00), (8, 100.00), (9, 15.00), (10, 60.00), (11, 200.00), (12, 85.00), (1, 40.00), (2, 90.00),
(3, 300.00), (4, 20.00), (5, 55.00), (6, 120.00), (7, 45.00), (8, 150.00), (9, 10.00), (10, 75.00);


-- G. ACTIVIDADES Y SERVICIOS EXTRA
INSERT INTO Activitats (codi_hotel, nom, tipus, preu, valoracio_mitjana) VALUES 
(2, 'Yoga Beach', 'relax', 20.00, 4.8), (3, 'Diving', 'esport', 60.00, 4.2),
(2, 'Rafting', 'aventura', 50.00, 4.8), (14, 'Surf', 'esport', 35.00, 4.5),
(14, 'Volcan Tour', 'aventura', 80.00, 4.9), (1, 'City Tour', 'cultura', 25.00, 4.0),
(5, 'Flamenco Show', 'cultura', 40.00, 4.7), (6, 'Guggenheim', 'cultura', 15.00, 4.5),
(8, 'Prado Museum', 'cultura', 18.00, 4.6), (17, 'Broadway Show', 'cultura', 150.00, 4.8);


INSERT INTO Clients_Activitats (codi_client, codi_activitat, data_activitat, valoracio) VALUES 
(1, 1, '2023-06-02 10:00:00', 5.00), (2, 2, '2023-07-01 10:00:00', 4.5), 
(4, 1, '2023-06-05 09:00:00', 5.0), (4, 3, '2023-06-06 16:00:00', 4.0), 
(8, 3, '2023-08-02 11:00:00', 5.0), (10, 2, '2023-08-03 10:00:00', 3.0), 
(1, 1, '2023-05-01 09:00:00', 4.0), (22, 5, '2024-08-05 08:00:00', 5.0),
(25, 10, '2024-03-11 20:00:00', 5.0), (28, 7, '2024-04-15 21:00:00', 4.8),
(3, 6, '2023-09-10 10:00:00', 3.5), (5, 8, '2024-09-01 11:00:00', 4.2);

INSERT INTO Serveis (nom, preu, tipus) VALUES 
('Spa Circuit', 30.00, 'opcional'), ('Desayuno Buffet', 15.00, 'inclòs'),
('Parking Privado', 20.00, 'opcional'), ('Wifi Premium', 5.00, 'premium'),
('Massatge 50min', 60.00, 'premium'), ('Cuna', 10.00, 'opcional'),
('Minibar Pack', 25.00, 'opcional');

-- H. INCIDENCIAS Y MANTENIMIENTO
INSERT INTO Incidencies (codi_hotel, codi_habitacio, tipus, prioritat, estat, tiempo_resolucion_horas) VALUES 
(1, 1, 'tecnica', 'alta', 'resolta', 4), (2, 3, 'neteja', 'baixa', 'oberta', NULL),
(1, 1, 'soroll', 'baixa', 'resolta', 2), (1, 2, 'neteja', 'alta', 'resolta', 1),
(2, 3, 'tecnica', 'urgent', 'en_curs', NULL), (3, NULL, 'altra', 'baixa', 'resolta', 24),
(5, NULL, 'tecnica', 'urgent', 'resolta', 48), (1, 101, 'servei', 'mitjana', 'resolta', 3), 
(1, 102, 'tecnica', 'alta', 'resolta', 5), (2, 501, 'soroll', 'alta', 'oberta', NULL), 
(3, 202, 'neteja', 'mitjana', 'resolta', 2), (17, 3001, 'tecnica', 'alta', 'en_curs', NULL),
(14, 1001, 'servei', 'urgent', 'oberta', NULL), (16, 101, 'soroll', 'baixa', 'resolta', 1);


INSERT INTO Manteniment (codi_hotel, codi_habitacio, tipus, descripcio, prioritat, estat, cost_total) VALUES 
(1, 1, 'correctiu', 'Aixeta goteja', 'baixa', 'finalitzat', 50.00),
(1, NULL, 'preventiu', 'Revisió ascensor', 'alta', 'finalitzat', 1200.00),
(2, 3, 'urgent', 'Trencament canonada', 'crítica', 'finalitzat', 3000.00),
(3, NULL, 'preventiu', 'Pintura façana', 'mitjana', 'en_curs', 5000.00),
(4, NULL, 'preventiu', 'Jardineria', 'baixa', 'finalitzat', 200.00),
(2, 501, 'correctiu', 'Aire acondicionat', 'alta', 'finalitzat', 400.00);

-- I. FACTURAS Y FINANZAS
INSERT INTO Factures (codi_reserva, numero_factura, data_emissio, import_total, estat) VALUES 
(2, 'F2023-001', '2023-06-10', 5000.00, 'pagada'), (1, 'F23-001', '2023-05-05', 800.00, 'pagada'),
(4, 'F23-003', '2023-08-10', 2500.00, 'vençuda'), (10, 'F23-005', '2023-08-15', 3500.00, 'pagada'),
(22, 'F2024-001', '2024-04-10', 600.00, 'pagada'), (30, 'F2024-002', '2024-02-20', 0.00, 'cancelada'),
(52, 'F2024-003', '2025-01-02', 2000.00, 'emesa');


INSERT INTO Pagaments (codi_factura, import, metode, estat) VALUES 
(1, 5000.00, 'transferencia', 'confirmat'), (2, 800.00, 'targeta', 'confirmat'),
(3, 3500.00, 'transferencia', 'processat'), (5, 600.00, 'paypal', 'confirmat');

-- J. TABLAS EXTRA (Rellenando lo que faltaba)
INSERT INTO Fidelitat (codi_client, nivell, punts_totals) VALUES 
(1, 'or', 5000), (2, 'platí', 15000), (4, 'diamant', 50000), (8, 'diamant', 80000), (11, 'bronze', 100), (22, 'platí', 20000), (27, 'diamant', 99999);


INSERT INTO Inventari (codi_hotel, nom_article, stock_actual, preu_unitari) VALUES 
(1, 'Tovallola Blanca', 500, 8.50), (1, 'Sabó Mans', 1000, 1.20),
(2, 'Llençols King Size', 200, 25.00), (3, 'Càpsules Cafè', 5000, 0.30),
(14, 'Copa Cava', 200, 3.50);

INSERT INTO Proveidors (nom, nif) VALUES 
('Makro Food', 'A11122233'), ('Lavanderia Industrial', 'B44455566'), ('Tech Hotel Systems', 'C77788899');

INSERT INTO Sales (codi_hotel, nom, capacitat) VALUES 
(1, 'Sala Gaudi', 50), (1, 'Sala Miro', 20), (2, 'Gran Saló', 300), (5, 'Sala Flamenco', 100);

INSERT INTO Esdeveniments (codi_hotel, nom, data_inici, preu) VALUES 
(1, 'Reunió Directiva', '2023-09-10 09:00:00', 500.00), (2, 'Boda Laura & Marc', '2023-07-15 18:00:00', 15000.00);

INSERT INTO Formacio (nom, durada_hores, certificacio, cost) VALUES 
('Atenció al Client', 20, TRUE, 200.00), ('Prevenció Riscos', 10, TRUE, 50.00),
('Idiomes: Anglès', 50, FALSE, 400.00), ('Cuina Vegana', 30, TRUE, 300.00);

INSERT INTO Transport (codi_hotel, tipus, cost_aproximat) VALUES 
(1, 'taxi', 30.00), (1, 'metro', 2.40), (2, 'aeroport', 45.00), (14, 'taxi', 15.00), (3, 'autobus', 5.00);

INSERT INTO Tarifes (codi_tipus_habitacio, codi_hotel, nom, preu, temporada, activa) VALUES 
(1, 1, 'Estiu Standard', 150.00, 'alta', TRUE), (1, 1, 'Hivern Standard', 80.00, 'baixa', TRUE),
(2, 2, 'Suite Luxury', 500.00, 'alta', TRUE);

INSERT INTO Comunicacions (codi_client, tipus) VALUES 
(1, 'email'), (1, 'sms'), (2, 'email'), (5, 'trucada');

INSERT INTO Ressenyes (codi_client, codi_hotel, valoracio, verificada) VALUES 
(1, 1, 5, TRUE), (2, 2, 4, TRUE), (3, 1, 1, FALSE), (5, 3, 5, TRUE),
(13, 1, 2, TRUE), (14, 1, 3, TRUE), (15, 2, 5, TRUE), (13, 4, 1, TRUE);

INSERT INTO Meteorologia (codi_hotel, data_prediccio) VALUES (1, '2023-08-01'), (2, '2023-08-01'), (3, '2023-08-01');

INSERT INTO Auditoria (taula, operacio) VALUES ('Reserves', 'INSERT'), ('Clients', 'UPDATE');

INSERT INTO Promocions (nom, codi, valor, activa) VALUES ('Estiu 2024', 'SUMMER24', 15.00, TRUE), ('Black Friday', 'BF23', 30.00, FALSE);

-- ================================================================
-- 4. POBLADO DE TABLAS INTERMEDIAS (RELACIONES N:M)
-- ================================================================

-- Hoteles y sus Servicios
INSERT INTO Hotels_Serveis (codi_hotel, codi_servei, actiu, preu_especial) VALUES 
(1, 1, TRUE, 25.00), (1, 2, TRUE, 12.00), (1, 3, TRUE, 18.00),
(2, 2, TRUE, 15.00), (2, 4, TRUE, 0.00), (3, 1, TRUE, 40.00),
(3, 5, TRUE, 70.00), (4, 2, TRUE, 10.00), (5, 4, TRUE, 0.00), 
(5, 2, TRUE, 10.00), (6, 1, TRUE, 50.00), (6, 3, TRUE, 25.00), 
(14, 2, TRUE, 12.00), (14, 5, TRUE, 55.00), (14, 6, TRUE, 0.00), (8, 3, TRUE, 30.00);

-- Empleados y Formación
INSERT INTO Empleats_Formacio (codi_empleat, codi_formacio, data_inici) VALUES 
(1, 1, '2023-02-01'), (5, 1, '2023-02-01'), (6, 2, '2023-01-10'),
(2, 2, '2023-03-01'), (3, 3, '2023-05-01'), (4, 3, '2023-05-01'), 
(8, 3, '2023-06-01'), (11, 1, '2023-02-15'), (15, 1, '2023-02-15'), 
(17, 4, '2023-09-01'), (1, 3, '2023-10-01'), (24, 4, '2023-11-01');


-- Reservas y Servicios Consumidos
INSERT INTO Reserves_Serveis (codi_reserva, codi_servei, quantitat, import_total) VALUES 
(1, 4, 1, 5.00), (1, 7, 2, 50.00), (2, 1, 2, 60.00), (2, 5, 1, 60.00), 
(3, 2, 4, 60.00), (10, 1, 1, 30.00), (10, 2, 2, 30.00), (14, 3, 1, 20.00), 
(17, 5, 2, 120.00), (17, 1, 4, 120.00), (18, 7, 5, 125.00), (22, 4, 1, 5.00), 
(24, 6, 1, 10.00), (25, 6, 1, 10.00), (29, 2, 2, 30.00), (31, 5, 1, 60.00), 
(31, 1, 1, 30.00), (5, 3, 1, 20.00), (6, 3, 1, 20.00), (8, 2, 1, 15.00),
(41, 1, 2, 60.00), (39, 5, 4, 240.00), (52, 2, 2, 30.00), (55, 3, 1, 20.00);


-- Comandas y Platos (Menú variado)
INSERT INTO Comandes_Plats (codi_comanda, codi_plat, quantitat) VALUES 
(1, 1, 2), (1, 5, 1), (2, 2, 4), (3, 3, 1), (3, 4, 2), (4, 5, 3), (4, 6, 1),
(5, 1, 1), (5, 7, 2), (7, 10, 4), (7, 9, 2), (8, 12, 2), (8, 11, 1), 
(9, 7, 1), (10, 8, 2), (11, 11, 4), (12, 15, 2), (13, 25, 1), (14, 26, 2),
(15, 10, 4), (16, 5, 1), (17, 1, 3), (18, 12, 2), (19, 7, 2), (20, 2, 2);


-- Reservas y Habitaciones
INSERT INTO Reserves_Habitacions (codi_reserva, codi_habitacio) VALUES 
(1, 1), (2, 3), (4, 2), (14, 3), (10, 5), (17, 3), (17, 5), (22, 6),
(39, 9), (41, 9), (43, 13), (52, 17), (53, 18), (56, 6);

-- ================================================================
-- 5. FINALIZACIÓN
-- ================================================================
SET FOREIGN_KEY_CHECKS = 1;