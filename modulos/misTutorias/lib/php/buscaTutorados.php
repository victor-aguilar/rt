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
        tutorias.idtutoria,
        usuarios.nick
        from 
        temas, tutorias, usuarios
        where 
        temas.idtema=tutorias.idtema
        and
        usuarios.idusuario=tutorias.estudiante
        and
        temas.idUsuario=%d;",$idUsuario);




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
