<!DOCTYPE html>
<html>
<head>
	<title></title>
</head>
<body>

	<?php
	// Create connection to Oracle
$conn = oci_connect("huerta", "huerta", "localhost/orcl");
if (!$conn) {
   $m = oci_error();
   echo $m['message'], "\n";
   exit;
}
else {
   echo "Connected to Oracle!";
   //header("Location:home.php");
}
// Close the Oracle connection
oci_close($conn);
?>

</body>
</html>
