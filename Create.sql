/*******************************************************************************************************
********************************************************************************************************
*******************											********************************************
*******************											********************************************
*******************			        TEC-RES					********************************************
*******************											********************************************
*******************											********************************************
********************************************************************************************************
********************************************************************************************************/

--CREATE TABLE

CREATE TABLE USUARIO(

	Username VARCHAR(50) NOT NULL,
	Nombre VARCHAR(15) NOT NULL,
	PrimerApellido VARCHAR(15) NOT NULL,
	SegundoApellido VARCHAR(15) NOT NULL,
	FechaIngreso DATE,
	Contrasena VARCHAR(100) NOT NULL,
	Correo VARCHAR(50) NOT NULL,
	PRIMARY KEY (Username)
	--Agregar correo
)

CREATE TABLE OCUPACION(
	Id INT NOT NULL IDENTITY(1,1),
	Nombre VARCHAR(20) NOT NULL,
	PRIMARY KEY (Id),
	UNIQUE(Nombre)
)


CREATE TABLE COMPRADOR(

	Username VARCHAR(50) NOT NULL,
	FechaNacimiento DATE NOT NULL,
	IngresoMensual INT NOT NULL,
	IdOcupacion INT NOT NULL,
	Domicilio INT NOT NULL,
	Sexo VARCHAR(5) NOT NULL,
	PRIMARY KEY (Username),
	
)





CREATE TABLE PERFIL_CLIENTE(
	Nombre VARCHAR(20) NOT NULL,
	Descripcion VARCHAR(200) NOT NULL,
	Predeterminado BIT DEFAULT (0),
	PRIMARY KEY (Nombre)
)

CREATE TABLE CLIENTE(
	Username VARCHAR(50) NOT NULL,
	IdNacionalidad INT NOT NULL,
	Cedula INT NOT NULL,
	PerfilCliente VARCHAR(20) NOT NULL,
	PRIMARY KEY (Username),
	UNIQUE (Cedula)
)


CREATE TABLE ADMINISTRADOR(
	Username VARCHAR(50) NOT NULL,
	Cedula INT NOT NULL,
	PRIMARY KEY (Username),
	UNIQUE (Cedula)
)


CREATE TABLE MENSAJE(
	Id INT NOT NULL IDENTITY(1,1),
	IdAnuncio INT NOT NULL,
	Fecha DATE NOT NULL,
	Hora TIME NOT NULL,
	Texto VARCHAR(80) NOT NULL,
	Emisor VARCHAR(50) NOT NULL,
	Receptor VARCHAR(50) NOT NULL,
	Estado BIT DEFAULT (0),
	PRIMARY KEY (Id)
)

CREATE TABLE ANUNCIO(
	Id INT NOT NULL IDENTITY(1,1),
	IdPropiedad INT NOT NULL,
	TipoAnuncio VARCHAR(30) NOT NULL,
	Tarjeta INT NOT NULL,
	IdAgente VARCHAR(50) NOT NULL,
	Estado BIT DEFAULT(0),
	Venta BIT DEFAULT (1),
	IdPublico INT,
	FechaInicial DATE NOT NULL,
	FechaFinal DATE NOT NULL,
	PRIMARY KEY (Id)
)

CREATE TABLE TIPO_ANUNCIO(
	Nombre VARCHAR(30) NOT NULL,
	Precio INT NOT NULL,
	Predeterminado BIT DEFAULT (0),
	PRIMARY KEY (Nombre)

)

CREATE TABLE PROPIEDAD(
	Id INT NOT NULL IDENTITY(1,1),
	Titulo VARCHAR(50) NOT NULL,
	CantidadBanos INT NOT NULL,
	IdUbicacion INT NOT NULL,
	TipoPropiedad INT NOT NULL,
	TamanoLote INT NOT NULL,
	TamanoPropiedad INT NOT NULL,
	Piscina BIT NOT NULL,
	ParqueoVisitas BIT NOT NULL,
	Parqueo BIT NOT NULL,
	TipoPiso INT NOT NULL,
	CantidadNiveles INT DEFAULT (1),
	CantidadHabitaciones INT NOT NULL,
	Precio INT NOT NULL,
	Propietario VARCHAR(50) NOT NULL,
	Gimnasio BIT DEFAULT(0),
	PRIMARY KEY (Id)
)

CREATE TABLE INMUEBLE(
	Id INT NOT NULL IDENTITY(1,1),
	TipoPropiedad VARCHAR(30) NOT NULL, 
	Predeterminado BIT DEFAULT (0),
	PRIMARY KEY (Id),
	UNIQUE(TipoPropiedad)
)


CREATE TABLE UBICACION(
	Id INT NOT NULL IDENTITY(1,1),
	Provincia VARCHAR(30) NOT NULL,
	Canton VARCHAR(50) NOT NULL,
	Distrito VARCHAR(50) NOT NULL,
	PRIMARY KEY (Id)

)

CREATE TABLE TIPO_PISO(
	Id INT NOT NULL IDENTITY(1,1),
	Piso VARCHAR(30) NOT NULL,
	Predeterminado BIT DEFAULT (0),
	PRIMARY KEY (Id)

)

CREATE TABLE NACIONALIDAD(
	Id INT NOT NULL IDENTITY(1,1),
	NAcionalidad VARCHAR(50) NOT NULL,
	PRIMARY KEY (Id)
)


CREATE TABLE FOTOS(
	Id INT NOT NULL IDENTITY(1,1),
	Ruta VARCHAR(350),
	IdPropiedad INT NOT NULL,
	PRIMARY KEY (Id)
)


CREATE TABLE PUBLICO(
	Id INT NOT NULL IDENTITY(1,1),
	CantidadMensajes INT DEFAULT(0),
	IngresoInicial INT NOT NULL,
	IngresoFinal INT NOT NULL,
	Sexo VARCHAR(5) NOT NULL,
	EdadInicial INT NOT NULL,
	EdadFinal INT NOT NULL,
	PRIMARY KEY (Id)
)


CREATE TABLE FACTURA(
	Id INT NOT NULL IDENTITY(1,1),
	Monto INT NOT NULL,
	IdAnuncio INT NOT NULL,
	Fecha DATE,
	PRIMARY KEY (Id)
)