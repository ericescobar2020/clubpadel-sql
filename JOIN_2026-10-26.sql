USE ClubPadel

INSERT INTO Alumno (IdAlumno, Nombre, Edad)
VALUES (6, N'Ana', 22);

SELECT * 
FROM Alumno;

SELECT * 
FROM Reserva;

SELECT * 
FROM Clase;

INSERT INTO Reserva (IdReserva, IdAlumno, IdClase)
VALUES (6,6,1);

UPDATE Alumno
SET Edad = 23
WHERE IdAlumno = 6;

DELETE FROM Alumno
WHERE IdAlumno = 6;

INSERT INTO Alumno (IdAlumno, Nombre, Edad)
VALUES (1, N'Prueba', 20);

INSERT INTO Alumno (IdAlumno, Nombre, Edad)
VALUES (7, NULL, 20);

INSERT INTO Reserva(IdReserva, IdAlumno, IdClase)
VALUES (7,999,1);

SELECT *
FROM Reserva
WHERE IdAlumno = 1;

DELETE FROM Alumno
WHERE IdAlumno = 1;

SELECT Reserva.IdReserva, Clase.Nombre -- las dos columnas que va mostrar
FROM Reserva -- punto de partida 
INNER JOIN Clase -- unir ambas tablas 
    ON Reserva.IdClase = Clase.IdClase
ORDER BY Reserva.IdReserva ASC;

SELECT * 
FROM Reserva;

SELECT * 
FROM Alumno;

SELECT * 
FROM Clase;

SELECT Reserva.IdReserva, Clase.Nombre
FROM Reserva
INNER JOIN Clase
    ON Reserva.IdClase = Clase.IdClase
ORDER BY Reserva.IdReserva ASC;

SELECT 
    Reserva.IdReserva, 
    Reserva.IdAlumno, 
    Alumno.Nombre, 
    Alumno.Edad
FROM Reserva
INNER JOIN Alumno
    ON Reserva.IdAlumno = Alumno.IdAlumno
ORDER BY Reserva.IdReserva ASC;

SELECT 
     Reserva.IdReserva,
	 Alumno.Nombre,
	 Alumno.Edad
FROM Reserva
INNER JOIN Alumno
    ON Reserva.IdAlumno = Alumno.IdAlumno
WHERE Alumno.IdAlumno= 4
ORDER BY Reserva.IdReserva ASC;

SELECT 
    Reserva.IdReserva, 
    Reserva.IdClase, 
    Clase.Nombre, 
    Clase.Cupo
FROM Reserva
INNER JOIN Clase
    ON Reserva.IdClase = Clase.IdClase
ORDER BY Reserva.IdReserva ASC;

SELECT r.IdReserva, c.Nombre AS Clase
FROM Reserva AS r
INNER JOIN Clase AS c
ON r.IdClase = c.IdClase
ORDER BY r.IdReserva ASC;

--Primer paso de J03: escribí únicamente la parte SELECT para mostrar:

SELECT r.IdReserva, a.Nombre AS Alumno,
c.Nombre AS Clase, c.Cupo
FROM Reserva AS r
INNER JOIN Alumno AS a
ON r.IdAlumno = a.IdAlumno
INNER JOIN Clase AS c
ON r.IdClase = c.IdClase
WHERE r.IdReserva = 4;


SELECT r.IdReserva, a.Nombre AS Alumno, c.Nombre AS Clase
FROM Reserva AS r
INNER JOIN Alumno AS a
ON r.IdAlumno = a.IdAlumno
INNER JOIN Clase AS c
ON r.IdClase = c.IdClase
ORDER BY r.IdReserva ASC;

SELECT IdReserva, IdAlumno, IdClase
FROM Reserva
WHERE IdReserva = 6;

SELECT IdAlumno, Nombre, Edad
FROM Alumno
WHERE IdAlumno = 6;

SELECT r.IdReserva, a.Nombre AS Alumno,a.Edad , c.Nombre AS Clase
FROM Reserva AS r
INNER JOIN Alumno AS a
ON r.IdAlumno = a.IdAlumno
INNER JOIN Clase AS c
ON r.IdClase = c.IdClase
WHERE a.Edad >= 18
ORDER BY r.IdReserva ASC;


SELECT r.IdReserva, a.Nombre AS Alumno, c.Nombre AS Clase
FROM Reserva AS r
INNER JOIN Alumno AS a 
ON r.IdAlumno = a.IdAlumno 
INNER JOIN Clase AS c
ON r.IdClase = c.IdClase
WHERE c.Nombre = 'Septima'
ORDER BY r.IdReserva

--J06: reservas de varias clases.
--Necesitás Reserva, Alumno y Clase. 
--Usá IN, que permite aceptar una lista de valores, 
--para seleccionar las clases 1, 3 y 5.
SELECT r.IdReserva, 
       a.Nombre AS Alumno,
       c.IdClase, 
       c.Nombre AS Clase
FROM Reserva AS r
INNER JOIN Alumno AS a 
ON r.IdAlumno = a.IdAlumno 
INNER JOIN Clase AS c
ON r.IdClase = c.IdClase
WHERE c.IdClase IN (1,3,5)
ORDER BY c.IdClase ASC, r.IdReserva ASC;

--J07: alumnos y sus reservas, página 9 del apunte.

SELECT * 
FROM Reserva;

SELECT * 
FROM Alumno;

SELECT * 
FROM Clase;

SELECT a.IdAlumno,
       a.Nombre,
	   r.IdReserva,
	   r.IdClase
FROM Alumno AS a 
INNER JOIN Reserva AS r
ON a.IdAlumno = r.IdAlumno
ORDER BY a.Nombre ASC, r.IdReserva ASC


SELECT r.IdReserva, r.IdAlumno,a.Nombre AS Alumno, c.IdClase, 
c.Nombre AS Clase, c.Cupo
FROM Reserva AS r
INNER JOIN Alumno AS a 
ON r.IdAlumno = a.Idalumno 
INNER JOIN Clase AS c
ON r.IdClase = c.IdClase
ORDER BY r.IdReserva ASC