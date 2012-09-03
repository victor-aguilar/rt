<?php

header('Content-Type: text/html; charset=UTF-8');
include "../../configuracion.php";

$html = "";

$db = dameConexion();

$query = sprintf('
        select idTema, nombre from Temas 
            where autorizado = true and 
			idUsuario = %d
			order by nombre asc;',$_POST['idTutor']); //ordenar por nick
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
