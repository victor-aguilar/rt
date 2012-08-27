<?php

header('Content-Type: text/html; charset=UTF-8');
include "../../configuracion.php";
include "../../lib/php/utils.php";

define("LIMITE", 20);

$html = "";

$db = dameConexion();// Regresa un objeto

$idsTemas = explode(",",$_POST['idsTemas']);

foreach($idsTemas as $i){
    $ldt .= $i . ",";
}
$ldt = substr($ldt,0, strlen($ldt)-1);

$query = "select u.nombre, t.idTema, t.idUsuario 
            from Usuarios as u, Temas as t
            where 
                t.idTema in (" . $ldt . ") and
                t.idUsuario = u.idUsuario order by u.nombre asc;";

$result = $db ->query($query);

if(!$result){die ("Error: " . $query);};

while($row = $result -> fetch_assoc()){
    $html .= '<option value="' .$row['idTema']. "," . $row['idUsuario'] . '">';
    $html .= $row['nombre'];
    $html .= '</option>';
}

$result ->free();
$db->close();
print($html);
?>
