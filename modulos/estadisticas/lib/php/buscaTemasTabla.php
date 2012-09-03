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
        <link rel="StyleSheet" href="../../../../lib/css/esviap.css" type="text/css"/>
        <link rel="StyleSheet" href="../css/ests.css" type="text/css"/>
        <script type="text/javascript" src="../../../../lib/js/jquery.js"></script>
        <script type="text/javascript" src="../js/informacion.js"></script>
        <title></title>
    </head>
    <body>
        <?php include "../../../../lib/php/encabezado.php" ?>
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
                    echo'<td id="nombre" accion="tema" onclick="busca(event)">';
                           echo $fila['tema'];
                    echo'</td>';
                echo'</tr>';
            }
            ?>
        </table>
        <div>
            <table id="informaciones" border="1">
                
            </table>
        </div>
        <?php include "../../../../lib/php/pieDePagina.php" ?>
    </body>
</html>
<?php
$db->close();
?>