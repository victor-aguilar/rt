<?php
include '../../../../configuracion.php';
header('Content-Type: text/html; charset=UTF-8');

$db = dameConexion();

if ($db->connect_errno) {
    printf($db->connect_error);
    exit();
}
$buscaEntidades = sprintf("
            select 
                    Entidades.nombre, count(*) as cuantos
                    from 
                    Entidades, Usuarios 
                    where 
                    Entidades.idEntidad = Usuarios.idEntidad 
                    group by 
                    Entidades.idEntidad 
                    order by 
                    Entidades.nombre;");
$resultadoDeEntidades = $db->query($buscaEntidades);
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
                    Entidad
                </td>
                <td>
                    Usuarios
                </td>
            </tr>
            <?php
            while ($resultadoDeEntidades && $filaDeEntidades = $resultadoDeEntidades->fetch_assoc()) {
                echo '<tr>';
                    echo '<td>';
                        echo '<a href="buscaUsuarios.php?busca=entidad&entidad='.$filaDeEntidades['nombre'].'">';
                            echo $filaDeEntidades['nombre'];
                        echo '</a>';
                    echo '</td>';
                    echo '<td>';
                        echo $filaDeEntidades['cuantos'];
                    echo '</td>';
                echo '</tr>';
            }
            ?>
        </table>        
    </body>
</html>
<?php
$db->close();
?>
