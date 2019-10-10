--GET PISO
CREATE FUNCTION getPISO(@piso VARCHAR(30)) RETURNS INT
AS
BEGIN
	DECLARE @ID INT
	SET @ID=(SELECT Id FROM TIPO_PISO WHERE Piso=@piso)
	RETURN @ID
END
---GET TIPO PROPIEDAD
CREATE FUNCTION getTIPOP(@propi VARCHAR(30)) RETURNS INT
AS
BEGIN
	DECLARE @ID INT
	SET @ID=(SELECT Id FROM INMUEBLE WHERE TipoPropiedad=@propi)
	RETURN @ID
END
--GET NACIONALIDAD
CREATE FUNCTION getNacionalidadId(@nacionalidad VARCHAR(30) ) RETURNS INT
AS
BEGIN
	DECLARE @Id INT
	SET @Id= (SELECT Id FROM NACIONALIDAD 
		WHERE @nacionalidad=Nacionalidad)
	RETURN @Id
END
--GET OCUPACION
CREATE FUNCTION GetOcupacion(@ocupacion VARCHAR(50)) RETURNS INT
AS
BEGIN
	DECLARE @Id INT
	SET @Id=(SELECT Id FROM OCUPACION
		WHERE @ocupacion=Nombre)
	RETURN @Id
END

--NUEVO CLIENTE
CREATE PROCEDURE NuevoCliente 
@username VARCHAR(50),
@nombre VARCHAR(15),
@pApellido VARCHAR(15),
@sApellido VARCHAR(15),
@fecha DATE,
@nacionalidad VARCHAR(30),
@cedula INT,
@perfil VARCHAR(20)
AS	
	DECLARE @nacId INT
	SET @nacId=dbo.getNacionalidadId(@nacionalidad)
	IF EXISTS(SELECT * FROM USUARIO
		WHERE Username=@username)--Si existe el Username Ingresado
		BEGIN--Inicia Sentencia
			SELECT 'ERROR: Usuario Registrado'
		END
	ELSE
		BEGIN
			INSERT INTO USUARIO(Username,Nombre,PrimerApellido,SegundoApellido,FechaIngreso)
            VALUES(@username,@nombre,@pApellido,@sApellido,@fecha)

			INSERT INTO CLIENTE(Username,IdNacionalidad,Cedula,PerfilCliente)
					VALUES(@username,@nacId,@cedula,@perfil)
		END
--GET UBICACION
CREATE FUNCTION GetDomicilio(@prov VARCHAR(20),@canton VARCHAR(20),@Distrito VARCHAR(25)) RETURNS INT
AS
BEGIN
	DECLARE @Id INT
	SET @Id=(SELECT Id FROM UBICACION
		WHERE (@prov=Provincia AND @canton=Canton AND @Distrito=Distrito))
	RETURN @Id
END
--NUEVO COMPRADOR
CREATE PROCEDURE NuevoComprador
@username VARCHAR(50),
@Nac DATE,
@Ingreso INT,
@nombre VARCHAR(20),
@pApellido VARCHAR(20),
@sApellido VARCHAR(20),
@Fingreso DATE,
@ocupacion VARCHAR(15),
@Prov VARCHAR(30),
@Canton VARCHAR(30),
@Distrito VARCHAR(30),
@Sexo VARCHAR(2)
AS	
	DECLARE @DOMI INT
	SET @DOMI=dbo.GetDomicilio(@Prov,@Canton,@Distrito)
	DECLARE @OCU INT
	SET @OCU=dbo.GetOcupacion(@ocupacion)
	IF EXISTS(SELECT * FROM USUARIO
		WHERE Username=@username)--Si existe el Username Ingresado
		BEGIN--Inicia Sentencia
			SELECT 'ERROR: Usuario Registrado'
		END
	ELSE
		BEGIN
			INSERT INTO USUARIO(Username,Nombre,PrimerApellido,SegundoApellido,FechaIngreso)
            VALUES(@username,@nombre,@pApellido,@sApellido,@Fingreso)

			INSERT INTO COMPRADOR(Username,FechaNacimiento,IngresoMensual,IdOcupacion,Domicilio,Sexo)
					VALUES(@username,@Nac,@Ingreso,@OCU,@DOMI,@Sexo)
		END

--LOGIN COMPRADOR COMTRASEÑA??????????
CREATE PROCEDURE logComprador
@username VARCHAR(50)
AS
IF EXISTS(SELECT Username FROM COMPRADOR WHERE Username=@username)
	BEGIN
		SELECT 'USUARIO CORRECTO'
	END
ELSE
	BEGIN
		SELECT 'EL USUARIO NO EXISTE'
	END

---------ANUNCIO---------
CREATE PROCEDURE AddAnun 
@pro INT,
@tipo VARCHAR(20),
@tarjeta INT,
@agente INT,
@estado BIT,
@venta BIT,
@publico INT
AS
INSERT INTO ANUNCIO(IdPropiedad,TipoAnuncio,Tarjeta,IdAgente,Estado,Venta,IdPublico)
VALUES(@pro,@tipo,@tarjeta,@agente,@estado,@venta,@publico)

CREATE PROCEDURE DelAnuncio(@idAnuncio INT)
AS
IF EXISTS(SELECT Id From ANUNCIO WHERE id=@idAnuncio)
BEGIN
	DELETE FROM ANUNCIO WHERE Id=@idAnuncio
END

CREATE PROCEDURE UpAnun
@ID INT,
@pro INT,
@tipo VARCHAR(20),
@tarjeta INT,
@agente INT,
@estado BIT,
@venta BIT,
@publico INT
AS
UPDATE ANUNCIO
SET IdPropiedad=@pro,TipoAnuncio=@tipo,Tarjeta=@tarjeta,IdAgente=@agente,Estado=@estado,Venta=@venta,IdPublico=@publico
WHERE Id=@ID
------------PUBLICO--------
CREATE PROCEDURE AddPub 
@fi DATE,
@ff DATE,
@mensaje INT,
@ingreso INT,
@fingreso INT,
@sexo BIT,
@edadI INT,
@edadf INT
AS
INSERT INTO PUBLICO(FechaInicial,FechaFinal,CantidadMensajes,IngresoInicial,IngresoFinal,Sexo,EdadInicial,EdadFinal)
VALUES(@fi,@ff,@mensaje,@ingreso,@fingreso,@sexo,@edadI,@edadf)

CREATE PROCEDURE delPublico(@idPublico INT)
AS
IF EXISTS(SELECT Id From PUBLICO WHERE id=@idPublico)
BEGIN
	DELETE FROM ANUNCIO WHERE Id=@idPublico
END
CREATE PROCEDURE UpPub
@ID INT,
@fi DATE,
@ff DATE,
@mensaje INT,
@ingreso INT,
@fingreso INT,
@sexo BIT,
@edadI INT,
@edadf INT
AS
UPDATE PUBLICO
SET FechaInicial=@fi,FechaFinal=@ff,CantidadMensajes=@mensaje,IngresoInicial=@ingreso,IngresoFinal=@fingreso,Sexo=@sexo,EdadInicial=@edadI,EdadFinal=@edadf
WHERE Id=@ID

---------------PERFIL CLIENTE-------------
CREATE PROCEDURE AddPcliente
@nombre VARCHAR(50),
@Descrp VARCHAR(50)
AS
INSERT INTO PERFIL_CLIENTE(Nombre,Descripcion,Predeterminado)
VALUES(@nombre,@Descrp,0)

CREATE PROCEDURE delPcliente
@nombre VARCHAR(50)
AS
IF EXISTS(SELECT Nombre From PERFIL_CLIENTE WHERE Nombre=@nombre)
BEGIN
	DELETE FROM PERFIL_CLIENTE WHERE Nombre=@nombre
END
CREATE PROCEDURE UpPcliente
@nombre VARCHAR(50),
@Descrp VARCHAR(50)
AS
UPDATE PERFIL_CLIENTE
SET Nombre=@nombre,Descripcion=@Descrp
WHERE Nombre=@nombre
------------------TIPO ANUNCIO----------------
CREATE PROCEDURE AddTAnuncio
@nombre VARCHAR(50),
@precio INT
AS
INSERT INTO TIPO_ANUNCIO(Nombre,Precio,Predeterminado)
VALUES(@nombre,@precio,0)

CREATE PROCEDURE delTAnuncio
@nombre VARCHAR(50)
AS
IF EXISTS(SELECT Nombre From TIPO_ANUNCIO WHERE Nombre=@nombre)
BEGIN
	DELETE FROM TIPO_ANUNCIO WHERE Nombre=@nombre
END
CREATE PROCEDURE UpTAnuncio
@nombre VARCHAR(50),
@precio INT
AS
UPDATE TIPO_ANUNCIO
SET Nombre=@nombre,Precio=@precio
WHERE Nombre=@nombre
------------------UBICACIONES------------
CREATE PROCEDURE AddUbi
@prov VARCHAR(50),
@canton VARCHAR(50) ,
@distrito VARCHAR(50)
AS
INSERT INTO UBICACION(Provincia,Canton,Distrito)
VALUES(@prov,@canton,@distrito)

CREATE PROCEDURE DelUbi
@prov VARCHAR(50),
@canton VARCHAR(50) ,
@distrito VARCHAR(50)
AS
IF EXISTS(SELECT * From UBICACION WHERE (Provincia=@prov AND Canton=@canton AND Distrito=@distrito))
	BEGIN
	DELETE FROM UBICACION WHERE (Provincia=@prov AND Canton=@canton AND Distrito=@distrito)
	END
CREATE PROCEDURE UpUbi
@ID INT,
@prov VARCHAR(50),
@canton VARCHAR(50) ,
@distrito VARCHAR(50)
AS
UPDATE UBICACION
SET Provincia=@prov,Canton=@canton,Distrito=@distrito
WHERE Id=@ID
----------OCUPACIONES---------
CREATE PROCEDURE AddOcu
@ocupacion VARCHAR(50)
AS
INSERT INTO OCUPACION(Nombre)
VALUES(@ocupacion)

CREATE PROCEDURE DelOcu
@ocupacion VARCHAR(50)
AS
IF EXISTS(SELECT Nombre FROM OCUPACION WHERE Nombre=@ocupacion)
	BEGIN
	DELETE FROM OCUPACION WHERE Nombre=@ocupacion
	END
CREATE PROCEDURE UpOcu
@ocupacion VARCHAR(50),
@ID INT
AS
UPDATE OCUPACION
SET Nombre=@ocupacion
WHERE Id=@ID
----------ADMIN----------
CREATE PROCEDURE AddAdmin
@username VARCHAR(50),
@cedula INT
AS
IF EXISTS(SELECT Username FROM USUARIO WHERE Username=@username)
	BEGIN
	INSERT INTO ADMINISTRADOR(Username,Cedula)
	VALUES (@username,@cedula)
	END
ELSE
	BEGIN
	SELECT 'EL USUARIO NO EXISTE'
	END
-----GESTION INMUEBLE----------
CREATE PROCEDURE AddInmueble
@mueble VARCHAR(50)
AS
INSERT INTO INMUEBLE(TipoPropiedad,Predeterminado)
VALUES(@mueble,0)

CREATE PROCEDURE DelInmueble
@mueble VARCHAR(50)
AS
IF EXISTS(SELECT TipoPropiedad FROM INMUEBLE WHERE TipoPropiedad=@mueble)
	BEGIN
	DELETE FROM INMUEBLE WHERE TipoPropiedad=@mueble
	END
CREATE PROCEDURE UpInmueble
@mueble VARCHAR(50),
@ID INT
AS
UPDATE INMUEBLE
SET TipoPropiedad=@mueble
WHERE Id=@ID

-----------TIPO DE PISO-----------
CREATE PROCEDURE AddTpiso
@Tipo VARCHAR(30)
AS
INSERT INTO TIPO_PISO(Piso,Predeterminado)
VALUES(@Tipo,0)

CREATE PROCEDURE DelTpiso
@piso VARCHAR(30)
AS
DELETE FROM TIPO_PISO WHERE Piso=@piso
CREATE PROCEDURE UpTpiso
@tipo VARCHAR(30),
@ID INT
As
UPDATE TIPO_PISO
SET Piso=@tipo
WHERE Id=@ID
-------------PROPIEDADES-----------
CREATE PROCEDURE AddPropiedad
@CantidadB int,
@prov varchar(30),
@canton varchar(30),
@distrito varchar(30),
@TipoP VARCHAR(20),
@tLote INT,
@tPro INT,
@Piscina BIT,
@parqueo BIT,
@parqueoV BIT,
@Piso VARCHAR(20),
@niveles INT,
@Habitaciones INT,
@Precio INT,
@propietario VARCHAR(30),
@Gimnasio BIT
AS
INSERT INTO PROPIEDAD(CantidadBanos,IdUbicacion,TipoPropiedad,TamanoLote,TamanoPropiedad,Piscina,ParqueoVisitas,Parqueo,TipoPiso,CantidadNiveles,CantidadHabitaciones,Precio,Propietario,Gimnasio)
VALUES(@CantidadB,dbo.GetDomicilio(@prov,@canton,@distrito),dbo.getTIPOP(@TipoP),@tLote,@tPro,@Piscina,@parqueoV,@parqueo,dbo.getPISO(@Piso),@niveles,@Habitaciones,@Precio,@propietario,@Gimnasio)

CREATE PROCEDURE DelPropiedad(@ID INT)
AS
DELETE FROM PROPIEDAD WHERE Id=@ID

CREATE PROCEDURE UpPropiedad
@ID INT,
@CantidadB int,
@prov varchar(30),
@canton varchar(30),
@distrito varchar(30),
@TipoP VARCHAR(20),
@tLote INT,
@tPro INT,
@Piscina BIT,
@parqueo BIT,
@parqueoV BIT,
@Piso VARCHAR(20),
@niveles INT,
@Habitaciones INT,
@Precio INT,
@propietario VARCHAR(30),
@Gimnasio BIT
AS
UPDATE PROPIEDAD
SET CantidadBanos=@CantidadB,TamanoLote=@tLote,TamanoPropiedad=@tPro,Piscina=@Piscina,ParqueoVisitas=@parqueoV,Parqueo=@parqueo,CantidadNiveles=@niveles,CantidadHabitaciones=@Habitaciones,Precio=@Precio,Propietario=@propietario,Gimnasio=@Gimnasio,TipoPiso=getPISO(@Piso),IdUbicacion=GetDomicilio(@prov,@canton,@distrito),TipoPropiedad=@getTIPOP(@TipoP)
WHERE Id=@ID
-------------VENDEDORES------------





--------LOGIN CLIENTE---------
CREATE PROCEDURE LogCliente(@username VARCHAR(50))
AS
IF EXISTS(SELECT Username FROM CLIENTE WHERE Username=@username)
	BEGIN 
	SELECT 'USUARIO CORRECTO'
	END
ELSE
	BEGIN 
	SELECT 'USUARIO NO EXISTE'
	END
