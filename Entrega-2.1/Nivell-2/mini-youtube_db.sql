DROP DATABASE IF EXISTS mini_youtube_db;

CREATE DATABASE mini_youtube_db;

USE mini_youtube_db;

CREATE TABLE
    Canal (
        id INT NOT NULL AUTO_INCREMENT,
        nom VARCHAR(20) NOT NULL,
        descripcio TINYTEXT NOT NULL,
        created_at timestamp NULL,
        updated_at timestamp NULL,
        id_usuari INT NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    Comentari (
        id INT NOT NULL AUTO_INCREMENT,
        contingut_comentari MEDIUMTEXT NOT NULL,
        created_at timestamp NULL,
        updated_at timestamp NULL,
        id_usuari INT NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    Dislike_comentari (
        id INT NOT NULL AUTO_INCREMENT,
        created_at timestamp NULL,
        id_usuari INT NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    Dislike_video (
        id INT NOT NULL AUTO_INCREMENT,
        created_at timestamp NULL,
        id_video INT NOT NULL,
        id_usuari INT NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    etiqueta (
        id INT NOT NULL AUTO_INCREMENT,
        nom VARCHAR(20) NOT NULL,
        id_video INT NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    Like_comentari (
        id INT NOT NULL AUTO_INCREMENT,
        created_at timestamp NULL,
        id_usuari INT NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    Like_video (
        id INT NOT NULL AUTO_INCREMENT,
        created_at timestamp NULL,
        id_video INT NOT NULL,
        id_usuari INT NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    Playlist (
        id INT NOT NULL AUTO_INCREMENT,
        nom VARCHAR(20) NOT NULL,
        estat ENUM('publicat', 'privat') NOT NULL,
        created_at timestamp NULL,
        updated_at timestamp NULL,
        id_usuari INT NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    Subscripcions (
        id INT NOT NULL AUTO_INCREMENT,
        created_at timestamp NULL,
        updated_at timestamp NULL,
        id_canal INT NOT NULL,
        id_usuari INT NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    Usuari (
        id INT NOT NULL AUTO_INCREMENT,
        username VARCHAR(20) NOT NULL,
        email VARCHAR(20) NOT NULL,
        password VARCHAR(20) NOT NULL,
        sexe ENUM(
            'home',
            'dona',
            'no-binari',
            'trans',
            'altres',
            'no-respondre'
        ) NOT NULL,
        data_naixement DATE NOT NULL,
        pais VARCHAR(20) NOT NULL,
        codi_postal VARCHAR(20) NOT NULL,
        created_at timestamp NULL,
        updated_at timestamp NULL,
        id_video INT NOT NULL,
        id_playlist INT NOT NULL,
        id_canal INT NOT NULL,
        id_comentari INT NOT NULL,
        id_like_comentari INT NOT NULL,
        id_dislike_comentari INT NOT NULL,
        id_subscripcio INT NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    Video (
        id INT NOT NULL AUTO_INCREMENT,
        titol VARCHAR(20) NOT NULL,
        descripcio TINYTEXT NOT NULL,
        nom_arxiu VARCHAR(20) NOT NULL,
        pes_arxiu FLOAT NOT NULL,
        duracio FLOAT NOT NULL,
        thumbnail VARCHAR(40) NOT NULL,
        reproduccions INTEGER NOT NULL DEFAULT 0,
        estat ENUM('publicat', 'ocult', 'privat') NOT NULL,
        created_at timestamp NULL,
        updated_at timestamp NULL,
        id_usuari INT NOT NULL,
        id_etiqueta INT NOT NULL,
        PRIMARY KEY (id)
    );

ALTER TABLE Video
ADD
    CONSTRAINT FK_Usuari_TO_Video FOREIGN KEY (id_usuari) REFERENCES Usuari (id);

ALTER TABLE Usuari
ADD
    CONSTRAINT FK_Video_TO_Usuari FOREIGN KEY (id_video) REFERENCES Video (id);

ALTER TABLE etiqueta
ADD
    CONSTRAINT FK_Video_TO_etiqueta FOREIGN KEY (id_video) REFERENCES Video (id);

ALTER TABLE Video
ADD
    CONSTRAINT FK_etiqueta_TO_Video FOREIGN KEY (id_etiqueta) REFERENCES etiqueta (id);

ALTER TABLE Canal
ADD
    CONSTRAINT FK_Usuari_TO_Canal FOREIGN KEY (id_usuari) REFERENCES Usuari (id);

ALTER TABLE Usuari
ADD
    CONSTRAINT FK_Canal_TO_Usuari FOREIGN KEY (id_canal) REFERENCES Canal (id);

ALTER TABLE Subscripcions
ADD
    CONSTRAINT FK_Canal_TO_Subscripcions FOREIGN KEY (id_canal) REFERENCES Canal (id);

ALTER TABLE Subscripcions
ADD
    CONSTRAINT FK_Usuari_TO_Subscripcions FOREIGN KEY (id_usuari) REFERENCES Usuari (id);

ALTER TABLE Like_video
ADD
    CONSTRAINT FK_Video_TO_Like_video FOREIGN KEY (id_video) REFERENCES Video (id);

ALTER TABLE Like_video
ADD
    CONSTRAINT FK_Usuari_TO_Like_video FOREIGN KEY (id_usuari) REFERENCES Usuari (id);

ALTER TABLE Dislike_video
ADD
    CONSTRAINT FK_Video_TO_Dislike_video FOREIGN KEY (id_video) REFERENCES Video (id);

ALTER TABLE Dislike_video
ADD
    CONSTRAINT FK_Usuari_TO_Dislike_video FOREIGN KEY (id_usuari) REFERENCES Usuari (id);

ALTER TABLE Playlist
ADD
    CONSTRAINT FK_Usuari_TO_Playlist FOREIGN KEY (id_usuari) REFERENCES Usuari (id);

ALTER TABLE Usuari
ADD
    CONSTRAINT FK_Playlist_TO_Usuari FOREIGN KEY (id_playlist) REFERENCES Playlist (id);

ALTER TABLE Comentari
ADD
    CONSTRAINT FK_Usuari_TO_Comentari FOREIGN KEY (id_usuari) REFERENCES Usuari (id);

ALTER TABLE Usuari
ADD
    CONSTRAINT FK_Comentari_TO_Usuari FOREIGN KEY (id_comentari) REFERENCES Comentari (id);

ALTER TABLE Like_comentari
ADD
    CONSTRAINT FK_Usuari_TO_Like_comentari FOREIGN KEY (id_usuari) REFERENCES Usuari (id);

ALTER TABLE Dislike_comentari
ADD
    CONSTRAINT FK_Usuari_TO_Dislike_comentari FOREIGN KEY (id_usuari) REFERENCES Usuari (id);

ALTER TABLE Usuari
ADD
    CONSTRAINT FK_Like_comentari_TO_Usuari FOREIGN KEY (id_like_comentari) REFERENCES Like_comentari (id);

ALTER TABLE Usuari
ADD
    CONSTRAINT FK_Dislike_comentari_TO_Usuari FOREIGN KEY (id_dislike_comentari) REFERENCES Dislike_comentari (id);

ALTER TABLE Usuari
ADD
    CONSTRAINT FK_Subscripcions_TO_Usuari FOREIGN KEY (id_subscripcio) REFERENCES Subscripcions (id);