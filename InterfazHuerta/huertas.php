<?php
	include_once 'header.php';
?>


		<div class="row justify-content-center">
			<div class="card col-lg-8 col-10 text-center" style="margin: 2% 0">
				<div class="form-group col-md-6">
				   <select class="form-control">
					   <option>Seleccione una huerta</option>
					   <?php

					   $matriz = oci_parse($conn, "BEGIN pck_huertas.getHuertas(); END;");
					   oci_execute($matriz);
					   while ($fila = oci_fetch_array($matriz, OCI_NUM+OCI_RETURN_NULLS))
					   {
							echo "<option>" . $fila[1] . "</option>";
					   }
					   ?>
					</select>
				</div>
			</div>
		</div>



  		
		<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAY9EYO8XqsZKsrXZslRF3IF2M5XDcDYZk&callback=myMap"></script>
		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
	</body>
</html>
