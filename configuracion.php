<?php

define("HOST_NAME","localhost");
define("USER_DB", "rt");
define("PASSWORD_DB","r2d2");
define("DB_NAME","tutorias");

define(
        "DIRECTORIO_BASE", 
        "archivosSubidos/");
define("DIR" , "victor/chat/");

define("DIRECTORIO_BASE_WEB","x");

date_default_timezone_set("America/Mexico_City");

function dameConexion(){
    return new mysqli(HOST_NAME,USER_DB,PASSWORD_DB,DB_NAME);
}

function administraSesion(){
    if(!isset($_SESSION['idUsuario'])){
        header('Location: http://' . $_SERVER['SERVER_NAME']);
        exit();
    }
}
?>