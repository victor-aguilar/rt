<?php
header('Content-Type: text/xml; charset=UTF-8');
include '../../configuracion.php';
include '../../lib/php/utils.php';

$idTutoria = $_POST['idTutoria'];

$ultimoMiliPendientes = $_POST['ultimoMiliPendientes']; //Se utiliza para hacer unica la fecha.
$ultimaVerificacionDePendientes = $_POST['ultimaVerificacionDePendientes'];
$fecha =getActualDate();
$db = new mysqli;



$db = dameConexion();

if($db->connect_errno){
  print($db->connect_error);
  exit();
}
//selecciona todo de mensajes
$consultaAMensajes=sprintf("select usuarios.nick, mensajes.idUsuario,
    mensajes.fecha, mensajes.mensaje, mensajes.mili from usuarios,
    mensajes where mensajes.idUsuario=usuarios.idUsuario and
    idTutoria=%d and autorizacion=0 and (fecha>%s or (fecha=%s and mili>%d));",
        $idTutoria,  
        '"'.$ultimaVerificacionDePendientes.'"',
        '"'.$ultimaVerificacionDePendientes.'"', 
        $ultimoMiliPendientes);

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