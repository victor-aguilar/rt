<?php
include '../../../../configuracion.php';
header('Content-Type: text/html; charset=UTF-8');

$db = dameConexion();

if ($db->connect_errno) {
    printf($db->connect_error);
    exit();
}

switch ($_GET['accion']){
    case 'asignatura':
        $buscaTemas = sprintf('select 
                    Temas.idTema, Temas.nombre as tema, 
                    EstandaresDeTema.idestandar , 
                    Estandares.idAsignatura, 
                    Asignaturas.nombre as asignatura
                    from 
                    Temas, EstandaresDeTema , Estandares, Asignaturas
                    where 
                    EstandaresDeTema.idTema= Temas.idTema 
                    and 
                    Estandares.idEstandar = EstandaresDeTema.idEstandar
                    and
                    Asignaturas.idAsignatura = Estandares.idAsignatura
                    and 
                    Asignaturas.nombre="%s" group by idTema;',$_GET['asignatura']);
        break;
}
$resultadoDeTemas=$db->query($buscaTemas);
?>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<link rel="stylesheet" type="text/css" href="../../../../lib/css/esviap.css"/>
        <title></title>
    </head>
    <body>
				<?php

echo '<div id="encabezado">';
echo '<img alt="logo EIMLE" src="../../../../lib/img/eimle.png" 
    style="display:block;margin:auto;">';
echo '</div>';
echo '<p align="center"><img src="../../../../lib/img/tured.png" width="680" height="32" border="0" /></p>';

?>
        <table border="1">
            <tr>
                <td>
                    ID
                </td>
                <td>
                    Tema
                </td>
            </tr>
            <?php
            while ($resultadoDeTemas && $fila=$resultadoDeTemas->fetch_assoc()){
                echo'<tr>';
                    echo'<td>';
                           echo $fila['idTema'];
                    echo'</td>';
                    echo'<td>';
                           echo $fila['tema'];
                    echo'</td>';
                echo'</tr>';
            }
            ?>
        </table>
    </body>
</html>
<?php
$db->close();
?>