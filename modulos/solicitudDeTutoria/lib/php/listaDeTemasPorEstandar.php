<?php

header('Content-Type: text/html; charset=UTF-8');
include "../../../../configuracion.php";

define("LIMITE", 20);

$idEstandar = $_POST['idEstandar'];

$html = "";

$db = dameConexion();

$n = "";
$v = "";

$query = sprintf(
		"select nombre,idTema 
			from EstandaresDeTema natural join temas 
			where idEstandar = %d 
			group by idTema;",$idEstandar);

$result = $db -> query($query);

if(!$result) die ("Error: ".  $db->error);;

while($row = $result->fetch_assoc()){
    $v = $row['idTema'];
    //suponemos que no hay diferencia entre mayuscuals y minusculas
    if ( $n == $row['nombre'] ){
        $v .= "," .$row['idTema'];
    }else{

        $html .= '<option value="' . $v .'"';
		$html .= ' title="' . $row['nombre'] . '">';
        $html .= $row['nombre'];
        $html .= '</option>';

        $n = $row['nombre'];
    }
}

$result -> free();
$db->close();
print($html);
?>
