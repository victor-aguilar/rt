<?php header('Content-Type: text/html; charset=UTF-8');
	include "../../configuracion.php";
?>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="../../lib/css/esviap.css"/>
		<link rel="stylesheet" type="text/css" href="lib/css/ests.css"/>
		<script type="text/javascript" src="../../lib/js/jquery.js"></script>
		<script type="text/javascript">
			$(document).ready(function(){
				$('#menu a').click(function(){
					$('#info').load( "lib/php/" + $(this).attr('value'));
				});
			})
		</script>
        <title>Estadisticas</title>
    </head>
    <body>
		<?php include "../../lib/php/encabezado.php" ?>
		<div style="text-align: center" id="menu">
        <a value="temas.php" href="#">Temas</a>
        <a value="tutorias.php" href="#">Tutorias</a>
        <a value="entidades.php" href="#">Endtidades</a>
        <a value="usuarios.php" href="#">Usuarios</a>
		</div>
		<br>
		<div id="info" style="margin-right:auto; margin-left:auto; width:300px;">
		</div>
        <?php
        // put your code here
        ?>
		<?php include "../../lib/php/pieDePagina.php" ?>
    </body>
</html>
