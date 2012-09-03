            <?php
            
            include '../../../../configuracion.php';
            header('Content-Type: text/html; charset=UTF-8');

            $db = dameConexion();

            if($db->connect_errno){
            printf($db->connect_error);
            exit();
            }
            if(isset($_GET['sexo'])){
            $buscaUsuarios= 'select idUsuario, nick, nombre from Usuarios';
            switch ($_GET['sexo']){
                case 'mujer':                    
                    $buscaUsuarios.= ' where sexo =1';
                    break;
                case 'hombre':
                    $buscaUsuarios.= ' where sexo =2';
                    break;
                case 'maquina':
                    $buscaUsuarios.= ' where sexo =3';
                    break;
                case 'todos':
                    $buscaUsuarios.= ' where sexo !=3';
                    break;
            }
            $buscaUsuarios.=" order by nick;";
            }
            
            if(isset($_GET['busca'])){
                switch ($_GET['busca']){
                    case 'tutores':                        
                        $buscaUsuarios='select 
                                        Usuarios.idUsuario, Usuarios.nick 
                                        from 
                                        Temas, Usuarios 
                                        where 
                                        Usuarios.idUsuario = Temas.idUsuario
                                        group by
                                        Usuarios.idUsuario
                                        order by
                                        Usuarios.nick;';
                        break;
                    case 'tutorados':
                        $buscaUsuarios='select 
                                        Usuarios.idUsuario, Usuarios.nick 
                                        from 
                                        Tutorias, Usuarios 
                                        where 
                                        Usuarios.idUsuario = Tutorias.estudiante
                                        group by
                                        Usuarios.idUsuario
                                        order by
                                        Usuarios.nick;';
                        break;
                    case 'entidad':
                        $buscaUsuarios=sprintf('select 
                                        * 
                                        from 
                                        Usuarios, Entidades 
                                        where 
                                        Entidades.idEntidad = Usuarios.idEntidad 
                                        and 
                                        Entidades.nombre = "%s" 
                                        order by 
                                        Usuarios.nick;',
                                        $_GET['entidad']);
                        break;  
                }
            }
            $resultadoDeBuscaUsuarios = $db->query($buscaUsuarios);
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
        <?php include "../../lib/php/encabezado.php" ?>
        <table border="1">
            <tr>
                <td>
                    ID
                </td>
                <td>
                    Nick
                </td>                    
            </tr>       
            <?php
                while ($resultadoDeBuscaUsuarios && $filaDeBuscaUsuarios = $resultadoDeBuscaUsuarios -> fetch_assoc()){
                    echo '<tr>';
                        echo '<td>';
                            echo $filaDeBuscaUsuarios['idUsuario'];
                        echo '</td>';
                        echo '<td id="nombre" accion="usuario" onclick="busca(event)">';
                            echo $filaDeBuscaUsuarios['nick'];
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
