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


INSERT INTO TIPO_PISO (Tipo,Predeterminado)
VALUES ('Concreto Lujado',1),('Porcelanato',1),('Ceramica',1);

INSERT INTO NACIONALIDAD(Nacionalidad)
VALUES ('Costarricense'),
('Nicaraguense'),
('Venezolano'),
('Canadiense');

INSERT INTO OCUPACION(Nombre)
VALUES('Ingeniero'),
('Medico'),('Estilista'),('Enfermero'),('Veterinario');

INSERT INTO INMUEBLE(Tipo)
VALUES('Lote'),('Casa'),('Apartemento');

INSERT INTO PERFIL_CLIENTE(Descripcion)
VALUES('Agente'),('Constructor'),('Propietario'),('Anunciante');

