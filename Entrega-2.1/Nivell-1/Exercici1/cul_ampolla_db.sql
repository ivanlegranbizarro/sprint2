-- Active: 1666782552703@@127.0.0.1@3306@album

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
        email VARCHAR(40) NULL,
        telefon VARCHAR(20) NOT NULL,
        client_recomana INT NULL,
        PRIMARY KEY (id), 
        CONSTRAINT fk_client_recomana FOREIGN KEY (client_recomana) REFERENCES Client(id)
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
        Email VARCHAR(40) NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    Ullera (
        id INT NOT NULL AUTO_INCREMENT,
        marca VARCHAR(20) NOT NULL,
        graduacio_dreta FLOAT NOT NULL,
        graduacio_esquerra FLOAT NULL,
        Muntura VARCHAR(20) NOT NULL,
        Color VARCHAR(20) NOT NULL,
        Preu FLOAT NOT NULL,
        created_at TIMESTAMP NULL,
        updated_at TIMESTAMP NULL,
        id_proveidor INT NOT NULL,
        id_client INT NOT NULL,
        id_empleat INT NOT NULL,
        quantitat INTEGER NOT NULL,
        pagat FLOAT NOT NULL,
        PRIMARY KEY (id),
        CONSTRAINT fk_ullera_proveidor FOREIGN KEY (id_proveidor) REFERENCES Proveidor (id),
        CONSTRAINT fk_ullera_client FOREIGN KEY (id_client) REFERENCES Client (id),
        CONSTRAINT fk_ullera_empleat FOREIGN KEY (id_empleat) REFERENCES Empleat (id)
    );

/* Òptica:
 Llista el total de factures d'un client/a en un període determinat.
 Llista els diferents models d'ulleres que ha venut un empleat/da durant un any.
 Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica. */

INSERT INTO Empleat (nom) VALUES ('Joan');

INSERT INTO Empleat (nom) VALUES ('Maria');

INSERT INTO
    Client (
        nom,
        cognom,
        codi_postal,
        email,
        telefon
    )
VALUES (
        'Pere',
        'Perez',
        '08001',
        'perez@perez.com',
        '666666666'
    );

INSERT INTO
    Proveidor (
        Carrer,
        Numero,
        codi_postal,
        Poblacio,
        Telefon,
        Fax,
        Email
    )
VALUES (
        'Carrer de la prova',
        1,
        '08001',
        'Barcelona',
        '666666666',
        '666666666',
        'proveidor1@proveidors.com'
    );

INSERT INTO
    Ullera(
        marca,
        graduacio_dreta,
        graduacio_esquerra,
        Muntura,
        Color,
        Preu,
        created_at,
        updated_at,
        id_proveidor,
        id_client,
        id_empleat,
        quantitat,
        pagat
    )
VALUES (
        'Marca1',
        1.5,
        1.5,
        'Muntura1',
        'Color1',
        100,
        '2019-01-01 00:00:00',
        '2019-01-01 00:00:00',
        1,
        1,
        1,
        1,
        100
    );


-- Llista el total de factures d'un client/a en un període determinat.

SELECT
    SUM(Preu) AS Total_factura
FROM Ullera
WHERE
    id_client = 1
    AND created_at BETWEEN '2019-01-01' AND '2019-12-31';

-- Llista els diferents models d'ulleres que ha venut un empleat/da durant un any.

SELECT
    marca
FROM Ullera
WHERE
    id_empleat = 1
    AND created_at BETWEEN '2019-01-01' AND '2019-12-31';

-- Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica.

SELECT p.*
FROM Ullera u
    INNER JOIN Proveidor p ON u.id_proveidor = p.id
WHERE
    u.created_at BETWEEN '2019-01-01' AND '2019-12-31';