<?php
	session_start();
?>

<!DOCTYPE html>
<html>
	<head>
		<title>Login</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
	</head>

	<body>

		<header class="sticky-top">
			<nav class="navbar navbar-expand-sm navbar-light" style="background-color: #168016;">
				<a class="navbar-brand" href="home.php">
					EcoHuertas
				</a>
				<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>

				<div class="collapse navbar-collapse" id="navbarSupportedContent">
				</div>
				<form class="form-inline">
					<button class="btn my-2 my-sm-0 btn-secondary" type="button">Login</button>
				</form>
			</nav>
		</header>


		<div class="row justify-content-center" style="margin: 2% 0 0 0">
			<form id="myform" method="post" class="needs-validation col-lg-4 col-md-6 col-sm-6 col-6" novalidate="" action="scripts/form-login.php">
				<div class="card" style="margin: 5% 0 0 0;padding: 0 0 10px 0">
					<div class="card-body">
						<div class="form-group row">
							<label for="username-input" class="col-sm-12 col-m-12 col-lg-6 col-form-label">Nombre de usuario:</label>
							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
								<?php
									if (isset($_GET['username']))
									{
										$username = $_GET['username'];
										echo '<input name="username-input" value="'.$username.'" class="form-control mr-sm-2" type="text" placeholder="username" required>';
									}
									else
									{
										echo '<input name="username-input" class="form-control mr-sm-2" type="text" placeholder="username" required>';
									}
								?>
								<div class="invalid-feedback">
									Por favor, ingrese el nombre de usuario.
								</div>
							</div>
						</div>
						<div class="form-group row">
							<label for="passwd-input" class="col-sm-12 col-m-12 col-lg-6 col-form-label">Contraseña:</label>
							<div class="col-lg-6 col-md-12 col-sm-12 col-12">
	  							<input name="passwd-input" type="password" class="form-control" placeholder="Contraseña" required>
								<div class="invalid-feedback">
									Por favor, ingrese la contraseña.
								</div>
							</div>
						</div>

						<?php

							if (isset($_GET['login']))
							{
								echo '<div class="form row justify-content-center" style="margin: 0 0 -5% 0">';
								echo '<div class="alert alert-danger" role="alert">';
								$signUpError = $_GET['login'];

								if ($signUpError == 'error')
									echo 'Usuario o contraseña incorrecto.';
								else
									echo 'Error inesperado.';

								echo '</div>';
								echo '</div>';
							}
						?>
					</div>
				<card class="body-card text-center">
					<div class="form row justify-content-center" >
						<button class="btn my-2 my-sm-0 btn-dark" type="button" onclick="location.href='signUp.php'">Sign Up</button>
						<button class="btn my-2 my-sm-0 btn-dark" style="margin: 0 1%" form="myform" type="submit" name="submit">Login</button>
					</div>
				</card>
			</div>
		</form>
		</div>


		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
		<script type="text/javascript" src="scripts/formValidation.js"></script>
	</body>
</html>
