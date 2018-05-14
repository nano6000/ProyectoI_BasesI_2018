/*drop sequence seq_abono;
drop sequence seq_calificacionhuerta;
drop sequence seq_cambioclave;
drop sequence seq_cambium;
drop sequence seq_canton;
drop sequence seq_clase;
drop sequence seq_colaborador;
drop sequence seq_color;
drop sequence seq_corteza;
drop sequence seq_distrito;
drop sequence seq_division;
drop sequence seq_especie;
drop sequence seq_familia;
drop sequence seq_genero;
drop sequence seq_huerta;
drop sequence seq_localizacion;
drop sequence seq_orden;
drop sequence seq_pais;
drop sequence seq_planta;
drop sequence seq_propiedad;
drop sequence seq_provincia;
drop sequence seq_tipohortaliza;
drop sequence seq_tipousuario;
drop sequence seq_transaccion;
drop sequence seq_vitamina;
drop sequence seq_xilema;*/

CREATE SEQUENCE seq_abono START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER abono_codigo_trg BEFORE
    INSERT ON abono
    FOR EACH ROW
    WHEN ( new.codigo IS NULL )
BEGIN
    :new.codigo := seq_abono.nextval;
    :new.fec_creacion := SYSDATE;
    :new.usuario_creacion := USER;
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER arbol_auditoria BEFORE
    INSERT ON arbol
    FOR EACH ROW
BEGIN
    :new.codigoplanta
    :new.fec_creacion := SYSDATE;
    :new.usuario_creacion := USER;
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE SEQUENCE seq_calificacionhuerta START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER calificacionhuerta_codigocalif BEFORE
    INSERT ON calificacionhuerta
    FOR EACH ROW
    WHEN ( new.codigocalificacion IS NULL )
BEGIN
    :new.codigocalificacion := seq_calificacionhuerta.nextval;
    :new.fec_creacion := SYSDATE;
    :new.usuario_creacion := USER;
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE SEQUENCE seq_cambioclave START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER cambioclave_codigo_trg BEFORE
    INSERT ON cambioclave
    FOR EACH ROW
    WHEN ( new.codigo IS NULL )
BEGIN
    :new.codigo := seq_cambioclave.nextval;
    :new.fec_creacion := SYSDATE;
    :new.usuario_creacion := USER;
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE SEQUENCE seq_canton START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER canton_codigo_trg BEFORE
    INSERT ON canton
    FOR EACH ROW
    WHEN ( new.codigo IS NULL )
BEGIN
    :new.codigo := seq_canton.nextval;
    :new.fec_creacion := SYSDATE;
    :new.usuario_creacion := USER;
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE SEQUENCE seq_clase START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER clase_codigoclase_trg BEFORE
    INSERT ON clase
    FOR EACH ROW
    WHEN ( new.codigoclase IS NULL )
BEGIN
    :new.codigoclase := seq_clase.nextval;
    :new.fec_creacion := SYSDATE;
    :new.usuario_creacion := USER;
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE SEQUENCE seq_colaborador START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER colaborador_codigocolaborador BEFORE
    INSERT ON colaborador
    FOR EACH ROW
    WHEN ( new.codigocolaborador IS NULL )
BEGIN
    :new.codigocolaborador := seq_colaborador.nextval;
    :new.fec_creacion := SYSDATE;
    :new.usuario_creacion := USER;
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER colaboradorhuerta_auditoria BEFORE
    INSERT ON colaboradorhuerta
    FOR EACH ROW
BEGIN
    :new.fec_creacion := SYSDATE;
    :new.usuario_creacion := USER;
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE SEQUENCE seq_color START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER color_codigocolor_trg BEFORE
    INSERT ON color
    FOR EACH ROW
    WHEN ( new.codigocolor IS NULL )
BEGIN
    :new.codigocolor := seq_color.nextval;
    :new.fec_creacion := SYSDATE;
    :new.usuario_creacion := USER;
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE SEQUENCE seq_distrito START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER distrito_codigo_trg BEFORE
    INSERT ON distrito
    FOR EACH ROW
    WHEN ( new.codigo IS NULL )
BEGIN
    :new.codigo := seq_distrito.nextval;
    :new.fec_creacion := SYSDATE;
    :new.usuario_creacion := USER;
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE SEQUENCE seq_division START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER division_codigodivision_trg BEFORE
    INSERT ON division
    FOR EACH ROW
    WHEN ( new.codigodivision IS NULL )
BEGIN
    :new.codigodivision := seq_division.nextval;
    :new.fec_creacion := SYSDATE;
    :new.usuario_creacion := USER;
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER emailpersona_auditoria_trg BEFORE
    INSERT ON emailpersona
    FOR EACH ROW
BEGIN
    :new.fec_creacion := SYSDATE;
    :new.usuario_creacion := USER;
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE SEQUENCE seq_especie START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER especie_codigoespecie_trg BEFORE
    INSERT ON especie
    FOR EACH ROW
    WHEN ( new.codigoespecie IS NULL )
BEGIN
    :new.codigoespecie := seq_especie.nextval;
    :new.fec_creacion := SYSDATE;
    :new.usuario_creacion := USER;
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE SEQUENCE seq_familia START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER familia_codigofamilia_trg BEFORE
    INSERT ON familia
    FOR EACH ROW
    WHEN ( new.codigofamilia IS NULL )
BEGIN
    :new.codigofamilia := seq_familia.nextval;
    :new.fec_creacion := SYSDATE;
    :new.usuario_creacion := USER;
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE SEQUENCE seq_genero START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER genero_codigogenero_trg BEFORE
    INSERT ON genero
    FOR EACH ROW
    WHEN ( new.codigogenero IS NULL )
BEGIN
    :new.codigogenero := seq_genero.nextval;
    :new.fec_creacion := SYSDATE;
    :new.usuario_creacion := USER;
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER hortaliza_codigoplanta_trg BEFORE
    INSERT ON hortaliza
    FOR EACH ROW
BEGIN
    :new.fec_creacion := SYSDATE;
    :new.usuario_creacion := USER;
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE SEQUENCE seq_huerta START WITH 0 MINVALUE 0 MAXVALUE 99999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER huerta_codigohuerta_trg BEFORE
    INSERT ON huertaA
    FOR EACH ROW
    WHEN ( new.codigohuerta IS NULL )
BEGIN
    :new.codigohuerta := seq_huerta.nextval;
    :new.fec_creacion := SYSDATE;
    :new.usuario_creacion := USER;
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE SEQUENCE seq_localizacion START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER localizacion_codigo_trg BEFORE
    INSERT ON localizacion
    FOR EACH ROW
    WHEN ( new.codigo IS NULL )
BEGIN
    :new.codigo := seq_localizacion.nextval;
    :new.fec_creacion := SYSDATE;
    :new.usuario_creacion := USER;
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE SEQUENCE seq_orden START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER orden_codigoorden_trg BEFORE
    INSERT ON orden
    FOR EACH ROW
    WHEN ( new.codigoorden IS NULL )
BEGIN
    :new.codigoorden := seq_orden.nextval;
    :new.fec_creacion := SYSDATE;
    :new.usuario_creacion := USER;
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
/* DROP = CREATE SEQUENCE seq_pais START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;*/

CREATE OR REPLACE TRIGGER pais_codigo_trg BEFORE
    INSERT ON pais
    FOR EACH ROW
BEGIN
    :new.fec_creacion := SYSDATE;
    :new.usuario_creacion := USER;
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER persona_trg BEFORE
    INSERT ON persona
    FOR EACH ROW
BEGIN
    :new.fec_creacion := SYSDATE;
    :new.usuario_creacion := USER;
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE SEQUENCE seq_planta START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER planta_codigoplanta_trg BEFORE
    INSERT ON planta
    FOR EACH ROW
    WHEN ( new.codigoplanta IS NULL )
BEGIN
    :new.codigoplanta := seq_planta.nextval;
    :new.fec_creacion := SYSDATE;
    :new.usuario_creacion := USER;
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER plantahuerta_auditoria_trg BEFORE
    INSERT ON plantahuerta
    FOR EACH ROW
BEGIN
    :new.fec_creacion := SYSDATE;
    :new.usuario_creacion := USER;
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE SEQUENCE seq_propiedad START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER propiedad_codigopropiedad_trg BEFORE
    INSERT ON propiedad
    FOR EACH ROW
    WHEN ( new.codigopropiedad IS NULL )
BEGIN
    :new.codigopropiedad := seq_propiedad.nextval;
    :new.fec_creacion := SYSDATE;
    :new.usuario_creacion := USER;
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER propiedadhor_auditoria_trg BEFORE
    INSERT ON propiedadhortaliza
    FOR EACH ROW
BEGIN
    :new.fec_creacion := SYSDATE;
    :new.usuario_creacion := USER;
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE SEQUENCE seq_provincia START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER provincia_codigo_trg BEFORE
    INSERT ON provincia
    FOR EACH ROW
    WHEN ( new.codigo IS NULL )
BEGIN
    :new.codigo := seq_provincia.nextval;
    :new.fec_creacion := SYSDATE;
    :new.usuario_creacion := USER;
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER telefonopersona_auditoria_trg BEFORE
    INSERT ON telefonopersona
    FOR EACH ROW
BEGIN
    :new.fec_creacion := SYSDATE;
    :new.usuario_creacion := USER;
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE SEQUENCE seq_cambium START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tipocambium_codigocambium_trg BEFORE
    INSERT ON tipocambium
    FOR EACH ROW
    WHEN ( new.codigocambium IS NULL )
BEGIN
    :new.codigocambium := seq_cambium.nextval;
    :new.fec_creacion := SYSDATE;
    :new.usuario_creacion := USER;
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE SEQUENCE seq_corteza START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tipocorteza_codigocorteza_trg BEFORE
    INSERT ON tipocorteza
    FOR EACH ROW
    WHEN ( new.codigocorteza IS NULL )
BEGIN
    :new.codigocorteza := seq_corteza.nextval;
    :new.fec_creacion := SYSDATE;
    :new.usuario_creacion := USER;
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE SEQUENCE seq_tipohortaliza START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tipohortaliza_codigotipo_trg BEFORE
    INSERT ON tipohortaliza
    FOR EACH ROW
    WHEN ( new.codigotipo IS NULL )
BEGIN
    :new.codigotipo := seq_tipohortaliza.nextval;
    :new.fec_creacion := SYSDATE;
    :new.usuario_creacion := USER;
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE SEQUENCE seq_tipotransaccion START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tipotransaccion_codigo_trg BEFORE
    INSERT ON tipotransaccion
    FOR EACH ROW
    WHEN ( new.codigotipo IS NULL )
BEGIN
    :new.codigotipo := seq_tipotransaccion.nextval;
    :new.fec_creacion := SYSDATE;
    :new.usuario_creacion := USER;
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE SEQUENCE seq_xilema START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tipoxilema_codigoxilema_trg BEFORE
    INSERT ON tipoxilema
    FOR EACH ROW
    WHEN ( new.codigoxilema IS NULL )
BEGIN
    :new.codigoxilema := seq_xilema.nextval;
    :new.fec_creacion := SYSDATE;
    :new.usuario_creacion := USER;
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE SEQUENCE seq_transaccion START WITH 0 MINVALUE 0 MAXVALUE 99999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER transaccion_codigotransaccion BEFORE
    INSERT ON transaccion
    FOR EACH ROW
    WHEN ( new.codigotransaccion IS NULL )
BEGIN
    :new.codigotransaccion := seq_transaccion.nextval;
    :new.fec_creacion := SYSDATE;
    :new.usuario_creacion := USER;
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER usuario_trg BEFORE
    INSERT ON usuario
    FOR EACH ROW
BEGIN
	:new.fec_creacion:=SYSDATE;
    :new.usuario_creacion:=USER;
	:new.fec_ultima_modificacion:=SYSDATE;
    :new.usuario_ultima_modificacion:=USER;
END;
/
CREATE SEQUENCE seq_vitamina START WITH 0 MINVALUE 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER vitamina_codigovitamina_trg BEFORE
    INSERT ON vitamina
    FOR EACH ROW
    WHEN ( new.codigovitamina IS NULL )
BEGIN
    :new.codigovitamina := seq_vitamina.nextval;
    :new.fec_creacion := SYSDATE;
    :new.usuario_creacion := USER;
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER vitaminacolor_auditoria_trg BEFORE
    INSERT ON vitaminacolor
    FOR EACH ROW
BEGIN
    :new.fec_creacion := SYSDATE;
    :new.usuario_creacion := USER;
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER vitaminacolor_trg BEFORE
    INSERT ON vitaminacolor
    FOR EACH ROW
BEGIN
	:new.fec_creacion:=SYSDATE;
    :new.usuario_creacion:=USER;
	:new.fec_ultima_modificacion:=SYSDATE;
    :new.usuario_ultima_modificacion:=USER;
END;
/
/*Triggers de update*/
CREATE OR REPLACE TRIGGER abono_codigo_trg_upd BEFORE
    UPDATE ON abono
    FOR EACH ROW
    WHEN ( new.codigo IS NULL )
BEGIN
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER arbol_auditoria_upd BEFORE
    UPDATE ON arbol
    FOR EACH ROW
BEGIN
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER calificacionhuerta_codigocalif_upd BEFORE
    UPDATE ON calificacionhuerta
    FOR EACH ROW
    WHEN ( new.codigocalificacion IS NULL )
BEGIN
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER cambioclave_codigo_trg_upd BEFORE
    UPDATE ON cambioclave
    FOR EACH ROW
    WHEN ( new.codigo IS NULL )
BEGIN
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER canton_codigo_trg_upd BEFORE
    UPDATE ON canton
    FOR EACH ROW
    WHEN ( new.codigo IS NULL )
BEGIN
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER clase_codigoclase_trg_upd BEFORE
    UPDATE ON clase
    FOR EACH ROW
    WHEN ( new.codigoclase IS NULL )
BEGIN
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER colaborador_codigocolaborador_upd BEFORE
    UPDATE ON colaborador
    FOR EACH ROW
    WHEN ( new.codigocolaborador IS NULL )
BEGIN
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER colaboradorhuerta_auditoria_upd BEFORE
    UPDATE ON colaboradorhuerta
    FOR EACH ROW
BEGIN
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER color_codigocolor_trg_upd BEFORE
    UPDATE ON color
    FOR EACH ROW
    WHEN ( new.codigocolor IS NULL )
BEGIN
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER distrito_codigo_trg_upd BEFORE
    UPDATE ON distrito
    FOR EACH ROW
    WHEN ( new.codigo IS NULL )
BEGIN
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER division_codigodivision_trg_upd BEFORE
    UPDATE ON division
    FOR EACH ROW
    WHEN ( new.codigodivision IS NULL )
BEGIN
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER emailpersona_auditoria_trg_upd BEFORE
    UPDATE ON emailpersona
    FOR EACH ROW
BEGIN
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER especie_codigoespecie_trg_upd BEFORE
    UPDATE ON especie
    FOR EACH ROW
    WHEN ( new.codigoespecie IS NULL )
BEGIN
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER familia_codigofamilia_trg_upd BEFORE
    UPDATE ON familia
    FOR EACH ROW
    WHEN ( new.codigofamilia IS NULL )
BEGIN
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER genero_codigogenero_trg_upd BEFORE
    UPDATE ON genero
    FOR EACH ROW
    WHEN ( new.codigogenero IS NULL )
BEGIN
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER hortaliza_codigoplanta_trg_upd BEFORE
    UPDATE ON hortaliza
    FOR EACH ROW
BEGIN
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER huerta_codigohuerta_trg_upd BEFORE
    UPDATE ON huertaA
    FOR EACH ROW
    WHEN ( new.codigohuerta IS NULL )
BEGIN
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER localizacion_codigo_trg_upd BEFORE
    UPDATE ON localizacion
    FOR EACH ROW
    WHEN ( new.codigo IS NULL )
BEGIN
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER orden_codigoorden_trg_upd BEFORE
    UPDATE ON orden
    FOR EACH ROW
    WHEN ( new.codigoorden IS NULL )
BEGIN
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER pais_codigo_trg_upd BEFORE
    UPDATE ON pais
    FOR EACH ROW
BEGIN
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER persona_trg BEFORE
    UPDATE ON persona
    FOR EACH ROW
BEGIN
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER planta_codigoplanta_trg_upd BEFORE
    UPDATE ON planta
    FOR EACH ROW
    WHEN ( new.codigoplanta IS NULL )
BEGIN
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER plantahuerta_auditoria_trg_upd BEFORE
    UPDATE ON plantahuerta
    FOR EACH ROW
BEGIN
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER propiedad_codigopropiedad_trg_upd BEFORE
    UPDATE ON propiedad
    FOR EACH ROW
    WHEN ( new.codigopropiedad IS NULL )
BEGIN
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER propiedadhor_auditoria_trg_upd BEFORE
    UPDATE ON propiedadhortaliza
    FOR EACH ROW
BEGIN
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER provincia_codigo_trg_upd BEFORE
    UPDATE ON provincia
    FOR EACH ROW
    WHEN ( new.codigo IS NULL )
BEGIN
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER telefonopersona_auditoria_trg_upd BEFORE
    UPDATE ON telefonopersona
    FOR EACH ROW
BEGIN
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER tipocambium_codigocambium_trg_upd BEFORE
    UPDATE ON tipocambium
    FOR EACH ROW
    WHEN ( new.codigocambium IS NULL )
BEGIN
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER tipocorteza_codigocorteza_trg_upd BEFORE
    UPDATE ON tipocorteza
    FOR EACH ROW
    WHEN ( new.codigocorteza IS NULL )
BEGIN
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER tipohortaliza_codigotipo_trg_upd BEFORE
    UPDATE ON tipohortaliza
    FOR EACH ROW
    WHEN ( new.codigotipo IS NULL )
BEGIN
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER tipotransaccion_codigo_trg_upd BEFORE
    UPDATE ON tipotransaccion
    FOR EACH ROW
    WHEN ( new.codigotipo IS NULL )
BEGIN
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER tipoxilema_codigoxilema_trg_upd BEFORE
    UPDATE ON tipoxilema
    FOR EACH ROW
    WHEN ( new.codigoxilema IS NULL )
BEGIN
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER transaccion_codigotransaccion_upd BEFORE
    UPDATE ON transaccion
    FOR EACH ROW
    WHEN ( new.codigotransaccion IS NULL )
BEGIN
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER usuario_trg BEFORE
    UPDATE ON usuario
    FOR EACH ROW
BEGIN
	:new.fec_ultima_modificacion:=SYSDATE;
    :new.usuario_ultima_modificacion:=USER;
END;
/

CREATE OR REPLACE TRIGGER vitamina_codigovitamina_trg_upd BEFORE
    UPDATE ON vitamina
    FOR EACH ROW
    WHEN ( new.codigovitamina IS NULL )
BEGIN
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER vitaminacolor_auditoria_trg_upd BEFORE
    UPDATE ON vitaminacolor
    FOR EACH ROW
BEGIN
    :new.fec_ultima_modificacion := SYSDATE;
    :new.usuario_ultima_modificacion := USER;
END;
/
CREATE OR REPLACE TRIGGER vitaminacolor_trg_upd BEFORE
    UPDATE ON vitaminacolor
    FOR EACH ROW
BEGIN
	:new.fec_ultima_modificacion:=SYSDATE;
    :new.usuario_ultima_modificacion:=USER;
END;
/
