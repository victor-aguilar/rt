<?php 
header('Content-Type: text/html; charset=UTF-8');
?>
<!DOCTYPE html>
<html>
  <head>
    <title></title>

  </head>
  <body>
      <script type="text/javascript" src="../../lib/js/jquery.js"></script>
<?php

$nombreReal = $_FILES['archivo']['name'];
$nombreTemporal = $_FILES['archivo']['tmp_name'];

if (move_uploaded_file($nombreTemporal, $nombreReal)){
    echo '<script type="text/javascript">';
    echo '$(document).ready(function(){';
    echo 'window.setTimeout(window.close, 3000);';
    echo '});';
    echo '</script>';
    echo "Avatar subido con exito. Cerrando ventana.";
}else{
    echo "<p>Error al mover el archivo.</p>";
    echo "de " . $nombreTemporal . " a "  . $nombreReal;
}
      
	   
?>
      
  </body>
</html>

