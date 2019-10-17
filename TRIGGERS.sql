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
        THROW 50001, 'No se puede eliminar', 1;
    END
END;

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
        THROW 50001, 'No se puede eliminar', 1;
    END
END;
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
        THROW 50001, 'No se puede eliminar', 1;
    END
END;
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
        THROW 50001, 'No se puede eliminar', 1;
    END
END;