<?php
include "../../configuracion.php";

header('Content-Type: text/html; charset=UTF-8');

$idTutoria = $_POST['idTutoria'];

$query = sprintf("select * from recursos 
    natural join tutorias 
    where idTutoria = %d;",$idTutoria);

$db = dameConexion();
if( !$db) echo "Error al conectarce a la base de dataos.";

// Obtenemos los recursos
$result = $db->query($query);

if ( ! $result){
    echo "<p>Error en la consulta:</p>";
    echo $query;
    exit();
}

while( $result && $row = $result ->fetch_assoc()){
    echo '<div name="recurso">';
    echo '<span value="' . $row['url'] . '">'. $row['url'] . '</span>';
    echo '<img value="' . $row['idTema'] .'" src="../../lib/img/cancel.png"/>';
    echo '</div>';
}
?>
