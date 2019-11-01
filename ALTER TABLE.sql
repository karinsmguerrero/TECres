/*******************************************************************************************************
********************************************************************************************************
*******************											********************************************
*******************											********************************************
*******************			        TEC-RES					********************************************
*******************											********************************************
*******************											********************************************
********************************************************************************************************
********************************************************************************************************/

--ALTER TABLE TECRES ASIGNACION DE LLAVES FORANEAS
GO
ALTER TABLE COMPRADOR
ADD FOREIGN KEY(Username) REFERENCES USUARIO(Username)
GO
ALTER TABLE PROPIEDAD
ADD FOREIGN KEY (IdUbicacion) REFERENCES UBICACION(Id);
GO
ALTER TABLE PROPIEDAD
ADD FOREIGN KEY (TipoPropiedad) REFERENCES INMUEBLE(Id);
GO
ALTER TABLE PROPIEDAD
ADD FOREIGN KEY (TipoPiso) REFERENCES TIPO_PISO(Id);
GO
ALTER TABLE PROPIEDAD
ADD FOREIGN KEY (Propietario) REFERENCES CLIENTE(Username);
GO
ALTER TABLE ANUNCIO
ADD FOREIGN KEY (IdPropiedad) REFERENCES PROPIEDAD(Id);
GO
ALTER TABLE ANUNCIO
ADD FOREIGN KEY (TipoAnuncio) REFERENCES TIPO_ANUNCIO(Nombre);
GO
ALTER TABLE ANUNCIO
ADD FOREIGN KEY (IdAgente) REFERENCES CLIENTE(Username);
GO
ALTER TABLE MENSAJE
ADD FOREIGN KEY (IdAnuncio) REFERENCES ANUNCIO(Id);
GO
ALTER TABLE MENSAJE
ADD FOREIGN KEY (Emisor) REFERENCES USUARIO(Username);
GO
ALTER TABLE MENSAJE
ADD FOREIGN KEY (Receptor) REFERENCES USUARIO(Username);
GO
ALTER TABLE COMPRADOR
ADD FOREIGN KEY (IdOcupacion) REFERENCES OCUPACION(Id);
GO
ALTER TABLE COMPRADOR
ADD FOREIGN KEY (Domicilio) REFERENCES UBICACION(Id);
GO
ALTER TABLE CLIENTE
ADD FOREIGN KEY (PerfilCliente) REFERENCES PERFIL_CLIENTE(Nombre);
GO
ALTER TABLE CLIENTE
ADD FOREIGN KEY (IdNacionalidad) REFERENCES NACIONALIDAD(Id);
GO
ALTER TABLE CLIENTE
ADD FOREIGN KEY (Username) REFERENCES USUARIO(Username);
GO
ALTER TABLE ADMINISTRADOR
ADD FOREIGN KEY (Username) REFERENCES USUARIO(Username);
GO
ALTER TABLE FOTOS
ADD FOREIGN KEY (IdPropiedad) REFERENCES PROPIEDAD(Id);
GO
ALTER TABLE ANUNCIO
ADD FOREIGN KEY (IdPublico) REFERENCES PUBLICO(Id);
GO
ALTER TABLE FACTURA
ADD FOREIGN KEY (IdAnuncio) REFERENCES ANUNCIO(Id)
--ALTER TABLE USUARIO DROP COLUMN Contrasena; 
GO
