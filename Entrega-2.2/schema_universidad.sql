-- Active: 1666782552703@@127.0.0.1@3306@tienda

DROP DATABASE IF EXISTS universidad;

CREATE DATABASE universidad CHARACTER SET utf8mb4;

USE universidad;

CREATE TABLE
    departamento (
        id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(50) NOT NULL
    );

CREATE TABLE
    persona (
        id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        nif VARCHAR(9) UNIQUE,
        nombre VARCHAR(25) NOT NULL,
        apellido1 VARCHAR(50) NOT NULL,
        apellido2 VARCHAR(50),
        ciudad VARCHAR(25) NOT NULL,
        direccion VARCHAR(50) NOT NULL,
        telefono VARCHAR(9),
        fecha_nacimiento DATE NOT NULL,
        sexo ENUM('H', 'M') NOT NULL,
        tipo ENUM('profesor', 'alumno') NOT NULL
    );

CREATE TABLE
    profesor (
        id_profesor INT UNSIGNED PRIMARY KEY,
        id_departamento INT UNSIGNED NOT NULL,
        FOREIGN KEY (id_profesor) REFERENCES persona(id),
        FOREIGN KEY (id_departamento) REFERENCES departamento(id)
    );

CREATE TABLE
    grado (
        id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL
    );

CREATE TABLE
    asignatura (
        id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        nombre VARCHAR(100) NOT NULL,
        creditos FLOAT UNSIGNED NOT NULL,
        tipo ENUM(
            'básica',
            'obligatoria',
            'optativa'
        ) NOT NULL,
        curso TINYINT UNSIGNED NOT NULL,
        cuatrimestre TINYINT UNSIGNED NOT NULL,
        id_profesor INT UNSIGNED,
        id_grado INT UNSIGNED NOT NULL,
        FOREIGN KEY(id_profesor) REFERENCES profesor(id_profesor),
        FOREIGN KEY(id_grado) REFERENCES grado(id)
    );

CREATE TABLE
    curso_escolar (
        id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
        anyo_inicio YEAR NOT NULL,
        anyo_fin YEAR NOT NULL
    );

CREATE TABLE
    alumno_se_matricula_asignatura (
        id_alumno INT UNSIGNED NOT NULL,
        id_asignatura INT UNSIGNED NOT NULL,
        id_curso_escolar INT UNSIGNED NOT NULL,
        PRIMARY KEY (
            id_alumno,
            id_asignatura,
            id_curso_escolar
        ),
        FOREIGN KEY (id_alumno) REFERENCES persona(id),
        FOREIGN KEY (id_asignatura) REFERENCES asignatura(id),
        FOREIGN KEY (id_curso_escolar) REFERENCES curso_escolar(id)
    );

/* Departamento */

INSERT INTO departamento VALUES (1, 'Informática');

INSERT INTO departamento VALUES (2, 'Matemáticas');

INSERT INTO departamento VALUES (3, 'Economía y Empresa');

INSERT INTO departamento VALUES (4, 'Educación');

INSERT INTO departamento VALUES (5, 'Agronomía');

INSERT INTO departamento VALUES (6, 'Química y Física');

INSERT INTO departamento VALUES (7, 'Filología');

INSERT INTO departamento VALUES (8, 'Derecho');

INSERT INTO departamento VALUES (9, 'Biología y Geología');

/* Persona */

INSERT INTO persona
VALUES (
        1,
        '26902806M',
        'Salvador',
        'Sánchez',
        'Pérez',
        'Almería',
        'C/ Real del barrio alto',
        '950254837',
        '1991/03/28',
        'H',
        'alumno'
    );

INSERT INTO persona
VALUES (
        2,
        '89542419S',
        'Juan',
        'Saez',
        'Vega',
        'Almería',
        'C/ Mercurio',
        '618253876',
        '1992/08/08',
        'H',
        'alumno'
    );

INSERT INTO persona
VALUES (
        3,
        '11105554G',
        'Zoe',
        'Ramirez',
        'Gea',
        'Almería',
        'C/ Marte',
        '618223876',
        '1979/08/19',
        'M',
        'profesor'
    );

INSERT INTO persona
VALUES (
        4,
        '17105885A',
        'Pedro',
        'Heller',
        'Pagac',
        'Almería',
        'C/ Estrella fugaz',
        NULL,
        '2000/10/05',
        'H',
        'alumno'
    );

INSERT INTO persona
VALUES (
        5,
        '38223286T',
        'David',
        'Schmidt',
        'Fisher',
        'Almería',
        'C/ Venus',
        '678516294',
        '1978/01/19',
        'H',
        'profesor'
    );

INSERT INTO persona
VALUES (
        6,
        '04233869Y',
        'José',
        'Koss',
        'Bayer',
        'Almería',
        'C/ Júpiter',
        '628349590',
        '1998/01/28',
        'H',
        'alumno'
    );

INSERT INTO persona
VALUES (
        7,
        '97258166K',
        'Ismael',
        'Strosin',
        'Turcotte',
        'Almería',
        'C/ Neptuno',
        NULL,
        '1999/05/24',
        'H',
        'alumno'
    );

INSERT INTO persona
VALUES (
        8,
        '79503962T',
        'Cristina',
        'Lemke',
        'Rutherford',
        'Almería',
        'C/ Saturno',
        '669162534',
        '1977/08/21',
        'M',
        'profesor'
    );

INSERT INTO persona
VALUES (
        9,
        '82842571K',
        'Ramón',
        'Herzog',
        'Tremblay',
        'Almería',
        'C/ Urano',
        '626351429',
        '1996/11/21',
        'H',
        'alumno'
    );

INSERT INTO persona
VALUES (
        10,
        '61142000L',
        'Esther',
        'Spencer',
        'Lakin',
        'Almería',
        'C/ Plutón',
        NULL,
        '1977/05/19',
        'M',
        'profesor'
    );

INSERT INTO persona
VALUES (
        11,
        '46900725E',
        'Daniel',
        'Herman',
        'Pacocha',
        'Almería',
        'C/ Andarax',
        '679837625',
        '1997/04/26',
        'H',
        'alumno'
    );

INSERT INTO persona
VALUES (
        12,
        '85366986W',
        'Carmen',
        'Streich',
        'Hirthe',
        'Almería',
        'C/ Almanzora',
        NULL,
        '1971-04-29',
        'M',
        'profesor'
    );

INSERT INTO persona
VALUES (
        13,
        '73571384L',
        'Alfredo',
        'Stiedemann',
        'Morissette',
        'Almería',
        'C/ Guadalquivir',
        '950896725',
        '1980/02/01',
        'H',
        'profesor'
    );

INSERT INTO persona
VALUES (
        14,
        '82937751G',
        'Manolo',
        'Hamill',
        'Kozey',
        'Almería',
        'C/ Duero',
        '950263514',
        '1977/01/02',
        'H',
        'profesor'
    );

INSERT INTO persona
VALUES (
        15,
        '80502866Z',
        'Alejandro',
        'Kohler',
        'Schoen',
        'Almería',
        'C/ Tajo',
        '668726354',
        '1980/03/14',
        'H',
        'profesor'
    );

INSERT INTO persona
VALUES (
        16,
        '10485008K',
        'Antonio',
        'Fahey',
        'Considine',
        'Almería',
        'C/ Sierra de los Filabres',
        NULL,
        '1982/03/18',
        'H',
        'profesor'
    );

INSERT INTO persona
VALUES (
        17,
        '85869555K',
        'Guillermo',
        'Ruecker',
        'Upton',
        'Almería',
        'C/ Sierra de Gádor',
        NULL,
        '1973/05/05',
        'H',
        'profesor'
    );

INSERT INTO persona
VALUES (
        18,
        '04326833G',
        'Micaela',
        'Monahan',
        'Murray',
        'Almería',
        'C/ Veleta',
        '662765413',
        '1976/02/25',
        'H',
        'profesor'
    );

INSERT INTO persona
VALUES (
        19,
        '11578526G',
        'Inma',
        'Lakin',
        'Yundt',
        'Almería',
        'C/ Picos de Europa',
        '678652431',
        '1998/09/01',
        'M',
        'alumno'
    );

INSERT INTO persona
VALUES (
        20,
        '79221403L',
        'Francesca',
        'Schowalter',
        'Muller',
        'Almería',
        'C/ Quinto pino',
        NULL,
        '1980/10/31',
        'H',
        'profesor'
    );

INSERT INTO persona
VALUES (
        21,
        '79089577Y',
        'Juan',
        'Gutiérrez',
        'López',
        'Almería',
        'C/ Los pinos',
        '678652431',
        '1998/01/01',
        'H',
        'alumno'
    );

INSERT INTO persona
VALUES (
        22,
        '41491230N',
        'Antonio',
        'Domínguez',
        'Guerrero',
        'Almería',
        'C/ Cabo de Gata',
        '626652498',
        '1999/02/11',
        'H',
        'alumno'
    );

INSERT INTO persona
VALUES (
        23,
        '64753215G',
        'Irene',
        'Hernández',
        'Martínez',
        'Almería',
        'C/ Zapillo',
        '628452384',
        '1996/03/12',
        'M',
        'alumno'
    );

INSERT INTO persona
VALUES (
        24,
        '85135690V',
        'Sonia',
        'Gea',
        'Ruiz',
        'Almería',
        'C/ Mercurio',
        '678812017',
        '1995/04/13',
        'M',
        'alumno'
    );

/* Profesor */

INSERT INTO profesor VALUES (3, 1);

INSERT INTO profesor VALUES (5, 2);

INSERT INTO profesor VALUES (8, 3);

INSERT INTO profesor VALUES (10, 4);

INSERT INTO profesor VALUES (12, 4);

INSERT INTO profesor VALUES (13, 6);

INSERT INTO profesor VALUES (14, 1);

INSERT INTO profesor VALUES (15, 2);

INSERT INTO profesor VALUES (16, 3);

INSERT INTO profesor VALUES (17, 4);

INSERT INTO profesor VALUES (18, 5);

INSERT INTO profesor VALUES (20, 6);

/* Grado */

INSERT INTO grado
VALUES (
        1,
        'Grado en Ingeniería Agrícola (Plan 2015)'
    );

INSERT INTO grado
VALUES (
        2,
        'Grado en Ingeniería Eléctrica (Plan 2014)'
    );

INSERT INTO grado
VALUES (
        3,
        'Grado en Ingeniería Electrónica Industrial (Plan 2010)'
    );

INSERT INTO grado
VALUES (
        4,
        'Grado en Ingeniería Informática (Plan 2015)'
    );

INSERT INTO grado
VALUES (
        5,
        'Grado en Ingeniería Mecánica (Plan 2010)'
    );

INSERT INTO grado
VALUES (
        6,
        'Grado en Ingeniería Química Industrial (Plan 2010)'
    );

INSERT INTO grado VALUES (7, 'Grado en Biotecnología (Plan 2015)');

INSERT INTO grado
VALUES (
        8,
        'Grado en Ciencias Ambientales (Plan 2009)'
    );

INSERT INTO grado VALUES (9, 'Grado en Matemáticas (Plan 2010)');

INSERT INTO grado VALUES (10, 'Grado en Química (Plan 2009)');

/* Asignatura */

INSERT INTO asignatura
VALUES (
        1,
        'Álgegra lineal y matemática discreta',
        6,
        'básica',
        1,
        1,
        3,
        4
    );

INSERT INTO asignatura
VALUES (
        2,
        'Cálculo',
        6,
        'básica',
        1,
        1,
        14,
        4
    );

INSERT INTO asignatura
VALUES (
        3,
        'Física para informática',
        6,
        'básica',
        1,
        1,
        3,
        4
    );

INSERT INTO asignatura
VALUES (
        4,
        'Introducción a la programación',
        6,
        'básica',
        1,
        1,
        14,
        4
    );

INSERT INTO asignatura
VALUES (
        5,
        'Organización y gestión de empresas',
        6,
        'básica',
        1,
        1,
        3,
        4
    );

INSERT INTO asignatura
VALUES (
        6,
        'Estadística',
        6,
        'básica',
        1,
        2,
        14,
        4
    );

INSERT INTO asignatura
VALUES (
        7,
        'Estructura y tecnología de computadores',
        6,
        'básica',
        1,
        2,
        3,
        4
    );

INSERT INTO asignatura
VALUES (
        8,
        'Fundamentos de electrónica',
        6,
        'básica',
        1,
        2,
        14,
        4
    );

INSERT INTO asignatura
VALUES (
        9,
        'Lógica y algorítmica',
        6,
        'básica',
        1,
        2,
        3,
        4
    );

INSERT INTO asignatura
VALUES (
        10,
        'Metodología de la programación',
        6,
        'básica',
        1,
        2,
        14,
        4
    );

INSERT INTO asignatura
VALUES (
        11,
        'Arquitectura de Computadores',
        6,
        'básica',
        2,
        1,
        3,
        4
    );

INSERT INTO asignatura
VALUES (
        12,
        'Estructura de Datos y Algoritmos I',
        6,
        'obligatoria',
        2,
        1,
        3,
        4
    );

INSERT INTO asignatura
VALUES (
        13,
        'Ingeniería del Software',
        6,
        'obligatoria',
        2,
        1,
        14,
        4
    );

INSERT INTO asignatura
VALUES (
        14,
        'Sistemas Inteligentes',
        6,
        'obligatoria',
        2,
        1,
        3,
        4
    );

INSERT INTO asignatura
VALUES (
        15,
        'Sistemas Operativos',
        6,
        'obligatoria',
        2,
        1,
        14,
        4
    );

INSERT INTO asignatura
VALUES (
        16,
        'Bases de Datos',
        6,
        'básica',
        2,
        2,
        14,
        4
    );

INSERT INTO asignatura
VALUES (
        17,
        'Estructura de Datos y Algoritmos II',
        6,
        'obligatoria',
        2,
        2,
        14,
        4
    );

INSERT INTO asignatura
VALUES (
        18,
        'Fundamentos de Redes de Computadores',
        6,
        'obligatoria',
        2,
        2,
        3,
        4
    );

INSERT INTO asignatura
VALUES (
        19,
        'Planificación y Gestión de Proyectos Informáticos',
        6,
        'obligatoria',
        2,
        2,
        3,
        4
    );

INSERT INTO asignatura
VALUES (
        20,
        'Programación de Servicios Software',
        6,
        'obligatoria',
        2,
        2,
        14,
        4
    );

INSERT INTO asignatura
VALUES (
        21,
        'Desarrollo de interfaces de usuario',
        6,
        'obligatoria',
        3,
        1,
        14,
        4
    );

INSERT INTO asignatura
VALUES (
        22,
        'Ingeniería de Requisitos',
        6,
        'optativa',
        3,
        1,
        NULL,
        4
    );

INSERT INTO asignatura
VALUES (
        23,
        'Integración de las Tecnologías de la Información en las Organizaciones',
        6,
        'optativa',
        3,
        1,
        NULL,
        4
    );

INSERT INTO asignatura
VALUES (
        24,
        'Modelado y Diseño del Software 1',
        6,
        'optativa',
        3,
        1,
        NULL,
        4
    );

INSERT INTO asignatura
VALUES (
        25,
        'Multiprocesadores',
        6,
        'optativa',
        3,
        1,
        NULL,
        4
    );

INSERT INTO asignatura
VALUES (
        26,
        'Seguridad y cumplimiento normativo',
        6,
        'optativa',
        3,
        1,
        NULL,
        4
    );

INSERT INTO asignatura
VALUES (
        27,
        'Sistema de Información para las Organizaciones',
        6,
        'optativa',
        3,
        1,
        NULL,
        4
    );

INSERT INTO asignatura
VALUES (
        28,
        'Tecnologías web',
        6,
        'optativa',
        3,
        1,
        NULL,
        4
    );

INSERT INTO asignatura
VALUES (
        29,
        'Teoría de códigos y criptografía',
        6,
        'optativa',
        3,
        1,
        NULL,
        4
    );

INSERT INTO asignatura
VALUES (
        30,
        'Administración de bases de datos',
        6,
        'optativa',
        3,
        2,
        NULL,
        4
    );

INSERT INTO asignatura
VALUES (
        31,
        'Herramientas y Métodos de Ingeniería del Software',
        6,
        'optativa',
        3,
        2,
        NULL,
        4
    );

INSERT INTO asignatura
VALUES (
        32,
        'Informática industrial y robótica',
        6,
        'optativa',
        3,
        2,
        NULL,
        4
    );

INSERT INTO asignatura
VALUES (
        33,
        'Ingeniería de Sistemas de Información',
        6,
        'optativa',
        3,
        2,
        NULL,
        4
    );

INSERT INTO asignatura
VALUES (
        34,
        'Modelado y Diseño del Software 2',
        6,
        'optativa',
        3,
        2,
        NULL,
        4
    );

INSERT INTO asignatura
VALUES (
        35,
        'Negocio Electrónico',
        6,
        'optativa',
        3,
        2,
        NULL,
        4
    );

INSERT INTO asignatura
VALUES (
        36,
        'Periféricos e interfaces',
        6,
        'optativa',
        3,
        2,
        NULL,
        4
    );

INSERT INTO asignatura
VALUES (
        37,
        'Sistemas de tiempo real',
        6,
        'optativa',
        3,
        2,
        NULL,
        4
    );

INSERT INTO asignatura
VALUES (
        38,
        'Tecnologías de acceso a red',
        6,
        'optativa',
        3,
        2,
        NULL,
        4
    );

INSERT INTO asignatura
VALUES (
        39,
        'Tratamiento digital de imágenes',
        6,
        'optativa',
        3,
        2,
        NULL,
        4
    );

INSERT INTO asignatura
VALUES (
        40,
        'Administración de redes y sistemas operativos',
        6,
        'optativa',
        4,
        1,
        NULL,
        4
    );

INSERT INTO asignatura
VALUES (
        41,
        'Almacenes de Datos',
        6,
        'optativa',
        4,
        1,
        NULL,
        4
    );

INSERT INTO asignatura
VALUES (
        42,
        'Fiabilidad y Gestión de Riesgos',
        6,
        'optativa',
        4,
        1,
        NULL,
        4
    );

INSERT INTO asignatura
VALUES (
        43,
        'Líneas de Productos Software',
        6,
        'optativa',
        4,
        1,
        NULL,
        4
    );

INSERT INTO asignatura
VALUES (
        44,
        'Procesos de Ingeniería del Software 1',
        6,
        'optativa',
        4,
        1,
        NULL,
        4
    );

INSERT INTO asignatura
VALUES (
        45,
        'Tecnologías multimedia',
        6,
        'optativa',
        4,
        1,
        NULL,
        4
    );

INSERT INTO asignatura
VALUES (
        46,
        'Análisis y planificación de las TI',
        6,
        'optativa',
        4,
        2,
        NULL,
        4
    );

INSERT INTO asignatura
VALUES (
        47,
        'Desarrollo Rápido de Aplicaciones',
        6,
        'optativa',
        4,
        2,
        NULL,
        4
    );

INSERT INTO asignatura
VALUES (
        48,
        'Gestión de la Calidad y de la Innovación Tecnológica',
        6,
        'optativa',
        4,
        2,
        NULL,
        4
    );

INSERT INTO asignatura
VALUES (
        49,
        'Inteligencia del Negocio',
        6,
        'optativa',
        4,
        2,
        NULL,
        4
    );

INSERT INTO asignatura
VALUES (
        50,
        'Procesos de Ingeniería del Software 2',
        6,
        'optativa',
        4,
        2,
        NULL,
        4
    );

INSERT INTO asignatura
VALUES (
        51,
        'Seguridad Informática',
        6,
        'optativa',
        4,
        2,
        NULL,
        4
    );

INSERT INTO asignatura
VALUES (
        52,
        'Biologia celular',
        6,
        'básica',
        1,
        1,
        NULL,
        7
    );

INSERT INTO asignatura
VALUES (
        53,
        'Física',
        6,
        'básica',
        1,
        1,
        NULL,
        7
    );

INSERT INTO asignatura
VALUES (
        54,
        'Matemáticas I',
        6,
        'básica',
        1,
        1,
        NULL,
        7
    );

INSERT INTO asignatura
VALUES (
        55,
        'Química general',
        6,
        'básica',
        1,
        1,
        NULL,
        7
    );

INSERT INTO asignatura
VALUES (
        56,
        'Química orgánica',
        6,
        'básica',
        1,
        1,
        NULL,
        7
    );

INSERT INTO asignatura
VALUES (
        57,
        'Biología vegetal y animal',
        6,
        'básica',
        1,
        2,
        NULL,
        7
    );

INSERT INTO asignatura
VALUES (
        58,
        'Bioquímica',
        6,
        'básica',
        1,
        2,
        NULL,
        7
    );

INSERT INTO asignatura
VALUES (
        59,
        'Genética',
        6,
        'básica',
        1,
        2,
        NULL,
        7
    );

INSERT INTO asignatura
VALUES (
        60,
        'Matemáticas II',
        6,
        'básica',
        1,
        2,
        NULL,
        7
    );

INSERT INTO asignatura
VALUES (
        61,
        'Microbiología',
        6,
        'básica',
        1,
        2,
        NULL,
        7
    );

INSERT INTO asignatura
VALUES (
        62,
        'Botánica agrícola',
        6,
        'obligatoria',
        2,
        1,
        NULL,
        7
    );

INSERT INTO asignatura
VALUES (
        63,
        'Fisiología vegetal',
        6,
        'obligatoria',
        2,
        1,
        NULL,
        7
    );

INSERT INTO asignatura
VALUES (
        64,
        'Genética molecular',
        6,
        'obligatoria',
        2,
        1,
        NULL,
        7
    );

INSERT INTO asignatura
VALUES (
        65,
        'Ingeniería bioquímica',
        6,
        'obligatoria',
        2,
        1,
        NULL,
        7
    );

INSERT INTO asignatura
VALUES (
        66,
        'Termodinámica y cinética química aplicada',
        6,
        'obligatoria',
        2,
        1,
        NULL,
        7
    );

INSERT INTO asignatura
VALUES (
        67,
        'Biorreactores',
        6,
        'obligatoria',
        2,
        2,
        NULL,
        7
    );

INSERT INTO asignatura
VALUES (
        68,
        'Biotecnología microbiana',
        6,
        'obligatoria',
        2,
        2,
        NULL,
        7
    );

INSERT INTO asignatura
VALUES (
        69,
        'Ingeniería genética',
        6,
        'obligatoria',
        2,
        2,
        NULL,
        7
    );

INSERT INTO asignatura
VALUES (
        70,
        'Inmunología',
        6,
        'obligatoria',
        2,
        2,
        NULL,
        7
    );

INSERT INTO asignatura
VALUES (
        71,
        'Virología',
        6,
        'obligatoria',
        2,
        2,
        NULL,
        7
    );

INSERT INTO asignatura
VALUES (
        72,
        'Bases moleculares del desarrollo vegetal',
        4.5,
        'obligatoria',
        3,
        1,
        NULL,
        7
    );

INSERT INTO asignatura
VALUES (
        73,
        'Fisiología animal',
        4.5,
        'obligatoria',
        3,
        1,
        NULL,
        7
    );

INSERT INTO asignatura
VALUES (
        74,
        'Metabolismo y biosíntesis de biomoléculas',
        6,
        'obligatoria',
        3,
        1,
        NULL,
        7
    );

INSERT INTO asignatura
VALUES (
        75,
        'Operaciones de separación',
        6,
        'obligatoria',
        3,
        1,
        NULL,
        7
    );

INSERT INTO asignatura
VALUES (
        76,
        'Patología molecular de plantas',
        4.5,
        'obligatoria',
        3,
        1,
        NULL,
        7
    );

INSERT INTO asignatura
VALUES (
        77,
        'Técnicas instrumentales básicas',
        4.5,
        'obligatoria',
        3,
        1,
        NULL,
        7
    );

INSERT INTO asignatura
VALUES (
        78,
        'Bioinformática',
        4.5,
        'obligatoria',
        3,
        2,
        NULL,
        7
    );

INSERT INTO asignatura
VALUES (
        79,
        'Biotecnología de los productos hortofrutículas',
        4.5,
        'obligatoria',
        3,
        2,
        NULL,
        7
    );

INSERT INTO asignatura
VALUES (
        80,
        'Biotecnología vegetal',
        6,
        'obligatoria',
        3,
        2,
        NULL,
        7
    );

INSERT INTO asignatura
VALUES (
        81,
        'Genómica y proteómica',
        4.5,
        'obligatoria',
        3,
        2,
        NULL,
        7
    );

INSERT INTO asignatura
VALUES (
        82,
        'Procesos biotecnológicos',
        6,
        'obligatoria',
        3,
        2,
        NULL,
        7
    );

INSERT INTO asignatura
VALUES (
        83,
        'Técnicas instrumentales avanzadas',
        4.5,
        'obligatoria',
        3,
        2,
        NULL,
        7
    );

/* Curso escolar */

INSERT INTO curso_escolar VALUES (1, 2014, 2015);

INSERT INTO curso_escolar VALUES (2, 2015, 2016);

INSERT INTO curso_escolar VALUES (3, 2016, 2017);

INSERT INTO curso_escolar VALUES (4, 2017, 2018);

INSERT INTO curso_escolar VALUES (5, 2018, 2019);

/* Alumno se matricula en asignatura */

INSERT INTO alumno_se_matricula_asignatura VALUES (1, 1, 1);

INSERT INTO alumno_se_matricula_asignatura VALUES (1, 2, 1);

INSERT INTO alumno_se_matricula_asignatura VALUES (1, 3, 1);

INSERT INTO alumno_se_matricula_asignatura VALUES (2, 1, 1);

INSERT INTO alumno_se_matricula_asignatura VALUES (2, 2, 1);

INSERT INTO alumno_se_matricula_asignatura VALUES (2, 3, 1);

INSERT INTO alumno_se_matricula_asignatura VALUES (4, 1, 1);

INSERT INTO alumno_se_matricula_asignatura VALUES (4, 2, 1);

INSERT INTO alumno_se_matricula_asignatura VALUES (4, 3, 1);

INSERT INTO alumno_se_matricula_asignatura VALUES (24, 1, 5);

INSERT INTO alumno_se_matricula_asignatura VALUES (24, 2, 5);

INSERT INTO alumno_se_matricula_asignatura VALUES (24, 3, 5);

INSERT INTO alumno_se_matricula_asignatura VALUES (24, 4, 5);

INSERT INTO alumno_se_matricula_asignatura VALUES (24, 5, 5);

INSERT INTO alumno_se_matricula_asignatura VALUES (24, 6, 5);

INSERT INTO alumno_se_matricula_asignatura VALUES (24, 7, 5);

INSERT INTO alumno_se_matricula_asignatura VALUES (24, 8, 5);

INSERT INTO alumno_se_matricula_asignatura VALUES (24, 9, 5);

INSERT INTO alumno_se_matricula_asignatura VALUES (24, 10, 5);

INSERT INTO alumno_se_matricula_asignatura VALUES (23, 1, 5);

INSERT INTO alumno_se_matricula_asignatura VALUES (23, 2, 5);

INSERT INTO alumno_se_matricula_asignatura VALUES (23, 3, 5);

INSERT INTO alumno_se_matricula_asignatura VALUES (23, 4, 5);

INSERT INTO alumno_se_matricula_asignatura VALUES (23, 5, 5);

INSERT INTO alumno_se_matricula_asignatura VALUES (23, 6, 5);

INSERT INTO alumno_se_matricula_asignatura VALUES (23, 7, 5);

INSERT INTO alumno_se_matricula_asignatura VALUES (23, 8, 5);

INSERT INTO alumno_se_matricula_asignatura VALUES (23, 9, 5);

INSERT INTO alumno_se_matricula_asignatura VALUES (23, 10, 5);

INSERT INTO alumno_se_matricula_asignatura VALUES (19, 1, 5);

INSERT INTO alumno_se_matricula_asignatura VALUES (19, 2, 5);

INSERT INTO alumno_se_matricula_asignatura VALUES (19, 3, 5);

INSERT INTO alumno_se_matricula_asignatura VALUES (19, 4, 5);

INSERT INTO alumno_se_matricula_asignatura VALUES (19, 5, 5);

INSERT INTO alumno_se_matricula_asignatura VALUES (19, 6, 5);

INSERT INTO alumno_se_matricula_asignatura VALUES (19, 7, 5);

INSERT INTO alumno_se_matricula_asignatura VALUES (19, 8, 5);

INSERT INTO alumno_se_matricula_asignatura VALUES (19, 9, 5);

INSERT INTO alumno_se_matricula_asignatura VALUES (19, 10, 5);

-- Retorna un llistat amb el primer cognom, segon cognom i el nom de tots els/les alumnes. El llistat haurà d'estar ordenat alfabèticament de menor a major pel primer cognom, segon cognom i nom.

SELECT
    persona.apellido1,
    persona.apellido2,
    persona.nombre
FROM persona
WHERE persona.tipo = 'alumno'
ORDER BY
    persona.apellido1,
    persona.apellido2,
    persona.nombre;

-- Esbrina el nom i els dos cognoms dels alumnes que no han donat d'alta el seu número de telèfon en la base de dades.

SELECT
    persona.nombre,
    persona.apellido1,
    persona.apellido2
FROM persona
WHERE
    persona.tipo = 'alumno'
    AND persona.telefono IS NULL;

-- Retorna el llistat dels alumnes que van néixer en 1999.

SELECT
    persona.nombre,
    persona.apellido1,
    persona.apellido2
FROM persona
WHERE
    persona.tipo = 'alumno'
    AND persona.fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31';

-- Retorna el llistat de professors/es que no han donat d'alta el seu número de telèfon en la base de dades i a més el seu NIF acaba en K.

SELECT
    persona.nombre,
    persona.apellido1,
    persona.apellido2
FROM persona
WHERE
    persona.tipo = 'profesor'
    AND persona.telefono IS NULL
    AND persona.nif LIKE '%K';

-- Retorna el llistat de les assignatures que s'imparteixen en el primer quadrimestre, en el tercer curs del grau que té l'identificador 7.

SELECT asignatura.nombre
FROM asignatura
WHERE
    asignatura.curso = 3
    AND asignatura.cuatrimestre = 1
    AND id_grado = 7;

-- Retorna un llistat dels professors/es juntament amb el nom del departament al qual estan vinculats. El llistat ha de retornar quatre columnes, primer cognom, segon cognom, nom i nom del departament. El resultat estarà ordenat alfabèticament de menor a major pels cognoms i el nom.

SELECT
    persona.apellido1,
    persona.apellido2,
    persona.nombre,
    departamento.nombre
FROM persona
    INNER JOIN profesor ON persona.id = profesor.id_departamento
    INNER JOIN departamento ON profesor.id_departamento = departamento.id
WHERE persona.tipo = 'profesor'
ORDER BY
    persona.apellido1,
    persona.apellido2,
    persona.nombre;

-- Retorna un llistat amb el nom de les assignatures, any d'inici i any de fi del curs escolar de l'alumne/a amb NIF 26902806M.

SELECT
    asignatura.nombre,
    curso_escolar.anyo_inicio,
    curso_escolar.anyo_fin
FROM asignatura
    INNER JOIN alumno_se_matricula_asignatura ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura
    INNER JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id
    INNER JOIN persona ON alumno_se_matricula_asignatura.id_alumno = persona.id
WHERE persona.nif = '26902806M';

-- Retorna un llistat amb el nom de tots els departaments que tenen professors/es que imparteixen alguna assignatura en el Grau en Enginyeria Informàtica (Pla 2015).

SELECT
    DISTINCT departamento.nombre
FROM departamento
    INNER JOIN profesor ON departamento.id = profesor.id_departamento
    INNER JOIN asignatura ON profesor.id_departamento = asignatura.id_profesor
WHERE
    asignatura.nombre = 'Grau en Enginyeria Informàtica (Pla 2015)';

-- Retorna un llistat amb tots els alumnes que s'han matriculat en alguna assignatura durant el curs escolar 2018/2019.

SELECT
    DISTINCT persona.nombre,
    persona.apellido1,
    persona.apellido2
FROM persona
    INNER JOIN alumno_se_matricula_asignatura ON persona.id = alumno_se_matricula_asignatura.id_alumno
    INNER JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id
WHERE
    curso_escolar.anyo_inicio = 2018
    AND curso_escolar.anyo_fin = 2019;

-- Resol les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN.

-- Retorna un llistat amb els noms de tots els professors/es i els departaments que tenen vinculats. El llistat també ha de mostrar aquells professors/es que no tenen cap departament associat. El llistat ha de retornar quatre columnes, nom del departament, primer cognom, segon cognom i nom del professor/a. El resultat estarà ordenat alfabèticament de menor a major pel nom del departament, cognoms i el nom.

SELECT
    departamento.nombre,
    persona.apellido1,
    persona.apellido2,
    persona.nombre
FROM persona
    LEFT JOIN profesor ON persona.id = profesor.id_departamento
    LEFT JOIN departamento ON profesor.id_departamento = departamento.id
WHERE persona.tipo = 'profesor'
ORDER BY
    departamento.nombre,
    persona.apellido1,
    persona.apellido2,
    persona.nombre;

-- Retorna un llistat amb els professors/es que no estan associats a un departament.

SELECT
    persona.nombre,
    persona.apellido1,
    persona.apellido2
FROM persona
    LEFT JOIN profesor ON persona.id = profesor.id_departamento
    LEFT JOIN departamento ON profesor.id_departamento = departamento.id
WHERE
    persona.tipo = 'profesor'
    AND departamento.nombre IS NULL;

-- Retorna un llistat amb els departaments que no tenen professors/es associats.

SELECT departamento.nombre
FROM departamento
    RIGHT JOIN profesor ON departamento.id = profesor.id_departamento
    RIGHT JOIN persona ON profesor.id_departamento = persona.id
WHERE
    persona.tipo = 'profesor'
    AND persona.nombre IS NULL;

-- Retorna un llistat amb els professors/es que no imparteixen cap assignatura.

SELECT
    persona.nombre,
    persona.apellido1,
    persona.apellido2
FROM persona
    LEFT JOIN profesor ON persona.id = profesor.id_departamento
    LEFT JOIN asignatura ON profesor.id_departamento = asignatura.id_profesor
WHERE
    persona.tipo = 'profesor'
    AND asignatura.nombre IS NULL;

-- Retorna un llistat amb les assignatures que no tenen un professor/a assignat.

SELECT asignatura.nombre
FROM asignatura
    RIGHT JOIN profesor ON asignatura.id_profesor = profesor.id_departamento
    RIGHT JOIN persona ON profesor.id_departamento = persona.id
WHERE
    persona.tipo = 'profesor'
    AND persona.nombre IS NULL;

-- Retorna un llistat amb tots els departaments que no han impartit assignatures en cap curs escolar.

SELECT
    DISTINCT departamento.nombre
FROM departamento
    LEFT JOIN profesor ON departamento.id = profesor.id_departamento
    LEFT JOIN asignatura ON profesor.id_departamento = asignatura.id_profesor
    LEFT JOIN alumno_se_matricula_asignatura ON asignatura.id = alumno_se_matricula_asignatura.id_asignatura
    LEFT JOIN curso_escolar ON alumno_se_matricula_asignatura.id_curso_escolar = curso_escolar.id
WHERE
    curso_escolar.anyo_inicio IS NULL
    AND curso_escolar.anyo_fin IS NULL;

-- Consultes resum:

-- Retorna el nombre total d'alumnes que hi ha.

SELECT COUNT(*) FROM persona WHERE tipo = 'alumno';

-- Calcula quants alumnes van néixer en 1999.

SELECT COUNT(*)
FROM persona
WHERE
    tipo = 'alumno'
    AND fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31';

-- Calcula quants professors/es hi ha en cada departament. El resultat només ha de mostrar dues columnes, una amb el nom del departament i una altra amb el nombre de professors/es que hi ha en aquest departament. El resultat només ha d'incloure els departaments que tenen professors/es associats i haurà d'estar ordenat de major a menor pel nombre de professors/es.

SELECT
    departamento.nombre,
    COUNT(profesor.id_departamento)
FROM departamento
    INNER JOIN profesor ON departamento.id = profesor.id_departamento
GROUP BY departamento.nombre
ORDER BY
    COUNT(profesor.id_departamento) DESC;

-- Retorna un llistat amb tots els departaments i el nombre de professors/es que hi ha en cadascun d'ells. Tingui en compte que poden existir departaments que no tenen professors/es associats. Aquests departaments també han d'aparèixer en el llistat.

SELECT
    departamento.nombre,
    COUNT(profesor.id_departamento)
FROM departamento
    LEFT JOIN profesor ON departamento.id = profesor.id_departamento
GROUP BY departamento.nombre;

-- Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun. Tingues en compte que poden existir graus que no tenen assignatures associades. Aquests graus també han d'aparèixer en el llistat. El resultat haurà d'estar ordenat de major a menor pel nombre d'assignatures.

SELECT
    grado.nombre,
    COUNT(asignatura.id_grado)
FROM grado
    LEFT JOIN asignatura ON grado.id = asignatura.id_grado
GROUP BY grado.nombre
ORDER BY
    COUNT(asignatura.id_grado) DESC;

-- Retorna un llistat amb el nom de tots els graus existents en la base de dades i el nombre d'assignatures que té cadascun, dels graus que tinguin més de 40 assignatures associades.

SELECT
    grado.nombre,
    COUNT(asignatura.id_grado)
FROM grado
    LEFT JOIN asignatura ON grado.id = asignatura.id_grado
GROUP BY grado.nombre
HAVING
    COUNT(asignatura.id_grado) > 40;

-- Retorna un llistat que mostri el nom dels graus i la suma del nombre total de crèdits que hi ha per a cada tipus d'assignatura. El resultat ha de tenir tres columnes: nom del grau, tipus d'assignatura i la suma dels crèdits de totes les assignatures que hi ha d'aquest tipus.

SELECT
    grado.nombre,
    asignatura.tipo,
    SUM(asignatura.creditos)
FROM grado
    INNER JOIN asignatura ON grado.id = asignatura.id_grado
GROUP BY
    grado.nombre,
    asignatura.tipo;

-- Retorna un llistat que mostri quants alumnes s'han matriculat d'alguna assignatura en cadascun dels cursos escolars. El resultat haurà de mostrar dues columnes, una columna amb l'any d'inici del curs escolar i una altra amb el nombre d'alumnes matriculats.

SELECT
    curso_escolar.anyo_inicio,
    COUNT(
        alumno_se_matricula_asignatura.id_alumno
    )
FROM curso_escolar
    INNER JOIN alumno_se_matricula_asignatura ON curso_escolar.id = alumno_se_matricula_asignatura.id_curso_escolar
GROUP BY
    curso_escolar.anyo_inicio;

-- Retorna un llistat amb el nombre d'assignatures que imparteix cada professor/a. El llistat ha de tenir en compte aquells professors/es que no imparteixen cap assignatura. El resultat mostrarà cinc columnes: id, nom, primer cognom, segon cognom i nombre d'assignatures. El resultat estarà ordenat de major a menor pel nombre d'assignatures.

SELECT
    persona.id,
    persona.nombre,
    persona.apellido1,
    persona.apellido2,
    COUNT(asignatura.id_profesor)
FROM persona
    LEFT JOIN profesor ON persona.id = profesor.id_profesor
    LEFT JOIN asignatura ON profesor.id_profesor = asignatura.id_profesor
GROUP BY
    persona.id,
    persona.nombre,
    persona.apellido1,
    persona.apellido2
ORDER BY
    COUNT(asignatura.id_profesor) DESC;

-- Retorna totes les dades de l'alumne/a més jove.

SELECT *
FROM persona
WHERE
    tipo = 'alumno'
    AND fecha_nacimiento = (
        SELECT
            MIN(fecha_nacimiento)
        FROM persona
        WHERE tipo = 'alumno'
    );

-- Retorna un llistat amb els professors/es que tenen un departament associat i que no imparteixen cap assignatura.

SELECT *
FROM profesor
WHERE
    id_departamento IS NOT NULL
    AND id_profesor NOT IN (
        SELECT id_profesor
        FROM asignatura
    );