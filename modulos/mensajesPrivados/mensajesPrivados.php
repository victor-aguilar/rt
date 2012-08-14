<?php
session_start();

header('Content-Type: text/xml; charset=UTF-8');
include "../../configuracion.php";
include "../../lib/php/utils.php";

$fecha = getActualDate();
$leido = 0;
$accion = $_POST['accion'];

$xml = '<?xml version="1.0" encoding="utf-8"?><mensajes>'; 

$db = dameConexion();

switch($accion){
    case "guarda":
        $para = $_POST['para'];
        $de = $_SESSION['idUsuario'];
        $asunto = $_POST['asunto'];
        $mensaje = $_POST['mensaje'];
        
        $query = sprintf('insert into mensajesPrivados 
            (de,para,asunto,mensaje,fecha,leido) values(%d,%d,\'%s\',\'%s\',"%s",%s)',
        $de,$para,$asunto,$mensaje,$fecha,$leido);
        
        if(!$db -> query($query)){
            $xml = '<?xml version="1.0" encoding="utf-8"?><mensajes>'; 
            $xml .= '<error><![CDATA[' .$query . '<br>' .$db-> error .']]></error>';
            $xml .= "</mensajes>";
            $db->close();
            print($xml);
            exit();
        }
        
        $xml .= '</mensajes>';
        
        //Aqui enviamos el e-mail.
        
        $query = sprintf('select email from usuarios where idUsuario = %d',$para);
        $result = $db->query($query);
        
        if ($result->num_rows != 0){
            $row = $result->fetch_assoc();
            $correoDeSinodal = $row['email'];
        }
        
        //mail($correoDeSinodal,$asunto,$mensaje);
        
        break;
    case "lista":
        
        $para = $_SESSION['idUsuario'];
        $query = sprintf('select mensajesPrivados.*, usuarios.nick
            from mensajesPrivados, usuarios 
            where mensajesPrivados.para = usuarios.idUsuario and usuarios.idUsuario = %d;',
            $para);
        
        $result = $db -> query($query);
        
        if (!$result){
            $xml = '<?xml version="1.0" encoding="utf-8"?><mensajes>'; 
            $xml .= '<error><![CDATA[' .$query . ']]></error>';
            $xml .= "</mensajes>";
            $db->close();
            print($xml);
            exit();
        }
        

        
        while($row = $result->fetch_assoc()){
            
             $query = sprintf("select usuarios.nick as deNick from usuarios, mensajesPrivados
                where usuarios.idUsuario = %d;", $row['de']);

            $result2 = $db -> query($query);

            if (!$result2){
                $xml = '<?xml version="1.0" encoding="utf-8"?><mensajes>'; 
                $xml .= '<error><![CDATA[' .$query . ']]></error>';
                $xml .= "</mensajes>";
                $db->close();
                print($xml);
                exit();
            }
            
            $deNick = $result2->fetch_assoc();
            
            
            $xml .= "<mensaje";
            $xml .= ' idMensajePrivado="' .$row['idMensajePrivado'] .'"';
            $xml .= ' de="'. $deNick['deNick'] . '"';
            $xml .= ' para="' . $row['para'] . '"';
            $xml .= ' asunto="' . $row['asunto'] .'"';
            $xml .= ' leido="' . $row['leido'] . '"';
            $xml .= '>';
            $xml .= "</mensaje>";
        }
        
        $xml .= "</mensajes>";
        $result->free();
        break;
    case ("extrae"):
        
        $idMensajePrivado = $_POST['idMensajePrivado'];
        $query = sprintf('select mensaje 
            from mensajesPrivados 
            where idMensajePrivado = %d',$idMensajePrivado);
        
        $result = $db ->query($query);
        
        if (!$result){
            $xml = '<?xml version="1.0" encoding="utf-8"?><mensajes>'; 
            $xml .= '<error><![CDATA[' .$query . ']]></error>';
            $xml .= "</mensajes>";
            $db->close();
            print($xml);
            exit();
        }
        
        if ($result->num_rows != 0){
            $row = $result->fetch_assoc();
            $xml .= '<mensaje><![CDATA['.$row['mensaje'] .']]></mensaje>';
        }
        $xml .= '</mensajes>';
        
        $query = sprintf("update MensajesPrivados set leido = true
                where idMensajePrivado = %d;",$idMensajePrivado);
        if (! $db->query($query)){
            echo "error al actualizar";
        }
        break;
}
$db->close();
print($xml);

?>