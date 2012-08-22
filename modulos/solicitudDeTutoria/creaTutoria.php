<?php
session_start();
include "../../configuracion.php";
include "../../lib/php/utils.php";
include "../../lib/php/queries.php";

header('Content-Type: text/html; charset=UTF-8');
header('refresh:3; url="../../modulos/loged/loged.php"'); 

administraSesion();

$db = dameConexion();// Regresa un objeto
if(!$db) die ("Error al conectarse a la base de datos.");

$para = $_GET['idTutorado'];
$de = $_SESSION['idUsuario'];
$asunto = "Aceptado";

$idTema = $_GET['idTema'];

$fecha = getActualDate();

$nombreDelTutorado = dameNombreDelUsuario($para,$db);
$nombreDelTema = dameNombreDelTema($idTema,$db);
$nombreDelTutor = dameNombreDelTutorDelTema($idTema,$db);

$mensaje = "<p>Hola <b>" . $nombreDelTutorado ."</b>!</p> <p>Fuiste aceptado en la tutoria";
$mensaje .= " con el tema <b>" . $nombreDelTema ."</b> impartida por <b>";
$mensaje .= $nombreDelTutor ."</b></p>";

$query = sprintf('insert into MensajesPrivados 
	(de,para,asunto,mensaje,fecha,leido) values(%d,%d,\'%s\',\'%s\',"%s",%s)',
	$de,$para,$asunto,$mensaje,$fecha,"false");

if(! $db -> query($query)) echo ("Error al enviar mensaje de confirmacion");

$query = sprintf("insert into Tutorias (estudiante,idTema) values(%d,%d);",
        $_GET['idTutorado'],$_GET['idTema']);

if(! $db->query($query) ){
    $html = "<p>Error al crear la tutoria.</p><p> Tutor"; 
    $html .=$_GET['idTutorado'] . " -> Tema" .$_GET['idTema'] . "</p>";
}

$html = '<center><p style="margin-top:auto;margin-bottom">Tutoria creada. Direccionando en 3 seg...</p></center>'; 

$db->close();
print($html);
?>
