<?php
    //parametros de conexion (opcionales)
    $basedatos = "localhost/orcl";
    $usuario   = "huerta";
    $contra    = "huerta";

    //suprime advertencias
    error_reporting(0);

	//proceso para conectar con el servidor
    $conn = oci_pconnect($usuario, $contra, $basedatos);
    if (!$conn)
    {
        $m = oci_error();
        echo $m['message'], "\n";
        exit;
    }
    else
    {
        // echo "Connected to Oracle!";

    }
    //oci_close($conn);
?>
