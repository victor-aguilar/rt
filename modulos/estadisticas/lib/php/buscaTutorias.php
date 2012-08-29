<?php
include '../../../../configuracion.php';
header('Content-Type: text/html; charset=UTF-8');

$db = dameConexion();

if ($db->connect_errno) {
    printf($db->connect_error);
    exit();
}
$query = 'select 
            Temas.nombre as tema, Usuarios.nick as estudiante, Tutorias.idTutoria , Tutores.Tutor, Etapas.max
            from 
            Tutorias, Usuarios, Temas , ((select 
            Tutorias.idTutoria, Usuarios.nick as Tutor, Temas.idTema
            from 
            Tutorias, Usuarios, Temas 
            where 
            Usuarios.idUsuario = Temas.idUsuario 
            and 
            Tutorias.idTema=Temas.idTema)as Tutores)
            , ((select 
            * 
            from ((select 
            idTutoria, max(idEtapa) as max 
            from 
            historial group by idTutoria) as maximo)
            where 
            max =%d)as Etapas)
            where 
            Temas.idTema=Tutorias.idTema 
            and 
            Usuarios.idUsuario= Tutorias.estudiante
            and
            Tutorias.idTutoria= Tutores.idTutoria
            and
            Etapas.idTutoria = Tutorias.idTutoria
            ;';
switch ($_GET['accion']) {
    case 'todos':
        $buscaTutorias = sprintf('select 
                        Temas.nombre as tema, Usuarios.nick as estudiante, Tutorias.idTutoria , Tutores.Tutor
                        from 
                        Tutorias, Usuarios, Temas , ((select 
                        Tutorias.idTutoria, Usuarios.nick as Tutor, Temas.idTema
                        from 
                        Tutorias, Usuarios, Temas 
                        where 
                        Usuarios.idUsuario = Temas.idUsuario 
                        and 
                        Tutorias.idTema=Temas.idTema)as Tutores)
                        where 
                        Temas.idTema=Tutorias.idTema 
                        and 
                        Usuarios.idUsuario= Tutorias.estudiante
                        and
                        Tutorias.idTutoria= Tutores.idTutoria
                        order by
                        idTutoria;');
        break;
    case 'terminadas':
        $buscaTutorias = sprintf($query, 6);
        break;
    case 'demostracion':
        $buscaTutorias = sprintf($query,5);
        break;
    case 'espera':
        $buscaTutorias = sprintf($query, 4);
        break;
    case 'tutoria':
        $buscaTutorias = sprintf('select 
                        Temas.nombre as tema, Usuarios.nick as estudiante, Tutorias.idTutoria , Tutores.Tutor, Etapas.max
                        from 
                        Tutorias, Usuarios, Temas , ((select 
                        Tutorias.idTutoria, Usuarios.nick as Tutor, Temas.idTema
                        from 
                        Tutorias, Usuarios, Temas 
                        where 
                        Usuarios.idUsuario = Temas.idUsuario 
                        and 
                        Tutorias.idTema=Temas.idTema)as Tutores)
                        , ((select
                        * 
                        from ((
                        select 
                        idTutoria, max(idEtapa) as max 
                        from 
                        historial group by idTutoria) as maximo)
                        where 
                        max <4)as Etapas)
                        where 
                        Temas.idTema=Tutorias.idTema 
                        and 
                        Usuarios.idUsuario= Tutorias.estudiante
                        and
                        Tutorias.idTutoria= Tutores.idTutoria
                        and
                        Etapas.idTutoria = Tutorias.idTutoria
                        order by
                        idTutoria;');
}

$resultadoDeTutorias = $db ->query($buscaTutorias);
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
                    ID
                </td>
                <td>
                    Tema de Tutoria
                </td>
                <td>
                    Estudiante
                </td>
                <td>
                    Tutor
                </td>
            </tr>
            <?php
            while ($resultadoDeTutorias && $filaDeTutorias = $resultadoDeTutorias -> fetch_assoc()){
                echo '<tr>';
                    echo '<td>';
                        echo $filaDeTutorias['idTutoria'];
                    echo '</td>';
                    echo '<td>';
                        echo $filaDeTutorias['tema'];
                    echo '</td>';
                    echo '<td>';
                        echo $filaDeTutorias['estudiante'];
                    echo '</td>';
                    echo '<td>';
                        echo $filaDeTutorias['Tutor'];
                    echo '</td>';
                echo '</tr>';
            }
            ?>
        </table>
    </body>
</html>
