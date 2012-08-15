<?php
session_start();
header('Content-Type: text/html; charset=UTF-8');

include '../../../../configuracion.php';


$idUsuario = $_SESSION['idUsuario'];


$db = dameConexion();

if($db->connect_errno){
  printf($db->connect_error);
  exit();
}
  
$buscaNotificaciones = sprintf("
	select * 
    from MensajesPrivados,Usuarios where leido=0 
    and Usuarios.idUsuario = %d",$idUsuario); 
$resultadoDeNotificaciones = $db->query($buscaNotificaciones);

if($resultadoDeNotificaciones && $filaDeNotificaciones = $resultadoDeNotificaciones->fetch_assoc()){
    echo 'true';
} 


$db->close();

?>
