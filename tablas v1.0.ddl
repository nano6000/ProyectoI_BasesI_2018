CREATE TABLE abono (
    codigo                        NUMBER NOT NULL,
    fechahora                     DATE NOT NULL,
    codigocolaborador             NUMBER NOT NULL,
    codigohuerta                  NUMBER NOT NULL,
    codigoplanta                  NUMBER NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

ALTER TABLE abono ADD CONSTRAINT pk_abono PRIMARY KEY ( codigo );

CREATE TABLE arbol (
    codigoplanta                  NUMBER NOT NULL,
    peligroexticion               NVARCHAR2(2) DEFAULT 'NO' NOT NULL,
    especie                       NUMBER NOT NULL,
    corteza                       NUMBER NOT NULL,
    xilema                        NUMBER NOT NULL,
    cambium                       NUMBER NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

ALTER TABLE arbol
    ADD CONSTRAINT ck_peligroextincion CHECK ( peligroexticion IN (
        'NO',
        'SI'
    ) );

ALTER TABLE arbol ADD CONSTRAINT pk_arbol PRIMARY KEY ( codigoplanta );

CREATE TABLE calificacionhuerta (
    codigocalificacion            NUMBER NOT NULL,
    fechahora                     DATE NOT NULL,
    comentario                    NVARCHAR2(250),
    puntuacion                    NUMBER(1) NOT NULL,
    username                      NVARCHAR2(15) NOT NULL,
    codigohuerta                  NUMBER NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

ALTER TABLE calificacionhuerta
    ADD CONSTRAINT ck_puntuacion CHECK ( puntuacion BETWEEN 1 AND 5 );

ALTER TABLE calificacionhuerta ADD CONSTRAINT pk_calificacionhuerta PRIMARY KEY ( codigocalificacion );

ALTER TABLE calificacionhuerta ADD CONSTRAINT un_calificacionhuerta UNIQUE ( username,
codigohuerta );

CREATE TABLE cambioclave (
    codigo       NUMBER NOT NULL,
    fechahora    DATE NOT NULL,
    clavevieja   VARCHAR2(15 CHAR) NOT NULL,
    clavenueva   VARCHAR2(15 CHAR) NOT NULL,
    username     NVARCHAR2(15) NOT NULL
);

ALTER TABLE cambioclave ADD CONSTRAINT pk_cambioclave PRIMARY KEY ( codigo );

CREATE TABLE canton (
    codigo                        NUMBER NOT NULL,
    nombre                        NVARCHAR2(20) NOT NULL,
    provincia                     NUMBER NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

ALTER TABLE canton ADD CONSTRAINT pk_canton PRIMARY KEY ( codigo );

CREATE TABLE clase (
    codigoclase                   NUMBER NOT NULL,
    nombre                        NVARCHAR2(15) NOT NULL,
    division                      NUMBER NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

ALTER TABLE clase ADD CONSTRAINT pk_clase PRIMARY KEY ( codigoclase );

ALTER TABLE clase ADD CONSTRAINT un_clase UNIQUE ( nombre );

CREATE TABLE colaborador (
    codigocolaborador             NUMBER NOT NULL,
    activo                        NVARCHAR2(10),
    encargado                     NUMBER NOT NULL,
    persona_cedula                NUMBER(9) NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

CREATE UNIQUE INDEX colaborador__idx ON
    colaborador ( persona_cedula ASC );

ALTER TABLE colaborador ADD CONSTRAINT pk_colaborador PRIMARY KEY ( codigocolaborador );

CREATE TABLE colaboradorhuerta (
    huerta                        NUMBER NOT NULL,
    colaborador                   NUMBER NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

ALTER TABLE colaboradorhuerta ADD CONSTRAINT un_colaboradorhuerta UNIQUE ( colaborador,
huerta );

CREATE TABLE color (
    codigocolor                   NUMBER NOT NULL,
    nombre                        NVARCHAR2(10) NOT NULL,
    descripcion                   NVARCHAR2(20),
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

ALTER TABLE color ADD CONSTRAINT pk_colorhortaliza PRIMARY KEY ( codigocolor );

ALTER TABLE color ADD CONSTRAINT un_colorhortaliza UNIQUE ( nombre );

CREATE TABLE distrito (
    codigo                        NUMBER NOT NULL,
    nombre                        NVARCHAR2(20) NOT NULL,
    canton                        NUMBER NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

ALTER TABLE distrito ADD CONSTRAINT pk_distrito PRIMARY KEY ( codigo );

CREATE TABLE division (
    codigodivision                NUMBER NOT NULL,
    nombre                        NVARCHAR2(15) NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

ALTER TABLE division ADD CONSTRAINT pk_division PRIMARY KEY ( codigodivision );

ALTER TABLE division ADD CONSTRAINT un_division UNIQUE ( nombre );

CREATE TABLE emailpersona (
    email                         NVARCHAR2(20) NOT NULL,
    cedula                        NUMBER(9) NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

ALTER TABLE emailpersona ADD CONSTRAINT un_emailpersona UNIQUE ( email,
cedula );

CREATE TABLE especie (
    codigoespecie                 NUMBER NOT NULL,
    nombre                        NVARCHAR2(15) NOT NULL,
    genero                        NUMBER NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

ALTER TABLE especie ADD CONSTRAINT pk_especie PRIMARY KEY ( codigoespecie );

ALTER TABLE especie ADD CONSTRAINT un_especie UNIQUE ( nombre );

CREATE TABLE familia (
    codigofamilia                 NUMBER NOT NULL,
    nombre                        NVARCHAR2(15) NOT NULL,
    orden                         NUMBER NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

ALTER TABLE familia ADD CONSTRAINT pk_familia PRIMARY KEY ( codigofamilia );

ALTER TABLE familia ADD CONSTRAINT un_familia UNIQUE ( nombre );

CREATE TABLE genero (
    codigogenero                  NUMBER NOT NULL,
    nombre                        NVARCHAR2(15) NOT NULL,
    familia                       NUMBER NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

ALTER TABLE genero ADD CONSTRAINT pk_genero PRIMARY KEY ( codigogenero );

ALTER TABLE genero ADD CONSTRAINT un_genero UNIQUE ( nombre );

CREATE TABLE hortaliza (
    codigoplanta                  NUMBER NOT NULL,
    codigotipo                    NUMBER NOT NULL,
    codigocolor                   NUMBER NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

ALTER TABLE hortaliza ADD CONSTRAINT pk_hortaliza PRIMARY KEY ( codigoplanta );

CREATE TABLE huerta (
    codigohuerta                  NUMBER NOT NULL,
    nombre                        NVARCHAR2(15) NOT NULL,
    activo                        NVARCHAR2(10),
    ubicacion                     NUMBER NOT NULL,
    localizacion                  NUMBER NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

CREATE UNIQUE INDEX huerta__idx ON
    huerta ( localizacion ASC );

ALTER TABLE huerta ADD CONSTRAINT pk_huerta PRIMARY KEY ( codigohuerta );

ALTER TABLE huerta ADD CONSTRAINT un_huerta UNIQUE ( nombre );

CREATE TABLE localizacion (
    codigo                        NUMBER NOT NULL,
    xcoord                        NUMBER(8,6),
    ycoord                        NUMBER(8,6),
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

ALTER TABLE localizacion ADD CONSTRAINT pk_localizacion PRIMARY KEY ( codigo );

ALTER TABLE localizacion ADD CONSTRAINT un_localizacion UNIQUE ( xcoord,
ycoord );

CREATE TABLE orden (
    codigoorden                   NUMBER NOT NULL,
    nombre                        NVARCHAR2(15) NOT NULL,
    clase                         NUMBER NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

ALTER TABLE orden ADD CONSTRAINT pk_orden PRIMARY KEY ( codigoorden );

ALTER TABLE orden ADD CONSTRAINT un_orden UNIQUE ( nombre );

CREATE TABLE pais (
    codigo                        NVARCHAR2(3) NOT NULL,
    nombre                        NVARCHAR2(10) NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

ALTER TABLE pais ADD CONSTRAINT pk_pais PRIMARY KEY ( codigo );

CREATE TABLE persona (
    cedula                        NUMBER(9) NOT NULL,
    primernombre                  NVARCHAR2(10) NOT NULL,
    segundonombre                 NVARCHAR2(10),
    primerapellido                NVARCHAR2(10) NOT NULL,
    segundoapellido               NVARCHAR2(10),
    fechanac                      DATE NOT NULL,
    imagen                        BLOB,
    pais                          NVARCHAR2(3) NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

ALTER TABLE persona ADD CONSTRAINT pk_persona PRIMARY KEY ( cedula );

CREATE TABLE planta (
    codigoplanta                  NUMBER NOT NULL,
    nombre                        VARCHAR2(15 CHAR) NOT NULL,
    activo                        NVARCHAR2(10),
    imagen                        BLOB NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

ALTER TABLE planta ADD CONSTRAINT pk_planta PRIMARY KEY ( codigoplanta );

CREATE TABLE plantahuerta (
    precio                        NUMBER(12,2) DEFAULT 0 NOT NULL,
    planta                        NUMBER NOT NULL,
    huerta                        NUMBER NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

ALTER TABLE plantahuerta ADD CONSTRAINT ck_precio CHECK ( precio = 0 );

ALTER TABLE plantahuerta ADD CONSTRAINT un_plantahuerta UNIQUE ( planta,
huerta );

CREATE TABLE propiedad (
    codigopropiedad               NUMBER NOT NULL,
    descripcion                   NVARCHAR2(20) NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

ALTER TABLE propiedad ADD CONSTRAINT pk_propiedad PRIMARY KEY ( codigopropiedad );

CREATE TABLE propiedadhortaliza (
    codigopropiedad               NUMBER NOT NULL,
    codigoplanta                  NUMBER NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

ALTER TABLE propiedadhortaliza ADD CONSTRAINT pk_propiedadhortaliza PRIMARY KEY ( codigopropiedad,
codigoplanta );

CREATE TABLE provincia (
    codigo                        NUMBER NOT NULL,
    nombre                        NVARCHAR2(20) NOT NULL,
    pais                          NVARCHAR2(3) NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

ALTER TABLE provincia ADD CONSTRAINT pk_provincia PRIMARY KEY ( codigo );

CREATE TABLE telefonopersona (
    telefono                      NVARCHAR2(20) NOT NULL,
    cedula                        NUMBER(9) NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

ALTER TABLE telefonopersona ADD CONSTRAINT un_telefonopersona UNIQUE ( telefono,
cedula );

CREATE TABLE tipocambium (
    codigocambium                 NUMBER NOT NULL,
    descripcion                   NVARCHAR2(20) NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

ALTER TABLE tipocambium ADD CONSTRAINT pk_tipocambium PRIMARY KEY ( codigocambium );

CREATE TABLE tipocorteza (
    codigocorteza                 NUMBER NOT NULL,
    descripcion                   NVARCHAR2(20) NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

ALTER TABLE tipocorteza ADD CONSTRAINT pk_tipocorteza PRIMARY KEY ( codigocorteza );

CREATE TABLE tipohortaliza (
    codigotipo                    NUMBER NOT NULL,
    descripcion                   NVARCHAR2(20) NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

ALTER TABLE tipohortaliza ADD CONSTRAINT pk_tipohortaliza PRIMARY KEY ( codigotipo );

CREATE TABLE tipotransaccion (
    codigotipo                    NUMBER NOT NULL,
    nombre                        NVARCHAR2(15) NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

ALTER TABLE tipotransaccion ADD CONSTRAINT pk_tipotransaccion PRIMARY KEY ( codigotipo );

ALTER TABLE tipotransaccion ADD CONSTRAINT un_tipotransaccion UNIQUE ( nombre );

CREATE TABLE tipousuario (
    codigo                        NUMBER NOT NULL,
    tipo                          NVARCHAR2(15) NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

ALTER TABLE tipousuario ADD CONSTRAINT pk_tipousuario PRIMARY KEY ( codigo );

CREATE TABLE tipoxilema (
    codigoxilema                  NUMBER NOT NULL,
    descripcion                   NVARCHAR2(20) NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

ALTER TABLE tipoxilema ADD CONSTRAINT pk_tipoxilema PRIMARY KEY ( codigoxilema );

CREATE TABLE transaccion (
    codigotransaccion             NUMBER NOT NULL,
    fechahora                     DATE NOT NULL,
    tipotransaccion               NUMBER NOT NULL,
    huerta                        NUMBER NOT NULL,
    planta                        NUMBER NOT NULL,
    cedula                        NUMBER(9) NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

ALTER TABLE transaccion ADD CONSTRAINT pk_transaccion PRIMARY KEY ( codigotransaccion );

CREATE TABLE usuario (
    username      NVARCHAR2(15) NOT NULL,
    password      NVARCHAR2(15) NOT NULL,
    estado        NVARCHAR2(7) NOT NULL,
    tipousuario   NUMBER NOT NULL,
    cedula        NUMBER(9) NOT NULL
);

ALTER TABLE usuario
    ADD CONSTRAINT ck_estado CHECK ( estado IN (
        'OFFLINE',
        'ONLINE'
    ) );

ALTER TABLE usuario ADD CONSTRAINT pk_usuario PRIMARY KEY ( username );

ALTER TABLE usuario ADD CONSTRAINT un_usuario UNIQUE ( cedula );

CREATE TABLE vitamina (
    codigovitamina                NUMBER NOT NULL,
    nombre                        NVARCHAR2(15) NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

ALTER TABLE vitamina ADD CONSTRAINT pk_vitamina PRIMARY KEY ( codigovitamina );

ALTER TABLE vitamina ADD CONSTRAINT un_vitamina UNIQUE ( nombre );

CREATE TABLE vitaminacolor (
    codigovitamina                NUMBER NOT NULL,
    codigocolor                   NUMBER NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

ALTER TABLE vitaminacolor ADD CONSTRAINT pk_vitaminacolor PRIMARY KEY ( codigovitamina,
codigocolor );

ALTER TABLE vitaminacolor ADD CONSTRAINT un_vitaminacolor UNIQUE ( codigovitamina,
codigocolor );

ALTER TABLE abono
    ADD CONSTRAINT fk_abono_colaborador FOREIGN KEY ( codigocolaborador )
        REFERENCES colaborador ( codigocolaborador );

ALTER TABLE abono
    ADD CONSTRAINT fk_abono_huerta FOREIGN KEY ( codigohuerta )
        REFERENCES huerta ( codigohuerta );

ALTER TABLE abono
    ADD CONSTRAINT fk_abono_planta FOREIGN KEY ( codigoplanta )
        REFERENCES planta ( codigoplanta );

ALTER TABLE arbol
    ADD CONSTRAINT fk_arbol_especie FOREIGN KEY ( especie )
        REFERENCES especie ( codigoespecie );

ALTER TABLE arbol
    ADD CONSTRAINT fk_arbol_planta FOREIGN KEY ( codigoplanta )
        REFERENCES planta ( codigoplanta );

ALTER TABLE arbol
    ADD CONSTRAINT fk_arbol_tipocambium FOREIGN KEY ( cambium )
        REFERENCES tipocambium ( codigocambium );

ALTER TABLE arbol
    ADD CONSTRAINT fk_arbol_tipocorteza FOREIGN KEY ( corteza )
        REFERENCES tipocorteza ( codigocorteza );

ALTER TABLE arbol
    ADD CONSTRAINT fk_arbol_tipoxilema FOREIGN KEY ( xilema )
        REFERENCES tipoxilema ( codigoxilema );

ALTER TABLE calificacionhuerta
    ADD CONSTRAINT fk_calificacionhuerta_huerta FOREIGN KEY ( codigohuerta )
        REFERENCES huerta ( codigohuerta );

ALTER TABLE calificacionhuerta
    ADD CONSTRAINT fk_calificacionhuerta_usuario FOREIGN KEY ( username )
        REFERENCES usuario ( username );

ALTER TABLE cambioclave
    ADD CONSTRAINT fk_cambioclave_usuario FOREIGN KEY ( username )
        REFERENCES usuario ( username );

ALTER TABLE canton
    ADD CONSTRAINT fk_canton_provincia FOREIGN KEY ( provincia )
        REFERENCES provincia ( codigo );

ALTER TABLE clase
    ADD CONSTRAINT fk_clase_division FOREIGN KEY ( division )
        REFERENCES division ( codigodivision );

ALTER TABLE colaboradorhuerta
    ADD CONSTRAINT fk_colabhuerta_colaborador FOREIGN KEY ( colaborador )
        REFERENCES colaborador ( codigocolaborador );

ALTER TABLE colaborador
    ADD CONSTRAINT fk_colaborador_colaborador FOREIGN KEY ( encargado )
        REFERENCES colaborador ( codigocolaborador );

ALTER TABLE colaborador
    ADD CONSTRAINT fk_colaborador_persona FOREIGN KEY ( persona_cedula )
        REFERENCES persona ( cedula );

ALTER TABLE colaboradorhuerta
    ADD CONSTRAINT fk_colaboradorhuerta_huerta FOREIGN KEY ( huerta )
        REFERENCES huerta ( codigohuerta );

ALTER TABLE distrito
    ADD CONSTRAINT fk_distrito_canton FOREIGN KEY ( canton )
        REFERENCES canton ( codigo );

ALTER TABLE emailpersona
    ADD CONSTRAINT fk_emailpersona_persona FOREIGN KEY ( cedula )
        REFERENCES persona ( cedula );

ALTER TABLE especie
    ADD CONSTRAINT fk_especie_genero FOREIGN KEY ( genero )
        REFERENCES genero ( codigogenero );

ALTER TABLE familia
    ADD CONSTRAINT fk_familia_orden FOREIGN KEY ( orden )
        REFERENCES orden ( codigoorden );

ALTER TABLE genero
    ADD CONSTRAINT fk_genero_familia FOREIGN KEY ( familia )
        REFERENCES familia ( codigofamilia );

ALTER TABLE hortaliza
    ADD CONSTRAINT fk_hortaliza_colorhortaliza FOREIGN KEY ( codigocolor )
        REFERENCES color ( codigocolor );

ALTER TABLE hortaliza
    ADD CONSTRAINT fk_hortaliza_planta FOREIGN KEY ( codigoplanta )
        REFERENCES planta ( codigoplanta );

ALTER TABLE hortaliza
    ADD CONSTRAINT fk_hortaliza_tipohortaliza FOREIGN KEY ( codigotipo )
        REFERENCES tipohortaliza ( codigotipo );

ALTER TABLE huerta
    ADD CONSTRAINT fk_huerta_distrito FOREIGN KEY ( ubicacion )
        REFERENCES distrito ( codigo );

ALTER TABLE huerta
    ADD CONSTRAINT fk_huerta_localizacion FOREIGN KEY ( localizacion )
        REFERENCES localizacion ( codigo );

ALTER TABLE orden
    ADD CONSTRAINT fk_orden_clase FOREIGN KEY ( clase )
        REFERENCES clase ( codigoclase );

ALTER TABLE persona
    ADD CONSTRAINT fk_persona_pais FOREIGN KEY ( pais )
        REFERENCES pais ( codigo );

ALTER TABLE plantahuerta
    ADD CONSTRAINT fk_plantahuerta_huerta FOREIGN KEY ( huerta )
        REFERENCES huerta ( codigohuerta );

ALTER TABLE plantahuerta
    ADD CONSTRAINT fk_plantahuerta_planta FOREIGN KEY ( planta )
        REFERENCES planta ( codigoplanta );

ALTER TABLE propiedadhortaliza
    ADD CONSTRAINT fk_prophortaliza_hortaliza FOREIGN KEY ( codigoplanta )
        REFERENCES hortaliza ( codigoplanta );

ALTER TABLE propiedadhortaliza
    ADD CONSTRAINT fk_prophortaliza_propiedad FOREIGN KEY ( codigopropiedad )
        REFERENCES propiedad ( codigopropiedad );

ALTER TABLE provincia
    ADD CONSTRAINT fk_provincia_pais FOREIGN KEY ( pais )
        REFERENCES pais ( codigo );

ALTER TABLE telefonopersona
    ADD CONSTRAINT fk_telefonopersona_persona FOREIGN KEY ( cedula )
        REFERENCES persona ( cedula );

ALTER TABLE transaccion
    ADD CONSTRAINT fk_transaccion_huerta FOREIGN KEY ( huerta )
        REFERENCES huerta ( codigohuerta );

ALTER TABLE transaccion
    ADD CONSTRAINT fk_transaccion_persona FOREIGN KEY ( cedula )
        REFERENCES persona ( cedula );

ALTER TABLE transaccion
    ADD CONSTRAINT fk_transaccion_planta FOREIGN KEY ( planta )
        REFERENCES planta ( codigoplanta );

ALTER TABLE transaccion
    ADD CONSTRAINT fk_transaccion_tipotransaccion FOREIGN KEY ( tipotransaccion )
        REFERENCES tipotransaccion ( codigotipo );

ALTER TABLE usuario
    ADD CONSTRAINT fk_usuario_persona FOREIGN KEY ( cedula )
        REFERENCES persona ( cedula );

ALTER TABLE usuario
    ADD CONSTRAINT fk_usuario_tipousuario FOREIGN KEY ( tipousuario )
        REFERENCES tipousuario ( codigo );

ALTER TABLE vitaminacolor
    ADD CONSTRAINT fk_vitaminacolor_color FOREIGN KEY ( codigocolor )
        REFERENCES color ( codigocolor );

ALTER TABLE vitaminacolor
    ADD CONSTRAINT fk_vitaminacolor_vitamina FOREIGN KEY ( codigovitamina )
        REFERENCES vitamina ( codigovitamina );

CREATE SEQUENCE seq_abono START WITH 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER abono_codigo_trg BEFORE
    INSERT ON abono
    FOR EACH ROW
    WHEN ( new.codigo IS NULL )
BEGIN
    :new.codigo := seq_abono.nextval;
END;
/

CREATE SEQUENCE seq_calificacionhuerta START WITH 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER calificacionhuerta_codigocalif BEFORE
    INSERT ON calificacionhuerta
    FOR EACH ROW
    WHEN ( new.codigocalificacion IS NULL )
BEGIN
    :new.codigocalificacion := seq_calificacionhuerta.nextval;
END;
/

CREATE SEQUENCE seq_cambioclave START WITH 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER cambioclave_codigo_trg BEFORE
    INSERT ON cambioclave
    FOR EACH ROW
    WHEN ( new.codigo IS NULL )
BEGIN
    :new.codigo := seq_cambioclave.nextval;
END;
/

CREATE SEQUENCE seq_canton START WITH 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER canton_codigo_trg BEFORE
    INSERT ON canton
    FOR EACH ROW
    WHEN ( new.codigo IS NULL )
BEGIN
    :new.codigo := seq_canton.nextval;
END;
/

CREATE SEQUENCE seq_clase START WITH 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER clase_codigoclase_trg BEFORE
    INSERT ON clase
    FOR EACH ROW
    WHEN ( new.codigoclase IS NULL )
BEGIN
    :new.codigoclase := seq_clase.nextval;
END;
/

CREATE SEQUENCE seq_colaborador START WITH 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER colaborador_codigocolaborador BEFORE
    INSERT ON colaborador
    FOR EACH ROW
    WHEN ( new.codigocolaborador IS NULL )
BEGIN
    :new.codigocolaborador := seq_colaborador.nextval;
END;
/

CREATE SEQUENCE seq_color START WITH 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER color_codigocolor_trg BEFORE
    INSERT ON color
    FOR EACH ROW
    WHEN ( new.codigocolor IS NULL )
BEGIN
    :new.codigocolor := seq_color.nextval;
END;
/

CREATE SEQUENCE seq_distrito START WITH 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER distrito_codigo_trg BEFORE
    INSERT ON distrito
    FOR EACH ROW
    WHEN ( new.codigo IS NULL )
BEGIN
    :new.codigo := seq_distrito.nextval;
END;
/

CREATE SEQUENCE seq_division START WITH 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER division_codigodivision_trg BEFORE
    INSERT ON division
    FOR EACH ROW
    WHEN ( new.codigodivision IS NULL )
BEGIN
    :new.codigodivision := seq_division.nextval;
END;
/

CREATE SEQUENCE seq_especie START WITH 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER especie_codigoespecie_trg BEFORE
    INSERT ON especie
    FOR EACH ROW
    WHEN ( new.codigoespecie IS NULL )
BEGIN
    :new.codigoespecie := seq_especie.nextval;
END;
/

CREATE SEQUENCE seq_familia START WITH 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER familia_codigofamilia_trg BEFORE
    INSERT ON familia
    FOR EACH ROW
    WHEN ( new.codigofamilia IS NULL )
BEGIN
    :new.codigofamilia := seq_familia.nextval;
END;
/

CREATE SEQUENCE seq_genero START WITH 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER genero_codigogenero_trg BEFORE
    INSERT ON genero
    FOR EACH ROW
    WHEN ( new.codigogenero IS NULL )
BEGIN
    :new.codigogenero := seq_genero.nextval;
END;
/

CREATE SEQUENCE seq_planta START WITH 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER hortaliza_codigoplanta_trg BEFORE
    INSERT ON hortaliza
    FOR EACH ROW
    WHEN ( new.codigoplanta IS NULL )
BEGIN
    :new.codigoplanta := seq_planta.nextval;
END;
/

CREATE SEQUENCE seq_huerta START WITH 0 MAXVALUE 99999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER huerta_codigohuerta_trg BEFORE
    INSERT ON huerta
    FOR EACH ROW
    WHEN ( new.codigohuerta IS NULL )
BEGIN
    :new.codigohuerta := seq_huerta.nextval;
END;
/

CREATE SEQUENCE seq_localizacion START WITH 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER localizacion_codigo_trg BEFORE
    INSERT ON localizacion
    FOR EACH ROW
    WHEN ( new.codigo IS NULL )
BEGIN
    :new.codigo := seq_localizacion.nextval;
END;
/

CREATE SEQUENCE seq_orden START WITH 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER orden_codigoorden_trg BEFORE
    INSERT ON orden
    FOR EACH ROW
    WHEN ( new.codigoorden IS NULL )
BEGIN
    :new.codigoorden := seq_orden.nextval;
END;
/

CREATE OR REPLACE TRIGGER planta_codigoplanta_trg BEFORE
    INSERT ON planta
    FOR EACH ROW
    WHEN ( new.codigoplanta IS NULL )
BEGIN
    :new.codigoplanta := seq_planta.nextval;
END;
/

CREATE SEQUENCE seq_propiedad START WITH 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER propiedad_codigopropiedad_trg BEFORE
    INSERT ON propiedad
    FOR EACH ROW
    WHEN ( new.codigopropiedad IS NULL )
BEGIN
    :new.codigopropiedad := seq_propiedad.nextval;
END;
/

CREATE SEQUENCE seq_provincia START WITH 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER provincia_codigo_trg BEFORE
    INSERT ON provincia
    FOR EACH ROW
    WHEN ( new.codigo IS NULL )
BEGIN
    :new.codigo := seq_provincia.nextval;
END;
/

CREATE SEQUENCE seq_cambium START WITH 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tipocambium_codigocambium_trg BEFORE
    INSERT ON tipocambium
    FOR EACH ROW
    WHEN ( new.codigocambium IS NULL )
BEGIN
    :new.codigocambium := seq_cambium.nextval;
END;
/

CREATE SEQUENCE seq_corteza START WITH 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tipocorteza_codigocorteza_trg BEFORE
    INSERT ON tipocorteza
    FOR EACH ROW
    WHEN ( new.codigocorteza IS NULL )
BEGIN
    :new.codigocorteza := seq_corteza.nextval;
END;
/

CREATE SEQUENCE seq_tipohortaliza START WITH 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tipohortaliza_codigotipo_trg BEFORE
    INSERT ON tipohortaliza
    FOR EACH ROW
    WHEN ( new.codigotipo IS NULL )
BEGIN
    :new.codigotipo := seq_tipohortaliza.nextval;
END;
/

CREATE SEQUENCE seq_tipotransaccion START WITH 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tipotransaccion_codigotipo_trg BEFORE
    INSERT ON tipotransaccion
    FOR EACH ROW
    WHEN ( new.codigotipo IS NULL )
BEGIN
    :new.codigotipo := seq_tipotransaccion.nextval;
END;
/

CREATE SEQUENCE seq_tipousuario START WITH 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tipousuario_codigo_trg BEFORE
    INSERT ON tipousuario
    FOR EACH ROW
    WHEN ( new.codigo IS NULL )
BEGIN
    :new.codigo := seq_tipousuario.nextval;
END;
/

CREATE SEQUENCE seq_xilema START WITH 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tipoxilema_codigoxilema_trg BEFORE
    INSERT ON tipoxilema
    FOR EACH ROW
    WHEN ( new.codigoxilema IS NULL )
BEGIN
    :new.codigoxilema := seq_xilema.nextval;
END;
/

CREATE SEQUENCE seq_transaccion START WITH 0 MAXVALUE 99999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER transaccion_codigotransaccion BEFORE
    INSERT ON transaccion
    FOR EACH ROW
    WHEN ( new.codigotransaccion IS NULL )
BEGIN
    :new.codigotransaccion := seq_transaccion.nextval;
END;
/

CREATE SEQUENCE seq_vitamina START WITH 0 MAXVALUE 999999 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER vitamina_codigovitamina_trg BEFORE
    INSERT ON vitamina
    FOR EACH ROW
    WHEN ( new.codigovitamina IS NULL )
BEGIN
    :new.codigovitamina := seq_vitamina.nextval;
END;
/