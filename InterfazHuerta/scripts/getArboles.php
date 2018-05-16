<?php

include_once 'scripts/conexion.inc';
    //$sql = "BEGIN :result := pck_consulta.getHuertas(); END;";

    $matriz = oci_parse($conn, "select p.codigoPlanta, p.nombre,
            c.descripcion, x.descripcion, ca.descripcion, a.peligroextincion
            from huerta.arbol a, huerta.clase c, huerta.tipocambium ca, huerta.tipoxilema x,
            huerta.tipocorteza c, huerta.planta p where p.codigoPlanta=a.codigoPlanta and
            a.corteza=c.codigocorteza and a.xilema=x.codigoxilema and a.cambium=ca.codigocambium");
    oci_execute($matriz);
    while ($fila = oci_fetch_array($matriz, OCI_NUM+OCI_RETURN_NULLS))
    {
        echo "<tr>";
        echo "<td>" . $fila[0] . "</td>";
        echo "<td>" . $fila[1] . "</td>";
        echo "<td>" . $fila[2] . "</td>";
        echo "<td>" . $fila[3] . "</td>";
        echo "<td>" . $fila[4] . "</td>";
        echo "<td>" . $fila[5] . "</td>";
        echo "<td>" . $fila[6] . "</td>";
        echo "</tr>";
    }

?>
