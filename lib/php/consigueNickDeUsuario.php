<?php
session_start();
header('Content-Type: text/html; charset=UTF-8');

include '../../configuracion.php';

administraSesion();

$db = dameConexion();

$query = sprintf("select nick from usuarios where idUsuario = %s" ,$_SESSION['idUsuario']);

$result = $db -> query($query);

$row = $result -> fetch_assoc();

$db->close();
print ($row['nick']);


?>