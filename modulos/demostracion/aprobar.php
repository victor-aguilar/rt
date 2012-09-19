<?php

header('Content-Type: text/html; charset=UTF-8');
include '../../configuracion.php';

$idUsuario = $_POST ['idUsuario'];
$idTutoria = $_POST ['idTutoria'];

$db = new mysqli;



$db = dameConexion();

if($db->connect_errno){
  print($db->connect_error);
  exit();
}

    $query = "update Sinodales set dictamen=1 where idUsuario=? and idTutoria=?";
    $stmt = $db ->stmt_init(); 
    $stmt->prepare($query);
    $stmt->bind_param("ss",$idUsuario, $idTutoria);
    if(! $stmt->execute() ){

        echo"Dictamen Aprovado";
        
        }
    
    $stmt->close();

    $db->close();

?>