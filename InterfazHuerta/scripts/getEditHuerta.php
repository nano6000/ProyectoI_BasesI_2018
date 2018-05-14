<?php

include_once 'scripts/conexion.inc';
    //$sql = "BEGIN :result := pck_consulta.getHuertas(); END;";

    $matriz = oci_parse($conn, "select codigoHuerta, nombre, ubicacion, xCoord, yCoord from nano.huerta h, nano.Localizacion l
                where l.codigo=h.localizacion");
    oci_execute($matriz);
    while ($fila = oci_fetch_array($matriz, OCI_NUM+OCI_RETURN_NULLS))
    {

        echo "<form id='form" . $fila[0] . "' method='post' action='scripts/updateHuerta.php?edit=" . $fila[0] . "'>";
        echo "<tr>";
        echo "<td>" . $fila[0] . "</td>";
        echo "<td> <input name='nombre' size='40' type='text' placeholder='". $fila[1] . "' required> </td>";
        echo "<td> <input name='tel1-input' size='40' type='text' placeholder='". $fila[2] . "' required> </td>";
        echo "<td> <input name='tel1-input' size='40' type='text' placeholder='". $fila[3] . "' required> </td>";
        echo "<td> <input name='tel1-input' size='40' type='text' placeholder='". $fila[4] . "' required> </td>";
        echo "<td> <button id='btnSignIn'form='form" . $fila[0] . "' type='submit' name='submit'>
            Editar
        </button>";

        echo "</form>";

        echo "</tr>";
    }

?>
