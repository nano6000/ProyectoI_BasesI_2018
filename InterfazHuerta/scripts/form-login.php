<?php

    session_start();

    if (isset($_POST['submit']))
    {
        include_once('conexion.inc');

        if ($_SERVER["REQUEST_METHOD"] == "POST")
        {
            $username = $_POST["username-input"];
            $passwd = $_POST["password-input"];
            $hashPsswd = password_hash($passwd, PASSWORD_DEFAULT);

            $result = 0;
            // $sql = "BEGIN :result := people_management.login_user(:username, :password); END;";
            // $s = oci_parse($conn, $sql);
            // oci_bind_by_name($s, ':username', $username);
            // oci_bind_by_name($s, ':password', $hashPsswd);
            // oci_bind_by_name($s, ':result', $result);
            // oci_execute($s);
            // if ($result > 0)
            // {
            //     $_SESSION['username'] = $username;
            //     header("Location: ../homeUser.php?login=success");
            // }
            // else
            //     header("Location: ../login.php?login=error&username=$username");
            $_SESSION['username'] = $username;
            $_SESSION['tipo'] = 3; //Administrador
            oci_close($conn);
            header("Location: ../homeUser.php?login=success");

        }
    }
?>
