DROP DATABASE IF EXISTS spotify_db;

CREATE DATABASE spotify_db;

USE spotify_db;

CREATE TABLE
    Usuari (
        id INT NOT NULL AUTO_INCREMENT,
        tipus ENUM('free', 'premium') NOT NULL,
        email VARCHAR(40) NOT NULL,
        username VARCHAR(40) NOT NULL,
        data_naixament DATE NOT NULL,
        sexe ENUM(
            'home',
            'dona',
            'trans',
            'no-binari',
            'no-respon'
        ) NOT NULL,
        pais VARCHAR(40) NOT NULL,
        codi_postal VARCHAR(40) NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    Cançons (
        id INT NOT NULL AUTO_INCREMENT,
        titol VARCHAR(40) NOT NULL,
        durada TIME NOT NULL,
        reproduccions INTEGER NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    Artista (
        id INT NOT NULL AUTO_INCREMENT,
        nom VARCHAR(40) NOT NULL,
        imatge VARCHAR(255) NOT NULL,
        genere_musical VARCHAR(255) NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    Album (
        id INT NOT NULL AUTO_INCREMENT,
        id_canço INT NOT NULL,
        id_artista INT NOT NULL,
        imatge VARCHAR(255) NOT NULL,
        publicacio DATE NOT NULL,
        PRIMARY KEY (id),
        CONSTRAINT FK_Cançons_TO_Album FOREIGN KEY (id_canço) REFERENCES Cançons (id),
        CONSTRAINT FK_Artista_TO_Album FOREIGN KEY (id_artista) REFERENCES Artista (id)
    );

CREATE TABLE
    albums_favorits (
        id INT NOT NULL AUTO_INCREMENT,
        id_album INT NOT NULL,
        id_usuari INT NOT NULL,
        PRIMARY KEY (id),
        CONSTRAINT FK_Album_TO_albums_favorits FOREIGN KEY (id_album) REFERENCES Album (id),
        CONSTRAINT FK_Usuari_TO_albums_favorits FOREIGN KEY (id_usuari) REFERENCES Usuari (id)
    );

CREATE TABLE
    cançons_favorites (
        id INT NOT NULL AUTO_INCREMENT,
        id_canço INT NOT NULL,
        id_usuari INT NOT NULL,
        PRIMARY KEY (id),
        CONSTRAINT FK_Cançons_TO_cançons_favorites FOREIGN KEY (id_canço) REFERENCES Cançons (id),
        CONSTRAINT FK_Usuari_TO_cançons_favorites FOREIGN KEY (id_usuari) REFERENCES Usuari (id)
    );

CREATE TABLE
    Pagament (
        id INT NOT NULL AUTO_INCREMENT,
        created_at timestamp NOT NULL,
        num_ordre VARCHAR(40) NOT NULL,
        id_usuari INT NOT NULL,
        Total FLOAT NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    PayPal (
        id INT NOT NULL AUTO_INCREMENT,
        username VARCHAR(40) NOT NULL,
        id_usuari INT NOT NULL,
        PRIMARY KEY (id),
        CONSTRAINT FK_Usuari_TO_PayPal FOREIGN KEY (id_usuari) REFERENCES Usuari (id)
    );

CREATE TABLE
    Playlist (
        id INT NOT NULL AUTO_INCREMENT,
        titol VARCHAR(40) NOT NULL,
        created_at timestamp NOT NULL,
        updated_at timestamp NOT NULL,
        id_usuari INT NOT NULL,
        estat ENUM('actives', 'esborrada') NOT NULL,
        id_canço INT NOT NULL,
        PRIMARY KEY (id),
        CONSTRAINT FK_Usuari_TO_Playlist FOREIGN KEY (id_usuari) REFERENCES Usuari (id),
        CONSTRAINT FK_Cançons_TO_Playlist FOREIGN KEY (id_canço) REFERENCES Cançons (id)
    );

CREATE TABLE
    Seguir_Artista (
        id INT NOT NULL AUTO_INCREMENT,
        id_artista INT NOT NULL,
        id_usuari INT NOT NULL,
        PRIMARY KEY (id),
        CONSTRAINT FK_Artista_TO_Seguir_Artista FOREIGN KEY (id_artista) REFERENCES Artista (id),
        CONSTRAINT FK_Usuari_TO_Seguir_Artista FOREIGN KEY (id_usuari) REFERENCES Usuari (id)
    );

CREATE TABLE
    Subscripcio (
        id INT NOT NULL AUTO_INCREMENT,
        inici timestamp NOT NULL,
        renovacio DATETIME NOT NULL,
        pagament ENUM('targeta', 'PayPal') NOT NULL,
        id_usuari INT NOT NULL,
        id_pagament INT NOT NULL,
        PRIMARY KEY (id),
        CONSTRAINT FK_Usuari_TO_Subscripcio FOREIGN KEY (id_usuari) REFERENCES Usuari (id),
        CONSTRAINT FK_Pagament_TO_Subscripcio FOREIGN KEY (id_pagament) REFERENCES Pagament (id)
    );

CREATE TABLE
    Targeta (
        id INT NOT NULL AUTO_INCREMENT,
        num_targeta VARCHAR(40) NOT NULL,
        caducitat DATE NOT NULL,
        codi_seguretat INTEGER NOT NULL,
        id_usuari INT NOT NULL,
        PRIMARY KEY (id)
    );