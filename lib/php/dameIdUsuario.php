<?php
session_start();
header('Content-Type: text/html; charset=UTF-8');

include '../../configuracion.php';

print($_SESSION['idUsuario']);

?>
