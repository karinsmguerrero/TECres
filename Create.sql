create database TECres


create table USUARIO(

	Correo VARCHAR(50) NOT NULL,
	Nombre VARCHAR(15) NOT NULL,
	PrimerApellido VARCHAR(15) NOT NULL,
	SegundoApellido VARCHAR(15) NOT NULL,
	Contrasena VARCHAR(50) NOT NULL,
	FechaIngreso DATE,
	PRIMARY KEY (Correo)
)

create table OCUPACION(
	Id INT NOT NULL IDENTITY(1,1),
	Nombre VARCHAR(15) NOT NULL,
	PRIMARY KEY (Id)
)


create table COMPRADOR(

	Correo VARCHAR(50) NOT NULL,
	FechaNacimiento DATE NOT NULL,
	IngresoMensual INT NOT NULL,
	IdOcupacion INT NOT NULL,
	Domicilio INT NOT NULL,
	Sexo VARCHAR(5) NOT NULL,
	PRIMARY KEY (Correo),
	FOREIGN KEY(Correo) REFERENCES USUARIO(Correo)
)





create table PERFIL_CLIENTE(
	Nombre VARCHAR(15) NOT NULL,
	Descripcion VARCHAR(50) NOT NULL,
	Predeterminado BIT DEFAULT (0),
	PRIMARY KEY (Nombre)
)

create table CLIENTE(
	Correo VARCHAR(50) NOT NULL,
	IdNacionalidad INT NOT NULL,
	Cedula INT NOT NULL,
	PerfilCliente VARCHAR(15) NOT NULL,
	PRIMARY KEY (Correo),
	UNIQUE (Cedula)
)


create table ADMINISTRADOR(
	Correo VARCHAR(50) NOT NULL,
	Cedula INT NOT NULL,
	PRIMARY KEY (Correo),
	UNIQUE (Cedula)
)


create table MENSAJE(
	Id INT NOT NULL IDENTITY(1,1),
	IdAnuncio INT NOT NULL,
	Fecha DATE NOT NULL,
	Hora TIME NOT NULL,
	Texto VARCHAR(80) NOT NULL,
	Comprador VARCHAR(50) NOT NULL,
	Agente VARCHAR(50) NOT NULL,
	PRIMARY KEY (Id)
)

create table ANUNCIO(
	Id INT NOT NULL IDENTITY(1,1),
	IdPropiedad INT NOT NULL,
	TipoAnuncio VARCHAR(20) NOT NULL,
	Tarjeta INT NOT NULL,
	IdAgente VARCHAR(50) NOT NULL,
	Estado BIT DEFAULT(0),
	Venta BIT DEFAULT (1),
	IdPublico INT,
	PRIMARY KEY (Id)
)

create table TIPO_ANUNCIO(
	Nombre VARCHAR(30) NOT NULL,
	Precio INT NOT NULL,
	Predeterminado BIT DEFAULT (0),
	PRIMARY KEY (Nombre)

)

create table PROPIEDAD(
	Id INT NOT NULL IDENTITY(1,1),
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

create table INMUEBLE(
	Id INT NOT NULL IDENTITY(1,1),
	Tipo VARCHAR(10) NOT NULL,
	Predeterminado BIT DEFAULT (0),
	PRIMARY KEY (Id)

)


create table UBICACION(
	Id INT NOT NULL IDENTITY(1,1),
	Provincia VARCHAR(15) NOT NULL,
	Canton VARCHAR(15) NOT NULL,
	Distrito VARCHAR(50) NOT NULL,
	PRIMARY KEY (Id)

)

create table TIPO_PISO(
	Id INT NOT NULL IDENTITY(1,1),
	Tipo VARCHAR(30) NOT NULL,
	Predeterminado BIT DEFAULT (0),
	PRIMARY KEY (Id)

)

create table NACIONALIDAD(
	Id INT NOT NULL IDENTITY(1,1),
	Nacionalidad VARCHAR(10) NOT NULL,
	PRIMARY KEY (Id)

)


CREATE TABLE FOTOS(
	Id INT NOT NULL IDENTITY(1,1),
	Ruta VARCHAR(200),
	IdPropiedad INT NOT NULL,
	PRIMARY KEY (Id)
)


CREATE TABLE PUBLICO(
	FechaInicial DATE NOT NULL,
	FechaFinal DATE NOT NULL,
	CantidadMensajes INT NOT NULL,
	IngresoInicial INT NOT NULL,
	IngresoFinal INT NOT NULL,
	Sexo VARCHAR(5) NOT NULL,
	EdadInicial INT NOT NULL,
	EdadFinal INT NOT NULL,
)
