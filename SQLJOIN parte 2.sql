USE ClubPadel;

SELECT IdAlumno, Nombre, Edad
FROM Alumno
WHERE IdAlumno = 7;

SELECT IdClase, Nombre, Cupo
FROM Clase
WHERE IdClase = 6;

INSERT INTO Alumno(IdAlumno, Nombre, Edad)
VALUES (7, 'Julia', 26)

INSERT INTO Clase(IdClase, Nombre, Cupo)
VALUES (6, 'Octava', 8)

SELECT *
FROM Reserva
WHERE IdAlumno = 7;

SELECT *
FROM Reserva
WHERE IdClase = 6;

SELECT a.IdAlumno, a.Nombre, r.IdReserva
FROM Alumno AS a
LEFT JOIN Reserva AS r
ON a.IdAlumno = r.IdAlumno
ORDER BY a.IdAlumno ASC, r.IdReserva ASC

SELECT a.IdAlumno, a.Nombre, a.Edad
FROM Alumno AS a
LEFT JOIN Reserva AS r
ON a.IdAlumno = r.IdAlumno
WHERE r.IdAlumno IS NULL
ORDER BY a.IdAlumno ASC

SELECT *
FROM Reserva

SELECT *
FROM Clase

SELECT *
FROM Alumno

SELECT c.IdClase, c.Nombre AS Clase, r.IdReserva
FROM Clase AS c
LEFT JOIN Reserva AS r
ON c.IdClase = r.IdClase
--WHERE r.IdAlumno IS NULL
ORDER BY c.IdClase ASC, r.IdReserva ASC

SELECT c.IdClase, c.Nombre AS Clase, c.Cupo
FROM Clase AS c
LEFT JOIN Reserva AS r
ON c.IdClase = r.IdClase
WHERE r.IdReserva IS NULL
ORDER BY c.IdClase ASC, r.IdReserva ASC

SELECT 
    a.IdAlumno, 
	a.Nombre AS Alumno,
	r.IdReserva, 
	c.IdClase, 
	c.Nombre AS Clase
FROM Alumno AS a
LEFT JOIN Reserva AS r
    ON a.IdAlumno = r.IdAlumno
LEFT JOIN Clase AS c
    ON r.IdClase = c.IdClase
ORDER BY a.IdAlumno ASC, r.IdReserva ASC;