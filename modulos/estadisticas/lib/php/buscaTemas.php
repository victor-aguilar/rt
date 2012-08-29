
<?php

include '../../../../configuracion.php';
header('Content-Type: text/xml; charset=UTF-8');

    $db = dameConexion();

    if($db->connect_errno){
    printf($db->connect_error);
    exit();
    }            
    
    switch ($_POST['accion']){
        case 'todos':
            $buscaTemas = '
                select 
                    Usuarios.nick ,Temas.* 
                    from 
                    Temas, Usuarios 
                    where 
                    Usuarios.idUsuario=Temas.idUsuario 
                    and 
                    autorizado = 1 
                    order by 
                    nombre;';
            break;
        case 'padre':
            $buscaTemas = sprintf('select * from Temas where autorizado=1 and idTema= %d',$_POST['padre']);
            break;
        case 'hijo':
            $buscaTemas = sprintf('select 
                    Usuarios.nick ,Temas.* 
                    from 
                    Temas, Usuarios 
                    where 
                    Usuarios.idUsuario=Temas.idUsuario 
                    and 
                    autorizado=1 
                    and temaPadre=%d;',$_POST['tema']);
            break;
    }
    
    
    $resultadoDeTemas = $db ->query($buscaTemas);
    
    $xml="";
    $xml .= '<temas accion="'.$_POST['accion'].'">';
    $xml .= '<query>'.$buscaTemas.'</query>';
    while ($resultadoDeTemas && $filaDeTemas = $resultadoDeTemas -> fetch_assoc()){
        $xml.='<tema';
        $xml.=' idTema="'.$filaDeTemas['idTema'].'"';
        $xml.=' nick="'.$filaDeTemas['nick'].'"';
        $xml.=' padre="'.$filaDeTemas['temaPadre'].'"' ;
        $xml.='>';
        $xml.=$filaDeTemas['nombre'];
        $xml.='</tema>';
    }
    $xml .= '</temas>';
    echo $xml;
    $db->close();
    ?>