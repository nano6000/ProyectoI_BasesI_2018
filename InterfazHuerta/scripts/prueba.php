<?php

include_once('conexion.inc');



?>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>Lista de Usuarios</title>
  <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
<script src="http://getbootstrap.com/dist/js/bootstrap.min.js"></script>
<script language="JavaScript" src="https://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>
<script language="JavaScript" src="https://cdn.datatables.net/1.10.4/js/jquery.dataTables.min.js" type="text/javascript"></script>
<script language="JavaScript" src="https://cdn.datatables.net/plug-ins/3cfcc339e89/integration/bootstrap/3/dataTables.bootstrap.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">

<link rel="stylesheet" type="text/css" href="http://cdn.datatables.net/plug-ins/3cfcc339e89/integration/bootstrap/3/dataTables.bootstrap.css">
           <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
           <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
           <script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
           <script src="https://cdn.datatables.net/1.10.12/js/dataTables.bootstrap.min.js"></script>
           <link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/dataTables.bootstrap.min.css" />
           <link rel="stylesheet" href="https://cdn.datatables.net/plug-ins/1.10.16/features/scrollResize/dataTables.scrollResize.min.js" />
</head>
<body>
  <!-- INICIO DE DATOS DE Usuario -->
  <?php
  $query="select * from nano.Huerta";

        echo "<div class='panel panel-default'>";
        echo "<div class='panel-heading'>";
        echo "Lista de Usuarios";
        echo "</div>";
        echo "<div class='panel-body'>";
        echo "<div class='table-responsive'>";

        echo "<table width='100%' class='table table-fixed table-bordered table-hover table-condensed table-hover' id='data' style='font-size: 11px;'>";
        echo "<thead style='background-color: #f8f8f8;'>";
        echo "<tr style='font-size: 13px; font-style: normal;'>";
        echo "<th style='text-align: center;'>ID_Empleado</th>";
        echo "<th style='text-align: center;'>Nombre</th>";
        echo "<th style='text-align: center;'>Apellido</th>";
        echo "<th style='text-align: center;'>Email</th>";
        echo "<th style='text-align: center;'>Telefono</th>";
        echo "<th style='text-align: center;'>Contratado</th>";
        echo "<th style='text-align: center;'>Salario</th>";
        echo "</tr>";
        echo "</thead>";
        echo "<tbody>";
        $matriz = oci_parse($conn, "select * from nano.huerta");
        oci_execute($matriz);
        while ($fila = oci_fetch_array($matriz, OCI_NUM+OCI_RETURN_NULLS)) {
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
        echo "</tbody>";
        echo "</table>";
        echo "</div>";
        echo "</div>";
    ?>


</body>
</html>
<?
////////////////////////////////////////////////////////FIN DEL HTML /////////////////////////////////////////////////////////////////////////
?>
<script>
 $(document).ready(function(){
      $('#data').DataTable( );
 });
 </script>
