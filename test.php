<?php


foreach($_SERVER as $nombre_campo => $valor){


$asignacion = "$" . $nombre_campo . "= . $valor . ";


echo "<br>" . $asignacion;


}
?>