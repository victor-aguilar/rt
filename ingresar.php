<?php
session_start();
header('Content-Type: text/html; charset=UTF-8');

include 'configuracion.php';


$nick = $_POST['nick'];
$contraseña = $_POST['contraseña'];
$idUsuario = "";
$db = dameConexion();

$buscaUsuario = sprintf("select idUsuario,nombre 
	from Usuarios where nick='%s' and contraseña ='%s';",$nick,$contraseña);
$result = $db->query($buscaUsuario);

if(!$result){
	die($buscaUsuario . " - " . $db->error);
}

if($result && $row= $result ->fetch_assoc()){
    $idUsuario = $row['idUsuario'];
}

$_SESSION['idUsuario'] = $idUsuario;
$_SESSION['nick'] = $nick;
$_SESSION['nombre'] = $row['nombre'];
print ('exito');
$db ->close();
?>
