<?php

    include_once 'header.php';
    include_once 'scripts/conexion.inc';

?>

    <div class="row justify-content-center" style="margin: 3% 0 0 0">
        <form id="myform" method="post" class="needs-validation col-lg-6 col-md-6 col-sm-6 col-6" novalidate="" action="scripts/insertHuerta.php">
            <div class="form-row">
                <div class="form-group col-md-2">
                    <label>Nombre:</label>
                </div>

                <div class="form-group col-md-10">
                    <input name="name-input" type="text" class="form-control" placeholder="Nombre de la huerta" required>
                    <div class="invalid-feedback">
                        Por favor, ingrese información válida.
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label>Pais:</label>
                    <select name="pais" class="custom-select" >
                        <?php
                            $matriz = oci_parse($conn, "select * from huerta.pais");
                            oci_execute($matriz);
                            while ($fila = oci_fetch_array($matriz, OCI_NUM+OCI_RETURN_NULLS))
                            {
                                echo "<option value='" . $fila[0] . "'>" . $fila[1] . " (" . $fila[0] . ")" . "</option>";
                            }
                        ?>
                    </select>
                    <div class="invalid-feedback">
                        Por favor, seleccione una opción.
                    </div>
                </div>
                <div class="form-group col-md-6">
                    <label>Provincia:</label>
                    <select name="provincia" class="custom-select" >
                        <?php
                            $matriz = oci_parse($conn, "select * from huerta.provincia");
                            oci_execute($matriz);
                            while ($fila = oci_fetch_array($matriz, OCI_NUM+OCI_RETURN_NULLS))
                            {
                                echo "<option value=\"$fila[0]\">" . $fila[1] . " (" . $fila[0] . ")" . "</option>";
                            }
                        ?>
                    </select>
                    <div class="invalid-feedback">
                        Por favor, seleccione una opción.
                    </div>
                </div>
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label>Canton:</label>
                    <select name="canton" class="custom-select" >
                        <?php
                            $matriz = oci_parse($conn, "select * from huerta.canton");
                            oci_execute($matriz);
                            while ($fila = oci_fetch_array($matriz, OCI_NUM+OCI_RETURN_NULLS))
                            {
                                echo "<option value=\"$fila[0]\">" . $fila[1] . " (" . $fila[0] . ")" . "</option>";
                            }
                        ?>
                    </select>
                    <div class="invalid-feedback">
                        Por favor, seleccione una opción.
                    </div>
                </div>
                <div class="form-group col-md-6">
                    <label>Distrito:</label>
                    <select name="district" class="custom-select" >
                        <?php
                            $matriz = oci_parse($conn, "select * from huerta.distrito");
                            oci_execute($matriz);
                            while ($fila = oci_fetch_array($matriz, OCI_NUM+OCI_RETURN_NULLS))
                            {
                                echo "<option value=\"$fila[0]\">" . $fila[1] . " (" . $fila[0] . ")" . "</option>";
                            }
                        ?>
                    </select>
                    <div class="invalid-feedback">
                        Por favor, seleccione una opción.
                    </div>
                </div>
            </div>
            <div class="form-row">
				<label>Coordenadas:</label>
			</div>
			<div class="form-row">
                <div class="form-group col-md-6">
                    <input name="Xpos-input"	type="text" class="form-control" placeholder="X\Longitud" required>
                    <div class="invalid-feedback">
                        Por favor, ingrese información válida.
                    </div>
                </div>
				<div class="form-group col-md-6">
					<input name="Ypos-input" type="text" class="form-control" placeholder="Y\Latitud" required>
					<div class="invalid-feedback">
						Por favor, ingrese información válida.
					</div>
				</div>
            </div>
            <div class="form row justify-content-center" style="margin: 10%">
                <button id="btnSignIn" class="btn my-2 my-sm-0 btn-dark" style="margin: 0 1%" form="myform" type="submit" name="submit">
                    Crear
                </button>
                <button class="btn my-2 my-sm-0 btn-dark" style="margin: 0 1%" type="button" onclick="location.href='homeUser.php'">Cancelar</button>
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
