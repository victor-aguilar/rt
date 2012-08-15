<?php

header('Content-Type: text/html; charset=UTF-8');
include "../../configuracion.php";

$db = dameConexion();

if($_POST['tipo'] == "producto"){
    $col = "idTutoria";
	$tabla = "Productos";
}else{
	$tabla = "Recursos";
    $col = "idTema";
}

$query = sprintf('delete from ' . $tabla .
        ' where ' . $col . ' = %d and url = "%s"',
                $_POST[$col],$_POST['url']);

if ( !$db->query($query) ){
    echo "Error: " . $query;
}else{
    echo "exito";
}
?>
