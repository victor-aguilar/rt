<?php
include '../../../../configuracion.php';
header('Content-Type: text/html; charset=UTF-8');

$db = dameConexion();

if ($db->connect_errno) {
    printf($db->connect_error);
    exit();
}
// numero de tutorias
$buscaTutorias = sprintf('select count(*) as cuantos from tutorias;');
$resultadoDeTutorias = $db->query($buscaTutorias);
$filaDeTutorias = $resultadoDeTutorias->fetch_assoc();
//  query de etapas
$buscaTutoriasEnEtapaX = 'select
                    count(*) as cuantos 
                    from 
                    ((select 
                    idTutoria, max(idEtapa) as max 
                    from 
                    historial  
                    group by 
                    idTutoria) as t) 
                    where max ';
?>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title></title>
    </head>
    <body>
        <table border="1">
            <tr>
                <td>
                    <a href="buscaTutorias.php?accion=todos">
                        Tutorias
                    </a>
                </td>
                <td>
                    <?php
                    echo $filaDeTutorias['cuantos'];
                    ?>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="buscaTutorias.php?accion=terminadas">
                        Terminadas
                    </a>
                </td>
                <td>
                    <?php
                    $buscaTutoriasEnEtapa6 = $buscaTutoriasEnEtapaX . '=6;';
                    $resultado = $db->query($buscaTutoriasEnEtapa6);
                    $filaResult = $resultado->fetch_assoc();
                    echo $filaResult['cuantos'];
                    ?>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="buscaTutorias.php?accion=demostracion">
                        En Demostracion
                    </a>
                </td>
                <td>
                    <?php
                    $buscaTutoriasEnEtapa5 = $buscaTutoriasEnEtapaX . '=5;';
                    $resultado = $db->query($buscaTutoriasEnEtapa5);
                    $filaResult = $resultado->fetch_assoc();
                    echo $filaResult['cuantos'];
                    ?>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="buscaTutorias.php?accion=espera">
                        En espera de Demostracion
                    </a>
                </td>
                <td>
                    <?php
                    $buscaTutoriasEnEtapa4 = $buscaTutoriasEnEtapaX . '=4;';
                    $resultado = $db->query($buscaTutoriasEnEtapa4);
                    $filaResult = $resultado->fetch_assoc();
                    echo $filaResult['cuantos'];
                    ?>
                </td>
            </tr>
            <tr>
                <td>
                    <a href="buscaTutorias.php?accion=tutoria">
                        En tutoria
                    </a>
                </td>
                <td>
                    <?php
                    $buscaTutoriasEnEtapa3 = $buscaTutoriasEnEtapaX . '<4;';
                    $resultado = $db->query($buscaTutoriasEnEtapa3);
                    $filaResult = $resultado->fetch_assoc();
                    echo $filaResult['cuantos'];
                    ?>
                </td>
            </tr>
            <?php
            ?>
        </table>
        <?php
        ?>
    </body>
</html>
<?php
$db->close();
?>