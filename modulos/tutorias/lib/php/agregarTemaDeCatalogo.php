<?php
/**
 * Añade un tema de catalogo (tabla temas) al tema de la tutoria actual.
 * +-----------------------------------------+
 * | idTema | nombre | idUsuario | temaPadre |
 * +-----------------------------------------+
 * |	1	| Tema1	 | 		2	 |	null	 |
 * +-----------------------------------------+
 * |	2	| Tema1	 | 		3	 |		1	 | Esto es lo que se agrega.
 * +-----------------------------------------+ 
 */


header('Content-Type: text/html; charset=UTF-8');
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

include "../../../../configuracion.php";

$db = dameConexion();
$query = sprintf('call guardaTemaDeCatalogo(%d,"%s");',$_POST['idTutoria'],$_POST['nombre']);
$db -> query($query);

if( $db->errno != 0){
	echo "error. " . $db->error;
	$db->close();
	exit();
	
}

echo "Tema agregado al catalogo de temas del Tutorado.";

$db->close();

?>
