DROP DATABASE IF EXISTS spotify_db;

CREATE DATABASE spotify_db;

USE spotify_db;

CREATE TABLE
    Album (
        id INT NOT NULL AUTO_INCREMENT,
        titol VARCHAR(20) NOT NULL,
        portada VARCHAR(40) NOT NULL,
        created_at timestamp NULL,
        updated_at timestamp NULL,
        id_artista INT NOT NULL,
        id_canço INT NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    Artista (
        id INT NOT NULL AUTO_INCREMENT,
        nom VARCHAR(20) NOT NULL,
        imatge VARCHAR(40) NOT NULL,
        genere_musical VARCHAR(40) NOT NULL,
        created_at timestamp NULL,
        updated_at timestamp NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    Canço (
        id INT NOT NULL AUTO_INCREMENT,
        titol VARCHAR(20) NOT NULL,
        duracio FLOAT NOT NULL,
        reproduccions BIGINT NOT NULL,
        created_at timestamp NULL,
        updated_at timestamp NULL,
        id_playlist INT NOT NULL,
        id_album INT NOT NULL,
        id_artista INT NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    Like_album (
        id INT NOT NULL AUTO_INCREMENT,
        created_at timestamp NULL,
        updated_at timestamp NULL,
        id_album INT NOT NULL,
        id_usuari INT NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    Like_canço (
        id INT NOT NULL AUTO_INCREMENT,
        created_at timestamp NULL,
        updated_at timestamp NULL,
        id_canço INT NOT NULL,
        id_usuari INT NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    Pagament (
        id INT NOT NULL AUTO_INCREMENT,
        created_at TIMESTAMP NULL,
        num_ordre VARCHAR(20) NOT NULL,
        total FLOAT NOT NULL,
        id_subscripcio INT NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    Paypal (
        id INT NOT NULL,
        username_paypal VARCHAR(20) NULL,
        id_usuari INT NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    Playlist (
        id INT NOT NULL AUTO_INCREMENT,
        created_at timestamp NULL,
        updated_at timestamp NULL,
        tipus ENUM('actives', 'esborrades') NOT NULL,
        id_canço INT NOT NULL,
        id_usuari INT NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    Seguir_artista (
        id INT NOT NULL AUTO_INCREMENT,
        created_at timestamp NULL,
        updated_at timestamp NULL,
        id_artista INT NOT NULL,
        id_usuari INT NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    Subscripcio (
        id INT NOT NULL AUTO_INCREMENT,
        renovacio_automatica BOOLEAN NULL DEFAULT True,
        pagament ENUM('targeta', 'PayPal') NOT NULL,
        created_at timestamp NULL,
        updated_at timestamp NULL,
        expires_at DATE NOT NULL,
        id_usuari INT NOT NULL,
        id_targeta INT NOT NULL,
        id_paypal INT NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    Targeta (
        id INT NOT NULL AUTO_INCREMENT,
        numero_targeta VARCHAR(40) NOT NULL,
        caducitat DATE NOT NULL,
        codi_seguretat VARCHAR(20) NOT NULL,
        id_usuari INT NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    Usuari (
        id INT NOT NULL AUTO_INCREMENT,
        tipus ENUM('free', 'premium') NOT NULL DEFAULT 'free',
        sexe ENUM(
            'home',
            'dona',
            'no-binari',
            'trans',
            'no-contesta'
        ) NOT NULL,
        username VARCHAR(20) NOT NULL,
        codi_postal VARCHAR(20) NOT NULL,
        pais VARCHAR(20) NOT NULL,
        email VARCHAR(20) NOT NULL,
        created_at timestamp NULL,
        updated_at timestamp NULL,
        id_playlist INT NOT NULL,
        PRIMARY KEY (id)
    );

ALTER TABLE Subscripcio
ADD
    CONSTRAINT FK_Usuari_TO_Subscripcio FOREIGN KEY (id_usuari) REFERENCES Usuari (id);

ALTER TABLE Targeta
ADD
    CONSTRAINT FK_Usuari_TO_Targeta FOREIGN KEY (id_usuari) REFERENCES Usuari (id);

ALTER TABLE Paypal
ADD
    CONSTRAINT FK_Usuari_TO_Paypal FOREIGN KEY (id_usuari) REFERENCES Usuari (id);

ALTER TABLE Subscripcio
ADD
    CONSTRAINT FK_Targeta_TO_Subscripcio FOREIGN KEY (id_targeta) REFERENCES Targeta (id);

ALTER TABLE Subscripcio
ADD
    CONSTRAINT FK_Paypal_TO_Subscripcio FOREIGN KEY (id_paypal) REFERENCES Paypal (id);

ALTER TABLE Seguir_artista
ADD
    CONSTRAINT FK_Artista_TO_Seguir_artista FOREIGN KEY (id_artista) REFERENCES Artista (id);

ALTER TABLE Seguir_artista
ADD
    CONSTRAINT FK_Usuari_TO_Seguir_artista FOREIGN KEY (id_usuari) REFERENCES Usuari (id);

ALTER TABLE Playlist
ADD
    CONSTRAINT FK_Canço_TO_Playlist FOREIGN KEY (id_canço) REFERENCES Canço (id);

ALTER TABLE Canço
ADD
    CONSTRAINT FK_Playlist_TO_Canço FOREIGN KEY (id_playlist) REFERENCES Playlist (id);

ALTER TABLE Playlist
ADD
    CONSTRAINT FK_Usuari_TO_Playlist FOREIGN KEY (id_usuari) REFERENCES Usuari (id);

ALTER TABLE Usuari
ADD
    CONSTRAINT FK_Playlist_TO_Usuari FOREIGN KEY (id_playlist) REFERENCES Playlist (id);

ALTER TABLE Pagament
ADD
    CONSTRAINT FK_Subscripcio_TO_Pagament FOREIGN KEY (id_subscripcio) REFERENCES Subscripcio (id);

ALTER TABLE Album
ADD
    CONSTRAINT FK_Artista_TO_Album FOREIGN KEY (id_artista) REFERENCES Artista (id);

ALTER TABLE Album
ADD
    CONSTRAINT FK_Canço_TO_Album FOREIGN KEY (id_canço) REFERENCES Canço (id);

ALTER TABLE Canço
ADD
    CONSTRAINT FK_Album_TO_Canço FOREIGN KEY (id_album) REFERENCES Album (id);

ALTER TABLE Like_canço
ADD
    CONSTRAINT FK_Canço_TO_Like_canço FOREIGN KEY (id_canço) REFERENCES Canço (id);

ALTER TABLE Like_canço
ADD
    CONSTRAINT FK_Usuari_TO_Like_canço FOREIGN KEY (id_usuari) REFERENCES Usuari (id);

ALTER TABLE Like_album
ADD
    CONSTRAINT FK_Album_TO_Like_album FOREIGN KEY (id_album) REFERENCES Album (id);

ALTER TABLE Like_album
ADD
    CONSTRAINT FK_Usuari_TO_Like_album FOREIGN KEY (id_usuari) REFERENCES Usuari (id);

ALTER TABLE Canço
ADD
    CONSTRAINT FK_Artista_TO_Canço FOREIGN KEY (id_artista) REFERENCES Artista (id);