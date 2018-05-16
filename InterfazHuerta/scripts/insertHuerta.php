<?php
    if (isset($_POST['submit']))
    {

        include_once('conexion.inc');

        // define variables and set to empty values

        if ($_SERVER["REQUEST_METHOD"] == "POST")
        {
            $nombre = $_POST["name-input"];
            $distrito = $_POST["district"];
            $canton = $_POST["canton"];
            $provincia = $_POST["provincia"];
            $pais = $_POST["pais"];
            $Xcoord = $_POST["Xpos-input"];
            $Ycoord = $_POST["Ypos-input"];



$sql ="insert INTO huerta.huertaa(codigoHuerta, nombre, activo, ubicacion, localizacion) VALUES
(huerta.seq_huerta.nextval,'".$nombre."', SI, 1, 1); commit;";





            $result = 0;
            // $sql = "BEGIN pck_huerta.insert_huerta(:nombre, :distrito, :Xcoord, :Ycoord); END;";
            //$sql = "insert INTO huerta.huertaa(codigoHuerta, nombre, activo, ubicacion, localizacion) VALUES (3, :nombre, SI, 1, 3);";
            $s = oci_parse($conn, $sql);
            // oci_bind_by_name($s, ':nombre', $nombre);
            oci_execute($s);

            oci_close($conn);
            header("Location: ../homeUser.php");

        }
    }
    else {
        header("Location: ../homeUser.php");
    }
?>
