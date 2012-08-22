<?php

header('Content-Type: text/html; charset=UTF-8');
include "../../../../configuracion.php";

$db = dameConexion();
$query = sprintf("call autorizaTema(%d);", $_POST['idTutoria']);

$db -> query($query);

if($db -> errno != 0){
	echo "Error al autorizar tema. ";$query  . $db-> error;
	$db->close();
	exit();
}

echo "<p>El Demostrador ya apuede tutorar en este tema.</p>";

$db->close();
?>
