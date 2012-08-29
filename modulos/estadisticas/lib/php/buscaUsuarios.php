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
            $buscaUsuarios.=";";
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
                }
            }
            $resultadoDeBuscaUsuarios = $db->query($buscaUsuarios);
            
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
                    Nick
                </td>                    
            </tr>       
            <?php
                while ($resultadoDeBuscaUsuarios && $filaDeBuscaUsuarios = $resultadoDeBuscaUsuarios -> fetch_assoc()){
                    echo '<tr>';
                        echo '<td>';
                            echo $filaDeBuscaUsuarios['idUsuario'];
                        echo '</td>';
                        echo '<td>';
                            echo $filaDeBuscaUsuarios['nick'];
                        echo '</td>';
                    echo '</tr>';
                }
            ?>
        </table>
    </body>
</html>
