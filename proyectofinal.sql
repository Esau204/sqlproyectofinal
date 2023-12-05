DROP DATABASE IF EXISTS Universidad;

CREATE DATABASE IF NOT EXISTS Universidad;

USE Universidad;
CREATE TABLE Alumno (
    matricula INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellidoPaterno VARCHAR(50),
    apellidoMaterno VARCHAR(50),
    email VARCHAR(50),
    edad INT,
    carreraCodigo VARCHAR(5) REFERENCES Carrera(codigoCarrera)
);

CREATE TABLE Carrera (
    codigoCarrera VARCHAR(5) PRIMARY KEY,
    nombre VARCHAR(50),
    descripcion TEXT
);

CREATE TABLE Profesor (
    numeroPersonal INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellidoPaterno VARCHAR(50),
    apellidoMaterno VARCHAR(50),
    email VARCHAR(50),
    gradoEstudios VARCHAR(20)
);

CREATE TABLE Materia (
    codigoMateria VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(50),
    descripcion TEXT,
    creditos INT,
    bloque VARCHAR(20),
    carreraCodigo VARCHAR(5) REFERENCES Carrera(codigoCarrera),
    areaCodigo VARCHAR(5) REFERENCES AreaFormacion(codigoArea)
);


CREATE TABLE OfertaAcademica (
    NRC INT PRIMARY KEY,
    profesorNumeroPersonal INT REFERENCES Profesor(numeroPersonal),
    materiaCodigo VARCHAR(10) REFERENCES Materia(codigoMateria),
    periodoEscolarCodigo VARCHAR(10) REFERENCES PeriodoEscolar(codigoPeriodo)
);

CREATE TABLE AreaFormacion (
    codigoArea VARCHAR(5) PRIMARY KEY,
    nombre VARCHAR(50)
);


CREATE TABLE PeriodoEscolar (
    codigoPeriodo VARCHAR(10) PRIMARY KEY,
    nombre VARCHAR(50),
    fechaInicio DATE,
    fechaFin DATE
);
INSERT INTO Alumno (matricula, nombre, apellidoPaterno, apellidoMaterno, email, edad, carreraCodigo)
VALUES 
    (1, 'Juan', 'Pérez', 'Gómez', 'juan.perez@email.com', 20, 'LIS'),
    (2, 'Ana', 'García', 'López', 'ana.garcia@email.com', 22, 'LICIC'),

INSERT INTO Carrera (codigoCarrera, nombre, descripcion)
VALUES 
    ('LIS', 'Licenciatura en Sistemas', 'Descripción de LIS'),
    ('LICIC', 'Licenciatura en Ciencias de la Computación', 'Descripción de LICIC'),
    ('LE', 'Licenciatura en Educación', 'Descripción de LE'),
    ('LRSC', 'Licenciatura en Redes y Sistemas de Comunicación', 'Descripción de LRSC'),
    ('LTC', 'Licenciatura en Tecnologías de la Computación', 'Descripción de LTC');



INSERT INTO Profesor (numeroPersonal, nombre, apellidoPaterno, apellidoMaterno, email, gradoEstudios)
VALUES 
    (101, 'Carlos', 'Hernández', 'Gómez', 'carlos.hernandez@email.com', 'Maestría'),
    (102, 'Laura', 'Rodríguez', 'Mendoza', 'laura.rodriguez@email.com', 'Doctorado');

INSERT INTO Materia (codigoMateria, nombre, descripcion, creditos, bloque, carreraCodigo, areaCodigo)
VALUES 
    ('MAT101', 'Matemáticas Básicas', 'Curso introductorio de matemáticas', 4, 'Primer Bloque', 'LIS', 'BG'),
    ('INF201', 'Programación I', 'Introducción a la programación', 5, 'Segundo Bloque', 'LICIC', 'BD');

INSERT INTO OfertaAcademica (nrc, matricula, profesorNumeroPersonal, materiaCodigo, periodoEscolarCodigo, calificacion)
VALUES 
    (1, 1, 101, 'MAT101', '202301', 85),
    (2, 2, 102, 'INF201', '202301', 78);

INSERT INTO AreaFormacion (codigoArea, nombre) VALUES
('BG', 'Básica General'),
('ID', 'Iniciación a la Disciplina'),
('DI', 'Disciplinaria'),
('TE', 'Terminal'),
('EL', 'Elección Libre');

INSERT INTO PeriodoEscolar (codigoPeriodo, nombre, fechaInicio, fechaFin) VALUES
('2023A', 'Periodo Escolar 2023-A', '2023-01-01', '2023-06-30'),
('2023B', 'Periodo Escolar 2023-B', '2023-07-01', '2023-12-31');
