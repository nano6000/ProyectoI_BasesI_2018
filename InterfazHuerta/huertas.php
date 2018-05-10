<!--

	appName -> nombre de la app

-->
<?php
include_once('scripts/conexion.inc');
?>

<!DOCTYPE html>
<html>
	<head>
		<title>Inicio</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
	</head>

	<body>

		<header class="sticky-top">
			<nav class="navbar navbar-expand-sm navbar-dark bg-dark" >
				<a class="navbar-brand" href="homeUser.html">
					appName
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
					<ul class="navbar-nav mr-auto">
						<li class="nav-item">
							<a class="nav-link" href="#">Compra/Venta</a>
						</li>
					<!--
						<li class="nav-item">
							<a class="nav-link" href="#">Nueva Huerta</a>
						</li>
					-->
						<li class="nav-item">
							<a class="nav-link" href="huertas.html">Huertas</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#">Abonos</a>
						</li>
					</ul>
				</div>
				<form class="form-inline">
					<div class="dropdown">
						<button class="btn btn-secundary dropdown-toogle" type="button" id="dropdownUserMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
							Username
						</button>
						<div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownUserMenu">
							<a class="dropdown-item" href="#">Editar</a>
							<a class="dropdown-item" href="home.html">Salir</a>
						</div>
					</div>
				</form>
			</nav>
		</header>


		<div class="row justify-content-center">
			<div class="card col-lg-8 col-10 text-center" style="margin: 2% 0">
				<div class="form-group col-md-6">
				   <select class="form-control">
					   <option>Seleccione una huerta</option>
					   <?php

					   $matriz = oci_parse($conn, "select * from ".$usuario.".huerta");
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
