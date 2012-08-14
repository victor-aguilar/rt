<?php
session_start();
header('Content-Type: text/xml; charset=UTF-8');

include '../../../../configuracion.php';


$idUsuario = $_SESSION['idUsuario'];


$db = dameConexion();

if($db->connect_errno){
  printf($db->connect_error);
  exit();
}
$buscaTutorias= sprintf("select 
        temas.nombre,
        tutorias.idTutoria,
        usuarios.nick
        from 
        temas, tutorias, usuarios
        where 
        temas.idTema=tutorias.idTema
        and
        usuarios.idUsuario=temas.idUsuario
        and
        estudiante=%d;",$idUsuario);




$resultadoDeTutorias = $db->query($buscaTutorias);

$datos = '<?xml version="1.0" encoding="utf-8"?><tutorias>';

while($resultadoDeTutorias && $filaDeTutorias = $resultadoDeTutorias->fetch_assoc()){

    $datos .= '<tutoria' .
            ' idtutoria="' . $filaDeTutorias['idTutoria'] . '"'.
            ' tutor="' . $filaDeTutorias['nick'] . '">';
    $datos .= $filaDeTutorias['nombre'];
    $datos .= '</tutoria>';
}
$datos .= '</tutorias>';

print($datos);
$db->close();

?>
