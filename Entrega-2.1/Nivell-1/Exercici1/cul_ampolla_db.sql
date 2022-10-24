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
        telefon VARCHAR(20) NOT NULL,
        created_at timestamp default current_timestamp,
        updated_at datetime default current_timestamp,
        id_empleat INT NOT NULL,
        id_client INT NULL COMMENT 'Recomanat',
        PRIMARY KEY (id)
    );

CREATE TABLE
    Empleat (
        id INT NOT NULL AUTO_INCREMENT,
        nom VARCHAR(20) NOT NULL,
        created_at timestamp default current_timestamp,
        updated_at datetime default current_timestamp,
        PRIMARY KEY (id)
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
        PRIMARY KEY (id)
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
        PRIMARY KEY (id)
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
        PRIMARY KEY (id)
    );

ALTER TABLE Ullera
ADD
    CONSTRAINT FK_Proveidor_TO_Ullera FOREIGN KEY (id_proveidor) REFERENCES Proveidor (id);

ALTER TABLE Proveidor
ADD
    CONSTRAINT FK_Ullera_TO_Proveidor FOREIGN KEY (id_ullera) REFERENCES Ullera (id);

ALTER TABLE Client
ADD
    CONSTRAINT FK_Empleat_TO_Client FOREIGN KEY (id_empleat) REFERENCES Empleat (id);

ALTER TABLE Factura
ADD
    CONSTRAINT FK_Empleat_TO_Ticket FOREIGN KEY (id_empleat) REFERENCES Empleat (id);

ALTER TABLE Factura
ADD
    CONSTRAINT FK_Client_TO_Ticket FOREIGN KEY (id_client) REFERENCES Client (id);

ALTER TABLE Factura
ADD
    CONSTRAINT FK_Ullera_TO_Ticket FOREIGN KEY (id_ullera) REFERENCES Ullera (id);