<?php

    if (isset($_GET['edit']))
    {
        include_once('conexion.inc');

        if ($_SERVER["REQUEST_METHOD"] == "POST")
        {
            $nombre = $_POST["nombre"];
            $pais = $_POST["pais"];
            $provincia = $_POST["provincia"];
            $canton = $_POST["canton"];
            $distrito = $_POST["distrito"];
            $xCoord = $_POST["xCoord"];
            $yCoord = $_POST["yCoord"];


            // $lob = oci_new_descriptor($conn, OCI_D_LOB);
            // $sql = "BEGIN pck_persona.insert_usuario(:usuario, :passwd, 'ONLINE', '0', :cedula, :pNombre, :sNombre, :pApellido, :sApellido,
            //                 :fechNac, :img, :pais); END;";
            // $s = oci_parse($conn, $sql);
            //
            // oci_bind_by_name($s, ':img', $lob, -1, OCI_B_BLOB);
            // oci_bind_by_name($s, ':pNombre',$pNombre);
            // oci_bind_by_name($s, ':sNombre',$sNombre);
            // oci_bind_by_name($s, ':pApellido',$pApellido);
            // oci_bind_by_name($s, ':sApellido',$sApellido);
            // oci_bind_by_name($s, ':pais',$pais);
            // oci_bind_by_name($s, ':cedula',$cedula);
            // oci_bind_by_name($s, ':fechNac',$fechNac);
            // oci_bind_by_name($s, ':usuario',$usuario);
            // oci_bind_by_name($s, ':passwd',$hashPsswd);
            // $myv = file_get_contents($_FILES['customFile']['tmp_name']);
            // $lob->writeTemporary($myv, OCI_TEMP_BLOB);
            // oci_execute($s);
            // $error =  oci_error($s);
            // echo htmlentities($error['message']);
            //
            // oci_close($conn);
            header("Location: ../editHuerta.php");
        }
    }

?>
