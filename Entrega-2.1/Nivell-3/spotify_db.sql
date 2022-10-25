DROP DATABASE IF EXISTS spotify_db;

CREATE DATABASE spotify_db;

USE spotify_db;

CREATE TABLE
    Canço (
        id INT NOT NULL AUTO_INCREMENT,
        titol VARCHAR(20) NOT NULL,
        duracio FLOAT NOT NULL,
        reproduccions BIGINT NOT NULL,
        id_playlist INT NOT NULL,
        id_album INT NOT NULL,
        id_artista INT NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE Artista (
    id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(20) NOT NULL,
    imatge VARCHAR(40) NOT NULL,
    genere_musical VARCHAR(40) NOT NULL,
    id_canço INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_artista_canço FOREIGN KEY (id_canço) REFERENCES Canço (id)
);

CREATE TABLE
    Album (
        id INT NOT NULL AUTO_INCREMENT,
        titol VARCHAR(20) NOT NULL,
        portada VARCHAR(40) NOT NULL,
        publicacio DATE NOT NULL,
        id_artista INT NOT NULL,
        id_canço INT NOT NULL,
        PRIMARY KEY (id),
        CONSTRAINT fk_album_artista FOREIGN KEY (id_artista) REFERENCES Artista (id),
        CONSTRAINT fk_album_canço FOREIGN KEY (id_canço) REFERENCES Canço (id)
    );


CREATE TABLE Usuari (
    id INT NOT NULL AUTO_INCREMENT,
    tipus ENUM('free', 'premium') NOT NULL DEFAULT 'free',
    sexe ENUM('home', 'dona', 'no-binari', 'trans', 'no-contesta') NOT NULL,
    username VARCHAR(20) NOT NULL,
    codi_postal VARCHAR(20) NOT NULL,
    pais VARCHAR(20) NOT NULL,
    email VARCHAR(20) NOT NULL,
    PRIMARY KEY (id)
);


CREATE TABLE Playlist (
    id INT NOT NULL AUTO_INCREMENT,
    tipus ENUM('actives', 'esborrades') NOT NULL,
    id_canço INT NOT NULL,
    id_usuari INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_playlist_canço FOREIGN KEY (id_canço)
        REFERENCES Canço (id),
    CONSTRAINT fk_playlist_usuari FOREIGN KEY (id_usuari)
        REFERENCES Usuari (id)
);



CREATE TABLE
    Like_album (
        id INT NOT NULL AUTO_INCREMENT,
        id_album INT NOT NULL,
        id_usuari INT NOT NULL,
        PRIMARY KEY (id),
        CONSTRAINT fk_like_album_album FOREIGN KEY (id_album) REFERENCES Album (id),
        CONSTRAINT fk_like_album_usuari FOREIGN KEY (id_usuari) REFERENCES Usuari (id)
    );



CREATE TABLE
    Like_canço (
        id INT NOT NULL AUTO_INCREMENT,
        id_canço INT NOT NULL,
        id_usuari INT NOT NULL,
        PRIMARY KEY (id),
        CONSTRAINT fk_like_canço_canço FOREIGN KEY (id_canço) REFERENCES Canço (id),
        CONSTRAINT fk_like_canço_usuari FOREIGN KEY (id_usuari) REFERENCES Usuari (id)
    );


CREATE TABLE Targeta (
    id INT NOT NULL AUTO_INCREMENT,
    numero_targeta VARCHAR(40) NOT NULL,
    caducitat DATE NOT NULL,
    codi_seguretat VARCHAR(20) NOT NULL,
    id_usuari INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_targeta_usuari FOREIGN KEY (id_usuari)
        REFERENCES Usuari (id)
);
   
   
CREATE TABLE Subscripcio (
    id INT NOT NULL AUTO_INCREMENT,
    renovacio_automatica BOOLEAN NULL DEFAULT TRUE,
    pagament ENUM('targeta', 'PayPal') NOT NULL,
    created_at TIMESTAMP NULL,
    updated_at TIMESTAMP NULL,
    expires_at DATE NOT NULL,
    id_usuari INT NOT NULL,
    id_targeta INT NOT NULL,
    id_paypal INT NOT NULL,
    PRIMARY KEY (id),
    CONSTRAINT fk_subscripcio_usuari FOREIGN KEY (id_usuari)
        REFERENCES Usuari (id)
);

CREATE TABLE
    Pagament (
        id INT NOT NULL AUTO_INCREMENT,
        created_at TIMESTAMP NULL,
        num_ordre VARCHAR(20) NOT NULL,
        total FLOAT NOT NULL,
        id_subscripcio INT NOT NULL,
        PRIMARY KEY (id),
        CONSTRAINT fk_pagament_subscripcio FOREIGN KEY (id_subscripcio) REFERENCES Subscripcio (id)
    );

CREATE TABLE
    Paypal (
        id INT NOT NULL,
        username_paypal VARCHAR(20) NULL,
        id_usuari INT NOT NULL,
        PRIMARY KEY (id),
        CONSTRAINT fk_paypal_usuari FOREIGN KEY (id_usuari) REFERENCES Usuari (id)
    );


CREATE TABLE
    Seguir_artista (
        id INT NOT NULL AUTO_INCREMENT,
        id_artista INT NOT NULL,
        id_usuari INT NOT NULL,
        PRIMARY KEY (id),
        CONSTRAINT fk_seguir_artista_artista FOREIGN KEY (id_artista) REFERENCES Artista (id),
        CONSTRAINT fk_seguir_artista_usuari FOREIGN KEY (id_usuari) REFERENCES Usuari (id)
    );




    
ALTER TABLE Canço
ADD
    CONSTRAINT FK_Playlist_TO_Canço FOREIGN KEY (id_playlist) REFERENCES Playlist (id),
    ADD
    CONSTRAINT FK_Album_TO_Canço FOREIGN KEY (id_album) REFERENCES Album (id),
    ADD
    CONSTRAINT FK_Artista_TO_Canço FOREIGN KEY (id_artista) REFERENCES Artista (id);
    
    
ALTER TABLE Playlist
ADD
    CONSTRAINT FK_Usuari_TO_Playlist FOREIGN KEY (id_usuari) REFERENCES Usuari (id);

ALTER TABLE Subscripcio
ADD
    CONSTRAINT FK_Targeta_TO_Subscripcio FOREIGN KEY (id_targeta) REFERENCES Targeta (id),
ADD
    CONSTRAINT FK_Paypal_TO_Subscripcio FOREIGN KEY (id_paypal) REFERENCES Paypal (id);