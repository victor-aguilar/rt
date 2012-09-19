<?php
include '../../../../configuracion.php';
header('Content-Type: text/html; charset=UTF-8');

$db = dameConexion();

if ($db->connect_errno) {
    printf($db->connect_error);
    exit();
}
$busca=  sprintf('select 
                    * 
                    from 
                    Temas,((select 
                            temaPadre, count(*) as cuantos
                            from Temas 
                            where temaPadre 
                            group by temaPadre 
                            order by temaPadre) 
                            as temaP)
                    where 
                    Temas.idTema = temaP.temaPadre
                    order by
                    cuantos 
                    desc;');
$result = $db->query($busca);
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
                <td>
                    Linaje
                </td>
            </tr>
            <?php
                while ($result && $fila = $result-> fetch_assoc()){
                    echo '<tr>';
                        echo '<td id="id">';
                            echo $fila['idTema'];
                        echo '</td>';
                        echo '<td id="nombre" accion="tema" onclick="busca(event)">';
                            echo $fila['nombre'];
                        echo '</td>';
                        echo '<td>';
                            echo $fila['cuantos'];
                        echo '</td>';
                    echo '</tr>';
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