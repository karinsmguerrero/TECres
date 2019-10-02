--Consultas DB

--Registro de nuevo Usuario

CREATE PROCEDURE RegistrarCliente 
@username VARCHAR(50),
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
			IF EXISTS(SELECT * FROM CLIENTE
			WHERE Username=@username)
				BEGIN
					SELECT 'ERROR: Usuario Registrado'
				END
			ELSE
				BEGIN
					INSERT INTO CLIENTE(Username,IdNacionalidad,Cedula,PerfilCliente)
					VALUES(@username,@nacionalidad,@cedula,@perfil)
				END	
		END--Finaliza Sentencia IF
	ELSE
		BEGIN
			INSERT INTO USUARIO(Username,Nombre,PrimerApellido,SegundoApellido,FechaIngreso)
            VALUES(@username,@nombre,@pApellido,@sApellido,@fecha)

			INSERT INTO CLIENTE(Username,IdNacionalidad,Cedula,PerfilCliente)
					VALUES(@username,@nacionalidad,@cedula,@perfil)
		END



EXEC RegistrarCliente 'crjose','Jose','Ramirez','Zeledon','2017-03-26',1,116590236,'Agente'

INSERT INTO PERFIL_CLIENTE(Nombre,Descripcion,Predeterminado)
VALUES('Agente','a',1),('Constructor','s',1),('Propietario','u',1),('Anunciante','d',1);

SELECT* FROM PERFIL_CLIENTE

SELECT *FROM CLIENTE

--Vista de Clientes

CREATE VIEW LISTA_CLIENTES WITH ENCRYPTION AS
	SELECT USUARIO.Username,
		USUARIO.Nombre,USUARIO.PrimerApellido,
		USUARIO.SegundoApellido, CLIENTE.Cedula, 
		CLIENTE.PerfilCliente, NACIONALIDAD.Nacionalidad
		FROM USUARIO
		INNER JOIN CLIENTE ON USUARIO.Username = CLIENTE.Username
		INNER JOIN NACIONALIDAD ON CLIENTE.IdNacionalidad=NACIONALIDAD.Id

SELECT * FROM LISTA_CLIENTES;