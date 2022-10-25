DROP DATABASE IF EXISTS mini_youtube_db;

CREATE DATABASE mini_youtube_db;

USE mini_youtube_db;

CREATE TABLE
    Usuari (
        id INT NOT NULL AUTO_INCREMENT,
        email VARCHAR(40) NOT NULL,
        username VARCHAR(12) NOT NULL,
        password VARCHAR(12) NOT NULL,
        data_naixement DATE NOT NULL,
        sexe ENUM(
            'home',
            'dona',
            'no-binari',
            'no-respon'
        ) NOT NULL,
        pais VARCHAR(12) NOT NULL,
        codi_postal VARCHAR(12) NOT NULL,
        PRIMARY KEY (id)
    );

CREATE TABLE
    Video (
        id INT NOT NULL AUTO_INCREMENT,
        Titol VARCHAR(100) NOT NULL,
        Descripcio MEDIUMTEXT NOT NULL,
        nom_arxiu VARCHAR(100) NOT NULL,
        duracio TIME NOT NULL,
        tamany FLOAT NOT NULL,
        thumbnail VARCHAR(255) NOT NULL,
        reproduccions INTEGER NOT NULL,
        estat ENUM('privat', 'public', 'ocult') NOT NULL,
        publicacio TIMESTAMP NOT NULL,
        id_usuari INT NOT NULL,
        PRIMARY KEY (id),
        CONSTRAINT fk_video_usuari FOREIGN KEY (id_usuari) REFERENCES Usuari (id)
    );

CREATE TABLE
    Canal (
        id INT NOT NULL AUTO_INCREMENT,
        nom VARCHAR(20) NOT NULL,
        Descripcio MEDIUMTEXT NOT NULL,
        created_at TIMESTAMP NOT NULL,
        updated_at TIMESTAMP NOT NULL,
        id_usuari INT NOT NULL,
        PRIMARY KEY (id),
        CONSTRAINT fk_canal_usuari FOREIGN KEY (id_usuari) REFERENCES Usuari (id)
    );

CREATE TABLE
    Comentaris (
        id INT NOT NULL AUTO_INCREMENT,
        comentari MEDIUMTEXT NOT NULL,
        created_at timestamp NOT NULL,
        updated_at timestamp NOT NULL,
        id_usuari INT NOT NULL,
        id_video INT NOT NULL,
        PRIMARY KEY (id),
        CONSTRAINT fk_comentaris_usuari FOREIGN KEY (id_usuari) REFERENCES Usuari (id),
        CONSTRAINT fk_comentaris_video FOREIGN KEY (id_video) REFERENCES Video (id)
    );

CREATE TABLE
    dislike_comentari (
        id INT NOT NULL AUTO_INCREMENT,
        created_at timestamp NOT NULL,
        updated_at timestamp NOT NULL,
        id_comentari INT NOT NULL,
        id_usuari INT NOT NULL,
        PRIMARY KEY (id),
        CONSTRAINT fk_dislike_comentari_comentari FOREIGN KEY (id_comentari) REFERENCES Comentaris (id),
        CONSTRAINT fk_dislike_comentari_usuari FOREIGN KEY (id_usuari) REFERENCES Usuari (id)
    );

CREATE TABLE
    dislikes_video (
        id INT NOT NULL AUTO_INCREMENT,
        id_usuari INT NOT NULL,
        id_video INT NOT NULL,
        created_at timestamp NOT NULL,
        PRIMARY KEY (id),
        CONSTRAINT fk_dislikes_video_usuari FOREIGN KEY (id_usuari) REFERENCES Usuari (id),
        CONSTRAINT fk_dislikes_video_video FOREIGN KEY (id_video) REFERENCES Video (id)
    );

CREATE TABLE
    etiqueta (
        id INT NOT NULL AUTO_INCREMENT,
        nom VARCHAR(20) NOT NULL,
        id_video INT NOT NULL,
        PRIMARY KEY (id),
        CONSTRAINT fk_etiqueta_video FOREIGN KEY (id_video) REFERENCES Video (id)
    );

CREATE TABLE
    like_comentari (
        id INT NOT NULL AUTO_INCREMENT,
        created_at timestamp NOT NULL,
        updated_at timestamp NOT NULL,
        id_comentari INT NOT NULL,
        id_usuari INT NOT NULL,
        PRIMARY KEY (id),
        CONSTRAINT fk_like_comentari_comentari FOREIGN KEY (id_comentari) REFERENCES Comentaris (id),
        CONSTRAINT fk_like_comentari_usuari FOREIGN KEY (id_usuari) REFERENCES Usuari (id)
    );

CREATE TABLE
    likes_video (
        id INT NOT NULL AUTO_INCREMENT,
        id_usuari INT NOT NULL,
        id_video INT NOT NULL,
        created_at timestamp NOT NULL,
        PRIMARY KEY (id),
        CONSTRAINT fk_likes_video_usuari FOREIGN KEY (id_usuari) REFERENCES Usuari (id),
        CONSTRAINT fk_likes_video_video FOREIGN KEY (id_video) REFERENCES Video (id)
    );

CREATE TABLE
    Playlist (
        id INT NOT NULL AUTO_INCREMENT,
        nom VARCHAR(20) NOT NULL,
        id_usuari INT NOT NULL,
        id_video INT NOT NULL,
        estat ENUM('privat', 'public') NOT NULL,
        PRIMARY KEY (id),
        CONSTRAINT fk_playlist_usuari FOREIGN KEY (id_usuari) REFERENCES Usuari (id),
        CONSTRAINT fk_playlist_video FOREIGN KEY (id_video) REFERENCES Video (id)
    );

CREATE TABLE
    Subscripcio (
        id INT NOT NULL AUTO_INCREMENT,
        id_canal INT NOT NULL,
        id_usuari INT NOT NULL,
        PRIMARY KEY (id),
        CONSTRAINT fk_subscripcio_canal FOREIGN KEY (id_canal) REFERENCES Canal (id),
        CONSTRAINT fk_subscripcio_usuari FOREIGN KEY (id_usuari) REFERENCES Usuari (id)
    );
