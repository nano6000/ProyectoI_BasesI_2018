<?php

include_once 'scripts/conexion.inc';
    //$sql = "BEGIN :result := pck_consulta.getHuertas(); END;";

    $matriz = oci_parse($conn, "select codigoHuerta, nombre, ubicacion, xCoord, yCoord from huerta.huertaa h, huerta.Localizacion l
                where l.codigo=h.localizacion");
    oci_execute($matriz);
    while ($fila = oci_fetch_array($matriz, OCI_NUM+OCI_RETURN_NULLS))
    {

        echo "<tr>";
        echo "<form id='form" . $fila[0] . "' class='needs-validation' method='post' action='scripts/updateHuerta.php?edit=" . $fila[0] . "'>";
        echo "<td>" . $fila[0] . "</td>";
        echo "<td> <input name='nombre' size='30' type='text' value='". $fila[1] . "' required> </td>";
        echo "<td> <select name='pais' name='pais' class='custom-select' required>'";
            $temp;
            $sql = oci_parse($conn, "select * from huerta.pais");
            oci_execute($sql);
            while ($pais = oci_fetch_array($sql, OCI_NUM+OCI_RETURN_NULLS))
            {
                if ($pais[1] == $fila[2])
                {
                    echo "<option value='" . $pais[0] . "' selected>" . $pais[1] . " (" . $pais[0] . ")" . "</option>";
                    $temp = $pais[1];
                }
                else
                    echo "<option value='" . $pais[0] . "'>" . $pais[1] . " (" . $pais[0] . ")" . "</option>";
            }
        echo "</select> </td>";

        echo "<td> <select name='provincia' name='provincia' class='custom-select' required>'";
            $sql = oci_parse($conn, "select * from huerta.provincia");
            oci_execute($sql);
            while ($provincia = oci_fetch_array($sql, OCI_NUM+OCI_RETURN_NULLS))
            {
                if ($provincia[1] == $temp)
                {
                    echo "<option value='" . $provincia[0] . "' selected>" . $provincia[1] . " (" . $provincia[0] . ")" . "</option>";
                    $temp = $provincia[1];
                }
                else
                    echo "<option value='" . $provincia[0] . "'>" . $provincia[1] . " (" . $provincia[0] . ")" . "</option>";
            }
        echo "</select> </td>";
        echo "<td> <select name='canton' name='canton' class='custom-select' required>'";
            $sql = oci_parse($conn, "select * from huerta.canton");
            oci_execute($sql);
            while ($canton = oci_fetch_array($sql, OCI_NUM+OCI_RETURN_NULLS))
            {
                if ($canton[1] == $temp)
                {
                    echo "<option value='" . $canton[0] . "' selected>" . $canton[1] . " (" . $canton[0] . ")" . "</option>";
                    $temp = $canton[1];
                }
                else
                    echo "<option value='" . $canton[0] . "'>" . $canton[1] . " (" . $canton[0] . ")" . "</option>";
            }
        echo "</select> </td>";
        echo "<td> <select name='distrito' name='distrito' class='custom-select' required>'";
            $sql = oci_parse($conn, "select * from huerta.distrito");
            oci_execute($sql);
            while ($distrito = oci_fetch_array($sql, OCI_NUM+OCI_RETURN_NULLS))
            {
                if ($distrito[1] == $temp)
                    echo "<option value='" . $distrito[0] . "' selected>" . $distrito[1] . " (" . $distrito[0] . ")" . "</option>";
                else
                    echo "<option value='" . $distrito[0] . "'>" . $distrito[1] . " (" . $distrito[0] . ")" . "</option>";
            }
        echo "</select> </td>";
        echo "<td> <input name='xCoord' size='30' type='text' value='". $fila[3] . "' required> </td>";
        echo "<td> <input name='yCoord' size='30' type='text' value='". $fila[4] . "' required> </td>";
        echo "<td> <button id='btnSignIn'form='form" . $fila[0] . "' type='submit' name='submit'>
            Editar
        </button>";

        echo "</form>";

        echo "</tr>";
    }

?>
