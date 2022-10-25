DROP DATABASE IF EXISTS cul_ampolla_db;

CREATE DATABASE cul_ampolla_db;

USE cul_ampolla_db;

CREATE TABLE
    Empleat (
        id INT NOT NULL AUTO_INCREMENT,
        nom VARCHAR(20) NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    Client (
        id INT NOT NULL AUTO_INCREMENT,
        nom VARCHAR(20) NOT NULL,
        cognom VARCHAR(20) NOT NULL,
        codi_postal VARCHAR(20) NOT NULL,
        email VARCHAR(20) NULL,
        telefon VARCHAR(20) NOT NULL,
        id_empleat INT NOT NULL,
        id_client INT NULL COMMENT 'Recomanat',
        PRIMARY KEY (id),
        CONSTRAINT fk_client_empleat FOREIGN KEY (id_empleat) REFERENCES Empleat (id)
    );

CREATE TABLE
    Ullera (
        id INT NOT NULL AUTO_INCREMENT,
        MARCA VARCHAR(20) NOT NULL,
        graduacio_1 FLOAT NOT NULL,
        graduacio_2 FLOAT NULL,
        Muntura VARCHAR(20) NOT NULL,
        Color VARCHAR(20) NOT NULL,
        Preu FLOAT NOT NULL,
        created_at TIMESTAMP NULL,
        updated_at TIMESTAMP NULL,
        id_proveidor INT NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    Proveidor (
        id INT NOT NULL AUTO_INCREMENT,
        Carrer VARCHAR(20) NOT NULL,
        Numero INTEGER NULL,
        codi_postal VARCHAR(20) NOT NULL,
        Poblacio VARCHAR(20) NOT NULL,
        Telefon VARCHAR(20) NOT NULL,
        Fax VARCHAR(20) NULL,
        Email VARCHAR(20) NOT NULL,
        id_ullera INT NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    Factura (
        id INT NOT NULL AUTO_INCREMENT,
        created_at timestamp default current_timestamp,
        id_empleat INT NOT NULL,
        id_client INT NOT NULL,
        quantitat INTEGER NOT NULL,
        id_ullera INT NOT NULL,
        preu FLOAT NOT NULL,
        pagat BOOLEAN NOT NULL,
        PRIMARY KEY (id),
        CONSTRAINT fk_factura_empleat FOREIGN KEY (id_empleat) REFERENCES Empleat (id),
        CONSTRAINT fk_factura_client FOREIGN KEY (id_client) REFERENCES Client (id),
        CONSTRAINT fk_factura_ullera FOREIGN KEY (id_ullera) REFERENCES Ullera (id)
    );

ALTER TABLE Proveidor
ADD
    CONSTRAINT FK_Ullera_TO_Proveidor FOREIGN KEY (id_ullera) REFERENCES Ullera (id);

ALTER TABLE Ullera
ADD
    CONSTRAINT FK_Proveidor_TO_Ullera FOREIGN KEY (id_proveidor) REFERENCES Proveidor (id);

/* Òptica:
 Llista el total de factures d'un client/a en un període determinat.
 Llista els diferents models d'ulleres que ha venut un empleat/da durant un any.
 Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica. */

-- Insertar datos

INSERT INTO Empleat (nom) VALUES ('Pepito');

INSERT INTO Empleat (nom) VALUES ('Juanito');

INSERT INTO
    Client (
        nom,
        cognom,
        codi_postal,
        email,
        telefon,
        id_empleat
    )
VALUES (
        'Parménides',
        'Perez',
        '08001',
        'parmenides@gmail.com',
        '666666666',
        1
    );

INSERT INTO
    Client (
        nom,
        cognom,
        codi_postal,
        email,
        telefon,
        id_empleat
    )
VALUES (
        'Sócrates',
        'Perez',
        '08001',
        'socrates@perez',
        '666666666',
        2
    );

INSERT INTO
    Ullera (
        MARCA,
        graduacio_1,
        graduacio_2,
        Muntura,
        Color,
        Preu,
        created_at,
        updated_at,
        id_proveidor
    )
VALUES (
        'Ray-Ban',
        1.5,
        1.7,
        'Pasta',
        'Negre',
        100,
        '2020-01-01 00:00:00',
        '2020-01-01 00:00:00',
        1
    );

INSERT INTO
    Proveidor (
        Carrer,
        Numero,
        codi_postal,
        Poblacio,
        Telefon,
        Fax,
        Email,
        id_ullera
    )
VALUES (
        'Carrer de la Pau',
        1,
        '08001',
        'Barcelona',
        '666666666',
        '666666666',
        'proveidor@proveidor.com',
        1
    );

INSERT INTO
    Factura (
        id_empleat,
        created_at,
        id_client,
        quantitat,
        id_ullera,
        preu,
        pagat
    )
VALUES (    
        1,
        '2020-01-01 00:00:00',
        1,
        1,
        1,
        100,
        1
    );

INSERT INTO
    Factura (
        id_empleat,
        created_at,
        id_client,
        quantitat,
        id_ullera,
        preu,
        pagat
    )
VALUES (    
        2,
        '2021-01-01 00:00:00',
        2,
        1,
        1,
        100,
        1
    );

-- Llista el total de factures d'un client/a en un període determinat.

SELECT
    SUM(preu) AS total_factures
FROM Factura
WHERE
    id_client = 1
    AND created_at BETWEEN '2020-01-01 00:00:00' AND '2020-12-31 23:59:59';