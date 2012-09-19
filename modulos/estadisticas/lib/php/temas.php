<?php
include '../../../../configuracion.php';
header('Content-Type: text/html; charset=UTF-8');

$db = dameConexion();

if ($db->connect_errno) {
    printf($db->connect_error);
    exit();
}

$cuentaTemas = sprintf('select count(*) as cuantos from Temas;');
$resultadoDeCuentaTemas = $db->query($cuentaTemas);
$dato = $resultadoDeCuentaTemas->fetch_assoc();

    $cuentaTemasPorAsignatura = sprintf('select count(distinct EstandaresDeTema.idTema) as cuantos,
                                Asignaturas.nombre as asignatura
                                from 
                                Temas, EstandaresDeTema , Estandares, Asignaturas
                                where 
                                EstandaresDeTema.idTema= Temas.idtema 
                                and 
                                Estandares.idEstandar = EstandaresDeTema.idEstandar
                                and
                                Asignaturas.idAsignatura = Estandares.idAsignatura
                                group by
                                asignatura
                                ;');
$resultadoDeCuentaTemasPorAsignatura = $db->query($cuentaTemasPorAsignatura);

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
                    Temas
                </td>
                <td>
                    <?php
                        print ($dato['cuantos']);
                    ?>
                </td>

            </tr>
            <?php
            while ($resultadoDeCuentaTemasPorAsignatura && $fila = $resultadoDeCuentaTemasPorAsignatura->fetch_assoc()) {
                echo'<tr>';
                    echo '<td>';
                        echo '<a href="lib/php/buscaTemasTabla.php?accion=asignatura&asignatura='.$fila['asignatura'].'">';
                            echo $fila['asignatura'];
                        echo '</a>';
                    echo '</td>';
                    echo '<td>';
                        echo $fila ['cuantos'];
                    echo '</td>';
                echo'</tr>';
            }
            ?>
        </table>

    </body>
</html>
