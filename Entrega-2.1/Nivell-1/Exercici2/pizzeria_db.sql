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
        id_comanda INT NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    Categoria (
        id INT NOT NULL AUTO_INCREMENT,
        Nom VARCHAR(20) NOT NULL,
        id_producte INT NOT NULL,
        PRIMARY KEY (id)
    ) COMMENT 'si el producte és pizza';

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
        id_categoria INT NOT NULL,
        PRIMARY KEY (id),
        CONSTRAINT fk_producte_categoria FOREIGN KEY (id_categoria) REFERENCES Categoria (id)
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
        PRIMARY KEY (id),
        CONSTRAINT fk_comanda_client FOREIGN KEY (id_client) REFERENCES Client (id),
        CONSTRAINT fk_comanda_botiga FOREIGN KEY (id_botiga) REFERENCES Botiga (id),
        CONSTRAINT fk_comanda_producte FOREIGN KEY (id_producte) REFERENCES Producte (id)
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

CREATE TABLE
    Ticket (
        id INT NOT NULL AUTO_INCREMENT,
        created_at timestamp NULL,
        updated_at timestamp NULL,
        tipus_pagament ENUM('credit', 'metal', 'app') NOT NULL,
        Adreça VARCHAR(20) NOT NULL COMMENT 'Si comanda domicili',
        Total FLOAT NOT NULL,
        canvi_diners BOOLEAN NULL DEFAULT False,
        id_empleat INT NOT NULL,
        id_comanda INT NOT NULL,
        PRIMARY KEY (id),
        CONSTRAINT fk_ticket_empleat FOREIGN KEY (id_empleat) REFERENCES Empleat (id),
        CONSTRAINT fk_ticket_comanda FOREIGN KEY (id_comanda) REFERENCES Comanda (id)
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

INSERT INTO Categoria (Nom, id_producte) VALUES ('Begudes', 1);

INSERT INTO Categoria (Nom, id_producte) VALUES ('Pizzes', 2);

INSERT INTO
    Categoria (Nom, id_producte)
VALUES ('Hamburgueses', 3);

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
    Comanda (
        tipus,
        Quantitat,
        created_at,
        updated_at,
        id_client,
        id_botiga,
        id_producte
    )
VALUES (
        'botiga',
        1,
        '2020-01-01 00:00:00',
        '2020-01-01 00:00:00',
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

INSERT INTO
    Ticket (
        created_at,
        updated_at,
        tipus_pagament,
        Adreça,
        Total,
        canvi_diners,
        id_empleat,
        id_comanda
    )
VALUES (
        '2020-01-01 00:00:00',
        '2020-01-01 00:00:00',
        'credit',
        'Carrer de la Pau',
        1.5,
        0,
        1,
        1
    );

/*  Pizzeria:
 Llista quants productes de categoria 'Begudes' s'han venut en una determinada localitat.*/

SELECT COUNT(*) AS 'Quantitat'
FROM Producte
    INNER JOIN Categoria ON Producte.id_categoria = Categoria.id
    INNER JOIN Comanda ON Producte.id = Comanda.id_producte
    INNER JOIN Botiga ON Comanda.id_botiga = Botiga.id
WHERE
    Categoria.Nom = 'Begudes'
    AND Botiga.Localitat = 'Barcelona';

/* Llista quantes comandes ha efectuat un determinat empleat/da. */

SELECT COUNT(*) AS 'Quantitat'
FROM Comanda
    INNER JOIN Empleat ON Comanda.id_botiga = Empleat.id_botiga
WHERE Empleat.Nom = 'Sócrates';