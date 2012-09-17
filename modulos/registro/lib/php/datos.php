<?php
include '../../../configuracion.php';
session_start();
header('Content-Type: text/html; charset=UTF-8');

$db=  dameConexion();


$email = $_SESSION['email'];
$entidad = $_POST['entidad'];
$municipio = $_POST['municipio'];
$localidad = $_POST['localidad'];
$escuela = $_POST['escuela'];

$mensaje = 'email: '.$email.' /n entidad: '.$entidad. ' /n localidad:'.$localidad;
$mensaje .= '/n escuela: '.$escuela;

mail('yyy@zzz.gob.mx', 'CCT', $mensaje);

$db->close();
?>