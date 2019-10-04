INSERT INTO UBICACION (Provincia,Canton,Distrito)
VALUES
 ('San Jose','San Jose','Carmen'),
 ('San Jose','San Jose','Merced'),
 ('San Jose','San Jose','Hospital'),
 ('San Jose','San Jose','Catedral'),
 ('San Jose','San Jose','Zapote'),
 ('San Jose','San Jose','San Francisco de dos Rios'),
 ('San Jose','San Jose','La Uruca'),
 ('San Jose','San Jose','Mata Redonda'),
 ('San Jose','San Jose','Pavas'),
 ('San Jose','Goicoechea','Guadalupe'),
 ('San Jose','Goicoechea','Calle Blancos'),
 ('San Jose','Goicoechea','Ipis'),
 ('San Jose','Goicoechea','Rancho Redondo'),
 ('San Jose','Goicoechea','Purral'),
 ('Cartago','Turrialba','Peralta'),
 ('Cartago','Turrialba','Tuis'),
 ('Cartago','Turrialba','Tayutic'),
 ('Cartago','Turrialba','Pavones');


INSERT INTO TIPO_PISO (Piso,Predeterminado)
VALUES ('Concreto Lujado',1),('Porcelanato',1),('Ceramica',1);

INSERT INTO NACIONALIDAD(Nacionalidad)
VALUES ('Costarricense'),
('Nicaraguense'),
('Venezolano'),
('Canadiense');

INSERT INTO OCUPACION(Nombre)
VALUES('Ingeniero'),
('Medico'),('Estilista'),('Enfermero'),('Veterinario');

INSERT INTO INMUEBLE(TipoPropiedad,Predeterminado)
VALUES('Lote',1),('Casa',1),('Apartemento',1);

INSERT INTO PERFIL_CLIENTE(Descripcion,Predeterminado)
VALUES('Agente',1),('Constructor',1),('Propietario',1),('Anunciante',1);

INSERT INTO ADMINISTRADOR(Username,Cedula)
VALUES ('admin1','118922345'),('admin2','436688734');

INSERT INTO TIPO_ANUNCIO(Nombre,Precio,Predeterminado)
VALUES ('Normal',1000,1),('Destacado',2000,1),('Oro',3000,1),('Platino',4000,1);

INSERT INTO USUARIO(Username,Nombre,PrimerApellido,SegundoApellido,FechaIngreso)
VALUES ('Miguelito68','Miguel','Sanchez','Obando','12/7/2001'),('Carlangas85','Carlos','Martinez','Sandoval','1/5/20011'),('Floripondiox','Felipe','Sanchez','Rodriguez','1/1/2005');

INSERT INTO PUBLICO(FechaInicial,FechaFinal,CantidadMensajes,IngresoInicial,IngresoFinal,Sexo,EdadInicial,EdadFinal)
VALUES ('12/2/2000','12/3/2000',20,100000,1000000,'M',20,35),('2/12/2000','12/3/2001',34,40000,100000,'M',20,25),('2/4/2000','2/6/2000',50,500000,2000000,'F',30,55);

INSERT INTO PROPIEDAD(CantidadBanos,IdUbicacion,TipoPropiedad,TamanoLote,TamanoPropiedad,Piscina,ParqueoVisitas,Parqueo,TipoPiso,CantidadNiveles,CantidadHabitaciones,Precio,Propietario,Gimnasio)
VALUES (2,NULL,'Casa',50,60,1,0,1,'Ceramica',1,3,50000000,NULL,0),(2,NULL,'Casa',50,60,0,0,1,'Ceramica',1,3,40000000,NULL,0),(2,NULL,'Apartamento',70,80,1,1,1,'Concreto Lujado',1,3,100000000,NULL,1);

INSERT INTO MENSAJE(IdAnuncio,Fecha,Hora,Texto,Comprador,Agente)
VALUES (NULL,'2/5/2019','8:45','yo quiero info',NULL,NULL),(NULL,'8/6/2019','7:45','suena ak7',NULL,NULL),(NULL,'3/4/2019','1:45','llameme',NULL,NULL)

INSERT INTO FOTOS(Ruta,IdPropiedad)
VALUES (NULL,NULL);

INSERT INTO COMPRADOR(UserName,FechaNacimiento,IngresoMensual,IdOcupacion,Domicilio,Sexo)
VALUES('pepitoak71234','12/5/1990',2000000,NULL,NULL,'M'),('MEcaniquitox','2/4/1995',1000000,NULL,NULL,'M'),('XxAnastasiaxX','2/1/1988',2200000,NULL,NULL,'F');

INSERT INTO CLIENTE(UserName,IdNacionalidad,Cedula,PerfilCliente)
VALUES('Alboroto3000',NULL,113254323,'Anunciante'),('CarlitoXx',NULL,304522872,'Agente'),('PatriciaM89',NULL,198337580,'Propietario');