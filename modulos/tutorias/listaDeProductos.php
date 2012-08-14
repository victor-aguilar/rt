<?php

header('Content-Type: text/html; charset=UTF-8');
include "../../configuracion.php";

$idTutoria = $_POST['idTutoria'];

if (!$db = dameConexion()){
    echo "error de conexion";
}

$query = sprintf("select * from productos where idTutoria = %d", $idTutoria);
//$query = "select * from Productos where idTutoria = ?";
//$stmt = $db->stmt_init();
//if(!$stmt->prepare($query)){
//    echo "<p> error al preparar</p>";
//}
//if(!$stmt->bind_param("s",$idTutoria)){
//    echo "<p> error al ligar</p>";
//}
//if (!$stmt->execute()){
//    echo "<p> error " . $stmt -> error . "</p>";
//}
//
//if(!$result = $stmt->get_result()){
//    echo "<p> error. result vacio.";
//}

$result = $db ->query($query);

while($result && $row = $result->fetch_assoc()){
    echo '<div name="producto">';
    echo '<span value="' . $row['url'] . '" alt="">';
    echo $row['url'].'</span>';
    echo '<img src="../../lib/img/cancel.png"/>';
    echo '</div>';
}

$db -> close();
?>
