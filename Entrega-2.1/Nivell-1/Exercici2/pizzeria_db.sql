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
    Comanda (
        id INT NOT NULL AUTO_INCREMENT,
        tipus ENUM('botiga', 'domicili') NOT NULL,
        Quantitat INTEGER NOT NULL,
        created_at timestamp NULL,
        updated_at timestamp NULL COMMENT 'entrega',
        id_client INT NOT NULL,
        id_botiga INT NOT NULL,
        PRIMARY KEY (id),
        CONSTRAINT fk_comanda_client FOREIGN KEY (id_client) REFERENCES Client (id),
        CONSTRAINT fk_comanda_botiga FOREIGN KEY (id_botiga) REFERENCES Botiga (id)
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
    Producte (
        id INT NOT NULL AUTO_INCREMENT,
        Nom VARCHAR(25) NOT NULL,
        Descripcio VARCHAR(50) NOT NULL,
        Imatge VARCHAR(100) NOT NULL,
        Preu FLOAT NOT NULL,
        Tipus ENUM(
            'pizza',
            'beguda',
            'hamburguesa'
        ) NOT NULL,
        id_categoria INT NOT NULL,
        id_comanda INT NOT NULL,
        PRIMARY KEY (id),
        CONSTRAINT fk_producte_comanda FOREIGN KEY (id_comanda) REFERENCES Comanda (id)
    );

CREATE TABLE
    Categoria (
        id INT NOT NULL AUTO_INCREMENT,
        Nom VARCHAR(20) NOT NULL,
        id_producte INT NOT NULL,
        PRIMARY KEY (id),
        CONSTRAINT fk_categoria_producte FOREIGN KEY (id_producte) REFERENCES Producte (id)
    ) COMMENT 'si el producte és pizza';

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

/*  Pizzeria:
 Llista quants productes de categoria 'Begudes' s'han venut en una determinada localitat.
 Llista quantes comandes ha efectuat un determinat empleat/da. */

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
        'Pizzeria Sabrosona',
        'Carrer de la Pau',
        'Barcelona',
        'Barcelona',
        '08001',
        '934567890',
        1,
        1
    ), (
        'Pizzeria Sabrosilla',
        'Carrer de la Guerra',
        'Barcelona',
        'Barcelona',
        '08002',
        '934567890',
        2,
        2
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
        'Pepet',
        'Carrer de la Pau',
        '08001',
        'Barcelona',
        'Barcelona',
        '934567890',
        1
    ), (
        'Pepa',
        'Pepota',
        'Carrer de la Guerra',
        '08002',
        'Barcelona',
        'Barcelona',
        '934567890',
        2
    );

INSERT INTO
    Comanda (
        tipus,
        Quantitat,
        created_at,
        updated_at,
        id_client,
        id_botiga
    )
VALUES (
        'botiga',
        2,
        '2020-01-01 00:00:00',
        '2020-01-01 00:00:00',
        1,
        1
    ), (
        'domicili',
        1,
        '2020-01-01 00:00:00',
        '2020-01-01 00:00:00',
        2,
        2
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
        'Miquel',
        'Herández',
        '12345678A',
        '934567890',
        'cuiner',
        1,
        1
    ), (
        'Antonia',
        'Machada',
        '12345678B',
        '934567890',
        'repartidor',
        2,
        2
    );

INSERT INTO
    Producte (
        Nom,
        Descripcio,
        Imatge,
        Preu,
        Tipus,
        id_categoria,
        id_comanda
    )
VALUES (
        'Pizza Margarita',
        'Pizza amb tomàquet i mozzarella',
        'https://www.pizzahut.es/images/pizzas/margarita.png',
        8.5,
        'pizza',
        1,
        1
    ), (
        'Pizza Carbonara',
        'Pizza amb tomàquet, mozzarella, bacon i ou',
        'https://www.pizzahut.es/images/pizzas/carbonara.png',
        9.5,
        'pizza',
        1,
        1
    ), (
        'Coca-Cola',
        'Refresc amb gas',
        'https://www.coca-cola.es/content/dam/journey/es/es/private/brands/coca-cola/coca-cola.png',
        1.5,
        'beguda',
        2,
        2
    );

INSERT INTO
    Categoria (Nom, id_producte)
VALUES ('Pizza', 1), ('Pizza', 2), ('Begudes', 3);

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
        18,
        0,
        1,
        1
    ), (
        '2020-01-01 00:00:00',
        '2020-01-01 00:00:00',
        'app',
        'Carrer de la Guerra',
        1.5,
        0,
        2,
        2
    )