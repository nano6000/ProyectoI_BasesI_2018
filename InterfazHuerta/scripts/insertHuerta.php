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

            $result = 0;
            // $sql = "BEGIN pck_huerta.insert_huerta(:nombre, :distrito, :Xcoord, :Ycoord); END;";
            $sql = "insert INTO Huerta (codigoHuerta, nombre, activo, ubicacion, localizacion) VALUES (2, 'OtraHuerta', 'SI', 1, 1);";
            $s = oci_parse($conn, $sql);
            oci_bind_by_name($s, ':nombre', $nombre);
            oci_bind_by_name($s, ':distrito', $distrito);
            oci_bind_by_name($s, ':Xcoord', $Xcoord);
            oci_bind_by_name($s, ':Ycoord', $Ycoord);
            oci_execute($s);

            oci_close($conn);
            header("Location: ../homeUser.php");

        }
    }
    else {
        header("Location: ../homeUser.php");
    }
?>
