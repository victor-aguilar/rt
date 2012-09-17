<?php
include "../../configuracion.php";
header('Content-Type: text/html; charset=UTF-8');

$db = dameConexion();

$nick  =$_POST['nick'];

$buscaNick = sprintf("select * from Usuarios where nick = '%s';",$nick);

$result = $db->query($buscaNick);

if(!$result){
	echo "Errorllllll." . $buscaNick;
}

if($result && ($result->num_rows != 0) ){
    echo "ya exite";
} else {
    echo "";
}

$db->close();
?>
