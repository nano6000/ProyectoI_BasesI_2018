<?php
    include_once 'header.php';

    include_once 'scripts/conexion.inc';

    if (isset($_SESSION['tipo']))
    {
        $tipo = $_SESSION['tipo'];
        if ($tipo != 3)
            header("Location: homeUser.php");
    }
    else
        header("Location: homeUser.php");
?>

    <!-- <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.js" charset="utf-8"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/buttons/1.5.1/js/dataTables.buttons.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="https://cdn.datatables.net/select/1.2.5/js/dataTables.select.min.js" charset="utf-8"></script>
    <script type="text/javascript" src="https://editor.datatables.net/extensions/Editor/js/dataTables.editor.min.js" charset="utf-8"></script>


    <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.1/js/dataTables.responsive.min.js"></script>
    <script src="https://cdn.datatables.net/responsive/2.2.1/js/responsive.bootstrap4.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/responsive/2.2.1/css/responsive.bootstrap4.min.css"> -->

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.0.0/css/bootstrap.css">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js" charset="utf-8"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js" charset="utf-8"></script>
    <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js" charset="utf-8"></script>

    <!-- The Modal
    <div class="modal fade" id="myModal">
    <div class="modal-dialog">
    <div class="modal-content">

        <!-- Modal Header
        <div class="modal-header">
            <h4 class="modal-title">Editar......</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>

        <!-- Modal body
        <div class="modal-body">

        <form  method="post" action="updatHuerta.php">
            <div class="form-group">
                <label for="formGroupExampleInput">Nombre</label>
                <input name="momento" type="text" class="form-control" id="formGroupExampleInput" placeholder="Example input">
            </div>
            <div class="form-group">
                <label for="formGroupExampleInput2">localizacion</label>
                <input name="recur" type="text" class="form-control" id="formGroupExampleInput2" placeholder="Another input">
            </div>
            <div class="form-group">
                <label for="formGroupExampleInput2">Ubicacion</label>
                <input name="recur" type="text" class="form-control" id="formGroupExampleInput2" placeholder="Another input">
            </div>
            <div class="form-group">

            <input type="submit" class="btn btn-primary" value="Registrar" />
        </form>
<select class="form-control" name="n">
      <option>Seleccione un encargado</option>
      <?php
      // $matriz = oci_parse($conn, "select * from nano.huerta");
      // oci_execute($matriz);
      // while ($fila = oci_fetch_array($matriz, OCI_NUM+OCI_RETURN_NULLS))
      // {
      //      echo "<option>" . $fila[1] . "</option>";
      // }
                       ?>   </select>
  </div>

    </div>
        </div>
            </div>
    </div><!--cierre del Modal-->


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
        echo '<tr>';
        echo '<th>ID Huerta</th>';
        echo '<th>Nombre</th>';
        echo '<th>Pais</th>';
        echo '<th>Provincia</th>';
        echo '<th>Canton</th>';
        echo '<th>Distrito</th>';
        echo '<th>Coordenada en X</th>';
        echo '<th>Coordenada en Y</th>';
        echo '<th>Editar</th>';
        echo '</tr>';
        echo '</thead>';
        echo '<tbody>';

        include_once 'scripts/getEditHuerta.php';

        echo "</tbody>";
        echo "</table>";
        echo "</div>";
        echo "</div>";
        echo "</div>";
      ?>

      <!-- <button type="submit" id="btnUpdate" name='btnUpdate' class="btn btn-primary" >
          Editar Registro
      </button> -->

    <script>
 $(document).ready(function(){
      $('#data').DataTable( );
 });

 //    	"footerCallback": function ( row, data, start, end, display ) {
 //            var api = this.api(), data;
 //           // converting to interger to find total
 //           var intVal = function ( i ) {
 //                 return typeof i === 'string' ?
 //                     i.replace(/[\$,]/g, '')*1 :
 //                     typeof i === 'number' ?
 //                        i : 0;
 //             };
 //
 //             // computing column Total of the complete result
 //             var pamonTotal = api
 //         .column( 6,{page:'current'})
 //              .data()
 //                 .reduce( function (a, b) {
 //                     return intVal(a) + intVal(b);
 //                 }, 0 );
 //
 //
 //
 //             // Update footer by showing the total with the reference of the column index
 //    $( api.column( 0 ).footer() ).html('Total:');
 //      $( api.column( 1 ).footer() ).html();
 //      $( api.column( 2 ).footer() ).html();
 //      $( api.column( 3 ).footer() ).html();
 //      $( api.column( 4 ).footer() ).html();
 //      $( api.column( 5 ).footer() ).html();
 //      $( api.column( 6 ).footer() ).html('₡'+pamonTotal);
 //
 //         },
 //         "resposive": true,
 //         "info": false,
 //         "searching": false,
 //         "paging":   false,
 //         "ordering": false
 //
 //     } );
 // } );
</script>
<!-- //         $(document).ready(function() {
//     var table = $('#data').DataTable();
//
//     $('#btnUpdate').click( function() {
//         var data = table.$('input, select').serialize();
//         alert(
//             "The following data would have been submitted to the server: \n\n"+
//             data.substr( 0, 120 )+'...'
//         );
//         return false;
//     } );
// } ); -->


    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>


    </body>


</html>
