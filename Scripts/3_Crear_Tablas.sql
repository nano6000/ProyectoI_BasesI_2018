/*drop table abono cascade constraints;
drop table arbol cascade constraints;
drop table calificacionHuerta cascade constraints;
drop table cambioclave cascade constraints;
drop table canton cascade constraints;
drop table clase cascade constraints;
drop table colaborador cascade constraints;
drop table colaboradorHuerta cascade constraints;
drop table color cascade constraints;
drop table distrito cascade constraints;
drop table division cascade constraints;
drop table emailPersona cascade constraints;
drop table especie cascade constraints;
drop table familia cascade constraints;
drop table genero cascade constraints;
drop table hortaliza cascade constraints;
drop table huertaA cascade constraints;
drop table localizacion cascade constraints;
drop table orden cascade constraints;
drop table pais cascade constraints;
drop table persona cascade constraints;
drop table planta cascade constraints;
drop table plantahuerta cascade constraints;
drop table propiedad cascade constraints;
drop table propiedadHortaliza cascade constraints;
drop table provincia cascade constraints;
drop table telefonopersona cascade constraint;
drop table tipocambium cascade constraints;
drop table tipocorteza cascade constraints;
drop table tipohortaliza cascade constraints;
drop table plantatrueque cascade constraints;
drop table tipousuario cascade constraints;
drop table tipoxilema cascade constraints;
drop table transaccion cascade constraints;
drop table usuario cascade constraints;
drop table vitamina cascade constraints;
drop table vitaminacolor cascade constraints;*/

/*---------------------------------------------------
                     Tabla Abono
--------------------------------------------------*/
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

comment on column abono.codigo is 'Identificador unico del abono';
comment on column abono.fechahora is 'Fecha en la que se hizo el abono';
comment on column abono.codigocolaborador is 'Llave foranea que relaciona el abono con el colaborador que lo realiza';
comment on column abono.codigohuerta is 'Llave foranea que relaciona el abono con la huerta en la que se usa el abono';
comment on column abono.codigoplanta is 'Llave foranea que relaciona el abono con la planta a la que se le pone el abono';
comment on column abono.fec_creacion is 'Fecha original de la creacion del abono';
comment on column abono.usuario_creacion is 'Usuario original que lo creo';
comment on column abono.fec_ultima_modificacion is 'Fecha de la ultima modificacion del abono';
comment on column abono.usuario_ultima_modificacion is 'Usuario que lo modifico por ultima vez';

comment on table abono is 'Abono de la huerta';

ALTER TABLE abono ADD CONSTRAINT pk_abono PRIMARY KEY ( codigo )
    using index
    tablespace huerta_ind PCTFREE 20
    storage (INITIAL 10K NEXT 10K PCTINCREASE 0);
    
/*---------------------------------------------------
                     Tabla Arbol
---------------------------------------------------*/
CREATE TABLE arbol (
    codigoplanta                  NUMBER NOT NULL,
    peligroextincion               NVARCHAR2(2) DEFAULT 'NO' NOT NULL,
    especie                       NUMBER NOT NULL,
    corteza                       NUMBER NOT NULL,
    xilema                        NUMBER NOT NULL,
    cambium                       NUMBER NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);
comment on column arbol.codigoplanta is 'Llave foranea que relaciona el arbol con una planta, ademas 
                                        es el identificador unico del arbol';
comment on column arbol.peligroextincion is 'Marca si está o no en peligro de extincion';
comment on column arbol.especie is 'Llave foranea que relaciona el arbol con una especie';
comment on column arbol.corteza is 'Llave foranea que relaciona el arbol con su tipo de corteza';
comment on column arbol.xilema is 'Llave foranea que relaciona el arbol con su tipo de xilema';
comment on column arbol.cambium is 'Llave foranea que relaciona el arbol con su tipo de cambium';
comment on column arbol.fec_creacion is 'Fecha original de la creacion del arbol';
comment on column arbol.usuario_creacion is 'Usuario original que lo creo';
comment on column arbol.fec_ultima_modificacion is 'Fecha de la ultima modificacion al arbol';
comment on column arbol.usuario_ultima_modificacion is 'Usuario que lo modifico por ultima vez';

comment on table arbol is 'Arboles de la huerta';

ALTER TABLE arbol ADD CONSTRAINT ck_peligroextincion CHECK ( peligroextincion IN ('NO','SI') );

ALTER TABLE arbol ADD CONSTRAINT pk_arbol PRIMARY KEY ( codigoplanta )
    using index
    tablespace huerta_ind PCTFREE 20
    storage (INITIAL 10K NEXT 10K PCTINCREASE 0);
    
/*---------------------------------------------------
               Tabla CalificacionHuerta
---------------------------------------------------*/
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

comment on column calificacionhuerta.codigocalificacion is 'El identificador unico de la calificacion de la huerta';
comment on column calificacionhuerta.fechahora is 'Fecha y hora en las que se hizo la calificacion';
comment on column calificacionhuerta.comentario is 'Es el comentario adjunto a la calificacion';
comment on column calificacionhuerta.puntuacion is 'Puntuacion que se dio en la calificacion a la huerta';
comment on column calificacionhuerta.username is 'Usuario que hizo la calificacion';
comment on column calificacionhuerta.codigohuerta is 'Llave foranea que relaciona la calificacion con una huerta';
comment on column calificacionhuerta.fec_creacion is 'Fecha original de la creacion de la calificacion';
comment on column calificacionhuerta.usuario_creacion is 'Usuario original que lo creo';
comment on column calificacionhuerta.fec_ultima_modificacion is 'Fecha de la ultima modificacion a la calificacion';
comment on column calificacionhuerta.usuario_ultima_modificacion is 'Usuario que lo modifico por ultima vez';

comment on table calificacionhuerta is 'Calificaciones de la huerta hechas por usuarios';

ALTER TABLE calificacionhuerta ADD CONSTRAINT ck_puntuacion CHECK ( puntuacion BETWEEN 1 AND 5 );

ALTER TABLE calificacionhuerta ADD CONSTRAINT un_calificacionhuerta UNIQUE ( username, codigohuerta );

ALTER TABLE calificacionhuerta ADD CONSTRAINT pk_calificacionhuerta PRIMARY KEY ( codigocalificacion )
    using index
    tablespace huerta_ind PCTFREE 20
    storage (INITIAL 10K NEXT 10K PCTINCREASE 0);
    
/*---------------------------------------------------
                    Tabla CambioClave
---------------------------------------------------*/
CREATE TABLE cambioclave (
    codigo       NUMBER NOT NULL,
    fechahora    DATE NOT NULL,
    clavevieja   VARCHAR2(15 CHAR) NOT NULL,
    clavenueva   VARCHAR2(15 CHAR) NOT NULL,
    username     NVARCHAR2(15) NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

comment on column cambioclave.codigo is 'Identificador único del cambio de clave';
comment on column cambioclave.fechahora is 'Fecha en la que se hizo el cambio de clave';
comment on column cambioclave.clavevieja is 'Clave anterior';
comment on column cambioclave.clavenueva is 'Clave despues del cambio';
comment on column cambioclave.username is 'Usuario al que hizo el cambio de clave';
comment on column cambioclave.fec_creacion is 'Fecha original del primer cambio de clave';
comment on column cambioclave.usuario_creacion is 'Usuario que hizo El cambio de clave';
comment on column cambioclave.fec_ultima_modificacion is 'Fecha de la ultima modificacion a la clave';
comment on column cambioclave.usuario_ultima_modificacion is 'Usuario que lo modifico por ultima vez';

comment on table cambioclave is 'Todos los cambios de clave hechos por los usuarios';

ALTER TABLE cambioclave ADD CONSTRAINT pk_cambioclave PRIMARY KEY ( codigo )
    using index
    tablespace huerta_ind PCTFREE 20
    storage (INITIAL 10K NEXT 10K PCTINCREASE 0);
    
/*---------------------------------------------------
                     Tabla Canton
---------------------------------------------------*/
CREATE TABLE canton (
    codigo                        NUMBER NOT NULL,
    nombre                        NVARCHAR2(20) NOT NULL,
    provincia                     NUMBER NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

comment on column canton.codigo is 'Identificador único del canton';
comment on column canton.nombre is 'El nombre del canton';
comment on column canton.provincia is 'Llave foranea que relaciona el canton con una provincia';
comment on column canton.fec_creacion is 'Fecha original de la creacion del canton';
comment on column canton.usuario_creacion is 'Usuario original que lo creo';
comment on column canton.fec_ultima_modificacion is 'Fecha de la ultima modificacion al canton';
comment on column canton.usuario_ultima_modificacion is 'Usuario que lo modifico por ultima vez';

comment on table canton is 'Cantones de una provincia';

ALTER TABLE canton ADD CONSTRAINT pk_canton PRIMARY KEY ( codigo )
    using index
    tablespace huerta_ind PCTFREE 20
    storage (INITIAL 10K NEXT 10K PCTINCREASE 0);
    
/*---------------------------------------------------
                      Tabla Clase
---------------------------------------------------*/
CREATE TABLE clase (
    codigoclase                   NUMBER NOT NULL,
    nombre                        NVARCHAR2(15) NOT NULL,
    division                      NUMBER NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

comment on column clase.codigoclase is 'Identificador único de la clase de un orden';
comment on column clase.nombre is 'El nombre de la clase';
comment on column clase.division is 'Llave foranea que relaciona la clase con una division';
comment on column clase.fec_creacion is 'Fecha original de la creacion de la clase';
comment on column clase.usuario_creacion is 'Usuario original que lo creo';
comment on column clase.fec_ultima_modificacion is 'Fecha de la ultima modificacion a la clase';
comment on column clase.usuario_ultima_modificacion is 'Usuario que lo modifico por ultima vez';

comment on table clase is 'Clases de una division de un arbol';

ALTER TABLE clase ADD CONSTRAINT un_clase UNIQUE ( nombre );

ALTER TABLE clase ADD CONSTRAINT pk_clase PRIMARY KEY ( codigoclase )
    using index
    tablespace huerta_ind PCTFREE 20
    storage (INITIAL 10K NEXT 10K PCTINCREASE 0);
    
/*---------------------------------------------------
                  Tabla Colaborador
---------------------------------------------------*/
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

comment on column colaborador.codigocolaborador is 'Identificador único de un colaborador';
comment on column colaborador.activo is 'Marca si el colaborador está activo o no';
comment on column colaborador.encargado is 'Llave foranea que relaciona a un colaborador con un encargado';
comment on column colaborador.persona_cedula is 'Llave foranea que relaciona al colaborador con una persona';
comment on column colaborador.fec_creacion is 'Fecha original de la creacion del colaborador';
comment on column colaborador.usuario_creacion is 'Usuario original que lo creo';
comment on column colaborador.fec_ultima_modificacion is 'Fecha de la ultima modificacion del colaborador';
comment on column colaborador.usuario_ultima_modificacion is 'Usuario que lo modifico por ultima vez';

comment on table colaborador is 'Colaborador de la huerta';

CREATE UNIQUE INDEX colaborador__idx ON colaborador ( persona_cedula ASC );

ALTER TABLE colaborador ADD CONSTRAINT pk_colaborador PRIMARY KEY ( codigocolaborador )
    using index
    tablespace huerta_ind PCTFREE 20
    storage (INITIAL 10K NEXT 10K PCTINCREASE 0);
    
/*---------------------------------------------------
                Tabla ColaboradorHuerta
---------------------------------------------------*/
CREATE TABLE colaboradorhuerta (
    huerta                        NUMBER NOT NULL,
    colaborador                   NUMBER NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

comment on column colaboradorhuerta.huerta is 'Identificador que relaciona a la huerta';
comment on column colaboradorhuerta.colaborador is 'Identificador que relaciona a un colaborador con la huerta';
comment on column colaboradorhuerta.fec_creacion is 'Fecha original de la creacion del colaborador en cierta huerta';
comment on column colaboradorhuerta.usuario_creacion is 'Usuario original que lo creo';
comment on column colaboradorhuerta.fec_ultima_modificacion is 'Fecha de la ultima modificacion del colaborador en cierta huerta';
comment on column colaboradorhuerta.usuario_ultima_modificacion is 'Usuario que lo modifico por ultima vez';

comment on table colaboradorhuerta is 'Todos los colaboradores de todas las huertas';

ALTER TABLE colaboradorhuerta ADD CONSTRAINT pk_colaboradorhuerta PRIMARY KEY (huerta, colaborador)
    using index
    tablespace huerta_ind PCTFREE 20
    storage (INITIAL 10K NEXT 10K PCTINCREASE 0);
    
/*---------------------------------------------------
                     Tabla Color
---------------------------------------------------*/    
CREATE TABLE color (
    codigocolor                   NUMBER NOT NULL,
    nombre                        NVARCHAR2(10) NOT NULL,
    descripcion                   NVARCHAR2(20),
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

comment on column color.codigocolor is 'Identificador unico de un color';
comment on column color.nombre is 'Nombre del color';
comment on column color.descripcion is 'Descripcion del color';
comment on column color.fec_creacion is 'Fecha original de la creacion del color';
comment on column color.usuario_creacion is 'Usuario original que lo creo';
comment on column color.fec_ultima_modificacion is 'Fecha de la ultima modificacion del color';
comment on column color.usuario_ultima_modificacion is 'Usuario que lo modifico por ultima vez';

comment on table color is 'Un color, y su descripcion';

ALTER TABLE color ADD CONSTRAINT un_colorhortaliza UNIQUE ( nombre );

ALTER TABLE color ADD CONSTRAINT pk_colorhortaliza PRIMARY KEY ( codigocolor )
    using index
    tablespace huerta_ind PCTFREE 20
    storage (INITIAL 10K NEXT 10K PCTINCREASE 0);

/*---------------------------------------------------
                      Tabla Distrito
---------------------------------------------------*/   
CREATE TABLE distrito (
    codigo                        NUMBER NOT NULL,
    nombre                        NVARCHAR2(20) NOT NULL,
    canton                        NUMBER NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

comment on column distrito.codigo is 'Identificador único del distrito';
comment on column distrito.nombre is 'El nombre del distrito';
comment on column distrito.canton is 'Llave foranea que relaciona al distrito con un canton';
comment on column distrito.fec_creacion is 'Fecha original de la creacion del distrito';
comment on column distrito.usuario_creacion is 'Usuario original que lo creo';
comment on column distrito.fec_ultima_modificacion is 'Fecha de la ultima modificacion al distrito';
comment on column distrito.usuario_ultima_modificacion is 'Usuario que lo modifico por ultima vez';

comment on table distrito is 'Distritos de un canton';

ALTER TABLE distrito ADD CONSTRAINT pk_distrito PRIMARY KEY ( codigo )
    using index
    tablespace huerta_ind PCTFREE 20
    storage (INITIAL 10K NEXT 10K PCTINCREASE 0);
    
/*---------------------------------------------------
                     Tabla Division
---------------------------------------------------*/  
CREATE TABLE division (
    codigodivision                NUMBER NOT NULL,
    nombre                        NVARCHAR2(15) NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

comment on column division.codigodivision is 'Identificador único de la division';
comment on column division.nombre is 'El nombre de la division';
comment on column division.fec_creacion is 'Fecha original de la creacion de la division';
comment on column division.usuario_creacion is 'Usuario original que lo creo';
comment on column division.fec_ultima_modificacion is 'Fecha de la ultima modificacion a la division';
comment on column division.usuario_ultima_modificacion is 'Usuario que lo modifico por ultima vez';

comment on table division is 'Division de un arbol';

ALTER TABLE division ADD CONSTRAINT un_division UNIQUE ( nombre );

ALTER TABLE division ADD CONSTRAINT pk_division PRIMARY KEY ( codigodivision )
    using index
    tablespace huerta_ind PCTFREE 20
    storage (INITIAL 10K NEXT 10K PCTINCREASE 0);

/*---------------------------------------------------
                   Tabla EmailPersona
---------------------------------------------------*/  
CREATE TABLE emailpersona (
    email                         NVARCHAR2(20) NOT NULL,
    cedula                        NUMBER(9) NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

comment on column emailpersona.email is 'Identificador de los emails de las personas';
comment on column emailpersona.cedula is 'Llave foranea que relaciona el email con una persona y un identificador de los 
                                          emails de las personas';
comment on column emailpersona.fec_creacion is 'Fecha original de la creacion del email';
comment on column emailpersona.usuario_creacion is 'Usuario original que lo creo';
comment on column emailpersona.fec_ultima_modificacion is 'Fecha de la ultima modificacion del email';
comment on column emailpersona.usuario_ultima_modificacion is 'Usuario que lo modifico por ultima vez';

comment on table emailpersona is 'Email de una persona';

ALTER TABLE emailpersona ADD CONSTRAINT pk_emailpersona PRIMARY KEY ( email, cedula )
    using index
    tablespace huerta_ind PCTFREE 20
    storage (INITIAL 10K NEXT 10K PCTINCREASE 0);
    
/*---------------------------------------------------
                     Tabla Especie
---------------------------------------------------*/  
CREATE TABLE especie (
    codigoespecie                 NUMBER NOT NULL,
    nombre                        NVARCHAR2(15) NOT NULL,
    genero                        NUMBER NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

comment on column especie.codigoespecie is 'Identificador unico de la especie de un arbol';
comment on column especie.nombre is 'Nombre de una especie';
comment on column especie.genero is 'Llave foranea que relaciona una especie con un genero';
comment on column especie.fec_creacion is 'Fecha original de la creacion de la especie';
comment on column especie.usuario_creacion is 'Usuario original que lo creo';
comment on column especie.fec_ultima_modificacion is 'Fecha de la ultima modificacion de la especie';
comment on column especie.usuario_ultima_modificacion is 'Usuario que lo modifico por ultima vez';

comment on table especie is 'Las especies de un genero';

ALTER TABLE especie ADD CONSTRAINT un_especie UNIQUE ( nombre );

ALTER TABLE especie ADD CONSTRAINT pk_especie PRIMARY KEY ( codigoespecie )
    using index
    tablespace huerta_ind PCTFREE 20
    storage (INITIAL 10K NEXT 10K PCTINCREASE 0);

/*---------------------------------------------------
                    Tabla Familia
---------------------------------------------------*/  
CREATE TABLE familia (
    codigofamilia                 NUMBER NOT NULL,
    nombre                        NVARCHAR2(15) NOT NULL,
    orden                         NUMBER NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

comment on column familia.codigofamilia is 'Identificador unico de la familia de un arbol';
comment on column familia.nombre is 'Nombre de una familia';
comment on column familia.orden is 'Llave foranea que relaciona una familia con un orden';
comment on column familia.fec_creacion is 'Fecha original de la creacion de la familia';
comment on column familia.usuario_creacion is 'Usuario original que lo creo';
comment on column familia.fec_ultima_modificacion is 'Fecha de la ultima modificacion de la familia';
comment on column familia.usuario_ultima_modificacion is 'Usuario que lo modifico por ultima vez';

comment on table familia is 'Las familias de un orden';

ALTER TABLE familia ADD CONSTRAINT un_familia UNIQUE ( nombre );

ALTER TABLE familia ADD CONSTRAINT pk_familia PRIMARY KEY ( codigofamilia )
    using index
    tablespace huerta_ind PCTFREE 20
    storage (INITIAL 10K NEXT 10K PCTINCREASE 0);

/*---------------------------------------------------
                     Tabla Genero
---------------------------------------------------*/  
CREATE TABLE genero (
    codigogenero                  NUMBER NOT NULL,
    nombre                        NVARCHAR2(15) NOT NULL,
    familia                       NUMBER NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

comment on column genero.codigogenero is 'Identificador unico del genero de un arbol';
comment on column genero.nombre is 'Nombre de un genero';
comment on column genero.familia is 'Llave foranea que relaciona un genero con una familia';
comment on column genero.fec_creacion is 'Fecha original de la creacion del genero';
comment on column genero.usuario_creacion is 'Usuario original que lo creo';
comment on column genero.fec_ultima_modificacion is 'Fecha de la ultima modificacion del genero';
comment on column genero.usuario_ultima_modificacion is 'Usuario que lo modifico por ultima vez';

comment on table genero is 'Los generos de un familia';

ALTER TABLE genero ADD CONSTRAINT un_genero UNIQUE ( nombre );

ALTER TABLE genero ADD CONSTRAINT pk_genero PRIMARY KEY ( codigogenero )
    using index
    tablespace huerta_ind PCTFREE 20
    storage (INITIAL 10K NEXT 10K PCTINCREASE 0);

/*---------------------------------------------------
                   Tabla Hortaliza
---------------------------------------------------*/  
CREATE TABLE hortaliza (
    codigoplanta                  NUMBER NOT NULL,
    codigotipo                    NUMBER NOT NULL,
    codigocolor                   NUMBER NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

comment on column hortaliza.codigoplanta is 'Llave foranea que relaciona la hortaliza con una planta, ademas 
                                        es el identificador unico de una hortaliza';
comment on column hortaliza.codigotipo is 'Llave foranea que relaciona la hortaliza con un tipo';
comment on column hortaliza.codigocolor is 'Llave foranea que relaciona la hortaliza con un color';
comment on column hortaliza.fec_creacion is 'Fecha original de la creacion de la hortaliza';
comment on column hortaliza.usuario_creacion is 'Usuario original que lo creo';
comment on column hortaliza.fec_ultima_modificacion is 'Fecha de la ultima modificacion de la hortaliza';
comment on column hortaliza.usuario_ultima_modificacion is 'Usuario que lo modifico por ultima vez';

comment on table hortaliza is 'Las hortalizas de la huerta';

ALTER TABLE hortaliza ADD CONSTRAINT pk_hortaliza PRIMARY KEY ( codigoplanta )
    using index
    tablespace huerta_ind PCTFREE 20
    storage (INITIAL 10K NEXT 10K PCTINCREASE 0);
    
/*---------------------------------------------------
                   Tabla HuertaA
---------------------------------------------------*/  
CREATE TABLE huertaA (
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

comment on column huertaA.codigohuerta is 'Identificador unico de una huerta';
comment on column huertaA.nombre is 'Nombre de una huerta';
comment on column huertaA.activo is 'Marca si una huerta está o no aciva';
comment on column huertaA.ubicacion is 'Llave foranea que relaciona la huerta con un distrito';
comment on column huertaA.localizacion is 'Llave foranea que relaciona la huerta con una localizacion';
comment on column huertaA.fec_creacion is 'Fecha original de la creacion de la huerta';
comment on column huertaA.usuario_creacion is 'Usuario original que lo creo';
comment on column huertaA.fec_ultima_modificacion is 'Fecha de la ultima modificacion de la huerta';
comment on column huertaA.usuario_ultima_modificacion is 'Usuario que lo modifico por ultima vez';

comment on table huertaA is 'Todas las huertas registradas';

CREATE UNIQUE INDEX huerta__idx ON huertaA (localizacion ASC);

ALTER TABLE huertaA ADD CONSTRAINT un_huerta UNIQUE ( nombre );

ALTER TABLE huertaA ADD CONSTRAINT pk_huerta PRIMARY KEY ( codigohuerta )
    using index
    tablespace huerta_ind PCTFREE 20
    storage (INITIAL 10K NEXT 10K PCTINCREASE 0);

/*---------------------------------------------------
                  Tabla Localizacion
---------------------------------------------------*/  
CREATE TABLE localizacion (
    codigo                        NUMBER NOT NULL,
    xcoord                        NUMBER(8,6),
    ycoord                        NUMBER(8,6),
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

comment on column localizacion.codigo is 'Identificador unico de una localizacion';
comment on column localizacion.xcoord is 'Coordenada en x, o latitud';
comment on column localizacion.ycoord is 'Coordenada en y, o longitud';
comment on column localizacion.fec_creacion is 'Fecha original de la creacion de la localizacion';
comment on column localizacion.usuario_creacion is 'Usuario original que lo creo';
comment on column localizacion.fec_ultima_modificacion is 'Fecha de la ultima modificacion de la localizacion';
comment on column localizacion.usuario_ultima_modificacion is 'Usuario que lo modifico por ultima vez';

comment on table localizacion is 'Una localizacion en x y y';

ALTER TABLE localizacion ADD CONSTRAINT un_localizacion UNIQUE ( xcoord, ycoord );

ALTER TABLE localizacion ADD CONSTRAINT pk_localizacion PRIMARY KEY ( codigo )
    using index
    tablespace huerta_ind PCTFREE 20
    storage (INITIAL 10K NEXT 10K PCTINCREASE 0);

/*---------------------------------------------------
                         Tabla Orden
---------------------------------------------------*/  
CREATE TABLE orden (
    codigoorden                   NUMBER NOT NULL,
    nombre                        NVARCHAR2(15) NOT NULL,
    clase                         NUMBER NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

comment on column orden.codigoorden is 'Identificador unico del orden de un arbol';
comment on column orden.nombre is 'Nombre de un orden';
comment on column orden.clase is 'Llave foranea que relaciona un orden con una clase';
comment on column orden.fec_creacion is 'Fecha original de la creacion del orden';
comment on column orden.usuario_creacion is 'Usuario original que lo creo';
comment on column orden.fec_ultima_modificacion is 'Fecha de la ultima modificacion del orden';
comment on column orden.usuario_ultima_modificacion is 'Usuario que lo modifico por ultima vez';

comment on table orden is 'Los ordenes de una clase';

ALTER TABLE orden ADD CONSTRAINT un_orden UNIQUE ( nombre );

ALTER TABLE orden ADD CONSTRAINT pk_orden PRIMARY KEY ( codigoorden )
    using index
    tablespace huerta_ind PCTFREE 20
    storage (INITIAL 10K NEXT 10K PCTINCREASE 0);
    
/*---------------------------------------------------
                      Tabla Pais
---------------------------------------------------*/  
CREATE TABLE pais (
    codigo                        NVARCHAR2(3) NOT NULL,
    nombre                        NVARCHAR2(10) NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

comment on column pais.codigo is 'Identificador único del pais';
comment on column pais.nombre is 'El nombre del pais';
comment on column pais.fec_creacion is 'Fecha original de la creacion del pais';
comment on column pais.usuario_creacion is 'Usuario original que lo creo';
comment on column pais.fec_ultima_modificacion is 'Fecha de la ultima modificacion al pais';
comment on column pais.usuario_ultima_modificacion is 'Usuario que lo modifico por ultima vez';

comment on table pais is 'Pais de una huerta';

ALTER TABLE pais ADD CONSTRAINT pk_pais PRIMARY KEY ( codigo )
    using index
    tablespace huerta_ind PCTFREE 20
    storage (INITIAL 10K NEXT 10K PCTINCREASE 0);
    
/*---------------------------------------------------
                    Tabla Persona
---------------------------------------------------*/  
CREATE TABLE persona (
    cedula                        NUMBER(9) NOT NULL,
    primernombre                  NVARCHAR2(10) NOT NULL,
    segundonombre                 NVARCHAR2(10),
    primerapellido                NVARCHAR2(10) NOT NULL,
    segundoapellido               NVARCHAR2(10),
    fechanac                      DATE NOT NULL,
    imagen                        BLOB,
    nacionalidad                          NVARCHAR2(3) NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

comment on column persona.cedula is 'Identificador único de una persona';
comment on column persona.primernombre is 'El primer nombre de una persona';
comment on column persona.segundonombre is 'El segundo nombre de una persona';
comment on column persona.primerapellido is 'El primer apellido de una persona';
comment on column persona.segundoapellido is 'El segundo apellido de una persona';
comment on column persona.fechanac is 'La fecha de nacimiento de una persona';
comment on column persona.imagen is 'Una imagen de la persona';
comment on column persona.nacionalidad is 'Llave foranea que relaciona a la persona con un pais';
comment on column persona.fec_creacion is 'Fecha original de la creacion de una persona';
comment on column persona.usuario_creacion is 'Usuario original que lo creo';
comment on column persona.fec_ultima_modificacion is 'Fecha de la ultima modificacion de una persona';
comment on column persona.usuario_ultima_modificacion is 'Usuario que lo modifico por ultima vez';

comment on table persona is 'Una persona, puede ser un coolaborador o un usuario';

ALTER TABLE persona ADD CONSTRAINT pk_persona PRIMARY KEY ( cedula )
    using index
    tablespace huerta_ind PCTFREE 20
    storage (INITIAL 10K NEXT 10K PCTINCREASE 0);
    
/*---------------------------------------------------
                    Tabla Planta
---------------------------------------------------*/  
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

comment on column planta.codigoplanta is 'Identificador único de una planta';
comment on column planta.nombre is 'El nombre de una planta';
comment on column planta.activo is 'Marca si la planta esta activa en alguna huerta';
comment on column planta.imagen is 'Una imagen de la planta';
comment on column planta.fec_creacion is 'Fecha original de la creacion de una planta';
comment on column planta.usuario_creacion is 'Usuario original que lo creo';
comment on column planta.fec_ultima_modificacion is 'Fecha de la ultima modificacion de una planta';
comment on column planta.usuario_ultima_modificacion is 'Usuario que lo modifico por ultima vez';

comment on table planta is 'Una planta, puede ser un una hortaliza o un arbol';

ALTER TABLE planta ADD CONSTRAINT pk_planta PRIMARY KEY ( codigoplanta )
    using index
    tablespace huerta_ind PCTFREE 20
    storage (INITIAL 10K NEXT 10K PCTINCREASE 0);
    
/*---------------------------------------------------
                  Tabla PlantaHuerta
---------------------------------------------------*/ 
CREATE TABLE plantahuerta (
    precio                        NUMBER(12,2) DEFAULT 0 NOT NULL,
    planta                        NUMBER NOT NULL,
    huerta                        NUMBER NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

comment on column plantahuerta.precio is 'Precio de una planta en cierta huerta';
comment on column plantahuerta.planta is 'Llave foranea que relaciona una planta con una huerta, tambien funciona 
                                          como identificador unico';
comment on column plantahuerta.huerta is 'Llave foranea que relaciona una huerta con una planta, tambien funciona 
                                          como identificador unico';
comment on column plantahuerta.fec_creacion is 'Fecha original de la creacion de la planta en cierta huerta';
comment on column plantahuerta.usuario_creacion is 'Usuario original que lo creo';
comment on column plantahuerta.fec_ultima_modificacion is 'Fecha de la ultima modificacion de la planta en cierta huerta';
comment on column plantahuerta.usuario_ultima_modificacion is 'Usuario que lo modifico por ultima vez';

comment on table plantahuerta is 'Todas las plantas en cierta huerta';

ALTER TABLE plantahuerta ADD CONSTRAINT ck_precio CHECK ( precio = 0 );

ALTER TABLE plantahuerta ADD CONSTRAINT pk_plantahuerta PRIMARY KEY ( planta,
huerta )
    using index
    tablespace huerta_ind PCTFREE 20
    storage (INITIAL 10K NEXT 10K PCTINCREASE 0);
    
/*---------------------------------------------------
                   Tabla Propiedad
---------------------------------------------------*/ 
CREATE TABLE propiedad (
    codigopropiedad               NUMBER NOT NULL,
    descripcion                   NVARCHAR2(20) NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

comment on column propiedad.codigopropiedad is 'Identificador único de una propiedad';
comment on column propiedad.descripcion is 'El nombre de la propiedad';
comment on column propiedad.fec_creacion is 'Fecha original de la creacion de la propiedad';
comment on column propiedad.usuario_creacion is 'Usuario original que lo creo';
comment on column propiedad.fec_ultima_modificacion is 'Fecha de la ultima modificacion de la propiedad';
comment on column propiedad.usuario_ultima_modificacion is 'Usuario que lo modifico por ultima vez';

comment on table propiedad is 'Una propiedad, o caracteristica';

ALTER TABLE propiedad ADD CONSTRAINT pk_propiedad PRIMARY KEY ( codigopropiedad )
    using index
    tablespace huerta_ind PCTFREE 20
    storage (INITIAL 10K NEXT 10K PCTINCREASE 0);
    
/*---------------------------------------------------
               Tabla PropiedadHortaliza
---------------------------------------------------*/ 
CREATE TABLE propiedadhortaliza (
    codigopropiedad               NUMBER NOT NULL,
    codigoplanta                  NUMBER NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

comment on column propiedadhortaliza.codigopropiedad is 'Llave foranea que relaciona una propiedad con una planta, 
                                                         además identificador único de una propiedad';
comment on column propiedadhortaliza.codigoplanta is 'Llave foranea que relaciona una planta con una propiedad, 
                                                      además identificador único de una propiedad';
comment on column propiedadhortaliza.fec_creacion is 'Fecha original de la creacion de la propiedad de la planta';
comment on column propiedadhortaliza.usuario_creacion is 'Usuario original que lo creo';
comment on column propiedadhortaliza.fec_ultima_modificacion is 'Fecha de la ultima modificacion de la propiedad de la planta';
comment on column propiedadhortaliza.usuario_ultima_modificacion is 'Usuario que lo modifico por ultima vez';

comment on table propiedadhortaliza is 'Una propiedad, o caracteristica de cierta planta';

ALTER TABLE propiedadhortaliza ADD CONSTRAINT pk_propiedadhortaliza PRIMARY KEY ( codigopropiedad,
codigoplanta )
    using index
    tablespace huerta_ind PCTFREE 20
    storage (INITIAL 10K NEXT 10K PCTINCREASE 0);
    
/*---------------------------------------------------
                     Tabla Provincia
---------------------------------------------------*/ 
CREATE TABLE provincia (
    codigo                        NUMBER NOT NULL,
    nombre                        NVARCHAR2(20) NOT NULL,
    pais                          NVARCHAR2(3) NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

comment on column provincia.codigo is 'Identificador único de la provincia';
comment on column provincia.nombre is 'El nombre de la provincia';
comment on column provincia.pais is 'Llave foranea que relaciona la provincia con un país';
comment on column provincia.fec_creacion is 'Fecha original de la creacion de la provincia';
comment on column provincia.usuario_creacion is 'Usuario original que lo creo';
comment on column provincia.fec_ultima_modificacion is 'Fecha de la ultima modificacion de la provincia';
comment on column provincia.usuario_ultima_modificacion is 'Usuario que lo modifico por ultima vez';

comment on table provincia is 'Provincias de un pais';

ALTER TABLE provincia ADD CONSTRAINT pk_provincia PRIMARY KEY ( codigo )
    using index
    tablespace huerta_ind PCTFREE 20
    storage (INITIAL 10K NEXT 10K PCTINCREASE 0);
    
/*---------------------------------------------------
                 Tabla TelefonoPersona
---------------------------------------------------*/ 
CREATE TABLE telefonopersona (
    telefono                      NVARCHAR2(20) NOT NULL,
    cedula                        NUMBER(9) NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

comment on column telefonopersona.telefono is 'Llave foranea que relaciona una telefono con una persona, 
                                               además identificador único de un telefono';
comment on column telefonopersona.cedula is 'Llave foranea que relaciona una persona con una telefono, 
                                             además identificador único de una telefono';
comment on column telefonopersona.fec_creacion is 'Fecha original de la creacion de un telefono de una persona';
comment on column telefonopersona.usuario_creacion is 'Usuario original que lo creo';
comment on column telefonopersona.fec_ultima_modificacion is 'Fecha de la ultima modificacion de un telefono de una persona';
comment on column telefonopersona.usuario_ultima_modificacion is 'Usuario que lo modifico por ultima vez';

comment on table telefonopersona is 'Telefonos de una persona';

ALTER TABLE telefonopersona ADD CONSTRAINT pk_telefonopersona PRIMARY KEY (telefono,
cedula)
    using index
    tablespace huerta_ind PCTFREE 20
    storage (INITIAL 10K NEXT 10K PCTINCREASE 0);
    
/*---------------------------------------------------
                   Tabla TipoCambium
---------------------------------------------------*/ 
CREATE TABLE tipocambium (
    codigocambium                 NUMBER NOT NULL,
    descripcion                   NVARCHAR2(20) NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

comment on column tipocambium.codigocambium is 'Identificador único de un tipo de cambium';
comment on column tipocambium.descripcion is 'Descripcion de un tipo de cambium';
comment on column tipocambium.fec_creacion is 'Fecha original de la creacion de un cambium';
comment on column tipocambium.usuario_creacion is 'Usuario original que lo creo';
comment on column tipocambium.fec_ultima_modificacion is 'Fecha de la ultima modificacion de un cambium';
comment on column tipocambium.usuario_ultima_modificacion is 'Usuario que lo modifico por ultima vez';

comment on table tipocambium is 'Los cambiums que puede tener un arbol';

ALTER TABLE tipocambium ADD CONSTRAINT pk_tipocambium PRIMARY KEY ( codigocambium )
    using index
    tablespace huerta_ind PCTFREE 20
    storage (INITIAL 10K NEXT 10K PCTINCREASE 0);
    
/*---------------------------------------------------
                  Tabla TipoCorteza
---------------------------------------------------*/
CREATE TABLE tipocorteza (
    codigocorteza                 NUMBER NOT NULL,
    descripcion                   NVARCHAR2(20) NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

comment on column tipocorteza.codigocorteza is 'Identificador único de un tipo de corteza';
comment on column tipocorteza.descripcion is 'Descripcion de un tipo de corteza';
comment on column tipocorteza.fec_creacion is 'Fecha original de la creacion de un tipo de corteza';
comment on column tipocorteza.usuario_creacion is 'Usuario original que lo creo';
comment on column tipocorteza.fec_ultima_modificacion is 'Fecha de la ultima modificacion de un tipo de corteza';
comment on column tipocorteza.usuario_ultima_modificacion is 'Usuario que lo modifico por ultima vez';

comment on table tipocorteza is 'Las cortezas que puede tener un arbol';

ALTER TABLE tipocorteza ADD CONSTRAINT pk_tipocorteza PRIMARY KEY ( codigocorteza )
    using index
    tablespace huerta_ind PCTFREE 20
    storage (INITIAL 10K NEXT 10K PCTINCREASE 0);
    
/*---------------------------------------------------
                  Tabla TipoHortaliza
---------------------------------------------------*/
CREATE TABLE tipohortaliza (
    codigotipo                    NUMBER NOT NULL,
    descripcion                   NVARCHAR2(20) NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

comment on column tipohortaliza.codigotipo is 'Identificador único de un tipo de hortaliza';
comment on column tipohortaliza.descripcion is 'Descripcion de un tipo de hortaliza';
comment on column tipohortaliza.fec_creacion is 'Fecha original de la creacion de un tipo de hortaliza';
comment on column tipohortaliza.usuario_creacion is 'Usuario original que lo creo';
comment on column tipohortaliza.fec_ultima_modificacion is 'Fecha de la ultima modificacion de un tipo de hortaliza';
comment on column tipohortaliza.usuario_ultima_modificacion is 'Usuario que lo modifico por ultima vez';

comment on table tipohortaliza is 'Los tipos que puede tener una hortaliza';

ALTER TABLE tipohortaliza ADD CONSTRAINT pk_tipohortaliza PRIMARY KEY ( codigotipo )
    using index
    tablespace huerta_ind PCTFREE 20
    storage (INITIAL 10K NEXT 10K PCTINCREASE 0);
    
/*---------------------------------------------------
                 Tabla PlantaTrueque
---------------------------------------------------*/
CREATE TABLE plantatrueque (
    codigotransaccion             NUMBER NOT NULL,
    planta                        NUMBER NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

comment on column plantatrueque.codigotransaccion is 'Llave foranea que relaciona a la entidad con una transaccion. Ademas es 
                                                     identificador único de plantatrueque';
comment on column plantatrueque.planta is 'Llave foranea que relaciona una transaccion con una planta';
comment on column plantatrueque.fec_creacion is 'Fecha original de la creacion del trueque';
comment on column plantatrueque.usuario_creacion is 'Usuario original que lo creo';
comment on column plantatrueque.fec_ultima_modificacion is 'Fecha de la ultima modificacion del trueque';
comment on column plantatrueque.usuario_ultima_modificacion is 'Usuario que lo modifico por ultima vez';

comment on table plantatrueque is 'La planta extra de una transaccion que sea un trueque';

ALTER TABLE plantatrueque ADD CONSTRAINT pk_plantatrueque PRIMARY KEY ( codigotransaccion )
    using index
    tablespace huerta_ind PCTFREE 20
    storage (INITIAL 10K NEXT 10K PCTINCREASE 0);

/*--------------------------------------------------
                  Tabla TipoUsuario
---------------------------------------------------*/
CREATE TABLE tipousuario (
    codigo                        NUMBER NOT NULL,
    tipo                          NVARCHAR2(15) NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

comment on column tipousuario.codigo is 'Identificador único de un tipo de usuario';
comment on column tipousuario.tipo is 'Nombre de un tipo de usuario';
comment on column tipousuario.fec_creacion is 'Fecha original de la creacion de un tipo de usuario';
comment on column tipousuario.usuario_creacion is 'Usuario original que lo creo';
comment on column tipousuario.fec_ultima_modificacion is 'Fecha de la ultima modificacion de un tipo de usuario';
comment on column tipousuario.usuario_ultima_modificacion is 'Usuario que lo modifico por ultima vez';

comment on table tipousuario is 'Los tipos de usuario que puede haber';

ALTER TABLE tipousuario ADD CONSTRAINT pk_tipousuario PRIMARY KEY ( codigo )
    using index
    tablespace huerta_ind PCTFREE 20
    storage (INITIAL 10K NEXT 10K PCTINCREASE 0);
    
/*---------------------------------------------------
                   Tabla TipoXilema
---------------------------------------------------*/
CREATE TABLE tipoxilema (
    codigoxilema                  NUMBER NOT NULL,
    descripcion                   NVARCHAR2(20) NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

comment on column tipoxilema.codigoxilema is 'Identificador único de un tipo de xilema';
comment on column tipoxilema.descripcion is 'Nombre de un tipo de xilema';
comment on column tipoxilema.fec_creacion is 'Fecha original de la creacion de un tipo de xilema';
comment on column tipoxilema.usuario_creacion is 'Usuario original que lo creo';
comment on column tipoxilema.fec_ultima_modificacion is 'Fecha de la ultima modificacion de un tipo de xilema';
comment on column tipoxilema.usuario_ultima_modificacion is 'Usuario que lo modifico por ultima vez';

comment on table tipoxilema is 'Los tipos de xilema que puede tener un arbol';

ALTER TABLE tipoxilema ADD CONSTRAINT pk_tipoxilema PRIMARY KEY ( codigoxilema )
    using index
    tablespace huerta_ind PCTFREE 20
    storage (INITIAL 10K NEXT 10K PCTINCREASE 0);
    
/*---------------------------------------------------
                   Tabla Transaccion
---------------------------------------------------*/
CREATE TABLE transaccion (
    codigotransaccion             NUMBER NOT NULL,
    fechahora                     DATE NOT NULL,
    huerta                        NUMBER NOT NULL,
    planta                        NUMBER NOT NULL,
    cedula                        NUMBER(9) NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

comment on column transaccion.codigotransaccion is 'Identificador único de una transaccion';
comment on column transaccion.fechahora is 'Fecha y hora de un transaccion';
comment on column transaccion.huerta is 'Llave foranea que relaciona una transaccion con una huerta';
comment on column transaccion.planta is 'Llave foranea que relaciona una transaccion con una planta';
comment on column transaccion.cedula is 'Llave foranea que relaciona una transaccion con una persona';
comment on column transaccion.fec_creacion is 'Fecha original de la creacion de una transaccion';
comment on column transaccion.usuario_creacion is 'Usuario original que lo creo';
comment on column transaccion.fec_ultima_modificacion is 'Fecha de la ultima modificacion de una transaccion';
comment on column transaccion.usuario_ultima_modificacion is 'Usuario que lo modifico por ultima vez';

comment on table transaccion is 'Las transacciones que se hagan';

ALTER TABLE transaccion ADD CONSTRAINT pk_transaccion PRIMARY KEY ( codigotransaccion )
    using index
    tablespace huerta_ind PCTFREE 20
    storage (INITIAL 10K NEXT 10K PCTINCREASE 0);
    
/*---------------------------------------------------
                   Tabla Usuario
---------------------------------------------------*/
CREATE TABLE usuario (
    username      NVARCHAR2(15) NOT NULL,
    password      NVARCHAR2(15) NOT NULL,
    estado        NVARCHAR2(7) NOT NULL,
    tipousuario   NUMBER NOT NULL,
    cedula        NUMBER(9) NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

comment on column usuario.username is 'Identificador único del usuario';
comment on column usuario.password is 'Contraseña actual del usuario';
comment on column usuario.estado is 'marca el estado del usuario, si esta en linea o no';
comment on column usuario.tipousuario is 'Llave foranea que relaciona un usuario con un tipo';
comment on column usuario.cedula is 'Llave foranea que relaciona un usuario con una persona';
comment on column usuario.fec_creacion is 'Fecha original de la creacion del usuario';
comment on column usuario.usuario_creacion is 'Usuario original que lo creo';
comment on column usuario.fec_ultima_modificacion is 'Fecha de la ultima modificacion del usuario';
comment on column usuario.usuario_ultima_modificacion is 'Usuario que lo modifico por ultima vez';

comment on table usuario is 'Los usuarios de las huertas';

ALTER TABLE usuario ADD CONSTRAINT ck_estado CHECK ( estado IN ('OFFLINE', 'ONLINE') );

ALTER TABLE usuario ADD CONSTRAINT un_usuario UNIQUE ( cedula );

ALTER TABLE usuario ADD CONSTRAINT pk_usuario PRIMARY KEY ( username )
    using index
    tablespace huerta_ind PCTFREE 20
    storage (INITIAL 10K NEXT 10K PCTINCREASE 0);

/*---------------------------------------------------
                   Tabla Vitamina
---------------------------------------------------*/
CREATE TABLE vitamina (
    codigovitamina                NUMBER NOT NULL,
    nombre                        NVARCHAR2(15) NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

comment on column vitamina.codigovitamina is 'Identificador único de una vitamina';
comment on column vitamina.nombre is 'Nombre de una vitamina';
comment on column vitamina.fec_creacion is 'Fecha original de la creacion de una vitamina';
comment on column vitamina.usuario_creacion is 'Usuario original que lo creo';
comment on column vitamina.fec_ultima_modificacion is 'Fecha de la ultima modificacion de una vitamina';
comment on column vitamina.usuario_ultima_modificacion is 'Usuario que lo modifico por ultima vez';

comment on table vitamina is 'Una vitamina';

ALTER TABLE vitamina ADD CONSTRAINT un_vitamina UNIQUE ( nombre );

ALTER TABLE vitamina ADD CONSTRAINT pk_vitamina PRIMARY KEY ( codigovitamina )
    using index
    tablespace huerta_ind PCTFREE 20
    storage (INITIAL 10K NEXT 10K PCTINCREASE 0);

/*---------------------------------------------------
               Tabla VitaminaColor
---------------------------------------------------*/
CREATE TABLE vitaminacolor (
    codigovitamina                NUMBER NOT NULL,
    codigocolor                   NUMBER NOT NULL,
    fec_creacion                  DATE,
    usuario_creacion              VARCHAR2(10),
    fec_ultima_modificacion       DATE,
    usuario_ultima_modificacion   VARCHAR2(10)
);

comment on column vitaminacolor.codigovitamina is 'Llave foranea que relaciona una vitamina con un color, ademas es 
                                              identificador único de una vitamina';
comment on column vitaminacolor.codigocolor is 'Llave foranea que relaciona un color con una vitamina, ademas es 
                                              identificador único de una vitamina';
comment on column vitaminacolor.fec_creacion is 'Fecha original de la creacion del color de la vitamina';
comment on column vitaminacolor.usuario_creacion is 'Usuario original que lo creo';
comment on column vitaminacolor.fec_ultima_modificacion is 'Fecha de la ultima modificacion del color de la vitamina';
comment on column vitaminacolor.usuario_ultima_modificacion is 'Usuario que lo modifico por ultima vez';

comment on table vitaminacolor is 'El color que pueda tener una vitamina';

ALTER TABLE vitaminacolor ADD CONSTRAINT pk_vitaminacolor PRIMARY KEY ( codigovitamina, codigocolor )
    using index
    tablespace huerta_ind PCTFREE 20
    storage (INITIAL 10K NEXT 10K PCTINCREASE 0);

/*---------------------------------------------------
               Llaves foraneas
---------------------------------------------------*/
ALTER TABLE abono
    ADD CONSTRAINT fk_abono_colaborador FOREIGN KEY ( codigocolaborador )
        REFERENCES colaborador ( codigocolaborador );

ALTER TABLE abono
    ADD CONSTRAINT fk_abono_huerta FOREIGN KEY ( codigohuerta )
        REFERENCES huertaA ( codigohuerta );

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
        REFERENCES huertaA ( codigohuerta );

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
        REFERENCES huertaA ( codigohuerta );

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

ALTER TABLE huertaA
    ADD CONSTRAINT fk_huerta_distrito FOREIGN KEY ( ubicacion )
        REFERENCES distrito ( codigo );

ALTER TABLE huertaA
    ADD CONSTRAINT fk_huerta_localizacion FOREIGN KEY ( localizacion )
        REFERENCES localizacion ( codigo );

ALTER TABLE orden
    ADD CONSTRAINT fk_orden_clase FOREIGN KEY ( clase )
        REFERENCES clase ( codigoclase );

ALTER TABLE persona
    ADD CONSTRAINT fk_persona_pais FOREIGN KEY ( nacionalidad )
        REFERENCES pais ( codigo );

ALTER TABLE plantahuerta
    ADD CONSTRAINT fk_plantahuerta_huerta FOREIGN KEY ( huerta )
        REFERENCES huertaA ( codigohuerta );

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

ALTER TABLE plantatrueque
    ADD CONSTRAINT fk_plantatrueque_transaccion FOREIGN KEY ( codigotransaccion )
        REFERENCES transaccion ( codigotransaccion );

ALTER TABLE plantatrueque
    ADD CONSTRAINT fk_plantatrueque_planta FOREIGN KEY ( planta )
        REFERENCES planta ( codigoplanta );

ALTER TABLE transaccion
    ADD CONSTRAINT fk_transaccion_huerta FOREIGN KEY ( huerta )
        REFERENCES huertaA ( codigohuerta );

ALTER TABLE transaccion
    ADD CONSTRAINT fk_transaccion_persona FOREIGN KEY ( cedula )
        REFERENCES persona ( cedula );

ALTER TABLE transaccion
    ADD CONSTRAINT fk_transaccion_planta FOREIGN KEY ( planta )
        REFERENCES planta ( codigoplanta );

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
