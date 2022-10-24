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