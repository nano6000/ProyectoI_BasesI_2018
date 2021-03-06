<?php
include_once('scripts/conexion.inc');
?>

<!DOCTYPE html>
<html>
	<head>
		<title>Sign up</title>
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
					<button class="btn my-2 my-sm-0 btn-secondary"  onclick="location.href='login.php'" type="button">Login</button>
				</form>
			</nav>
		</header>

		<div class="row justify-content-center" style="margin: 2% 0 0 0">
			<form id="myform" method="post" class="needs-validation col-lg-6 col-md-6 col-sm-6 col-6" novalidate="" action="scripts/form-input.php">
				<div class="form-row">
					<label> Nombre:</label>
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
						<?php
							if (isset($_GET['pNombre']))
							{
								$pNombre = $_GET['pNombre'];
								echo '<input name="frstName-input" type="text" class="form-control" placeholder="Primer Nombre" value="'.$pNombre.'" required>';
							}
							else
							{
								echo '<input name="frstName-input" type="text" class="form-control" placeholder="Primer Nombre" required>';
							}
						?>
						<div class="invalid-feedback">
							Por favor, ingrese información válida.
						</div>
					</div>
					<div class="form-group col-md-6">
						<?php
							if (isset($_GET['sNombre']))
							{
								$sNombre = $_GET['sNombre'];
								echo '<input name="secndName-input"	type="text" class="form-control" placeholder="Segundo Nombre" value="'.$sNombre.'">';
							}
							else
							{
								echo '<input name="secndName-input"	type="text" class="form-control" placeholder="Segundo Nombre">';
							}
						?>
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
						<?php
							if (isset($_GET['pApellido']))
							{
								$pApellido = $_GET['pApellido'];
								echo '<input name="frstLstName-input" type="text" class="form-control" placeholder="Primer Apellido" value="'.$pApellido.'" required>';
							}
							else
							{
								echo '<input name="frstLstName-input" type="text" class="form-control" placeholder="Primer Apellido" required>';
							}
						?>
						<div class="invalid-feedback">
							Por favor, ingrese información válida.
						</div>
					</div>
					<div class="form-group col-md-6">
						<?php
							if (isset($_GET['sApellido']))
							{
								$sApellido = $_GET['sApellido'];
								echo '<input name="secndLstName-input" type="text" class="form-control" placeholder="Segundo Apellido" value="'.$sApellido.'">';
							}
							else
							{
								echo '<input name="secndLstName-input" type="text" class="form-control" placeholder="Segundo Apellido">';
							}
						?>
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
						<label>Nacionalidad:</label>
						<select name="citizenship" name="citizenship" class="custom-select" required>
							<?php
								if (isset($_GET['pais']))
									$pais = $_GET['pais'];
								else
									$pais = "";
								$matriz = oci_parse($conn, "select * from huerta.pais");
								oci_execute($matriz);
								while ($fila = oci_fetch_array($matriz, OCI_NUM+OCI_RETURN_NULLS))
								{
									if ($fila[0] == $pais)
										echo "<option value='" . $fila[0] . "' selected>" . $fila[1] . " (" . $fila[0] . ")" . "</option>";
									else
										echo "<option value='" . $fila[0] . "'>" . $fila[1] . " (" . $fila[0] . ")" . "</option>";
								}
							?>
						</select>
						<div class="invalid-feedback">
							Por favor, seleccione una opción.
						</div>
					</div>
					<div class="form-group col-md-6">
						<label>Cedula:</label>
						<?php
							if (isset($_GET['cedula']))
							{
								$cedula = $_GET['cedula'];
								echo '<input name="id-input" type="text" class="form-control" pattern="[0-9]{9}" placeholder="Cedula" value="'.$cedula.'" required>';
							}
							else
							{
								echo '<input name="id-input" type="text" class="form-control" pattern="[0-9]{9}" placeholder="Cedula" required>';
							}
						?>
						<div class="invalid-feedback">
							Por favor, ingrese información válida.
							Ej. 123456789
						</div>
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
						<label>E-mail 1:</label>
						<?php
							if (isset($_GET['pEmail']))
							{
								$pEmail = $_GET['pEmail'];
								echo '<input name="email1-input" type="text" class="form-control" pattern=".+@.+\.(com|es)" placeholder="E-mail 1" value="'.$pEmail.'" required>';
							}
							else
							{
								echo '<input name="email1-input" type="text" class="form-control" pattern=".+@.+\.(com|es)" placeholder="E-mail 1" required>';
							}
						?>
						<div class="invalid-feedback">
							Por favor, ingrese información válida.
						</div>
					</div>
					<div class="form-group col-md-6">
						<label>E-mail 2:</label>
						<?php
							if (isset($_GET['sEmail']))
							{
								$sEmail = $_GET['sEmail'];
								echo '<input name="email2-input" type="email" class="form-control" pattern=".+@.+\.(com|es)" placeholder="E-mail 2" value="'.$sEmail.'">';
							}
							else
							{
								echo '<input name="email2-input" type="email" class="form-control" pattern=".+@.+\.(com|es)" placeholder="E-mail 2">';
							}
						?>
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
						<label>Telefono 1:</label>
						<?php
							if (isset($_GET['pTel']))
							{
								$pTel = $_GET['pTel'];
								echo '<input name="tel1-input" type="text" class="form-control" pattern="(\(\+[0-9]{3}\))?[0-9]{8}[0-9]*" placeholder="Telefono 1" value="'.$pTel.'" required>';
							}
							else
							{
								echo '<input name="tel1-input" type="text" class="form-control" pattern="(\(\+[0-9]{3}\))?[0-9]{8}[0-9]*" placeholder="Telefono 1" required>';
							}
						?>
						<div class="invalid-feedback">
							Por favor, ingrese información válida.
						</div>
					</div>
					<div class="form-group col-md-6">
						<label>Telefono 2:</label>
						<?php
							if (isset($_GET['sTel']))
							{
								$sTel = $_GET['sTel'];
								echo '<input name="tel2-input" type="text" class="form-control" pattern="(\(\+[0-9]{3}\))?[0-9]{8}[0-9]*" placeholder="Telefono 2" value="'.$sTel.'">';
							}
							else
							{
								echo '<input name="tel2-input" type="text" class="form-control" pattern="(\(\+[0-9]{3}\))?[0-9]{8}[0-9]*" placeholder="Telefono 2">';
							}
						?>
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
						<label>Fecha de nacimiento:</label>
						<input name="date-input" class="form-control" type="date" required>
						<div class="invalid-feedback">
							Por favor, ingrese información válida.
						</div>
					</div>
					<div class="form-group col-md-6">
						<label>Nombre de usuario:</label>
						<?php
							if (isset($_GET['usuario']))
							{
								$usuario = $_GET['usuario'];
								echo '<input name="username-input" type="text" class="form-control" placeholder="Nombre de usario" value="'.$usuario.'" required>';
							}
							else
							{
								echo '<input name="username-input" type="text" class="form-control" placeholder="Nombre de usario" required>';
							}
						?>
						<div class="invalid-feedback">
							Por favor, ingrese información válida.
						</div>
					</div>
				</div>
				<div class="form-row">
					<div class="form-group col-md-6">
						<label>Contraseña:</label>
						<input name="passwd-input" type="password" class="form-control" placeholder="Contraseña" required>
						<div class="invalid-feedback">
							Por favor, ingrese información válida.
						</div>
					</div>
					<div class="form-group col-md-6">
						<label>Confirmar contraseña:</label>
						<input name="ckPasswd-input" type="password" class="form-control" placeholder="Confirme la contraseña" required>
						<div class="registrationFormAlert" id="divCheckPasswordMatch"></div>
					</div>
				</div>
				<div class="form-row">
					<label>Imagen: </label>
					<div class="custom-file">
						<input type="file" class="custom-file-input" name="customFile" accept="image/*" required="">
						<div class="invalid-feedback">
							Por favor, ingrese una imagen.
						</div>
						<label class="custom-file-label" for="customFile">Seleccione una imagen</label>
					</div>
				</div>

				<?php
					if (isset($_GET['signup']))
					{
						echo '<div class="form row justify-content-center" style="margin: 10% 0 0 0">';
						echo '<div class="alert alert-danger" role="alert">';
						$signUpError = $_GET['signup'];

						if ($signUpError == 'duplicate')
							echo 'La cedula ingresada ya existe.';
						elseif ($signUpError == 'usernameTaken')
							echo 'El nombre de usuario ingresado ya existe.';
						echo '</div>';
						echo '</div>';
					}
				?>
				<div class="form row justify-content-center" style="margin: 10%">
					<button id="btnSignIn" class="btn my-2 my-sm-0 btn-dark" style="margin: 0 1%" form="myform" type="submit" name="submit">
						Sign Up
					</button>
					<button class="btn my-2 my-sm-0 btn-dark" style="margin: 0 1%" type="button" onclick="location.href='home.php'">Cancelar</button>
				</div>
			</form>
		</div>



		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
		<script type="text/javascript" src="scripts/formValidation.js"></script>
		<script type="text/javascript" src="scripts/checkPasswords.js"></script>
	</body>
</html>
