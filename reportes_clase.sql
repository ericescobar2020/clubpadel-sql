USE ClubPadel;
GO

-- Informe de clases con al menos dos reservas.


SELECT c.IdClase, c.Nombre AS Nombre,   
COUNT (r.IdReserva) AS CantidadReservas
FROM Clase as c 
LEFT JOIN Reserva as r
ON c.Idclase = r.IdClase
GROUP BY c.Idclase,c.Nombre
HAVING COUNT (r.IdReserva) >= 2
ORDER BY c.IdClase ASC;
--MOTRAR 
