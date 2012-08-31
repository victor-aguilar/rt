<?php
include '../../configuracion.php';
header('Content-Type: text/html; charset=UTF-8');

$db = dameConexion();

if ($db->connect_errno) {
    printf($db->connect_error);
    exit();
}

$buscaTemas = 'select * from Temas order by nombre;';

$resultadoDeBuscaTemas = $db->query($buscaTemas);
?>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="StyleSheet" href="../../lib/css/esviap.css" type="text/css"/>
        <link rel="StyleSheet" href="lib/css/ests.css" type="text/css"/>
        <script type="text/javascript" src="../../lib/js/jquery.js"></script>
        <script type="text/javascript" src="lib/js/portamento.js"></script>
        <script type="text/javascript" src="../../lib/js/funciones.js"></script>
        <script type="text/javascript" src="lib/js/arbol.js"></script>
        <title></title>
    </head>
    <body>
        <?php include "../../lib/php/encabezado.php" ?>
        <div id="wrapper">
            <div id="temass">
                <ul id="temas" class="s">
                    <li>
                        Temas
                    </li>
                </ul>
            </div>
            <div id="informacion" style="display : none">

            </div>
        </div>
        <div id="m"></div>
        <?php include "../../lib/php/pieDePagina.php" ?>

    </body>
</html>
<?php
$db->close();
?>