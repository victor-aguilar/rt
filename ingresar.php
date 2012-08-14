<?php
session_start();
header('Content-Type: text/html; charset=UTF-8');

include 'configuracion.php';


$nick = $_POST['nick'];
$contraseña = $_POST['contraseña'];
$idUsuario = "";
$db = dameConexion();

$buscaUsuario = sprintf("select idUsuario from usuarios where nick='%s' and contraseña ='%s';",$nick,$contraseña);
$resultadoDeUsuario = $db->query($buscaUsuario);

if($resultadoDeUsuario && $filaDeUsuario= $resultadoDeUsuario ->fetch_assoc()){
    $idUsuario = $filaDeUsuario['idUsuario'];
}

$_SESSION['idUsuario'] = $idUsuario;
$_SESSION['nick'] = $nick;
print ($idUsuario);
$db ->close();
?>
