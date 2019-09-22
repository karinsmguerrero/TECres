

create table PERFIL_CLIENTE(
	Nombre VARCHAR(15) NOT NULL,
	Descripcion VARCHAR(50) NOT NULL,
	PRIMARY KEY (Nombre)
)

create table AGENTE_VENTAS(
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

create table VENDEDOR(
	Correo VARCHAR(50) NOT NULL,
	Cedula INT NOT NULL,
	IdNacionalidad INT NOT NULL,
	PRIMARY KEY (Correo),
	UNIQUE (Cedula)
)


create table MENSAJE(
	Id INT NOT NULL,
	IdAnuncio INT NOT NULL,
	Fecha DATE NOT NULL,
	Hora TIME NOT NULL,
	Texto VARCHAR(80) NOT NULL,
	Comprador VARCHAR(50) NOT NULL,
	Agente VARCHAR(50) NOT NULL,
	PRIMARY KEY (Id)
)

create table ANUNCIO(
	Id INT NOT NULL,
	IdPropiedad INT NOT NULL,
	TipoAnuncio VARCHAR(15) NOT NULL,
	Tarjeta INT NOT NULL,
	FechaInicial DATE NOT NULL,
	FechaFinal DATE NOT NULL,
	CantidadMensajes INT NOT NULL,
	IngresoInicial INT NOT NULL,
	IngresoFinal INT NOT NULL,
	Sexo VARCHAR(20) NOT NULL,
	EdadInicial INT NOT NULL,
	EdadFinal INT NOT NULL,
	IdAgente VARCHAR(50) NOT NULL,
	Estado BIT NOT NULL DEFAULT(0),
	PRIMARY KEY (Id)
)

create table TIPO_ANUNCIO(
	Nombre VARCHAR(20) NOT NULL,
	Precio INT NOT NULL,
	PRIMARY KEY (Nombre)

)

create table PROPIEDAD(
	Id INT NOT NULL,
	CantidadBanos INT NOT NULL,
	IdUbicacion INT NOT NULL,
	TipoPropiedad VARCHAR(15) NOT NULL,
	TamanoLote INT NOT NULL,
	TamanoPropiedad INT NOT NULL,
	Piscina BIT NOT NULL,
	ParqueoVisitas BIT NOT NULL,
	Parqueo BIT NOT NULL,
	TipoPiso INT NOT NULL,
	CantidadNiveles INT DEFAULT (1),
	CantidadHabitaciones INT NOT NULL,
	Precio INT NOT NULL,
	Fotos VARCHAR (200),
	Propietario VARCHAR(50) NOT NULL,
	Gimnasio BIT NOT NULL DEFAULT(0),
	PRIMARY KEY (Id)
)

create table INMUEBLE(
	Tipo VARCHAR(10) NOT NULL,
	PRIMARY KEY (Tipo)

)


create table UBICACION(
	Id INT NOT NULL,
	Provincia VARCHAR(15) NOT NULL,
	Canton VARCHAR(15) NOT NULL,
	Distrito VARCHAR(15) NOT NULL,
	PRIMARY KEY (Id)

)

create table TIPO_PISO(
	Tipo VARCHAR(10) NOT NULL,
	PRIMARY KEY (Tipo)

)

create table NACIONALIDAD(
	Id INT NOT NULL,
	Nacionalidad VARCHAR(10) NOT NULL,
	PRIMARY KEY (Id)

)