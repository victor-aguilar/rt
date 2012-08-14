<?php
header('Content-Type: text/html; charset=UTF-8');
include '../../configuracion.php';
include '../../lib/php/utils.php';

$idTutoria = $_POST['idTutoria'];
$idUsuario = $_POST['idUsuario'];
$fecha = getActualDate();
$mensaje = $_POST['mensaje'];
$autorizacion = 1;
$idEtapa =$_POST['idEtapa'];

$db = new mysqli;




$db = dameConexion();

if($db->connect_errno){
  print($db->connect_error);
  exit();
}

    $query = "call guardaMensaje(?,?,?,?,?,?,@mili);";
    $stmt = $db ->stmt_init(); 
    $stmt->prepare($query);
    $stmt->bind_param("ddssdd", $idTutoria,$idUsuario,$fecha,$mensaje,$autorizacion,$idEtapa);
    if(! $stmt->execute() ){
        echo "Error al llamar store procedure guardarMensaje.";
        echo "\n paramentros:<br>\n";
        echo $idTutoria ."<br>\n";
        echo $idUsuario ."<br>\n";
        echo $fecha ."<br>\n";
        echo $mensaje ."<br>\n";
        echo $autorizacion ."<br>\n";
        echo $idEtapa ."<br>\n";
    }
    
    $stmt->close();
$db->close();
?>
