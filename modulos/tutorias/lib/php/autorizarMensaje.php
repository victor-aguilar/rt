<?php

header('Content-Type: text/html; charset=UTF-8');
include '../../../../configuracion.php';
include 'funciones.php';

$db = dameConexion();
$idUsuario = $_POST['idUsuario'];
$idTutoria = $_POST['idTutoria'];
$idEtapa = $_POST['idEtapa'];
$idMensaje = $_POST['idMensaje'];
$mensaje = $_POST['mensaje'];
$autorizacion = 1;

deleteMensaje($idMensaje,$db);
saveMensaje($idTutoria,$idUsuario,$idEtapa,$autorizacion,$mensaje,$db);

?>
