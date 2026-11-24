USE ClubPadel

SELECT IdAlumno, 
       Nombre, 
	   Edad
FROM Alumno
WHERE Edad >= 18
ORDER BY Edad DESC, IdAlumno ASC;
    
SELECT IdClase, 
       Nombre, 
	   Cupo
FROM Clase
WHERE Cupo >= 6
ORDER BY Cupo DESC, IdClase ASC;

/*Tablas: Reserva, Alumno y Clase.
Mostrá: IdReserva, nombre del alumno con alias Alumno 
y nombre de la clase con alias Clase.
Incluí: solamente las reservas con alumno y clase relacionados.
Orden: IdReserva de menor a mayor.*/
SELECT r.IdReserva, a.Nombre AS Alumno, c.Nombre AS Clase
FROM Reserva r
INNER JOIN Alumno a
ON r.IdAlumno = a.IdAlumno 
INNER JOIN Clase c
ON r.IdClase = c.IdClase
ORDER BY r.IdReserva ASC

/*Tablas: Alumno y Reserva.
Mostrá: IdAlumno, nombre con alias Alumno e IdReserva.
Incluí: todos los alumnos, tengan o no reservas.
Orden: IdAlumno ascendente y, después, IdReserva ascendente.*/
SELECT a.IdAlumno, a.Nombre AS Alumno, r.IdReserva
FROM Alumno a
LEFT JOIN Reserva r
ON a.IdAlumno = r.IdAlumno
ORDER BY a.IdAlumno ASC, r.IdReserva ASC;

/*Tablas: Alumno y Reserva.
Mostrá: IdAlumno, Nombre y Edad.
Incluí: únicamente los alumnos que no tienen ninguna reserva.
Orden: IdAlumno ascendente.*/
SELECT a.IdAlumno, a.Nombre AS Alumno, a.Edad
FROM Alumno a
LEFT JOIN Reserva r
ON a.IdAlumno = r.IdAlumno
WHERE r.IdAlumno IS NULL
ORDER BY a.IdAlumno ASC;

SELECT *
FROM Reserva

SELECT *
FROM Clase
SELECT *
FROM Alumno

SELECT 
    COUNT(*) AS CantidadClases, 
    SUM(Cupo) AS CapacidadTotal
FROM 
    Clase;

/*
Consulta 07 — Cantidad de reservas por clase
- Tablas: Clase y Reserva.
- Mostrá: IdClase, nombre con alias Clase y cantidad de 
  reservas con alias CantidadReservas.
- Incluí: todas las clases; las que no tienen reservas deben 
  mostrar 0.
- Orden: IdClase ascendente.
*/
SELECT c.IdClase, c.Nombre AS Clase, 
COUNT (r.IdReserva) AS CantidadReservas 
FROM Clase c
LEFT JOIN Reserva r 
ON c.IdClase = r.IdClase
GROUP BY 
 c.IdClase,
 c.Nombre
ORDER BY
 c.IdClase ASC;

 /*
 Consulta 08 — Lugares libres por clase
- Tablas: Clase y Reserva.
- Mostrá: IdClase, nombre con alias Clase, Cupo, 
  CantidadReservas y LugaresLibres.
- Calculá: los lugares libres restando las reservas al cupo.
  Cada reserva ocupa un lugar.
- Incluí: todas las clases, incluso las que no tienen reservas.
- Orden: IdClase ascendente.
 */

 SELECT c.IdClase, c.Nombre AS Clase,c.Cupo,
COUNT (r.IdReserva) AS CantidadReservas,
c.Cupo - COUNT(r.IdReserva) AS LugaresLibres
FROM Clase c
LEFT JOIN Reserva r 
ON c.IdClase = r.IdClase
GROUP BY 
 c.IdClase,
 c.Nombre,
 c.Cupo
ORDER BY
 c.IdClase ASC;
 /*
 Consulta 09 — Porcentaje de ocupación por clase
- Tablas: Clase y Reserva.
- Mostrá: IdClase, nombre con alias Clase y porcentaje 
  del cupo ocupado con alias OcupacionPorcentaje.
- Cada reserva ocupa un lugar. Expresá el porcentaje con 
  dos decimales.
- Incluí: todas las clases; las que no tienen reservas 
  deben mostrar 0.00.
- Orden: IdClase ascendente.
 */
  SELECT c.IdClase, c.Nombre AS Clase,
  CAST(COUNT(r.IdReserva) * 100.0 / c.Cupo AS DECIMAL(5,2)) AS OcupacionPorcentaje
FROM Clase c
LEFT JOIN Reserva r 
ON c.IdClase = r.IdClase
GROUP BY 
 c.IdClase,
 c.Nombre,
 c.Cupo
ORDER BY
 c.IdClase ASC;

 /*
 Consulta 10 — Clases con al menos seis lugares libres
- Tablas: Clase y Reserva.
- Mostrá: IdClase, nombre con alias Clase, Cupo, 
  CantidadReservas y LugaresLibres.
- Incluí: únicamente las clases con 6 o más lugares libres, 
  considerando también las que no tienen reservas.
- Orden: IdClase ascendente.
 */
 SELECT c.IdClase, c.Nombre AS Clase, c.Cupo ,
  COUNT (r.IdReserva) AS CantidadReservas,
  c.Cupo - COUNT(r.IdReserva) AS LugaresLibres
FROM Clase c
LEFT JOIN Reserva r 
ON c.IdClase = r.IdClase
GROUP BY 
 c.IdClase,
 c.Nombre,
 c.Cupo
HAVING 
c.Cupo - COUNT(r.IdReserva) >=6
ORDER BY
 c.IdClase ASC;