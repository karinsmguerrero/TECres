/*******************************************************************************************************
********************************************************************************************************
*******************											********************************************
*******************											********************************************
*******************			        TEC-RES					********************************************
*******************											********************************************
*******************											********************************************
********************************************************************************************************
********************************************************************************************************/



--//////////////////////////////////////////CONSULTAS/////////////////////////////////////////////////////



/*******************************************************************************************************
********************************************************************************************************
*******************											********************************************
*******************											********************************************
*******************			      FUNCIONES					********************************************
*******************											********************************************
*******************											********************************************
********************************************************************************************************
********************************************************************************************************/

GO
/***************************************************************************************
*Tipo: Función
*Descripción: Concatena el nombre de un Usuario
*Párametros Entrada: Username:VARCHAR(50)
*Parámetros Salida: Nombre Completo:VARCHAR(50)
***************************************************************************************/
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


GO

/***************************************************************************************
*Tipo: Función
*Descripción: Obtiene el Id de una nacionalidad
*Párametros Entrada: nacionalidad:VARCHAR(30)
*Parámetros Salida: Id:INT
***************************************************************************************/
CREATE FUNCTION getNacionalidadId(@nacionalidad VARCHAR(30) ) RETURNS INT
AS
BEGIN
	DECLARE @Id INT
	SET @Id= (SELECT Id FROM NACIONALIDAD 
		WHERE @nacionalidad=Nacionalidad)
	RETURN @Id
END

GO	
/***************************************************************************************
*Tipo: Función
*Descripción: Obtiene la fecha en la que termina un anuncio
*Párametros Entrada: IdAnuncio:INT
*Parámetros Salida: FechaCaducidad:DATE
***************************************************************************************/
CREATE FUNCTION getFechaInicialAnuncio(@id INT ) RETURNS DATE
AS
BEGIN
	DECLARE @fecha DATE
	SET @fecha= (SELECT FechaInicial FROM ANUNCIO 
		WHERE @id=Id)
	RETURN @fecha
END

GO

/***************************************************************************************
*Tipo: Función
*Descripción: Obtiene la fecha en la que inicia un anuncio
*Párametros Entrada: IdAnuncio:INT
*Parámetros Salida: FechaInicial:INT
***************************************************************************************/
CREATE FUNCTION getFechaFinalAnuncio(@id INT ) RETURNS DATE
AS
BEGIN
	DECLARE @fecha DATE
	SET @fecha= (SELECT FechaFinal FROM ANUNCIO 
		WHERE @id=Id)
	RETURN @fecha
END


GO
/***************************************************************************************
*Tipo: Función
*Descripción: Obtiene el precio por día precio de un Auncio 
*Párametros Entrada: Anuncio:INT
*Parámetros Salida: Precio:INT
***************************************************************************************/
CREATE FUNCTION getPrecioAnuncio(@id INT) RETURNS INT
AS
BEGIN
	DECLARE @precio INT
	SET @precio= (SELECT Precio FROM ANUNCIO 
		INNER JOIN TIPO_ANUNCIO ON TIPO_ANUNCIO.Nombre=ANUNCIO.TipoAnuncio
		WHERE @id=Id)
	RETURN @precio
END
GO
/***************************************************************************************
*Tipo: Función 
*Descripción: Calcula los días entre dos fechas dadas
*Párametros Entrada: Fecha Inicial:DATE, Fecha Final:DATE
*Parámetros Salida: Cantidad de días: INT
***************************************************************************************/
CREATE FUNCTION cantDias(@fechaInicial DATE,@fechaFinal DATE) RETURNS INT
AS
BEGIN
	DECLARE @dias INT
	SET @dias= (SELECT DATEDIFF(day, @fechaInicial, @fechaFinal))
	RETURN @dias
END

GO
/***************************************************************************************
*Tipo: Función
*Descripción: Obtiene el tipo de cuenta de un usuario
*Párametros Entrada: Username:VARCHAR(50)
*Parámetros Salida: TipoCuenta:VARCHAR(20)
**************************************************************************************/
CREATE FUNCTION getTipoCuenta(@username VARCHAR(50)) RETURNS VARCHAR(20)
AS
BEGIN
	DECLARE @cuenta VARCHAR(20)
	IF EXISTS(SELECT Username FROM CLIENTE 
	WHERE Username=@username)
		BEGIN
			SET @cuenta= (SELECT PerfilCliente FROM
			CLIENTE WHERE Username=@username)
		END
	IF EXISTS(SELECT Username FROM ADMINISTRADOR 
	WHERE Username=@username)
		BEGIN
			SET @cuenta= 'ADMINISTRAD0R605'
		END
	IF EXISTS(SELECT Username FROM COMPRADOR 
	WHERE Username=@username)
		BEGIN
			SET @cuenta= 'C0MPRAD0R605'
		END
	RETURN @cuenta
END

/*******************************************************************************************************
********************************************************************************************************
*******************											********************************************
*******************											********************************************
*******************			      PROCESOS					********************************************
*******************											********************************************
*******************											********************************************
********************************************************************************************************
********************************************************************************************************/

GO
/***************************************************************************************
*Tipo: Proceso
*Descripción: Registro de un nuevo Cliente
*Párametros Entrada: [Username:VARCHAR(50), Contraseña:VARCHAR(50), 
* Correo:VARCHAR(50),Nombre:VARCHAR(15), Primer Apellido:VARCHAR(15),
* Segundo Apellido VARCHAR(15), Fecha Ingreso:DATE, IdNacionalidad:INT,
* Cedula:INT, Perfil Cliente:VARCHAR(20)]
*Parámetros Salida: N/A
***************************************************************************************/
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
			SELECT '-1'
		END
	ELSE
		BEGIN
			INSERT INTO USUARIO(Username,Contrasena,Nombre,PrimerApellido,SegundoApellido,FechaIngreso,Correo)
            VALUES(@username,@contrasena,@nombre,@pApellido,@sApellido,@fecha,@correo)

			INSERT INTO CLIENTE(Username,IdNacionalidad,Cedula,PerfilCliente)
					VALUES(@username,@nacionalidad,@cedula,@perfil)
		END

GO
/***************************************************************************************
*Tipo: Proceso
*Descripción: Registro Administrador
*Párametros Entrada: [Username:VARCHAR(50), Contraseña:VARCHAR(50), 
* Correo:VARCHAR(50),Nombre:VARCHAR(15), Primer Apellido:VARCHAR(15),
* Segundo Apellido VARCHAR(15), Fecha Ingreso:DATE, IdNacionalidad:INT,
* Cedula:INT]
*Parámetros Salida: N/A
***************************************************************************************/
CREATE PROCEDURE NuevoAdministrador
@username VARCHAR(50),
@contrasena VARCHAR(50),
@correo VARCHAR(50),
@nombre VARCHAR(15),
@pApellido VARCHAR(15),
@sApellido VARCHAR(15),
@fecha DATE,
@cedula INT
AS	
	
	IF EXISTS(SELECT * FROM USUARIO
		WHERE Username=@username)--Si existe el Username Ingresado
		BEGIN--Inicia Sentencia
			SELECT '-1'
		END
	ELSE
		BEGIN
			INSERT INTO USUARIO(Username,Contrasena,Nombre,PrimerApellido,SegundoApellido,FechaIngreso,Correo)
            VALUES(@username,@contrasena,@nombre,@pApellido,@sApellido,@fecha,@correo)

			INSERT INTO ADMINISTRADOR(Username,Cedula)
					VALUES(@username,@cedula)
		END
				
GO

/***************************************************************************************
*Tipo: Proceso
*Descripción: Registro de comprador
*Párametros Entrada: [Username:VARCHAR(50), Contraseña:VARCHAR(50), 
* Correo:VARCHAR(50),Nombre:VARCHAR(15), Primer Apellido:VARCHAR(15),
* Segundo Apellido VARCHAR(15), Fecha Ingreso:DATE, IdDomicilio:INT,
* Cedula:INT, IdOcupacion:INT, Ingresos:INT,Sexo:VARCHAR(5),Nacimiento:DATE]
*Parámetros Salida: N/A
***************************************************************************************/
CREATE PROCEDURE NuevoComprador 
@username VARCHAR(50),
@contrasena VARCHAR(50),
@correo VARCHAR(50),
@nombre VARCHAR(15),
@pApellido VARCHAR(15),
@sApellido VARCHAR(15),
@fecha DATE,
@cedula INT,
@ocupacion INT,
@ingreso INT,
@domicilio INT,
@sexo VARCHAR(5),
@nacimiento DATE
AS	
	
	IF EXISTS(SELECT * FROM USUARIO
		WHERE Username=@username)--Si existe el Username Ingresado
		BEGIN--Inicia Sentencia
			SELECT '-1'
		END
	ELSE
		BEGIN
			INSERT INTO USUARIO(Username,Contrasena,Nombre,PrimerApellido,SegundoApellido,FechaIngreso,Correo)
            VALUES(@username,@contrasena,@nombre,@pApellido,@sApellido,@fecha,@correo)

			INSERT INTO COMPRADOR(Username,FechaNacimiento,IdOcupacion,Domicilio,Sexo)
					VALUES(@username,@nacimiento,@ocupacion,@domicilio,@sexo)
		END

GO
--INSERCION de Facturas
/***************************************************************************************
*Tipo: Proceso
*Descripción: Agregar nueva Factura
*Párametros Entrada: Id Anuncio:INT, Fecha:DATE
*Parámetros Salida: N/A
***************************************************************************************/
CREATE PROCEDURE NuevaFactura 
@id_anuncio INT,
@fecha DATE
AS	
	DECLARE @monto INT
	DECLARE @fechaInicial DATE
	DECLARE @fechaFinal DATE
	DECLARE @costoAnuncio INT
	SET @fechaInicial =dbo.getFechaInicialAnuncio(@id_anuncio)
	SET @fechaFinal=dbo.getFechaFinalAnuncio(@id_anuncio)
	SET @costoAnuncio=dbo.getPrecioAnuncio(@id_anuncio)
	SET @monto= dbo.cantDias(@fechaInicial, @fechaFinal)*@costoAnuncio
	INSERT INTO FACTURA(Monto,IdAnuncio,Fecha) 
	VALUES(@monto,@id_anuncio,@fecha)

GO

/***************************************************************************************
*Tipo: PROCESO
*Descripción: Obtiene los credenciales de sesión de una cuenta 
*Párametros Entrada: Username:VARCHAR(50)
*Parámetros Salida: N/A
***************************************************************************************/
CREATE PROCEDURE getCredenciales
@username VARCHAR(50)
AS	
	IF NOT EXISTS(SELECT * FROM USUARIO
		WHERE Username=@username)--Si existe el Username Ingresado
		BEGIN--Inicia Sentencia
			SELECT '-1'
		END
	ELSE
		BEGIN
			SELECT (SELECT dbo.getTipoCuenta(@username)) AS TipoCuenta,
			(SELECT dbo.getNombreCompleto(@username))AS Nombre, 
			@username AS Username, Contrasena
			FROM USUARIO
			WHERE Username=@username
		END

GO


/*******************************************************************************************************
********************************************************************************************************
*******************											********************************************
*******************											********************************************
*******************			      VISTAS					********************************************
*******************											********************************************
*******************											********************************************
********************************************************************************************************
********************************************************************************************************/


GO
/***************************************************************************************
*Tipo: Vista
*Descripción: Vista de los datos esenciales del Usuario tipo Cliente
*Datos: Username, Nombre, Primer Apellido, Segundo Apellido, Cédula,
*Perfil Cliente, Nacionalidad
*Párametros Entrada: N/A
*Parámetros Salida: N/A
***************************************************************************************/
CREATE VIEW vCLIENTES WITH ENCRYPTION AS
	SELECT USUARIO.Username,
		USUARIO.Nombre,USUARIO.PrimerApellido,
		USUARIO.SegundoApellido, CLIENTE.Cedula, 
		CLIENTE.PerfilCliente, NACIONALIDAD.Nacionalidad
		FROM USUARIO
		INNER JOIN CLIENTE ON USUARIO.Username = CLIENTE.Username
		INNER JOIN NACIONALIDAD ON CLIENTE.IdNacionalidad=NACIONALIDAD.Id
		

GO
/***************************************************************************************
*Tipo: Vista
*Descripción: Lista de facturas
*Datos: Nombre, Monto, Fecha, Tipo Anuncio, Correo, Username
*Párametros Entrada: N/A
*Parámetros Salida: N/A
***************************************************************************************/
CREATE VIEW vFACTURAS WITH ENCRYPTION AS
	SELECT  (SELECT dbo.getNombreCompleto(USUARIO.Username))AS Nombre,
	FACTURA.Monto, FACTURA.Fecha, ANUNCIO.TipoAnuncio,
	USUARIO.Correo, USUARIO.Username
	FROM FACTURA 
	INNER JOIN ANUNCIO ON ANUNCIO.Id = FACTURA.IdAnuncio
	INNER JOIN PROPIEDAD ON ANUNCIO.IdPropiedad = PROPIEDAD.Id
	INNER JOIN USUARIO ON PROPIEDAD.Propietario = USUARIO.Username


GO
/***************************************************************************************
*Tipo: Vista
*Descripción: Lista de propiedades 
*Párametros Entrada: N/A
*Parámetros Salida: N/A
***************************************************************************************/
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


GO
/***************************************************************************************
*Tipo: Vista
*Descripción: Lista de administradores
*Datos: Username, Nombre Completo, Cedula, Fecha Ingreso
*Párametros Entrada: N/A
*Parámetros Salida: N/A
***************************************************************************************/
CREATE VIEW vADMINISTRADORES WITH ENCRYPTION AS
	SELECT USUARIO.Username,
		(SELECT dbo.getNombreCompleto(USUARIO.Username))AS Nombre,
		ADMINISTRADOR.Cedula, USUARIO.FechaIngreso
		FROM USUARIO
		INNER JOIN ADMINISTRADOR 
		ON USUARIO.Username = ADMINISTRADOR.Username
		

GO
/***************************************************************************************
*Tipo: Vista
*Descripción: Lista de compradores
*Datos: [Username,Nombre Completo,Ocupacion,FechaNacimiento, Ingreso Mensual
*Domicilio]
*Párametros Entrada: N/A
*Parámetros Salida: N/A
***************************************************************************************/
CREATE VIEW vCOMPRADORES WITH ENCRYPTION AS
	SELECT USUARIO.Username,
		(SELECT dbo.getNombreCompleto(USUARIO.Username))AS Nombre,
		OCUPACION.Nombre AS Ocupacion,
		COMPRADOR.FechaNacimiento,COMPRADOR.IngresoMensual,
		COMPRADOR.Sexo, UBICACION.Provincia,UBICACION.Canton,
		UBICACION.Distrito
		FROM USUARIO
		INNER JOIN COMPRADOR ON USUARIO.Username = COMPRADOR.Username
		INNER JOIN OCUPACION ON COMPRADOR.IdOcupacion=OCUPACION.Id
		INNER JOIN UBICACION ON UBICACION.Id=COMPRADOR.Domicilio



/*******************************************************************************************************
********************************************************************************************************
*******************											********************************************
*******************											********************************************
*******************			       TRIGGERS					********************************************
*******************											********************************************
*******************											********************************************
********************************************************************************************************
********************************************************************************************************/


GO
/***************************************************************************************
*Tipo: TRIGGER
*Descripción: Restricción no permite eliminar ubicaciones predeterminadas
*Acción: DELETE
*Párametros Entrada: N/A
*Parámetros Salida: N/A
***************************************************************************************/
CREATE TRIGGER TRIG_UBICACION ON UBICACION
FOR DELETE
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (
        SELECT *
        FROM deleted
        WHERE Id <487
    )
    BEGIN
        ROLLBACK;
        THROW 50001, 'ERROR: ON DELETE DEFAULT VALUE', 1;
    END
END;

GO
/***************************************************************************************
*Tipo: TRIGGER
*Descripción: Restricción no permite modificar ubicaciones predeterminadas
*Acción: UPDATE
*Párametros Entrada: N/A
*Parámetros Salida: N/A
***************************************************************************************/
CREATE TRIGGER TRIG_UP_UBICACION ON UBICACION
FOR UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (
        SELECT *
        FROM UBICACION
        WHERE Id <487
    )
    BEGIN
        ROLLBACK;
        THROW 50001, 'ERROR: ON UPDATE DEFAULT VALUE', 1;
    END
END;

GO

/***************************************************************************************
*Tipo: TRIGGER
*Descripción: Restricción no permite eliminar Inmuebles predeterminados
*Acción: DELETE
*Párametros Entrada: N/A
*Parámetros Salida: N/A
***************************************************************************************/
CREATE TRIGGER TRIG_INMUEBLE ON INMUEBLE
FOR DELETE
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (
        SELECT *
        FROM deleted
        WHERE Predeterminado = 1
    )
    BEGIN
        ROLLBACK;
        THROW 50001, 'ERROR: ON DELETE DEFAULT VALUE', 1;
    END
END;


GO

/***************************************************************************************
*Tipo: TRIGGER
*Descripción: Restricción no permite modificar inmuebles predeterminados
*Acción: UPDATE
*Párametros Entrada: N/A
*Parámetros Salida: N/A
***************************************************************************************/
CREATE TRIGGER TRIG_UP_INMUEBLE ON INMUEBLE
FOR DELETE
AS
BEGIN

    SET NOCOUNT ON;

    IF EXISTS (
        SELECT *
        FROM INMUEBLE
        WHERE Predeterminado = 1
    )
    BEGIN
        ROLLBACK;
        THROW 50001, 'ERROR: ON UPDATE DEFAULT VALUE', 1;
    END
END;

GO


/***************************************************************************************
*Tipo: TRIGGER
*Descripción: Restricción no permite eliminar perfiles predeterminados
*Acción: DELETE
*Párametros Entrada: N/A
*Parámetros Salida: N/A
***************************************************************************************/
CREATE TRIGGER TRIG_PERFILCLIENTE ON PERFIL_CLIENTE
FOR DELETE
AS
BEGIN

    SET NOCOUNT ON;

    IF EXISTS (
        SELECT *
        FROM deleted
        WHERE Predeterminado = 1
    )
    BEGIN
        ROLLBACK;
        THROW 50001, 'ERROR: ON DELETE DEFAULT VALUE', 1;
    END
END;

GO


/***************************************************************************************
*Tipo: TRIGGER
*Descripción: Restricción no permite modificar perfiles predeterminados
*Acción: UPDATE
*Párametros Entrada: N/A
*Parámetros Salida: N/A
***************************************************************************************/
CREATE TRIGGER TRIG_UP_PERFILCLIENTE ON PERFIL_CLIENTE
FOR UPDATE
AS
BEGIN

    SET NOCOUNT ON;

    IF EXISTS (
        SELECT *
        FROM PERFIL_CLIENTE
        WHERE Predeterminado = 1
    )
    BEGIN
        ROLLBACK;
        THROW 50001, 'ERROR: ON UPDATE DEFAULT VALUE', 1;
    END
END;

GO

/***************************************************************************************
*Tipo: TRIGGER
*Descripción: Restricción no permite eliminar un tipo de anuncio predeterminados
*Acción: DELETE
*Párametros Entrada: N/A
*Parámetros Salida: N/A
***************************************************************************************/
CREATE TRIGGER TRIG_TIPOANUN ON TIPO_ANUNCIO
FOR DELETE
AS
BEGIN

    SET NOCOUNT ON;

    IF EXISTS (
        SELECT *
        FROM deleted
        WHERE Predeterminado = 1
    )
    BEGIN
        ROLLBACK;
        THROW 50001, 'ERROR: ON DELETE DEFAULT VALUE', 1;
    END
END;


GO

/***************************************************************************************
*Tipo: TRIGGER
*Descripción: Restricción no permite modificar tipo de anuncios predeterminados
*Acción:UPDATE 
*Párametros Entrada: N/A
*Parámetros Salida: N/A
***************************************************************************************/
CREATE TRIGGER TRIG_UP_TIPOANUN ON TIPO_ANUNCIO
FOR UPDATE
AS
BEGIN

    SET NOCOUNT ON;

    IF EXISTS (
        SELECT *
        FROM TIPO_ANUNCIO
        WHERE Predeterminado = 1
    )
    BEGIN
        ROLLBACK;
        THROW 50001, 'ERROR: ON UPDATE DEFAULT VALUE', 1;
    END
END;

GO

/***************************************************************************************
*Tipo: TRIGGER
*Descripción: Restricción no permite eliminar tipo de pisos predeterminados
*Acción: DELETE
*Párametros Entrada: N/A
*Parámetros Salida: N/A
***************************************************************************************/
CREATE TRIGGER TRIG_TIPOPISO ON TIPO_PISO
FOR DELETE
AS
BEGIN

    SET NOCOUNT ON;

    IF EXISTS (
        SELECT *
        FROM deleted
        WHERE Predeterminado = 1
    )
    BEGIN
        ROLLBACK;
        THROW 50001, 'ERROR: ON DELETE DEFAULT VALUE', 1;
    END
END;

GO
/***************************************************************************************
*Tipo: TRIGGER
*Descripción: Restricción no permite modificar tipos de pisos predeterminados
*Acción: UPDATE
*Párametros Entrada: N/A
*Parámetros Salida: N/A
***************************************************************************************/
CREATE TRIGGER TRIG_UP_TIPOPISO ON TIPO_PISO
FOR UPDATE
AS
BEGIN
    SET NOCOUNT ON;
    IF EXISTS (
        SELECT *
        FROM TIPO_PISO
        WHERE Predeterminado = 1
    )
    BEGIN
        ROLLBACK;
        THROW 50001, 'ERROR: ON UPDATE DEFAULT VALUE', 1;
    END
END;

GO


/***************************************************************************************
*Tipo: TRIGGER
*Descripción: Eliminar todos los registros asociados a una Propiedad
*Acción: DELETE
*Párametros Entrada: N/A
*Parámetros Salida: N/A
***************************************************************************************/
CREATE TRIGGER TRIG_DEL_PROPIEDAD ON PROPIEDAD
FOR DELETE 
AS DECLARE @id INT
	SELECT @id = del.Id FROM DELETED del;
	DELETE FROM FOTOS WHERE IdPropiedad = @Id
	DELETE FROM ANUNCIO WHERE IdPropiedad = @Id
	PRINT 'TRIGGER SE ELIMINARON TODOS LOS REGISTROS DE LA PROPIEDAD'

GO

/***************************************************************************************
*Tipo: TRIGGER
*Descripción: Eliminar todos los registros asociados a un dueño de propiedades
*Acción: DELETE
*Párametros Entrada: N/A
*Parámetros Salida: N/A
***************************************************************************************/
CREATE TRIGGER TRIG_DEL_CLIENTE ON CLIENTE
FOR DELETE 
AS DECLARE @username VARCHAR(50)
	SELECT @username = del.Username FROM DELETED del;
	DELETE FROM PROPIEDAD WHERE Propietario = @username;
	DELETE FROM USUARIO WHERE Username=@username;
	PRINT 'TRIGGER SE ELIMINARON TODOS LOS REGISTROS DEL CLIENTE'


GO

/***************************************************************************************
*Tipo: TRIGGER
*Descripción: Eliminar todos los registros asociados a un administrador
*Acción: DELETE
*Párametros Entrada: N/A
*Parámetros Salida: N/A
***************************************************************************************/
CREATE TRIGGER TRIG_DEL_ADMIN ON ADMINISTRADOR
FOR DELETE 
AS DECLARE @username VARCHAR(50)
	SELECT @username = del.Username FROM DELETED del;
	DELETE FROM USUARIO WHERE Username=@username;
	PRINT 'TRIGGER SE ELIMINARON TODOS LOS REGISTROS DEL ADMINISTRADOR'

GO
/***************************************************************************************
*Tipo: TRIGGER
*Descripción: Eliminar todos los registros asociados a un comprador
*Acción: DELETE
*Párametros Entrada: N/A
*Parámetros Salida: N/A
***************************************************************************************/
CREATE TRIGGER TRIG_DEL_COMPRADOR ON COMPRADOR
FOR DELETE 
AS DECLARE @username VARCHAR(50)
	SELECT @username = del.Username FROM DELETED del;
	DELETE FROM USUARIO WHERE Username=@username;
	PRINT 'TRIGGER SE ELIMINARON TODOS LOS REGISTROS DEL COMPRADOR'

GO
/***************************************************************************************
*Tipo: TRIGGER
*Descripción: Eliminar todos los registros asociados a un anuncio
*Acción: DELETE
*Párametros Entrada: N/A
*Parámetros Salida: N/A
***************************************************************************************/
CREATE TRIGGER TRIG_DEL_ANUCIO ON ANUNCIO
FOR DELETE 
AS DECLARE @idPub VARCHAR(50)
	SELECT @idPub = del.IdPublico FROM DELETED del;
	DELETE FROM PUBLICO WHERE Id=@idPub;
	PRINT 'TRIGGER SE ELIMINARON TODOS LOS REGISTROS DEL ANUNCIO'