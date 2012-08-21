<?php

header('Content-Type: text/html; charset=UTF-8');
include "../../../../configuracion.php";

if(isset($_POST['r'])){
	$query = sprintf("select * from Recursos 
		natural join Tutorias
		where idTutoria = %d;",$_POST['idTutoria']);
}else{
	$query = sprintf("select * from Productos 
		where idTutoria = %d;",$_POST['idTutoria']);
}

$db = dameConexion();

// Obtenemos los recursos
$result = $db->query($query);

if ( ! $result){
	echo "<p>Error en la consulta:</p>";
	echo $query . " <br>" . $db->error;
	exit();
}

while($result && $row = $result->fetch_assoc()){
	$visual = ($row['hint'] == "")? $row['url']: $row['hint'];
	echo '<div>';
	echo '<span value="' . $row['url'] . '" alt="' . $row['descripcion'] . '">';
	echo $visual.'</span>';
	echo '<img src="../../lib/img/cancel.png"/>';
	echo '</div>';
}
?>
