<?php
header('Content-Type: text/html; charset=UTF-8');
include '../../configuracion.php';
include '../../lib/php/utils.php';

$idTutoria = $_POST['idTutoria'];
$idEtapa = $_POST['idEtapa'];
$fecha =getActualDate();
$db = new mysqli;
$ultimaVerificacionDePendientes=0;
$ultimoMiliPendientes=0;


$db->connect(HOST_NAME, USER_DB, PASSWORD_DB, DB_NAME);

if($db->connect_errno){
  print($db->connect_error);
  exit();
}
//selecciona todo de mensajes
$consultaAMensajes=sprintf("
	select 
		u.nick, 
		m.idUsuario,
		m.fecha, 
		m.mensaje, 
		m.mili 
    from 
		Usuarios as u, Mensajes as m 
    where 
		m.idUsuario = u.idUsuario and
		m.idTutoria = %d and m.idEtapa = %d and 
		m.autorizacion = 1",
        $idTutoria,  
        $idEtapa);

$resultadoDeMensajes = $db->query($consultaAMensajes);



$datos = '<?xml version="1.0" encoding="utf-8"?><mensajes>';

while($resultadoDeMensajes && $filaDeMensajes = $resultadoDeMensajes->fetch_assoc()){
    $datos .= '<mensaje' .
            ' idUsuario="' . $filaDeMensajes['idUsuario'] . '"'.
            ' nick="' . $filaDeMensajes['nick'] . '"' .
            ' fecha="'. $filaDeMensajes['fecha'] . '">';
    $datos .= $filaDeMensajes['mensaje'];
    $datos .= '</mensaje>';
    $ultimaVerificacionDePendientes = $fecha;
    $ultimoMiliPendientes = $filaDeMensajes['mili'];

}
$datos .= "<ultimaVerificacionDePendientes ultimoMiliPendientes=\"" . $ultimoMiliPendientes . "\">" . $ultimaVerificacionDePendientes . "</ultimaVerificacionDePendientes>";
$datos .= '</mensajes>';

print($datos);
$db->close();

?>