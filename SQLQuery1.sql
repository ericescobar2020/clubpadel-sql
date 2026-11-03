CREATE DATABASE	ClubEjemplo;
USE ClubEjemplo;

CREATE TABLE Alumno
(
    IdAlumno INT PRIMARY KEY,
    Nombre NVARCHAR(50) NOT NULL,
	Edad INT NOT NULL
);

CREATE TABLE Clase
(
    IdClase INT PRIMARY KEY, --Es mas facil divirlo o indetificarlo por cate o por clase --
    Nombre NVARCHAR(50) NOT NULL,
	Cupo INT NOT NULL
);

USE master;
GO

ALTER DATABASE ClubEjemplo MODIFY NAME = ClubPadel;
GO

USE ClubPadel;

CREATE TABLE Reserva
(
    IdReserva INT PRIMARY KEY,
    IdAlumno INT NOT NULL,
    IdClase INT NOT NULL,

    FOREIGN KEY (IdAlumno) REFERENCES Alumno(IdAlumno),
    FOREIGN KEY (IdClase) REFERENCES Clase(IdClase)
);
INSERT INTO Alumno (IdAlumno, Nombre, Edad)
VALUES (1, N'Eric', 29),
       (2, N'Carlos', 34),
	   (3,N'Leo',15),
	   (4,N'Maria', 30),
	   (5,N'Cesar', 45);

INSERT INTO Alumno (IdAlumno, Nombre, Edad)
VALUES 
	   (3,N'Leo',15),
	   (4,N'Maria', 30),
	   (5,N'Cesar', 45);

INSERT INTO Clase (IdClase, Nombre, Cupo)
VALUES 
	   (1,'Septima',8),
	   (2,'Sexta', 8),
	   (3,'Quinta', 6),
	   (4,'Cuarta', 4),
	   (5,'Tercera', 4);

INSERT INTO Reserva (IdReserva, IdAlumno, IdClase)
VALUES (1, 3, 2),
       (2, 4,1),
	   (3,1,3),
	   (4,5,4);
	   
INSERT INTO Reserva (IdReserva, IdAlumno, IdClase)
VALUES (5,2,5);

SELECT IdReserva, IdAlumno, IdClase
FROM Reserva;

