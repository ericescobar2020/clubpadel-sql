-- Calcula la cantidad de reservas y los lugares libres por clase.
-- LEFT JOIN permite incluir clases sin reservas; COUNT(r.IdReserva) cuenta sus reservas.

USE ClubPadel;

SELECT COUNT(*) AS TotalReservas
FROM Reserva

SELECT COUNT(*) AS Cantidadclases,
       SUM(Cupo) AS Capacidadtotal
FROM Clase

SELECT IdClase,       
COUNT(*) AS CantidadReservas 
FROM Reserva
GROUP BY IdClase 
ORDER BY IdClase ASC;

SELECT c.IdClase,c.Nombre as Clase, c.Cupo,        
CAST(100.0 * COUNT(r.IdReserva) / c.Cupo AS DECIMAL (5,2)) AS OcupacionPorcentaje
FROM Clase as c
LEFT JOIN Reserva AS r
ON c.IdClase = r.IdClase
GROUP BY c.IdClase, c.Nombre ,c.Cupo 
ORDER BY c.IdClase ASC;

SELECT *
FROM Reserva

SELECT *
FROM Clase
SELECT *
FROM Alumno

SELECT c.IdClase,c.Nombre AS Clase, c.Cupo,
COUNT (r.IdReserva) AS [Cantidad de reserva],
c.Cupo - COUNT(r.IdReserva) AS [Lugares libre]
FROM Clase as c
LEFT JOIN Reserva AS r
ON c.IdClase = r.IdClase
GROUP BY c.IdClase, c.Nombre ,c.Cupo 
HAVING c.Cupo - COUNT(r.IdReserva) >=6
ORDER BY c.IdClase ASC;

SELECT c.IdClase, c.Nombre AS Nombre,   
COUNT (r.IdReserva) AS CantidadReservas
FROM Clase as c 
LEFT JOIN Reserva as r
ON c.Idclase = r.IdClase
GROUP BY c.Idclase,c.Nombre
HAVING COUNT (r.IdReserva) >= 2
ORDER BY c.IdClase ASC;