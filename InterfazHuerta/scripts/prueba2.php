<?php

    $c = oci_pconnect("nano", "nano", "localhost/orcl");
    $s = oci_parse($c, "select * from nano.Huerta");
    oci_execute($s);
    while (($row = oci_fetch_row($s)) != false) {
        echo $row[0] . " " . $row[1] . "<br>\n";
}

oci_free_statement($s);
oci_close($c);

?>
