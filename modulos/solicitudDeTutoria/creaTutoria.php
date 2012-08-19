<?php
session_start();
include "../../configuracion.php";
include "../../lib/php/utils.php";

header('Content-Type: text/html; charset=UTF-8');
header('refresh:2; url="../../modulos/loged/loged.php"'); 

administraSesion();

$html = "";

$db = dameConexion();// Regresa un objeto

if(!$db) die ("Error al conectarse a la base de datos.");

$query = sprintf("insert into Tutorias (estudiante,idTema) values(%d,%d);",
        $_GET['idTutorado'],$_GET['idTema']);

if(! $db->query($query) ){
    $html = "<p>Error al crear la tutoria.</p><p> Tutor"; 
    $html .=$_GET['idTutorado'] . " -> Tema" .$_GET['idTema'] . "</p>";
}

$html = '<center><p style="margin-top:auto;margin-bottom">Tutoria creada. Direccionando en 2 seg...</p></center>'; 

$db->close();
print($html);
?>
