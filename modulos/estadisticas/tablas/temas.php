<?php //

//header('Content-Type: text/html; charset=UTF-8');
//require '../../../configuracion.php';
//require '../lib/Estadisticas.php';
//
//$db = dameConexion();
//$e = new Estadisticas($db);
//echo '<center>';
//$tabla = $e->tablaAsignaturasPorTemas();
//$db->close();
//print($tabla);


?>

<?php
include '../../../configuracion.php';
header('Content-Type: text/html; charset=UTF-8');

$db = dameConexion();

if ($db->connect_errno) {
    printf($db->connect_error);
    exit();
}

$cuentaTemas = sprintf('select count(*) as cuantos from Temas;');
$resultadoDeCuentaTemas = $db->query($cuentaTemas);
$dato = $resultadoDeCuentaTemas->fetch_assoc();
$totalTemas = $dato['cuantos'];

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
	<center>
<table border="1">
<tr>
<td>
Catálogo
</td>
<td>
<?php
                        print ($totalTemas);
                    ?>
</td>

</tr>
<?php		$count = 0;
            while ($resultadoDeCuentaTemasPorAsignatura && $fila = $resultadoDeCuentaTemasPorAsignatura->fetch_assoc()) {
				$count += $fila['cuantos'];
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
			echo '<tr><td>Sin Asignatura</td></td><td>' . ($totalTemas - $count) . '</td></tr>';
            ?>
</table></center>

</body>
</html>
