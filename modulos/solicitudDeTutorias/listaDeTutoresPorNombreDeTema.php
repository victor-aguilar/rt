<?php

header('Content-Type: text/html; charset=UTF-8');
include "../../configuracion.php";
include "../../lib/php/utils.php";

define("LIMITE", 20);

$html = "";

$db = dameConexion();// Regresa un objeto

if(!$db) die ("Error al conectarse a la base de datos.");

$idsTemas = explode(",",$_POST['idsTemas']);
        
$ldt = "";

foreach($idsTemas as $i){
    $ldt .= "t.idTema = " . $i . " or ";
}
$ldt = substr($ldt,0, strlen($ldt)-4);

$query = "select u.nick, t.idTema, t.idUsuario 
            from usuarios as u, temas as t
            where 
                (" . $ldt . ")and
                t.idUsuario = u.idUsuario;";

$result = $db ->query($query);

if(!$result){die ("Error: " . $query);};

while($row = $result -> fetch_assoc()){
    $html .= '<option value="' .$row['idTema']. "," . $row['idUsuario'] . '">';
    $html .= $row['nick'];
    $html .= '</option>';
}

$result ->free();
$db->close();
print($html);
?>
