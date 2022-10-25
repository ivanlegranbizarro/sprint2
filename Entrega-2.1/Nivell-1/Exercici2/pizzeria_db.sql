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
        Descripcio VARCHAR(25) NOT NULL,
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