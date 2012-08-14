<?php

define("HOST_NAME","localhost");
define("USER_DB", "rt");
define("PASSWORD_DB","r2d2");
define("DB_NAME","tutorias");

define(
        "DIRECTORIO_BASE", 
        "C:/Program Files (x86)/Apache Software Foundation/Apache2.2/htdocs/victor/chat/archivosSubidos/");

function dameConexion(){
    return new mysqli(HOST_NAME,USER_DB,PASSWORD_DB,DB_NAME);
}
?>