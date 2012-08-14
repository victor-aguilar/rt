<?php
header('Content-Type: text/xml; charset=UTF-8');

include 'configuracion.php';


$idUsuario = $_POST['idUsuario'];


$db = dameConexion();

if($db->connect_errno){
  printf($db->connect_error);
  exit();
}
$buscaTutorias= sprintf("select 
        temas.nombre,
        tutorias.idtutoria,
        usuarios.nick
        from 
        temas, tutorias, usuarios
        where 
        temas.idtema=tutorias.idtema
        and
        usuarios.idusuario=temas.idUsuario
        and
        estudiante=%d;",$idUsuario);




$resultadoDeTutorias = $db->query($buscaTutorias);

$datos = '<?xml version="1.0" encoding="utf-8"?><tutorias>';

while($resultadoDeTutorias && $filaDeTutorias = $resultadoDeTutorias->fetch_assoc()){

    $datos .= '<tutoria' .
            ' idtutoria="' . $filaDeTutorias['idtutoria'] . '"'.
            ' tutor="' . $filaDeTutorias['nick'] . '">';
    $datos .= $filaDeTutorias['nombre'];
    $datos .= '</tutoria>';
}
$datos .= '</tutorias>';

print($datos);
$db->close();

?>
