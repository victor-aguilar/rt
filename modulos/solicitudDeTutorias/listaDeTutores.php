<?php

header('Content-Type: text/html; charset=UTF-8');
include "../../configuracion.php";

$html = "";

$db = dameConexion();

$query = sprintf('
    select temas.idUsuario, usuarios.nick
        from temas, usuarios
        where usuarios.idUsuario = temas.idUsuario
        group by usuarios.nick order by usuarios.nick asc;'); //ordenar por nick

$result = $db->query($query);

if(! $result){
    echo "Error: " . $query;
    $db->close();
    exit();
}

while ( $row = $result -> fetch_assoc()){
    $html .= '<option value="' . $row['idUsuario'] . '">';
    $html .= $row['nick'];
    $html .= '</opction>';
}

$result -> free();
$db -> close();
print($html);


?>
