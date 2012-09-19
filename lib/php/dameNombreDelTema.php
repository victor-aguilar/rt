<?php

header('Content-Type: text/html; charset=UTF-8');
include "../../configuracion.php";
include "queries.php";

$db = dameConexion();
print(dameNombreDelTemaDeLaTutoria($_POST['idTutoria'],$db));


?>
