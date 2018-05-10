<?php

include_once('conexion.inc');

    // define variables and set to empty values
    $pNombre = $sNombre = $pApellido = $sApellido = $pEmail = $sEmail =  "";
    $pTel = $sTel = $pais = $cedula = $fechNac = $usuario = $passwd = $img = "";

    if ($_SERVER["REQUEST_METHOD"] == "POST")
    {
        $pNombre = $_POST["frstName-input"];
        $sNombre = $_POST["secndName-input"];
        $pApellido = $_POST["frstLstName-input"];
        $sApellido = $_POST["secndLstName-input"];
        $pEmail = $_POST["email1-input"];
        $sEmail = $_POST["email2-input"];
        $pTel = $_POST["tel1-input"];
        $sTel = $_POST["tel2-input"];
        $pais = $_POST["citizenship"];
        $cedula = $_POST["id-input"];
        $fechNac = date("d-m-Y", strtotime($_POST["date-input"]));
        $usuario = $_POST["username-input"];
        $passwd =$_POST["passwd-input"];
        $img = file_get_contents($_FILES['customFile']['tmp_name']);

        $result = 0;
        $sql = "BEGIN :result := people_management.check_person(:cedula); END;";
        $s = oci_parse($conn, $sql);
        oci_bind_by_name($s, ':cedula', $cedula);
        oci_bind_by_name($s, ':result', $result);
        oci_execute($s);

        if($result>0)
        {
            echo "La persona ya existe";
            header("Location: ../signUp.php?signup=duplicate&pNombre=$pNombre&sNombre=$sNombre&
                        pApellido=$pApellido&sApellido=$sApellido&pEmail=$pEmail&sEmail=$sEmail&pTel=$pTel&
                        sTel=$sTel&pais=$pais&usuario=$usuario");
            exit();
        }
        else
        {
            //comprobar que no exista el Usuario
            $result = 0;
            $sql = "BEGIN :result := people_management.check_username(:usuario); END;";
            $s = oci_parse($conn, $sql);
            oci_bind_by_name($s, ':usuario', $usuario);
            oci_bind_by_name($s, ':result', $result);
            oci_execute($s);

            if ($result>0)
            {
                echo "El usuario ya existe";
                header("Location: ../signUp.php?signup=usernameTaken&pNombre=$pNombre&sNombre=$sNombre&
                            pApellido=$pApellido&sApellido=$sApellido&pEmail=$pEmail&sEmail=$sEmail&pTel=$pTel&
                            sTel=$sTel&pais=$pais&cedula=$cedula");
                exit();
            }
            else
            {
                $lob = oci_new_descriptor($conn, OCI_D_LOB);
                $sql = "BEGIN people_management.insert_persona(:cedula, :pNombre, :sNombre, :pApellido, :sApellido,
                                :fechNac, :img, :pais, :pEmail, :pTel, :usuario, :passwd); END;";
                $s = oci_parse($conn, $sql);

                oci_bind_by_name($s, ':img', $lob, -1, OCI_B_BLOB);
                oci_bind_by_name($s, ':pNombre',$pNombre);
                oci_bind_by_name($s, ':sNombre',$sNombre);
                oci_bind_by_name($s, ':pApellido',$pApellido);
                oci_bind_by_name($s, ':sApellido',$sApellido);
                oci_bind_by_name($s, ':pEmail',$pEmail);
                oci_bind_by_name($s, ':pTel',$pTel);
                oci_bind_by_name($s, ':pais',$pais);
                oci_bind_by_name($s, ':cedula',$cedula);
                oci_bind_by_name($s, ':fechNac',$fechNac);
                oci_bind_by_name($s, ':usuario',$usuario);
                oci_bind_by_name($s, ':passwd',$passwd);
                $myv = file_get_contents($_FILES['customFile']['tmp_name']);
                $lob->writeTemporary($myv, OCI_TEMP_BLOB);
                oci_execute($s);
                $error =  oci_error($s);
                echo htmlentities($error['message']);

                session_start();

                header("Location: ../homeUser.php");
            }
        }

    }

    function test_input($data)
    {
        $data = trim($data);
        $data = stripslashes($data);
        $data = htmlspecialchars($data);
        return $data;
    }
?>
