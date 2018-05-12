CREATE SEQUENCE seq_abono START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER abono_codigo_trg BEFORE
    INSERT ON abono
    FOR EACH ROW
    WHEN ( new.codigo IS NULL )
BEGIN
    :new.codigo := seq_abono.nextval;
END;
/
CREATE SEQUENCE seq_calificacionhuerta START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER calificacionhuerta_codigocalif BEFORE
    INSERT ON calificacionhuerta
    FOR EACH ROW
    WHEN ( new.codigocalificacion IS NULL )
BEGIN
    :new.codigocalificacion := seq_calificacionhuerta.nextval;

END;
/
CREATE SEQUENCE seq_cambioclave START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER cambioclave_codigo_trg BEFORE
    INSERT ON cambioclave
    FOR EACH ROW
    WHEN ( new.codigo IS NULL )
BEGIN
    :new.codigo := seq_cambioclave.nextval;
END;
/
CREATE SEQUENCE seq_canton START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER canton_codigo_trg BEFORE
    INSERT ON canton
    FOR EACH ROW
    WHEN ( new.codigo IS NULL )
BEGIN
    :new.codigo := seq_canton.nextval;
END;
/
CREATE SEQUENCE seq_clase START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER clase_codigoclase_trg BEFORE
    INSERT ON clase
    FOR EACH ROW
    WHEN ( new.codigoclase IS NULL )
BEGIN
    :new.codigoclase := seq_clase.nextval;
END;
/
CREATE SEQUENCE seq_colaborador START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER colaborador_codigocolaborador BEFORE
    INSERT ON colaborador
    FOR EACH ROW
    WHEN ( new.codigocolaborador IS NULL )
BEGIN
    :new.codigocolaborador := seq_colaborador.nextval;
END;
/
CREATE SEQUENCE seq_color START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER color_codigocolor_trg BEFORE
    INSERT ON color
    FOR EACH ROW
    WHEN ( new.codigocolor IS NULL )
BEGIN
    :new.codigocolor := seq_color.nextval;
END;
/
CREATE SEQUENCE seq_distrito START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER distrito_codigo_trg BEFORE
    INSERT ON distrito
    FOR EACH ROW
    WHEN ( new.codigo IS NULL )
BEGIN
    :new.codigo := seq_distrito.nextval;
END;
/
CREATE SEQUENCE seq_division START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER division_codigodivision_trg BEFORE
    INSERT ON division
    FOR EACH ROW
    WHEN ( new.codigodivision IS NULL )
BEGIN
    :new.codigodivision := seq_division.nextval;
END;
/
CREATE SEQUENCE seq_especie START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER especie_codigoespecie_trg BEFORE
    INSERT ON especie
    FOR EACH ROW
    WHEN ( new.codigoespecie IS NULL )
BEGIN
    :new.codigoespecie := seq_especie.nextval;
END;
/
CREATE SEQUENCE seq_familia START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER familia_codigofamilia_trg BEFORE
    INSERT ON familia
    FOR EACH ROW
    WHEN ( new.codigofamilia IS NULL )
BEGIN
    :new.codigofamilia := seq_familia.nextval;
END;
/
CREATE SEQUENCE seq_genero START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER genero_codigogenero_trg BEFORE
    INSERT ON genero
    FOR EACH ROW
    WHEN ( new.codigogenero IS NULL )
BEGIN
    :new.codigogenero := seq_genero.nextval;
END;
/
CREATE SEQUENCE seq_planta START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER hortaliza_codigoplanta_trg BEFORE
    INSERT ON hortaliza
    FOR EACH ROW
    WHEN ( new.codigoplanta IS NULL )
BEGIN
    :new.codigoplanta := seq_planta.nextval;
END;
/
CREATE SEQUENCE seq_huerta START WITH 0 MINVALUE 0 MAXVALUE 99999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER huerta_codigohuerta_trg BEFORE
    INSERT ON huertaA
    FOR EACH ROW
    WHEN ( new.codigohuerta IS NULL )
BEGIN
    :new.codigohuerta := seq_huerta.nextval;
END;
/
CREATE SEQUENCE seq_localizacion START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER localizacion_codigo_trg BEFORE
    INSERT ON localizacion
    FOR EACH ROW
    WHEN ( new.codigo IS NULL )
BEGIN
    :new.codigo := seq_localizacion.nextval;
END;
/
CREATE SEQUENCE seq_orden START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER orden_codigoorden_trg BEFORE
    INSERT ON orden
    FOR EACH ROW
    WHEN ( new.codigoorden IS NULL )
BEGIN
    :new.codigoorden := seq_orden.nextval;
END;
/
CREATE SEQUENCE seq_planta START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER planta_codigoplanta_trg BEFORE
    INSERT ON planta
    FOR EACH ROW
    WHEN ( new.codigoplanta IS NULL )
BEGIN
    :new.codigoplanta := seq_planta.nextval;
END;
/
CREATE SEQUENCE seq_propiedad START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER propiedad_codigopropiedad_trg BEFORE
    INSERT ON propiedad
    FOR EACH ROW
    WHEN ( new.codigopropiedad IS NULL )
BEGIN
    :new.codigopropiedad := seq_propiedad.nextval;
END;
/
CREATE SEQUENCE seq_provincia START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER provincia_codigo_trg BEFORE
    INSERT ON provincia
    FOR EACH ROW
    WHEN ( new.codigo IS NULL )
BEGIN
    :new.codigo := seq_provincia.nextval;
END;
/
CREATE SEQUENCE seq_cambium START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tipocambium_codigocambium_trg BEFORE
    INSERT ON tipocambium
    FOR EACH ROW
    WHEN ( new.codigocambium IS NULL )
BEGIN
    :new.codigocambium := seq_cambium.nextval;
END;
/
CREATE SEQUENCE seq_corteza START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tipocorteza_codigocorteza_trg BEFORE
    INSERT ON tipocorteza
    FOR EACH ROW
    WHEN ( new.codigocorteza IS NULL )
BEGIN
    :new.codigocorteza := seq_corteza.nextval;
END;
/
CREATE SEQUENCE seq_tipohortaliza START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tipohortaliza_codigotipo_trg BEFORE
    INSERT ON tipohortaliza
    FOR EACH ROW
    WHEN ( new.codigotipo IS NULL )
BEGIN
    :new.codigotipo := seq_tipohortaliza.nextval;
END;
/
CREATE SEQUENCE seq_tipotransaccion START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tipotransaccion_codigotipo_trg BEFORE
    INSERT ON tipotransaccion
    FOR EACH ROW
    WHEN ( new.codigotipo IS NULL )
BEGIN
    :new.codigotipo := seq_tipotransaccion.nextval;
END;
/
CREATE SEQUENCE seq_tipousuario START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tipousuario_codigo_trg BEFORE
    INSERT ON tipousuario
    FOR EACH ROW
    WHEN ( new.codigo IS NULL )
BEGIN
    :new.codigo := seq_tipousuario.nextval;
END;
/
CREATE SEQUENCE seq_xilema START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tipoxilema_codigoxilema_trg BEFORE
    INSERT ON tipoxilema
    FOR EACH ROW
    WHEN ( new.codigoxilema IS NULL )
BEGIN
    :new.codigoxilema := seq_xilema.nextval;
END;
/
CREATE SEQUENCE seq_transaccion START WITH 0 MINVALUE 0 MAXVALUE 99999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER transaccion_codigotransaccion BEFORE
    INSERT ON transaccion
    FOR EACH ROW
    WHEN ( new.codigotransaccion IS NULL )
BEGIN
    :new.codigotransaccion := seq_transaccion.nextval;
END;
/
CREATE SEQUENCE seq_vitamina START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER vitamina_codigovitamina_trg BEFORE
    INSERT ON vitamina
    FOR EACH ROW
    WHEN ( new.codigovitamina IS NULL )
BEGIN
    :new.codigovitamina := seq_vitamina.nextval;
END;
