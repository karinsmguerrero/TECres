/*
* Consultas DB
*/



-- Registro Cliente
INSERT INTO USUARIO(Correo,Nombre,PrimerApellido,SegundoApellido,Contrasena,FechaIngreso)
VALUES ('carl@gmail.com','Carlos','Zamora','Flores','856','2019-05-12');

SELECT Nombre FROM PERFIL_CLIENTE;

SELECT * FROM NACIONALIDAD;

INSERT INTO CLIENTE(Correo,IdNacionalidad,Cedula,PerfilCliente)
VALUES ('carl@gmail.com',4,116890858,'Agente');


-- Login Cliente
Select Contrasena
FROM USUARIO 
WHERE Correo IN(
	SELECT USUARIO.Correo, USUARIO.Contrasena
	FROM USUARIO
	INNER JOIN CLIENTE ON USUARIO.Correo = CLIENTE.Correo
)

--Informacion Usuarios
SELECT *
FROM CLIENTE
WHERE EXISTS (
SELECT USUARIO.Correo, USUARIO.Contrasena, CLIENTE.PerfilCliente,
	FROM USUARIO
	INNER JOIN CLIENTE ON USUARIO.Correo = CLIENTE.Correo
	INNER JOIN NACIONALIDAD ON CLIENTE.IdNacionalidad=NACIONALIDAD.Id
)

--Obtener Contrasena de CLIENTE
SELECT Contrasena,Correo
FROM USUARIO
WHERE EXISTS (
SELECT USUARIO.Correo,
		USUARIO.Nombre,USUARIO.PrimerApellido,
		USUARIO.SegundoApellido, CLIENTE.Cedula, 
		CLIENTE.PerfilCliente
	FROM USUARIO
	INNER JOIN CLIENTE ON USUARIO.Correo = CLIENTE.Correo
)

SELECT *
FROM (
	SELECT Contrasena,Correo
		FROM USUARIO
		WHERE EXISTS (
		SELECT USUARIO.Correo,
				USUARIO.Nombre,USUARIO.PrimerApellido,
				USUARIO.SegundoApellido, CLIENTE.Cedula, 
				CLIENTE.PerfilCliente
			FROM USUARIO
			INNER JOIN CLIENTE ON USUARIO.Correo = CLIENTE.Correo
		)
)

SELECT *
	FROM USUARIO 
	WHERE EXISTS(
	SELECT USUARIO.Correo,
			USUARIO.Nombre,USUARIO.PrimerApellido,
			USUARIO.SegundoApellido, CLIENTE.Cedula, 
			CLIENTE.PerfilCliente
		FROM USUARIO
		INNER JOIN CLIENTE ON USUARIO.Correo = CLIENTE.Correo
	)



SELECT Contrasena
FROM USUARIO
WHERE EXISTS (
SELECT USUARIO.Correo,
		USUARIO.Nombre,USUARIO.PrimerApellido,
		USUARIO.SegundoApellido, CLIENTE.Cedula, 
		CLIENTE.PerfilCliente
	FROM USUARIO
	INNER JOIN CLIENTE ON USUARIO.Correo = CLIENTE.Correo
)

--DROP VIEW LISTA_CLIENTES
--VISTA LISTA CLIENTES OK
CREATE VIEW LISTA_CLIENTES WITH ENCRYPTION AS
	SELECT USUARIO.Correo,
		USUARIO.Nombre,USUARIO.PrimerApellido,
		USUARIO.SegundoApellido, CLIENTE.Cedula, 
		CLIENTE.PerfilCliente, NACIONALIDAD.Nacionalidad
		FROM USUARIO
		INNER JOIN CLIENTE ON USUARIO.Correo = CLIENTE.Correo
		INNER JOIN NACIONALIDAD ON CLIENTE.IdNacionalidad=NACIONALIDAD.Id

SELECT * FROM LISTA_CLIENTES;


UPDATE LISTA_CLIENTES SET PrimerApellido = 'Segura' WHERE Correo='gio@gmail.com';


SELECT * FROM USUARIO;


SELECT Contrasena FROM USUARIO WHERE Correo = 'gio@gmail.com';

IF object_id('procesoA') IS NOT NULL
	DROP PROCEDURE procesoA
ELSE
	SELECT 'NO EXISTE'
/*
Vistas
*/


--SENTENCIA SQL
--SELECT CLIENTE.Correo, CLIENTE.Cedula, CLIENTE.PerfilCliente, NACIONALIDAD.Nacionalidad, USUARIO.Nombre, USUARIO.PrimerApellido,USUARIO.SegundoApellido,USUARIO.FechaIngreso

SELECT  USUARIO.Nombre, 
		USUARIO.PrimerApellido,USUARIO.SegundoApellido,USUARIO.FechaIngreso,
		CLIENTE.Cedula, CLIENTE.Correo, CLIENTE.Cedula, CLIENTE.PerfilCliente, NACIONALIDAD.Nacionalidad
		FROM USUARIO
		WHERE Correo IN(
		SELECT *
		FROM USUARIO
		INNER JOIN CLIENTE ON USUARIO.Correo = CLIENTE.Correo
		INNER JOIN NACIONALIDAD ON CLIENTE.IdNacionalidad = NACIONALIDAD.Id
		);
		
--DECLARE @correoVar VARCHAR(50) --Declaracion variable de correoInput
--SET @correoVar = 'gio@gmail.com' Asignarle un valor a la variable
/*
* Consulta Registro de un nuevo cliente
*/
CREATE PROCEDURE A
@correo VARCHAR(50)
AS
EXCEC LoginCliente @correo

CREATE PROCEDURE LoginCliente 
@correoVar VARCHAR(50)
AS	
	IF EXISTS(SELECT * FROM USUARIO
		WHERE Correo=@correoVar)--Si existe el correo Ingresado
		BEGIN--Inicia Sentencia
			IF EXISTS(SELECT * FROM CLIENTE
			WHERE Correo=@correoVar)
				BEGIN
					SELECT 'La cuenta ya existe'
				END
			ELSE
				BEGIN
					--INSERT INTO CLIENTE(Correo,IdNacionalidad,Cedula,PerfilCliente)
					--VALUES (@correoVar,4,116890858,'Agente');
					SELECT 'Usuario Registrado'
				END
		END--Finaliza Sentencia
	ELSE
		BEGIN
			--INSERT INTO USUARIO(Correo,Nombre,PrimerApellido,SegundoApellido,Contrasena,FechaIngreso)
			--VALUES ('carl@gmail.com','Carlos','Zamora','Flores','856','2019-05-12');
			SELECT 'NO EXISTE R'
		END
--Finaliza proceso Registro de Cliente
EXEC LoginCliente 'gio@gmail.com'
SELECT * FROM CLIENTE
DROP PROC LoginCliente
--DROP PROC getClientes
CREATE PROCEDURE GetClientes AS
	SELECT USUARIO.Correo,
		USUARIO.Nombre,USUARIO.PrimerApellido,
		USUARIO.SegundoApellido, CLIENTE.Cedula, 
		CLIENTE.PerfilCliente, NACIONALIDAD.Nacionalidad
		FROM USUARIO
		INNER JOIN CLIENTE ON USUARIO.Correo = CLIENTE.Correo
		INNER JOIN NACIONALIDAD ON CLIENTE.IdNacionalidad=NACIONALIDAD.Id

EXEC getClientes

SELECT Nombre FROM USUARIO WHERE Correo='q'


(SELECT * FROM USUARIO
			WHERE Correo='gio@gmail.com')
					
				




CREATE PROCEDURE LoginCliente 
@correoVar VARCHAR(50),
@passVar VARCHAR(50) OUTPUT 
AS	
	IF EXISTS(SELECT * FROM USUARIO
		WHERE Correo=@correoVar)--Si existe el correo Ingresado
		BEGIN--Inicia Sentencia
			IF EXISTS(SELECT * FROM CLIENTE
			WHERE Correo=@correoVar)
				BEGIN
					SET @passVar = (SELECT Contrasena FROM USUARIO 
					WHERE @correoVar=USUARIO.Correo)
				END
			
		END--Finaliza Sentencia
	
--Finaliza proceso Registro de Cliente
DECLARE @pass VARCHAR(50)
EXEC LoginCliente 'gio@gmail.com', @pass OUTPUT
SELECT @pass

DROP PROCEDURE LoginCliente
SELECT * FROM CLIENTE



CREATE VIEW LISTA_CLIENTES WITH ENCRYPTION AS
	SELECT USUARIO.Correo,
		USUARIO.Nombre,USUARIO.PrimerApellido,
		USUARIO.SegundoApellido, CLIENTE.Cedula, 
		CLIENTE.PerfilCliente, NACIONALIDAD.Nacionalidad
		FROM USUARIO
		INNER JOIN CLIENTE ON USUARIO.Correo = CLIENTE.Correo
		INNER JOIN NACIONALIDAD ON CLIENTE.IdNacionalidad=NACIONALIDAD.Id

SELECT * FROM LISTA_CLIENTES;
--Falta ver lo de las fotos
CREATE VIEW LISTA_PROPIEDADES WITH ENCRYPTION AS
	SELECT PROPIEDAD.Id,PROPIEDAD.CantidadBanos, UBICACION.*,INMUEBLE.TipoPropiedad, 
	 PROPIEDAD.TamanoLote,PROPIEDAD.TamanoPropiedad, 
	 PROPIEDAD.Piscina, PROPIEDAD.Parqueo, PROPIEDAD.ParqueoVisitas,
	 TIPO_PISO.Tipo,PROPIEDAD.CantidadNiveles, PROPIEDAD.CantidadHabitaciones,
	 PROPIEDAD.Propietario, PROPIEDAD.Gimnasio, PROPIEDAD.Precio

		FROM PROPIEDAD
		INNER JOIN INMUEBLE ON PROPIEDAD.TipoPropiedad = INMUEBLE.Id
		INNER JOIN UBICACION ON PROPIEDAD.IdUbicacion=UBICACION.Id
		INNER JOIN TIPO_PISO ON PROPIEDAD.TipoPiso=TIPO_PISO.id


SELECT * FROM LISTA_PROPIEDADES;

/*
BUSQUEDA DE PROPIEDADES
Se emplean varios Filtros de búsqueda:
El resultado sería un listado de todas las propiedades que
cumplan con los criterios de búsqueda, este listado mostrará la foto principal de la
propiedad, ubicación exacta, precio, metros cuadrados de construcción y del terreno
y el precio resaltado.

*/

--Busqueda por
SELECT * FROM LISTA_PROPIEDADES
	WHERE LISTA_PROPIEDADES.Piscina=1;--AGREGAR CRITERIOS DE BUSQUEDA



CREATE PROCEDURE UpdateCliente 
@correoVar VARCHAR(50),
@nombreVar VARCHAR(15),
@prApellidoVar VARCHAR(15),
@seApellidoVar VARCHAR(15),
@contrasenaVar VARCHAR(50),
@idNacionalidadVar INT,
@cedulaVar INT,
@perfilVar VARCHAR(20)
AS	
	IF EXISTS(SELECT * FROM USUARIO
		WHERE Correo=@correoVar)--Si existe el correo Ingresado
		BEGIN--Inicia Sentencia
			IF EXISTS(SELECT * FROM CLIENTE
			WHERE Correo=@correoVar)
				BEGIN
					UPDATE USUARIO SET PrimerApellido = @PrApellidoVar WHERE Correo=@correoVar;
				END
			
		END--Finaliza Sentencia
	

CREATE PROCEDURE DeleteCliente 
@correoVar VARCHAR(50)
AS	
	IF EXISTS(SELECT * FROM USUARIO
		WHERE Correo=@correoVar)--Si existe el correo Ingresado
		BEGIN--Inicia Sentencia
			IF EXISTS(SELECT * FROM CLIENTE
			WHERE Correo=@correoVar)
				BEGIN
					DELETE FROM CLIENTE WHERE CLIENTE.Correo=@correoVar
					DELETE FROM USUARIO WHERE USUARIO.Correo=@correoVar
				END
			
		END--Finaliza Sentencia
	

/**
Gestión de Propiedades: El sistema debe permitir crear, modificar y eliminar
propiedades. 
Para el registro de una propiedad se desea conocer: Título de la
propiedad, descripción de la propiedad, dueño (cliente), Tipo Inmueble (Lote, casa,
apartamento), ubicación de la propiedad, metros cuadrados del terreno, metros
cuadrados de construcción, cantidad de habitaciones, cantidad de baños, cantidad
de parqueos, tipo de piso (concreto lujado, cerámica, porcelanato), niveles,
gimnasio, piscina, parqueo para visitas, listado de fotos del inmueble y precio
*/

--Obtener Propiedad:
--SELECT * FROM LISTA_PROPIEDADES WHERE LISTA_PROPIEDADES.Id=1;
--Obtener lista de ubicaciones
SELECT Provincia,Canton,Distrito FROM UBICACION;
--Obtener Id de Ubicacion

--Obtener Tipos de Piso
SELECT Piso FROM TIPO_PISO;

CREATE PROCEDURE InsertPropiedad 
AS	
	--INSERT INTO PROPIEDAD

