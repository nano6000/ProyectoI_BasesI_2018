<?php
    if (isset($_POST['submit']))
    {
        session_start();

        include_once('conexion.inc');

        $username = $_SESSION["username"];

        // $sql = "BEGIN people_management.logout_user(:username); END;";
        // $s = oci_parse($conn, $sql);
        // oci_bind_by_name($s, ':username', $username);
        // oci_execute($s);

        oci_close($conn);

        session_unset();
        session_destroy();
        header("Location: ../home.php");
    }
?>
