<?php

header('Content-Type: text/html; charset=UTF-8');
include "../../configuracion.php";

$db = dameConexion();

if($_POST['tipo'] == "producto"){
    $col = "idTutoria";
}else{
    $col = "idTema";
}

$query = sprintf('delete from ' .$_POST['tipo'] . "s" . 
        ' where ' . $col . ' = %d and url = "%s"',
                $_POST[$col],$_POST['url']);

if ( !$db->query($query) ){
    echo "Error: " . $query;
}else{
    echo "exito";
}
?>
