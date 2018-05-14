<?php

include_once 'scripts/conexion.inc';
    //$sql = "BEGIN :result := pck_consulta.getHuertas(); END;";

    $matriz = oci_parse($conn, "select codigoHuerta, nombre, ubicacion, localizacion from nano.huerta");
    oci_execute($matriz);
    while ($fila = oci_fetch_array($matriz, OCI_NUM+OCI_RETURN_NULLS))
    {
        echo "<tr>";
        echo "<td>" . $fila[0] . "</td>";
        echo "<td>" . $fila[1] . "</td>";
        echo "<td>" . $fila[2] . "</td>";
        echo "<td>" . $fila[3] . "</td>";

        echo "</tr>";
    }

?>
