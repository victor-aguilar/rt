<?php
include "../Connections/configuracion.php";
header('Content-Type: text/html; charset=UTF-8');

$db = dameConexion();
if($db->connect_errno){
  print($db->connect_error);
  exit();
}
$nick  =$_POST['nick'];

$buscaNick = sprintf("select * from usuarios where nick = '%s';",$nick);
$resultadoDeNick = $db->query($buscaNick);
if($resultadoDeNick && $filaDeNick = $resultadoDeNick->fetch_assoc()){
    echo "ya exite";
} else {
    echo "";
}

$db->close();
?>
