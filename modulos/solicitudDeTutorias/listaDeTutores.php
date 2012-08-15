<?php

header('Content-Type: text/html; charset=UTF-8');
include "../../configuracion.php";

$html = "";

$db = dameConexion();

$query = sprintf('
    select t.idUsuario, u.nick
        from Temas as t, Usuarios as u
        where u.idUsuario = t.idUsuario
        group by u.nick order by u.nick asc;'); //ordenar por nick

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
