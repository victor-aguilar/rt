<?php

header('Content-Type: text/html; charset=UTF-8');
include "../../configuracion.php";

$html = "";

$db = dameConexion();

$query = sprintf('
        select temas.idTema, temas.nombre from temas 
            where temas.idUsuario = %d;',$_POST['idTutor']); //ordenar por nick
$result = $db->query($query);

if(! $result){
    echo "Error: " . $query;
    $db->close();
    exit();
}

while ( $row = $result -> fetch_assoc()){
        $html .= '<option value="' . $row['idTema'] . '">';
        $html .= $row['nombre'];
        $html .= '</option>';
}

$result -> free();
$db -> close();
print($html);


?>
