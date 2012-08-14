<?php

header('Content-Type: text/html; charset=UTF-8');
include '../../configuracion.php';

$idUsuario = $_POST ['idUsuario'];
$fecha = $_POST ['fecha'];
$idTutoria = $_POST['idTutoria'];
$db = new mysqli;



$db = dameConexion();

if($db->connect_errno){
  print($db->connect_error);
  exit();
}

    $query = "delete from mensajes where idUsuario=? and idTutoria=? and fecha=?";
    $stmt = $db ->stmt_init(); 
    $stmt->prepare($query);
    $stmt->bind_param("dss",$idUsuario, $idTutoria, $fecha);
    if(! $stmt->execute() ){

        echo"Dictamen Aprovado";
        
        }
    
    $stmt->close();

    $db->close();

?>