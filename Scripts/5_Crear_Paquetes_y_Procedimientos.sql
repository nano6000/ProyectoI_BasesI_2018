create or replace package pck_hortaliza is
       procedure insert_vitamina(pNombre NVARCHAR2(30));
       procedure insert_vitaminacolor(pVitamina NUMBER, pColor NUMBER)
       procedure insert_color(pNombre NVARCHAR2(20), pDescripcion NVARCHAR2(40));
       procedure insert_propiedad(pDescripcion NVARCHAR2(40));
       procedure insert_propiedadhortaliza(pCodigoPlanta NUMBER, pCodigoColor NUMBER);
       procedure insert_tipohortaliza(pDescripcion NVARCHAR2(40));
       procedure insert_hortaliza(pNombre VARCHAR2(15), pActivo NVARCHAR2(20), pImagen blob, pCodigoTipo NUMBER, pCodigoColor NUMBER);
END;
/
create or replace package pck_arbol is
       procedure insert_xilema(pDescripcion NVARCHAR2(40));
       procedure insert_corteza(pDescripcion NVARCHAR2(40));
       procedure insert_cambium(pDescripcion NVARCHAR2(40));
       procedure insert_division(pNombre NVARCHAR2(30));
       procedure insert_clase(pNombre NVARCHAR2(30), pCodigoDivision NUMBER);
       procedure insert_orden(pNombre NVARCHAR2(30), pCodigoClase NUMBER);
       procedure insert_familia(pNombre NVARCHAR2(30), pCodigoOrden NUMBER);
       procedure insert_genero(pNombre NVARCHAR2(30), pCodigoFamilia NUMBER);
       procedure insert_especie(pNombre NVARCHAR2(30), pCodigoGenero NUMBER);
       procedure insert_arbol(pNombre VARCHAR2(15), pActivo NVARCHAR2(20), pImagen blob, pPeligro NVARCHAR2(4), 
                              pEspecie NUMBER, pCambium NUMBER, pCorteza NUMBER, pXilema NUMBER);  
END;
/
create or replace package pck_persona is
       procedure insert_pais(pNombre NVARCHAR2(20));
       procedure insert_usuario(pUsername NVARCHAR(30), pPassword NVARCHAR2(30), pEstado NVARCHAR2(14), pTipoUsuario NUMBER, 
                                pPrimerNombre NVARCHAR2(20), pSegundoNombre NVARCHAR2(20), pPrimerApellido NVARCHAR2(20), 
                                pSegundoApellido NVARCHAR2(20), pFechaNac DATE, pImagen BLOB, pNacionalidad NVARCHAR2(6));
       procedure insert_colaborador(pActivo NVARCHAR2(20), pEncargado NUMBER, pPrimerNombre NVARCHAR2(20), pSegundoNombre NVARCHAR2(20),
                                    pPrimerApellido NVARCHAR2(20), pSegundoApellido NVARCHAR2(20), pFechaNac DATE, pImagen BLOB,
                                    pNacionalidad NVARCHAR2(6));
       procedure insert_tipoUsuario(pTipo NVARCHAR2(30));
       procedure insert_cambioClave(pClaveNueva VARCHAR2(15));
       procedure insert_emailPersona(pEmail NVARCHAR2(40), pCedula NUMBER(9));
       procedure insert_telefonoPersona(pEmail NVARCHAR2(40), pCedula NUMBER(9));
END;
/
create or replace package pck_huerta is
       procedure insert_huerta(pNombre NVARCHAR2(30), pActivo NVARCHAR2(20), pUbicacion NUMBER, pLocalizacion NUMBER);
       procedure insert_calificacionHuerta(pFechahora DATE, pComentario NVARCHAR2(500), pPuntuacion NUMBER(1),
                                           pUsername NVARCHAR2(30), pCodigoHuerta NUMBER);
       procedure insert_distrito(pNombre NVARCHAR2(40), pCanton NUMBER);
       procedure insert_canton(pNombre NVARCHAR2(40), pProvincia NUMBER);
       procedure insert_provincia(pNombre NVARCHAR2(40), pPais NVARCHAR2(6));
       procedure insert_localizacion(pXcoord NUMBER(8,6), pYcoord NUMBER(8,6));
       procedure insert_colaboradorhuerta(pHuerta NUMBER, pColaborador NUMBER);
       procedure insert_plantahuerta(pPrecio NUMBER(12,2), pPlanta NUMBER, pHuerta NUMBER);
       procedure insert_abono(pFechahora DATE, pColaborador NUMBER, pHuerta NUMBER, pPlanta NUMBER);
END;
/
create or replace package pck_transaccion is
       procedure insert_transaccion(pFechahora DATE, pHuerta NUMBER, pPlanta NUMBER, pCedula NUMBER);
       procedure insert_plantatrueque(pCodigotransaccion NUMBER, pPlanta NUMBER);
END;
/
create or replace package pck_consultas is
       procedure insert_hortaliza();
       procedure insert_arbol(); 
END;
/
create or replace package pck_estadisticas is
       procedure insert_hortaliza();
       procedure insert_arbol(); 
END;
/
