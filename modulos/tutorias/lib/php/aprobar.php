<?php

header('Content-Type: text/html; charset=UTF-8');
include "../../../../configuracion.php";
include "../../../../lib/php/queries.php";

$db = dameConexion();

$idTema = dameIdTemaIdAlumnoDeTutoria($_POST['idTutoria'],$db);
$query = sprintf("update Temas set autorizado = true where idTema = %d;", $idTema);

$db -> query($query);

if($db -> errno != 0){
	echo "Error al autorizar tema. " .$query  . $db-> error;
	$db->close();
	exit();
}

echo "<p>El Demostrador ya apuede tutorar en este tema.</p>";

$db->close();
?>
