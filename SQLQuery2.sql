USE ClubPadel;

SELECT Nombre, Cupo
FROM Clase;

SELECT Nombre,Edad
FROM Alumno;

SELECT IdReserva,IdAlumno
FROM Reserva;

SELECT IdAlumno,Nombre,Edad
FROM Alumno
WHERE Edad >= 18;

--Actividad Q04: escribí una nueva consulta que muestre IdAlumno, 
--Nombre y Edad del alumno llamado Eric.
SELECT IdAlumno,Nombre,Edad
FROM Alumno
WHERE Nombre = 'Eric';

--Actividad Q05: escribí una consulta que muestre IdReserva, IdAlumno e IdClase 
--de las reservas cuya clase tenga IdClase = 2.
SELECT IdReserva,IdAlumno,IdClase
FROM Reserva
WHERE IdClase = 2; -- es la clase 'Sexta'

SELECT Nombre, Cupo
FROM Clase
WHERE Cupo >= 4 AND Cupo <= 6;

--Actividad Q06: escribí una consulta que muestre IdAlumno, Nombre y
--Edad de los alumnos que tengan entre 18 y 35 años, 
--incluyendo ambos límites. Usá AND.
SELECT IdAlumno, Nombre,Edad
FROM Alumno
WHERE Edad >= 18 AND Edad <= 35;

--ORDER BY
SELECT IdClase, Nombre, Cupo
FROM Clase
ORDER BY Cupo ASC, IdClase ASC;

--Actividad Q07: escribí una nueva consulta que muestre IdAlumno, 
--Nombre y Edad de todos los alumnos, ordenados por:
--1. Edad ascendente.
--2. IdAlumno ascendente, para resolver posibles empates de edad.
SELECT IdAlumno, Nombre, Edad
FROM Alumno
ORDER BY Edad ASC, IdAlumno ASC;

--Actividad Q08 — práctica autónoma: adaptá tu consulta anterior 
--para mostrar IdAlumno, Nombre y Edad de todos los alumnos, 
--ordenados por:
--1. Edad descendente.
--2. IdAlumno ascendente, para resolver posibles empates.

SELECT IdAlumno, Nombre, Edad
FROM Alumno
ORDER BY Edad DESC, IdAlumno ASC;

--BETWEEN, en la página 7 del apunte. Significa “entre” 
--y permite filtrar un rango incluyendo ambos límites.
--Por ejemplo, para buscar clases con cupo entre 4 y 6:
SELECT IdClase, Nombre, Cupo
FROM Clase
WHERE Cupo BETWEEN 4 AND 6
ORDER BY IdClase ASC;

--Actividad Q09: mostrá IdAlumno, Nombre y Edad de los alumnos 
--que tengan entre 25 y 40 años, usando BETWEEN. Ordená el resultado 
--por IdAlumno ascendente.
SELECT IdAlumno, Nombre, Edad
FROM Alumno
WHERE Edad BETWEEN 25 AND 40
ORDER BY IdAlumno ASC;

--Actividad Q10 — práctica autónoma: escribí una consulta sobre 
--Reserva que:
--1. Muestre IdReserva, IdAlumno e IdClase.
--2. Seleccione las reservas cuyo IdReserva esté entre 2 y 4, incluyendo ambos límites, usando BETWEEN.
--3. Ordene por IdReserva ascendente.

SELECT IdReserva, IdAlumno, IdClase
FROM Reserva
WHERE IdReserva BETWEEN 2 AND 4
ORDER BY IdReserva ASC;

--Por ejemplo, para buscar las clases con identificadores 2 y 4:
SELECT IdClase, Nombre, Cupo
FROM Clase
WHERE IdClase IN (2, 4)
ORDER BY IdClase ASC;

--Actividad Q11: mostrá IdAlumno, Nombre y Edad de los alumnos cuyos 
--identificadores sean 1, 3 o 5, usando IN. Ordená por IdAlumno 
--ascendente.
SELECT IdAlumno, Nombre, Edad
FROM Alumno
WHERE IdAlumno IN (1,3,5)
ORDER BY IdAlumno ASC;

--Muestre IdReserva, IdAlumno e IdClase.
--Seleccione las reservas de las clases cuyos IdClase sean 1, 3 o 5, 
--usando IN.
--Ordene primero por IdClase ascendente y, dentro de cada clase, 
--por IdReserva ascendente.
SELECT IdReserva, IdAlumno, IdClase
FROM Reserva
WHERE IdClase IN (1,3,5)
ORDER BY IdClase ASC,IdReserva ASC;