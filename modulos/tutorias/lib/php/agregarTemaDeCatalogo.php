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
include "../../../../lib/php/queries.php";

$db = dameConexion();

$tmp = dameIdTemaIdAlumnoDeTutoria($_POST['idTutoria'], $db);

$idTema = $tmp[0];
$idAlumno = $tmp[1];

$query = sprintf('
	select * from Temas 
	where temaPadre = %d and idUsuario = %d;',
		$idTema,$idAlumno);

$result = $db -> query($query);

if(!$result ) die ("Error al consultar tema repetido. " . $query);
if($result -> num_rows != 0) die ("Error. Ya agregaste un tema al alumno actual. ");

$nombreDelAlumno = dameNombreDelUsuario($idAlumno,$db);


$query = sprintf('
	insert into Temas (nombre,idUsuario,temaPadre) 
	values ("%s",%d,%d);',$_POST['nombre'],$idAlumno,$idTema);

$db -> query($query);

if( $db->errno != 0) die ("Error al insertar " . $query . $db->error);

echo "El tema con el nombre " . $_POST['nombre'];
echo " fue agregado a los Temas de Catalogo de " . $nombreDelAlumno . ".";

$db->close();

?>
