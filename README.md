# ClubPadel SQL

Proyecto de práctica de SQL Server y Git para consultar alumnos,
clases y reservas de un club de pádel.

## Herramientas

- SQL Server.
- SQL Server Management Studio (SSMS).
- Git y GitHub.

## Tablas y relaciones

- Alumno: guarda el identificador, nombre y edad de cada alumno.
- Clase: guarda el identificador, nombre y cupo de cada clase.
- Reserva: relaciona un alumno con una clase mediante
  las claves foráneas IdAlumno e IdClase.

Un alumno puede tener varias reservas y una clase puede
recibir varias reservas.

## Consultas

- Evaluacion_SQL.sql: contiene diez consultas sobre filtros,
  ordenamiento, uniones, alumnos sin reservas, totales,
  reservas por clase, lugares libres y porcentaje de ocupación.
- reportes_clase.sql: muestra las clases que tienen
  al menos dos reservas.

## Cómo ejecutar

1. Tener SQL Server y SSMS instalados.
2. Tener creada la base ClubPadel con las tablas
   Alumno, Clase y Reserva, sus relaciones y datos de prueba.
3. Abrir el archivo SQL deseado en SSMS.
4. Conectarse al servidor y ejecutar las consultas.

Descargar este repositorio no crea automáticamente la base de datos.