<?php

define("HOST","localhost");
define("USER", "liceocom_rt");
define("PASSWORD","r2d2");
define("DB","liceocom_tutorias");

date_default_timezone_set("America/Mexico_City");

function dameConexion(){

	$db = new mysqli(HOST,USER,PASSWORD,DB);
	
	if(!$db){
                echo "error";
		echo $db -> error;
                $db ->set_charset('utf8');
                exit();
	}
        
	return $db;
}

function administraSesion(){
    if(!isset($_SESSION['idUsuario'])){
        header('Location: http://' . $_SERVER['SERVER_NAME']);
        exit();
    }
}
?>