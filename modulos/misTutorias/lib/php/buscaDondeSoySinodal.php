<?php
header('Content-Type: text/xml; charset=UTF-8');

include 'configuracion.php';


$idUsuario = $_POST['idUsuario'];


$db = dameConexion();

if($db->connect_errno){
  printf($db->connect_error);
  exit();
}
$buscaTutorados= sprintf("select 
        temas.nombre,
        sinodales.idtutoria,
        usuarios.nick
        from 
        temas, sinodales, usuarios, tutorias
        where
        tutorias.idtema=temas.idtema
        and
        sinodales.idtutoria=tutorias.idtutoria
        and
        tutorias.estudiante=usuarios.idusuario
        and
        sinodales.idUsuario=%d;",$idUsuario);




$resultadoDeTutorados = $db->query($buscaTutorados);

$datos = '<?xml version="1.0" encoding="utf-8"?><tutorias>';

while($resultadoDeTutorados && $filaDeTutorados = $resultadoDeTutorados->fetch_assoc()){

    $datos .= '<tutoria' .
            ' idtutoria="' . $filaDeTutorados['idtutoria'] . '"'.
            ' tutorado="' . $filaDeTutorados['nick'] . '">';
    $datos .= $filaDeTutorados['nombre'];
    $datos .= '</tutoria>';
}

$datos .= '</tutorias>';

print($datos);
$db->close();
?>
