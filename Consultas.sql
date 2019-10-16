--Consultas DB

--Vista de Clientes

CREATE VIEW vLISTA_CLIENTES WITH ENCRYPTION AS
	SELECT USUARIO.Username,
		USUARIO.Nombre,USUARIO.PrimerApellido,
		USUARIO.SegundoApellido, CLIENTE.Cedula, 
		CLIENTE.PerfilCliente, NACIONALIDAD.Nacionalidad
		FROM USUARIO
		INNER JOIN CLIENTE ON USUARIO.Username = CLIENTE.Username
		INNER JOIN NACIONALIDAD ON CLIENTE.IdNacionalidad=NACIONALIDAD.Id

--SELECT * FROM vLISTA_CLIENTES;


--Obtener ID de nacionalidad
CREATE FUNCTION getNacionalidadId(@nacionalidad VARCHAR(30) ) RETURNS INT
AS
BEGIN
	DECLARE @Id INT
	SET @Id= (SELECT Id FROM NACIONALIDAD 
		WHERE @nacionalidad=Nacionalidad)
	RETURN @Id
END


--Obtener ID de nacionalidad
CREATE FUNCTION getNombreCompleto(@username VARCHAR(50)) RETURNS VARCHAR(50)
AS
BEGIN
	DECLARE @Nombre VARCHAR(50)
	SET @Nombre=CONCAT((SELECT USUARIO.Nombre FROM USUARIO 
		WHERE @username=USUARIO.Username),' ',(SELECT USUARIO.PrimerApellido FROM USUARIO 
		WHERE @username=USUARIO.Username),' ',(SELECT USUARIO.SegundoApellido FROM USUARIO 
		WHERE @username=USUARIO.Username))
	RETURN @Nombre
END



--Registro de nuevo Usuario

--Registro de nuevo Usuario
CREATE PROCEDURE NuevoCliente 
@username VARCHAR(50),
@contrasena VARCHAR(50),
@correo VARCHAR(50),
@nombre VARCHAR(15),
@pApellido VARCHAR(15),
@sApellido VARCHAR(15),
@fecha DATE,
@nacionalidad INT,
@cedula INT,
@perfil VARCHAR(20)
AS	
	
	IF EXISTS(SELECT * FROM USUARIO
		WHERE Username=@username)--Si existe el Username Ingresado
		BEGIN--Inicia Sentencia
			SELECT 'ERROR: Usuario Registrado'
		END
	ELSE
		BEGIN
			INSERT INTO USUARIO(Username,Contrasena,Nombre,PrimerApellido,SegundoApellido,FechaIngreso,Correo)
            VALUES(@username,@contrasena,@nombre,@pApellido,@sApellido,@fecha,@correo)

			INSERT INTO CLIENTE(Username,IdNacionalidad,Cedula,PerfilCliente)
					VALUES(@username,@nacionalidad,@cedula,@perfil)
		END



--Vista de Facturacion
CREATE VIEW vFACTURAS WITH ENCRYPTION AS
	SELECT  (SELECT dbo.getNombreCompleto(USUARIO.Username))AS Nombre,
	FACTURA.Monto, FACTURA.Fecha, ANUNCIO.TipoAnuncio,
	USUARIO.Correo
	FROM FACTURA 
	INNER JOIN ANUNCIO ON ANUNCIO.Id = FACTURA.IdAnuncio
	INNER JOIN PROPIEDAD ON ANUNCIO.IdPropiedad = PROPIEDAD.Id
	INNER JOIN USUARIO ON PROPIEDAD.Propietario = USUARIO.Username



--SELECT  * FROM vFACTURAS
--Vista PROPIEDADES
CREATE VIEW vPROPIEDADES WITH ENCRYPTION AS
	SELECT PROPIEDAD.Propietario, PROPIEDAD.Titulo,
		PROPIEDAD.CantidadHabitaciones,
		PROPIEDAD.CantidadBanos, UBICACION.Provincia,
		UBICACION.Canton,UBICACION.Distrito, INMUEBLE.TipoPropiedad,
		PROPIEDAD.TamanoLote, PROPIEDAD.TamanoPropiedad, PROPIEDAD.Piscina,
		PROPIEDAD.ParqueoVisitas, PROPIEDAD.Parqueo, TIPO_PISO.Piso,
		PROPIEDAD.Precio, PROPIEDAD.Gimnasio 
		FROM PROPIEDAD
		INNER JOIN UBICACION ON PROPIEDAD.IdUbicacion = UBICACION.Id
		INNER JOIN INMUEBLE ON PROPIEDAD.TipoPropiedad=INMUEBLE.Id
		INNER JOIN TIPO_PISO ON PROPIEDAD.TipoPiso=TIPO_PISO.Id




	
--Funcion para obtener la fecha en la que termina un anuncio
CREATE FUNCTION getFechaInicialAnuncio(@id INT ) RETURNS DATE
AS
BEGIN
	DECLARE @fecha DATE
	SET @fecha= (SELECT FechaInicial FROM ANUNCIO 
		WHERE @id=Id)
	RETURN @fecha
END

--Funcion para obtener la fecha en la que inicia un anuncio
CREATE FUNCTION getFechaFinalAnuncio(@id INT ) RETURNS DATE
AS
BEGIN
	DECLARE @fecha DATE
	SET @fecha= (SELECT FechaFinal FROM ANUNCIO 
		WHERE @id=Id)
	RETURN @fecha
END

--MEtodo para obetener el precio de un anuncio a oartir de un ID
CREATE FUNCTION getPrecioAnuncio(@id INT) RETURNS INT
AS
BEGIN
	DECLARE @precio INT
	SET @precio= (SELECT Precio FROM ANUNCIO 
		INNER JOIN TIPO_ANUNCIO ON TIPO_ANUNCIO.Nombre=ANUNCIO.TipoAnuncio
		WHERE @id=Id)
	RETURN @precio
END


CREATE FUNCTION getMontoFactura(@id INT) RETURNS INT
AS
BEGIN
	DECLARE @precio INT
	SET @precio= (SELECT Precio FROM ANUNCIO 
		INNER JOIN TIPO_ANUNCIO ON TIPO_ANUNCIO.Nombre=ANUNCIO.TipoAnuncio
		WHERE @id=Id)
	RETURN @precio
END

/*

--INSERCION de Facturas
CREATE PROCEDURE NuevaFactura 
@id_anuncio INT,
@fecha DATE
AS	
	DECLARE @monto INT
	DECLARE @fechaInicial INT
	DECLARE @fechaFinal INT
	DECLARE @costoAnuncio INT
	SET @fechaInicial =(SELECT dbo.getFechaInicialAnuncio(@id_anuncio))
	SET @fechaFinal=(SELECT dbo.getFechaFinalAnuncio(@id_anuncio))
	SET @costoAnuncio=(SELECT dbo.getPrecioAnuncio(@id_anuncio))
	SET @monto= SELECT((SELECT DATEDIFF(day,
   '2007-05-07 09:53:01.0376635',
   '2007-05-08 09:53:01.0376635'))*5)
   --SELECT((SELECT DATEDIFF(day, @fechaInicial, @fechaFinal))*@costoAnuncio)
	INSERT INTO FACTURA(Monto,IdAnuncio,Fecha) 
	VALUES(@monto,@id_anuncio,@fecha)



	SELECT((SELECT DATEDIFF(day,
   '2007-05-07 09:53:01.0376635',
   '2007-05-08 09:53:01.0376635'))*5)

   */