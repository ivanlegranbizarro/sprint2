-- Active: 1666249938234@@127.0.0.1@3306@cul_ampolla_db

DROP DATABASE IF EXISTS cul_ampolla_db;

CREATE DATABASE cul_ampolla_db;

USE cul_ampolla_db;

CREATE TABLE
    Client (
        id INT NOT NULL AUTO_INCREMENT,
        nom VARCHAR(20) NOT NULL,
        cognom VARCHAR(20) NOT NULL,
        codi_postal VARCHAR(20) NOT NULL,
        email VARCHAR(20) NULL,
        UNIQUE,
        telefon VARCHAR(20) NOT NULL,
        id_empleat INT NOT NULL,
        id_client INT NULL COMMENT 'Recomanat',
        PRIMARY KEY (id) UNIQUE KEY (email) CONSTRAINT fk_client_empleat FOREIGN KEY (id_empleat) REFERENCES Empleat (id) ON DELETE CASCADE ON UPDATE CASCADE
    );

CREATE TABLE
    Empleat (
        id INT NOT NULL AUTO_INCREMENT,
        nom VARCHAR(20) NOT NULL,
        PRIMARY KEY (id) CONSTRAINT fk_empleat_client FOREIGN KEY (id_client) REFERENCES Client (id) ON DELETE CASCADE ON UPDATE CASCADE
    );

CREATE TABLE
    Proveidor (
        id INT NOT NULL AUTO_INCREMENT,
        Carrer VARCHAR(20) NOT NULL,
        Numero INTEGER NULL,
        codi_postal INTEGER NOT NULL,
        Poblacio VARCHAR(20) NOT NULL,
        Telefon VARCHAR(20) NOT NULL,
        Fax VARCHAR(20) NULL,
        Email VARCHAR(20) NOT NULL,
        id_ullera INT NOT NULL,
        PRIMARY KEY (id) CONSTRAINT fk_proveidor_ullera FOREIGN KEY (id_ullera) REFERENCES Ullera (id) ON DELETE CASCADE ON UPDATE CASCADE
    );

CREATE TABLE
    Factura (
        id INT NOT NULL AUTO_INCREMENT,
        created_at timestamp default current_timestamp,
        updated_at datetime default current_timestamp,
        id_empleat INT NOT NULL,
        id_client INT NOT NULL,
        quantitat INTEGER NOT NULL,
        id_ullera INT NOT NULL,
        preu FLOAT NOT NULL,
        pagat BOOLEAN NOT NULL,
        PRIMARY KEY (id) CONSTRAINT fk_factura_empleat FOREIGN KEY (id_empleat) REFERENCES Empleat (id) ON DELETE CASCADE ON UPDATE CASCADE
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
        created_at timestamp NULL,
        updated_at timestamp NULL,
        id_proveidor INT NOT NULL,
        PRIMARY KEY (id) CONSTRAINT fk_ullera_proveidor FOREIGN KEY (id_proveidor) REFERENCES Proveidor (id)
    );