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
	SET @DOMI=GetDomicilio(@Prov,@Canton,@Distrito)
	DECLARE @OCU INT
	SET @OCU=GetOcupacion(@ocupacion)
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
	SELECT 'EL USUARIO NO EXIXSTE'
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
