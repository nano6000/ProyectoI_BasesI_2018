<!--

	EcoHuertas -> nombre de la app

-->
<?php
    session_start();
?>

<!DOCTYPE html>
<html>
	<head>
		<title>Inicio</title>
		<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
	</head>

<body>
	<header class="sticky-top">
		<nav class="navbar navbar-expand-sm navbar-light" style="background-color: #168016;">
			<a class="navbar-brand" href="homeUser.php">
                <img src="logo.png" alt="logo" height="50" width="42">
				EcoHuertas
			</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
                    <?php
                        if (isset($_SESSION['tipo']))
                        {
                            $tipo = $_SESSION['tipo'];
                            switch ($tipo)
                            {
                                case 3: //Administrador
                                    echo '<div class="dropdown">
                                            <button type="button" class="btn btn-success dropdown-toggle" id="dropdownHuerta" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">

                                                    Huertas
                                            </button>
                                            <div class="dropdown-menu" aria-labelledby="dropdownHuerta">
                                                <a class="dropdown-item" href="crearHuerta.php">Nueva huerta</a>
                                                <a class="dropdown-item" href="editHuerta.php">Editar</a>
                                                <a class="dropdown-item" href="verHuertas.php">Ver</a>
                                            </div>
                                        </div>
                					    <li class="nav-item">
              							    <a class="nav-link" href="#">Encargados</a>
              					        </li>';
                                case 2: //Encargados
                                    echo '<li class="nav-item">
              							    <a class="nav-link" href="#">Colaboradores</a>
              					        </li>
                                        <li class="nav-item">
                  							<a class="nav-link" href="#">Estadisticas</a>
                  					    </li>
                                        <li class="nav-item">
                							<a class="nav-link" href="#">Compra/Venta</a>
                						</li>';
                                case 1: //Colaboradores
                                    if ($tipo > 1)
                                        echo '<li class="nav-item">
                							<a class="nav-link" href="#">Abonos</a>
                						</li>';
                                    else
                                        echo '<li class="nav-item">
                							<a class="nav-link" href="#">Abonar</a>
                						</li>';
                                default:
                                    if ($tipo < 3)
                                        echo '<li class="nav-item">
                							<a class="nav-link" href="#">Huertas</a>
                						</li>';
                                    echo '<li class="nav-item">
                							<a class="nav-link" href="#">Plantas</a>
                						</li>';
                                    break;
                            }
                        }
                    ?>
				</ul>
			</div>
			<div class="dropdown">
				<button class="btn btn-secundary dropdown-toogle" type="button" id="dropdownUserMenu" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
					<?php
					 	if (!isset($_SESSION['username']))
							header("Location: home.php");
						else
							echo $_SESSION['username'];
					?>
				</button>
				<div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownUserMenu">
                    <a class="dropdown-item" href="#">Editar</a>
                    <form action="scripts/logout.php" method="post">
                        <button class="dropdown-item" type="submit" name="submit">Salir</button>
                    </form>
				</div>
			</div>
		</nav>

	</header>
