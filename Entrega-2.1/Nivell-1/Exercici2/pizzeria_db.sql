-- Active: 1666249938234@@127.0.0.1@3306@cul_ampolla_db

DROP DATABASE IF EXISTS pizzeria_db;

CREATE DATABASE pizzeria_db;

use pizzeria_db;

CREATE TABLE
    Botiga (
        id INT NOT NULL AUTO_INCREMENT,
        Nom VARCHAR(20) NOT NULL,
        Adreça VARCHAR(20) NOT NULL,
        Localitat VARCHAR(20) NOT NULL,
        Provincia VARCHAR(20) NOT NULL,
        Codi_postal VARCHAR(20) NOT NULL,
        Telefon VARCHAR(20) NOT NULL,
        created_at timestamp NULL,
        updated_at timestamp NULL,
        id_comanda INT NOT NULL,
        id_empleat INT NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    Categoria (
        id INT NOT NULL AUTO_INCREMENT,
        Nom VARCHAR(20) NOT NULL,
        created_at timestamp NULL,
        updated_at timestamp NULL,
        id_producte INT NOT NULL,
        PRIMARY KEY (id)
    ) COMMENT 'si el producte és pizza';

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
        created_at timestamp NULL,
        updated_at timestamp NULL,
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
        PRIMARY KEY (id)
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
        created_at timestamp NULL,
        updated_at timestamp NULL,
        id_botiga INT NOT NULL,
        id_ticket INT NOT NULL,
        PRIMARY KEY (id)
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
        updated_at timestamp NULL,
        created_at timestamp NULL,
        id_categoria INT NOT NULL,
        id_comanda INT NOT NULL,
        PRIMARY KEY (id)
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
        PRIMARY KEY (id)
    );

ALTER TABLE Comanda
ADD
    CONSTRAINT FK_Client_TO_Comanda FOREIGN KEY (id_client) REFERENCES Client (id);

ALTER TABLE Categoria
ADD
    CONSTRAINT FK_Producte_TO_Categoria FOREIGN KEY (id_producte) REFERENCES Producte (id);

ALTER TABLE Producte
ADD
    CONSTRAINT FK_Categoria_TO_Producte FOREIGN KEY (id_categoria) REFERENCES Categoria (id);

ALTER TABLE Client
ADD
    CONSTRAINT FK_Comanda_TO_Client FOREIGN KEY (id_comanda) REFERENCES Comanda (id);

ALTER TABLE Producte
ADD
    CONSTRAINT FK_Comanda_TO_Producte FOREIGN KEY (id_comanda) REFERENCES Comanda (id);

ALTER TABLE Botiga
ADD
    CONSTRAINT FK_Comanda_TO_Botiga FOREIGN KEY (id_comanda) REFERENCES Comanda (id);

ALTER TABLE Comanda
ADD
    CONSTRAINT FK_Botiga_TO_Comanda FOREIGN KEY (id_botiga) REFERENCES Botiga (id);

ALTER TABLE Empleat
ADD
    CONSTRAINT FK_Botiga_TO_Empleat FOREIGN KEY (id_botiga) REFERENCES Botiga (id);

ALTER TABLE Botiga
ADD
    CONSTRAINT FK_Empleat_TO_Botiga FOREIGN KEY (id_empleat) REFERENCES Empleat (id);

ALTER TABLE Ticket
ADD
    CONSTRAINT FK_Empleat_TO_Ticket FOREIGN KEY (id_empleat) REFERENCES Empleat (id);

ALTER TABLE Empleat
ADD
    CONSTRAINT FK_Ticket_TO_Empleat FOREIGN KEY (id_ticket) REFERENCES Ticket (id);

ALTER TABLE Ticket
ADD
    CONSTRAINT FK_Comanda_TO_Ticket FOREIGN KEY (id_comanda) REFERENCES Comanda (id);