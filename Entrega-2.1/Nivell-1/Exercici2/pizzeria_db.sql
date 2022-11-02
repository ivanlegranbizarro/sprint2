-- Active: 1666782552703@@127.0.0.1@3306@cul_ampolla_db

DROP DATABASE IF EXISTS pizzeria_db;

CREATE DATABASE pizzeria_db;

USE pizzeria_db;

CREATE TABLE
    Botiga (
        id INT NOT NULL AUTO_INCREMENT,
        Nom VARCHAR(20) NOT NULL,
        Adreça VARCHAR(20) NOT NULL,
        Localitat VARCHAR(20) NOT NULL,
        Provincia VARCHAR(20) NOT NULL,
        Codi_postal VARCHAR(20) NOT NULL,
        Telefon VARCHAR(20) NOT NULL,
        id_empleat INT NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    Client (
        id INT NOT NULL AUTO_INCREMENT,
        Nom VARCHAR(25) NOT NULL,
        Cognom VARCHAR(25) NOT NULL,
        Adreça VARCHAR(25) NOT NULL,
        Codi_postal VARCHAR(25) NOT NULL,
        Localitat VARCHAR(25) NOT NULL,
        Provincia VARCHAR(25) NOT NULL,
        Telefon VARCHAR(25) NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    Producte (
        id INT NOT NULL AUTO_INCREMENT,
        Nom VARCHAR(25) NOT NULL,
        Descripcio VARCHAR(50) NOT NULL,
        Imatge VARCHAR(255) NOT NULL,
        Preu FLOAT NOT NULL,
        Tipus ENUM(
            'pizza',
            'beguda',
            'hamburguesa'
        ) NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    Categoria (
        id INT NOT NULL AUTO_INCREMENT,
        Nom VARCHAR(25) NOT NULL,
        id_producte INT NOT NULL,
        PRIMARY KEY (id),
        FOREIGN KEY (id_producte) REFERENCES Producte(id)
    );

CREATE TABLE
    Empleat (
        id INT NOT NULL AUTO_INCREMENT,
        Nom VARCHAR(20) NOT NULL,
        Cognom VARCHAR(20) NOT NULL,
        NIF VARCHAR(20) NOT NULL,
        Telefon VARCHAR(20) NOT NULL,
        tipus ENUM(
            'cuiner',
            'repartidor',
            'en_botiga'
        ) NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    Comanda (
        id INT NOT NULL AUTO_INCREMENT,
        tipus ENUM('botiga', 'domicili') NOT NULL,
        Quantitat INTEGER NOT NULL,
        created_at timestamp NULL,
        updated_at timestamp NULL COMMENT 'entrega',
        id_client INT NOT NULL,
        id_producte INT NOT NULL,
        id_empleat INT NOT NULL,
        id_botiga INT NOT NULL,
        canvi_diners BOOLEAN NOT NULL,
        tipus_pagament ENUM('targeta', 'efectiu', 'app') NOT NULL,
        total FLOAT NOT NULL DEFAULT 0,
        pagat BOOLEAN NOT NULL,
        PRIMARY KEY (id),
        CONSTRAINT fk_comanda_client FOREIGN KEY (id_client) REFERENCES Client (id),
        FOREIGN KEY (id_producte) REFERENCES Producte(id),
        CONSTRAINT fk_comanda_empleat FOREIGN KEY (id_empleat) REFERENCES Empleat (id),
        CONSTRAINT fk_comanda_botiga FOREIGN KEY (id_botiga) REFERENCES Botiga (id)
    );

INSERT INTO
    Botiga (
        Nom,
        Adreça,
        Localitat,
        Provincia,
        Codi_postal,
        Telefon,
        id_empleat
    )
VALUES (
        'Pizzeria',
        'Carrer de la Pau',
        'Barcelona',
        'Barcelona',
        '08001',
        '934567890',
        1
    );

INSERT INTO
    Client (
        Nom,
        Cognom,
        Adreça,
        Codi_postal,
        Localitat,
        Provincia,
        Telefon
    )
VALUES (
        'Pep',
        'Garcia',
        'Carrer de la Pau',
        '08001',
        'Barcelona',
        'Barcelona',
        '934567890'
    );

INSERT INTO
    Producte (
        Nom,
        Descripcio,
        Imatge,
        Preu,
        Tipus
    )
VALUES (
        'Pizza',
        'Pizza de la casa',
        'https://www.pizzahut.es/sites/default/files/styles/medium/public/2019-03/PH_Web_Pizza_Margarita_1.png?itok=Z8ZQZ2Zz',
        10.00,
        'pizza'
    ), (
        'Coca-Cola',
        'Coca-Cola',
        'https://www.coca-cola.es/content/dam/journey/es/es/private/2019/01/24/1548331600000-coca-cola-0-33l.png',
        1.50,
        'beguda'
    ), (
        'Hamburguesa',
        'Hamburguesa de la casa',
        'https://www.hamburguesas.com/wp-content/uploads/2019/03/hamburguesa-queso-1.jpg',
        5.00,
        'hamburguesa'
    ), (
        'Coca-Cola',
        'Coca-Cola',
        'https://www.coca-cola.es/content/dam/journey/es/es/private/2019/01/24/1548331600000-coca-cola-0-33l.png',
        1.50,
        'beguda'
    );

INSERT INTO
    `Empleat` (
        `id`,
        `Nom`,
        `Cognom`,
        `NIF`,
        `Telefon`,
        `tipus`
    )
VALUES (
        1,
        'Pep',
        'Garcia',
        '12345678A',
        '934567890',
        'cuiner'
    ), (
        2,
        'Pepa',
        'Garcia',
        '12345678A',
        '934567890',
        'repartidor'
    ), (
        3,
        'Josep',
        'Altramús',
        '12345678A',
        '934567890',
        'en_botiga'
    );

INSERT INTO
    Comanda(
        tipus,
        Quantitat,
        created_at,
        updated_at,
        id_client,
        id_producte,
        id_empleat,
        id_botiga,
        canvi_diners,
        tipus_pagament,
        total,
        pagat
    )
VALUES (
        'botiga',
        1,
        '2020-01-01 00:00:00',
        '2020-01-01 00:00:00',
        1,
        1,
        1,
        1,
        0,
        'targeta',
        10.00,
        1
    ), (
        'botiga',
        1,
        '2020-01-01 00:00:00',
        '2020-01-01 00:00:00',
        1,
        2,
        1,
        1,
        0,
        'targeta',
        1.50,
        1
    ), (
        'botiga',
        1,
        '2020-01-01 00:00:00',
        '2020-01-01 00:00:00',
        1,
        3,
        1,
        1,
        0,
        'targeta',
        5.00,
        1
    ), (
        'botiga',
        1,
        '2020-01-01 00:00:00',
        '2020-01-01 00:00:00',
        1,
        4,
        1,
        1,
        0,
        'targeta',
        1.50,
        1
    );

/*  Pizzeria:
 Llista quants productes de tipus 'Begudes' s'han venut en una determinada localitat.*/

SELECT COUNT(*) AS 'Quantitat'
FROM Comanda
    INNER JOIN Producte ON Comanda.id_producte = Producte.id
    INNER JOIN Botiga ON Comanda.id_botiga = Botiga.id
WHERE
    Producte.Tipus = 'beguda'
    AND Botiga.Localitat = 'Barcelona';

/* Llista quantes comandes ha efectuat un determinat empleat/da. */

SELECT COUNT(*) AS 'Quantitat'
FROM Comanda
WHERE id_empleat = 1;