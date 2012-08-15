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
$buscaTutorados= sprintf("select 
        Temas.nombre,
        Sinodales.idTutoria,
        Usuarios.nick
        from 
        Temas, Sinodales, Usuarios, Tutorias
        where
        Tutorias.idTema=Temas.idTema
        and
        Sinodales.idTutoria=Tutorias.idTutoria
        and
        Tutorias.estudiante=Usuarios.idUsuario
        and
        Sinodales.idUsuario=%d;",$idUsuario);




$resultadoDeTutorados = $db->query($buscaTutorados);

$datos = '<?xml version="1.0" encoding="utf-8"?><tutorias>';

while($resultadoDeTutorados && $filaDeTutorados = $resultadoDeTutorados->fetch_assoc()){

    $datos .= '<tutoria' .
            ' idtutoria="' . $filaDeTutorados['idTutoria'] . '"'.
            ' tutorado="' . $filaDeTutorados['nick'] . '">';
    $datos .= $filaDeTutorados['nombre'];
    $datos .= '</tutoria>';
}

$datos .= '</tutorias>';

print($datos);
$db->close();
?>
