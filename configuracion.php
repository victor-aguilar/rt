<?php
		
define("HOST","localhost");
define("USER", "liceocom_rt");
define("PASSWORD","r2d2");
define("DB","liceocom_tutorias");

date_default_timezone_set("America/Mexico_City");

function dameConexion(){

	$db = new mysqli(HOST,USER,PASSWORD,DB);
	
	if(!$db) die ("Error al conectarse a la base de datos.");
	$db ->set_charset('utf8');
	echo "Ocurrio un erro";
        
	return $db;
}

function administraSesion(){
    if(!isset($_SESSION['idUsuario'])){
		echo "No has iniciado session.";
        header('Location: http://' . $_SERVER['SERVER_NAME']. "/rt");
        exit();
    }
}
?>