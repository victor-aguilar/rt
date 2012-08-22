<?php

header('Content-Type: text/html; charset=UTF-8');

function dameNombreDelUsuario($idUsuario,$db){
	
	$query = sprintf("select nombre from Usuarios where idUsuario = %d;", $idUsuario);
	$result = $db-> query($query);
	if(!$result) die ("error en la consulta: ".$query);
	$row = $result->fetch_assoc();
	return $row['nombre'];
}
function dameNombreDelTema($idTema,$db){
	$query = sprintf("select nombre from Temas where idTema = %d;", $idTema);
	$result = $db-> query($query);
	if(!$result) die ("error en la consulta: ".$query);
	$row = $result->fetch_assoc();
	return $row['nombre'];
}

function dameNombreDelTutorDelTema($idTema,$db){
	$query = sprintf("
			select u.nombre as nombre
			from Usuarios as u,Temas as t 
			where 
				t.idTema = %d and 
				u.idUsuario = t.idUsuario;",$idTema);
	$result = $db -> query($query);
	if(!$result) die ("error en la consulta: ".$query);
	$row = $result->fetch_assoc();
	return $row['nombre'];
}
?>
