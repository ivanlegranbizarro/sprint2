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
        id_comanda INT NOT NULL,
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
        id_categoria INT NULL,
        PRIMARY KEY (id),
        FOREIGN KEY (id_categoria) REFERENCES Categoria(id)
    );

-- table Categoria is only used to categorize pizzas

CREATE TABLE
    Categoria(
        id INT NOT NULL AUTO_INCREMENT,
        Nom VARCHAR(25) NOT NULL,
        PRIMARY KEY (id),
        CHECK (Producte.Tipus = 'pizza')
    );

CREATE TABLE
    Comanda (
        id INT NOT NULL AUTO_INCREMENT,
        tipus ENUM('botiga', 'domicili') NOT NULL,
        Quantitat INTEGER NOT NULL,
        created_at timestamp NULL,
        updated_at timestamp NULL COMMENT 'entrega',
        id_client INT NOT NULL,
        id_botiga INT NOT NULL,
        id_producte INT NOT NULL,
        id_empleat INT NOT NULL,
        canvi_diners BOOLEAN NOT NULL,
        tipus_pagament ENUM('targeta', 'efectiu', 'app') NOT NULL,
        total FLOAT NOT NULL,
        pagat BOOLEAN NOT NULL,
        PRIMARY KEY (id),
        CONSTRAINT fk_comanda_client FOREIGN KEY (id_client) REFERENCES Client (id)
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
        id_botiga INT NOT NULL,
        id_ticket INT NOT NULL,
        PRIMARY KEY (id),
        CONSTRAINT fk_empleat_botiga FOREIGN KEY (id_botiga) REFERENCES Botiga (id)
    );

INSERT INTO
    Botiga (
        Nom,
        Adreça,
        Localitat,
        Provincia,
        Codi_postal,
        Telefon,
        id_comanda,
        id_empleat
    )
VALUES (
        'Pizzeria',
        'Carrer de la Pau',
        'Barcelona',
        'Barcelona',
        '08001',
        '934567890',
        1,
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
        Telefon,
        id_comanda
    )
VALUES (
        'Pep',
        'Garcia',
        'Carrer de la Pau',
        '08001',
        'Barcelona',
        'Barcelona',
        '934567890',
        1
    );

/ /
INSERT INTO
    Producte (
        Nom,
        Descripcio,
        Imatge,
        Preu,
        Tipus,
        id_categoria
    )
VALUES (
        'Coca-Cola',
        'Beguda refrescant',
        'https://www.coca-cola.es/content/dam/journey/es/es/private/2019/03/26/5c9a1b0e-1c1c-4b1c-8c1c-6c9a1b0e1c1c/5c9a1b0e-1c1c-4b1c-8c1c-6c9a1b0e1c1c.jpg',
        1.5,
        'beguda',
        1
    ), (
        'Pizza Margarita',
        'Pizza amb tomàquet i formatge',
        'https://www.cocinayvino.com/wp-content/uploads/2018/05/pizza-margarita.jpg',
        5,
        'pizza',
        2
    ), (
        'Hamburguesa',
        'Hamburguesa amb formatge',
        'https://www.cocinayvino.com/wp-content/uploads/2018/05/pizza-margarita.jpg',
        5,
        'hamburguesa',
        3
    );

INSERT INTO
    Comanda(
        tipus,
        Quantitat,
        created_at,
        updated_at,
        id_client,
        id_botiga,
        id_producte,
        id_empleat,
        canvi_diners,
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
        1,
        1
    );

INSERT INTO
    Empleat (
        Nom,
        Cognom,
        NIF,
        Telefon,
        tipus,
        id_botiga,
        id_ticket
    )
VALUES (
        'Sócrates',
        'Garcia',
        '12345678A',
        '934567890',
        'cuiner',
        1,
        1
    );

/*  Pizzeria:
 Llista quants productes de tipus 'Begudes' s'han venut en una determinada localitat.*/

SELECT
    COUNT(Producte.Tipus) AS 'Quantitat de begudes venudes'
FROM Comanda
    INNER JOIN Producte ON Comanda.id_producte = Producte.id
    INNER JOIN Botiga ON Comanda.id_botiga = Botiga.id
WHERE
    Producte.Tipus = 'beguda'
    AND Botiga.Localitat = 'Barcelona';

/* Llista quantes comandes ha efectuat un determinat empleat/da. */