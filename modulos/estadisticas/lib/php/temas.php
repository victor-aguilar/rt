<?php

include '../../../../configuracion.php';
header('Content-Type: text/html; charset=UTF-8');

$db = dameConexion();

if($db->connect_errno){
  printf($db->connect_error);
  exit();
}

$cuentaTemas = sprintf('select count(*) from Temas');
$resultadoDeCuentaTemas = $db ->query($cuentaTemas);
$dato = $resultadoDeCuentaTemas -> fetch_assoc();
print ($dato['count(*)']);

?>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <?php
        // put your code here
        ?>
    </body>
</html>
