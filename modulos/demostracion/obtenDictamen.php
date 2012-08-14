<?php
header('Content-Type: text/html; charset=UTF-8');
include '../../configuracion.php';
include '../../lib/php/utils.php';

$idTutoria = $_POST['idTutoria'];

$dictamen = 0;
$db = new mysqli;


$db = dameConexion();

if($db->connect_errno){
  print($db->connect_error);
  exit();
}

  $consultaASinodales=sprintf("
      select usuarios.nick,sinodales.dictamen 
      from usuarios, sinodales 
      where usuarios.idusuario=sinodales.idusuario and
      idtutoria=%d;",
            $idTutoria);
  
  $resultadoDeSinodales = $db->query($consultaASinodales);
        
    while($resultadoDeSinodales && $filaDeSinodales = $resultadoDeSinodales->fetch_assoc()){
    if($filaDeSinodales['dictamen']== (true|| 1)){
        $dictamen++;
    }
}

if ($dictamen%2==0){
    $dictamenFinal = "El Sinodal ".$filaDeSinodales['nick']." te aprovo.  Has Aprovado la Demostracion";
    }  else {
        $dictamenFinal = "El Sinodal ".$filaDeSinodales['nick']." te aprovo.";
}

$datos = '<?xml version="1.0" encoding="utf-8"?><dictamenes>';
$datos .= '<dictamen>'.$dictamenFinal.'</dictamen>';
$datos .= '</dictamenes>';
print($datos);
$db->close();
?>
