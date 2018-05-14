
CREATE OR REPLACE PACKAGE people_management IS

PROCEDURE insert_persona (pCEDULA NUMBER, pPRIMERNOMBRE NVARCHAR2, pSEGUNDONOMBRE NVARCHAR2, pPRIMERAPELLIDO NVARCHAR2, pSEGUNDOAPELLIDO NVARCHAR2, 
                        pFECHANAC DATE, pIMAGEN BLOB, pPAIS NVARCHAR2, pEMAIL NVARCHAR2, pTELEFONO NVARCHAR2, pUSERNAME NVARCHAR2, 
                        pPASSWORD NVARCHAR2);
FUNCTION check_username (pUSERNAME NVARCHAR2) RETURN NUMBER;
FUNCTION check_person (pCEDULA NUMBER) RETURN NUMBER;
                        
END people_management;

CREATE OR REPLACE PACKAGE BODY people_management IS

PROCEDURE insert_persona (pCEDULA NUMBER, pPRIMERNOMBRE NVARCHAR2, pSEGUNDONOMBRE NVARCHAR2, pPRIMERAPELLIDO NVARCHAR2, pSEGUNDOAPELLIDO NVARCHAR2, 
                        pFECHANAC DATE, pIMAGEN BLOB, pPAIS NVARCHAR2, pEMAIL NVARCHAR2, pTELEFONO NVARCHAR2, pUSERNAME NVARCHAR2, 
                        pPASSWORD NVARCHAR2) AS
    BEGIN
        INSERT INTO persona(cedula, primernombre, segundonombre, primerapellido, segundoapellido, fechanac, imagen, pais) 
            VALUES (pCEDULA, pPRIMERNOMBRE, pSEGUNDONOMBRE, pPRIMERAPELLIDO, pSEGUNDOAPELLIDO, to_date(pFECHANAC, 'dd/mm/yyyy'), pIMAGEN, pPAIS);
        
        INSERT INTO emailpersona(cedula, email) VALUES (pCEDULA, pEMAIL);
        
        INSERT INTO telefonopersona(cedula, telefono) VALUES (pCEDULA, pTELEFONO);
        
        INSERT INTO usuario(cedula, username, estado, password, tipoUsuario) VALUES (pCEDULA, pUSERNAME, 'ONLINE', pPASSWORD, 1);
        
        COMMIT;
        
        EXCEPTION WHEN OTHERS THEN
            ROLLBACK;
            RAISE; 
    END insert_persona;
    
FUNCTION check_username (pUSERNAME NVARCHAR2) RETURN NUMBER AS
    u NUMBER := 0;
    BEGIN
        SELECT count(username) INTO u
        FROM usuario
        WHERE username = pUSERNAME;
        
        return(u);
    END check_username;

FUNCTION check_person (pCEDULA NUMBER) RETURN NUMBER AS
    u NUMBER := 0;
    BEGIN
        SELECT count(CEDULA) INTO u
        FROM persona
        WHERE cedula = pCEDULA;
        
        return(u);
    END check_person;
    
END people_management;



    
    
    
    
    
    
    