create or replace package pck_hortaliza is
       procedure insert_vitamina(pNombre NVARCHAR2);
       procedure insert_vitaminacolor(pVitamina NUMBER, pColor NUMBER);
       procedure insert_color(pNombre NVARCHAR2, pDescripcion NVARCHAR2);
       procedure insert_propiedad(pDescripcion NVARCHAR2);
       procedure insert_propiedadhortaliza(pCodigoPlanta NUMBER, pCodigoColor NUMBER);
       procedure insert_tipohortaliza(pDescripcion NVARCHAR2);
       procedure insert_hortaliza(pNombre VARCHAR2, pActivo NVARCHAR2, pImagen blob, pCodigoTipo NUMBER, pCodigoColor NUMBER);
--       function propiedades_hortaliza(pId NUMBER) RETURN propiedades_hortaliza_record;
END;

/
create or replace package pck_arbol is
       procedure insert_xilema(pDescripcion NVARCHAR2);
       procedure insert_corteza(pDescripcion NVARCHAR2);
       procedure insert_cambium(pDescripcion NVARCHAR2);
       procedure insert_division(pNombre NVARCHAR2);
       procedure insert_clase(pNombre NVARCHAR2, pCodigoDivision NUMBER);
       procedure insert_orden(pNombre NVARCHAR2, pCodigoClase NUMBER);
       procedure insert_familia(pNombre NVARCHAR2, pCodigoOrden NUMBER);
       procedure insert_genero(pNombre NVARCHAR2, pCodigoFamilia NUMBER);
       procedure insert_especie(pNombre NVARCHAR2, pCodigoGenero NUMBER);
       procedure insert_arbol(pNombre VARCHAR2, pActivo NVARCHAR2, pImagen blob, pPeligro NVARCHAR2, 
                              pEspecie NUMBER, pCambium NUMBER, pCorteza NUMBER, pXilema NUMBER);  
END;
/
create or replace package pck_persona is
       procedure insert_pais(pNombre NVARCHAR2);
       procedure insert_usuario(pUsername NVARCHAR2, pPassword NVARCHAR2, pEstado NVARCHAR2, pTipoUsuario NUMBER, 
                                pCedula NUMBER, pPrimerNombre NVARCHAR2, pSegundoNombre NVARCHAR2, pPrimerApellido NVARCHAR2, 
                                pSegundoApellido NVARCHAR2, pFechaNac DATE, pImagen BLOB, pNacionalidad NVARCHAR2);
       procedure insert_colaborador(pActivo NVARCHAR2, pEncargado NUMBER, pPrimerNombre NVARCHAR2, pSegundoNombre NVARCHAR2,
                                    pCedula NUMBER, pPrimerApellido NVARCHAR2, pSegundoApellido NVARCHAR2, pFechaNac DATE, pImagen BLOB,
                                    pNacionalidad NVARCHAR2);
       procedure insert_tipoUsuario(pTipo NVARCHAR2);
       procedure insert_cambioClave(pClaveNueva VARCHAR2, pClaveVieja VARCHAR2,pUsername NVARCHAR2);
       procedure insert_emailPersona(pEmail NVARCHAR2, pCedula NUMBER);
       procedure insert_telefonoPersona(pTelefono NVARCHAR2, pCedula NUMBER);
END;
/
create or replace package pck_huerta is
       procedure insert_huerta(pNombre NVARCHAR2, pActivo NVARCHAR2, pUbicacion NUMBER, pXCoord NUMBER, pYCoord NUMBER);
       procedure insert_calificacionHuerta(pFechahora DATE, pComentario NVARCHAR2, pPuntuacion NUMBER,
                                           pUsername NVARCHAR2, pCodigoHuerta NUMBER);
       procedure insert_distrito(pNombre NVARCHAR2, pCanton NUMBER);
       procedure insert_canton(pNombre NVARCHAR2, pProvincia NUMBER);
       procedure insert_provincia(pNombre NVARCHAR2, pPais NVARCHAR2);
       procedure insert_colaboradorhuerta(pHuerta NUMBER, pColaborador NUMBER);
       procedure insert_plantahuerta(pPrecio NUMBER, pPlanta NUMBER, pHuerta NUMBER);
       procedure insert_abono(pFechahora DATE, pColaborador NUMBER, pHuerta NUMBER, pPlanta NUMBER);
END;
/
create or replace package pck_transaccion is
       procedure insert_compra(pFechahora DATE, pHuerta NUMBER, pPlanta NUMBER, pCedula NUMBER);
       procedure insert_trueque(pFechahora DATE, pHuerta NUMBER, pPlanta NUMBER, pCedula NUMBER, pPlantaT NUMBER);
END;
/
create or replace package pck_consultas is
       
END;
/
create or replace package pck_estadisticas is
       
END;
/

---------------------------------------------------------------------------------------------------------------------------
CREATE OR REPLACE PACKAGE BODY pck_hortaliza as
       --=============================================================
       procedure insert_vitamina(pNombre NVARCHAR2) is
       BEGIN
             insert into vitamina (nombre)
             values (pNombre);
       END;
       --=============================================================
       procedure insert_vitaminacolor(pVitamina NUMBER, pColor NUMBER) is
       BEGIN
             insert into vitaminacolor (codigovitamina, codigocolor)
             values (pVitamina, pColor);
       END;  
       --=============================================================
       procedure insert_color(pNombre NVARCHAR2, pDescripcion NVARCHAR2) is
       BEGIN
             insert into color (nombre, descripcion)
                    values (pNombre, pDescripcion);
       END;
       --=============================================================
       procedure insert_propiedad(pDescripcion NVARCHAR2) is
       BEGIN
             insert into propiedad (descripcion)
                        values (pDescripcion);
       END;
       --=============================================================
       procedure insert_propiedadhortaliza(pCodigoPlanta NUMBER, pCodigoColor NUMBER) is
       BEGIN
             insert into propiedadhortaliza (codigoplanta, codigopropiedad)
                    values (pCodigoPlanta, pCodigoColor);
       END;
       --=============================================================
       procedure insert_tipohortaliza(pDescripcion NVARCHAR2) is
       BEGIN
             insert into tipohortaliza (descripcion)
                    values (pDescripcion);
       END;
       --=============================================================
       procedure insert_hortaliza(pNombre VARCHAR2, pActivo NVARCHAR2, pImagen blob, pCodigoTipo NUMBER, pCodigoColor NUMBER) is
       BEGIN
             insert into planta (nombre, activo, imagen)
                    values (pNombre, pActivo, pImagen);
             insert into hortaliza (codigoplanta, codigotipo, codigocolor)
                    values (seq_planta.currval, pCodigoTipo, pCodigoColor);
       END;
       --=============================================================
END;
/

CREATE OR REPLACE PACKAGE BODY pck_arbol as
       procedure insert_xilema(pDescripcion NVARCHAR2) is
       BEGIN
             insert into Tipoxilema (Descripcion)
                    values (pDescripcion);
       END;
       --=============================================================
       procedure insert_corteza(pDescripcion NVARCHAR2) is
       BEGIN
             insert into Tipocorteza (Descripcion)
                    values (pDescripcion);
       END;
       --=============================================================
       procedure insert_cambium(pDescripcion NVARCHAR2) is
       BEGIN
             insert into Tipocambium (Descripcion)
                    values (pDescripcion);
       END;
       --=============================================================
       procedure insert_division(pNombre NVARCHAR2) is
       BEGIN
             insert into division (nombre)
                    values (pNombre);
       END;
       --=============================================================
       procedure insert_clase(pNombre NVARCHAR2, pCodigoDivision NUMBER) is
       BEGIN
             insert into clase (nombre, division)
                    values (pNombre, pCodigoDivision);
       END;
       --=============================================================
       procedure insert_orden(pNombre NVARCHAR2, pCodigoClase NUMBER) is
       BEGIN
             insert into orden (nombre, clase)
                    values (pNombre, pCodigoClase);
       END;
       --=============================================================
       procedure insert_familia(pNombre NVARCHAR2, pCodigoOrden NUMBER) is
       BEGIN
             insert into familia (nombre, orden)
                    values (pNombre, pCodigoOrden);
       END;
       --=============================================================
       procedure insert_genero(pNombre NVARCHAR2, pCodigoFamilia NUMBER) is
       BEGIN
             insert into genero (nombre, familia)
                    values (pNombre, pCodigoFamilia);
       END;
       --=============================================================
       procedure insert_especie(pNombre NVARCHAR2, pCodigoGenero NUMBER) is
       BEGIN
             insert into especie (nombre, genero)
                    values (pNombre, pCodigoGenero);
       END;
       --=============================================================
       procedure insert_arbol(pNombre VARCHAR2, pActivo NVARCHAR2, pImagen blob, pPeligro NVARCHAR2, 
                              pEspecie NUMBER, pCambium NUMBER, pCorteza NUMBER, pXilema NUMBER) is
       BEGIN
             insert into planta (nombre, activo, imagen)
                    values (pNombre, pActivo, pImagen);
             insert into arbol(codigoplanta, peligroextincion, especie, corteza, xilema, cambium)
                    values (seq_planta.currval, pPeligro, pEspecie, pCorteza, pXilema, pCambium);
       END;
       --=============================================================
END;
/

CREATE OR REPLACE PACKAGE BODY pck_persona as
       procedure insert_pais(pNombre NVARCHAR2) is
       BEGIN
             insert into pais (nombre)
                    values (pNombre);
       END;
       --=============================================================
       procedure insert_tipoUsuario(pTipo NVARCHAR2) is
       BEGIN
             insert into tipousuario (tipo)
                    values (pTipo);
       END;
       --=============================================================
       procedure insert_cambioClave(pClaveNueva VARCHAR2, pClaveVieja VARCHAR2,pUsername NVARCHAR2) is
       BEGIN
             insert into cambioclave (fechahora, clavevieja, clavenueva)
                    values (SYSDATE, pClaveVieja, pClaveNueva);
       END;
       --=============================================================
       procedure insert_emailPersona(pEmail NVARCHAR2, pCedula NUMBER) is
       BEGIN
             insert into emailpersona (email, cedula)
                    values (pEmail, pCedula);
       END;
       --=============================================================
       procedure insert_telefonoPersona(pTelefono NVARCHAR2, pCedula NUMBER) is
       BEGIN
             insert into telefonopersona (telefono, cedula)
                    values (pTelefono, pCedula);
       END;
       --=============================================================
       procedure insert_usuario(pUsername NVARCHAR2, pPassword NVARCHAR2, pEstado NVARCHAR2, pTipoUsuario NUMBER, 
                                pCedula NUMBER, pPrimerNombre NVARCHAR2, pSegundoNombre NVARCHAR2, pPrimerApellido NVARCHAR2, 
                                pSegundoApellido NVARCHAR2, pFechaNac DATE, pImagen BLOB, pNacionalidad NVARCHAR2) is
       BEGIN
             insert into persona (cedula, primernombre, segundonombre, primerapellido,segundoapellido, 
                                 fechanac, imagen, nacionalidad)
                    values (pCedula, pPrimerNombre, pSegundoNombre, pPrimerApellido, pSegundoApellido,
                           pFechaNac, pImagen, pNacionalidad);
             insert into usuario (username, password, estado, tipousuario, cedula)
                    values (pUsername, pPassword, pEstado, pTipoUsuario, pCedula);
       END;
       --=============================================================
       procedure insert_colaborador(pActivo NVARCHAR2, pEncargado NUMBER, pPrimerNombre NVARCHAR2, pSegundoNombre NVARCHAR2,
                                    pCedula NUMBER, pPrimerApellido NVARCHAR2, pSegundoApellido NVARCHAR2, pFechaNac DATE, pImagen BLOB,
                                    pNacionalidad NVARCHAR2) is
       BEGIN
             insert into persona (cedula, primernombre, segundonombre, primerapellido,segundoapellido, 
                                 fechanac, imagen, nacionalidad)
                    values (pCedula, pPrimerNombre, pSegundoNombre, pPrimerApellido, pSegundoApellido,
                           pFechaNac, pImagen, pNacionalidad);
             insert into colaborador (activo,encargado, persona_cedula)
                    values (pActivo, pEncargado, pCedula);
       END;
       --=============================================================
END;
/

CREATE OR REPLACE PACKAGE BODY pck_huerta as
       procedure insert_huerta(pNombre NVARCHAR2, pActivo NVARCHAR2, pUbicacion NUMBER, pXCoord NUMBER, pYCoord NUMBER) is
       BEGIN
             insert into localizacion (xcoord, ycoord)
                    values (pXCoord, pYCoord);
             insert into huertaa(nombre, activo, ubicacion,localizacion)
                    values (pNombre, pActivo, pUbicacion, seq_localizacion.currval);
       END;
       --=============================================================
       procedure insert_calificacionHuerta(pFechahora DATE, pComentario NVARCHAR2, pPuntuacion NUMBER,
                                           pUsername NVARCHAR2, pCodigoHuerta NUMBER) is
       BEGIN
             insert into calificacionhuerta (fechahora, comentario, puntuacion, username, codigohuerta)
                    values (pFechahora, pComentario, pPuntuacion, pUsername, pCodigoHuerta);
       END;
       --=============================================================
       procedure insert_distrito(pNombre NVARCHAR2, pCanton NUMBER) is
       BEGIN
             insert into distrito(nombre, canton)
                    values (pNombre, pCanton);
       END;
       --=============================================================
       procedure insert_canton(pNombre NVARCHAR2, pProvincia NUMBER) is
       BEGIN
             insert into canton(nombre, provincia)
                    values (pNombre, pProvincia);
       END;
       --=============================================================
       procedure insert_provincia(pNombre NVARCHAR2, pPais NVARCHAR2) is
       BEGIN
             insert into provincia (nombre, pais)
                    values (pNombre, pPais);
       END;

       --=============================================================
       procedure insert_colaboradorhuerta(pHuerta NUMBER, pColaborador NUMBER) is
       BEGIN
             insert into colaboradorhuerta(huerta, colaborador)
                    values (pHuerta, pColaborador);
       END;
       --=============================================================
       procedure insert_plantahuerta(pPrecio NUMBER, pPlanta NUMBER, pHuerta NUMBER) is
       BEGIN
             insert into plantaHuerta(Planta, Precio, Huerta)
                    values (pPlanta, pPrecio, pHuerta);
       END;
       --=============================================================
       procedure insert_abono(pFechahora DATE, pColaborador NUMBER, pHuerta NUMBER, pPlanta NUMBER) is
       BEGIN
             insert into abono(fechahora, codigocolaborador, codigohuerta, codigoplanta)
                    values (pFechahora, pColaborador, pHuerta, pPlanta);
       END;
       --=============================================================
END;
/

CREATE OR REPLACE PACKAGE BODY pck_transaccion as
       procedure insert_compra(pFechahora DATE, pHuerta NUMBER, pPlanta NUMBER, pCedula NUMBER) is
       BEGIN
             insert into transaccion (fechahora, huerta, planta, cedula)
                    values (pFechahora, pHuerta, pPlanta, pCedula);
       END;
       --=============================================================
       procedure insert_trueque(pFechahora DATE, pHuerta NUMBER, pPlanta NUMBER, pCedula NUMBER, pPlantaT NUMBER) is
       BEGIN
             insert into transaccion (fechahora, huerta, planta, cedula)
                    values (pFechahora, pHuerta, pPlanta, pCedula);
             insert into plantatrueque (codigotransaccion, planta)
                    values (seq_transaccion.currval,pPlantaT);
       END;
       --=============================================================
END;
/

CREATE OR REPLACE PACKAGE BODY pck_consultas as

END;
/

CREATE OR REPLACE PACKAGE BODY pck_estadisticas as

END;
/
