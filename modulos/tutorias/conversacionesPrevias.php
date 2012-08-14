<?php
header('Content-Type: text/xml; charset=UTF-8');

include "../../configuracion.php";
include "../../lib/php/utils.php";

$idTutoria = $_POST['idTutoria'];
$idEtapa = 1;

$fechaActual = getActualDate();

$xml = "";

$db = dameConexion();

if(!$db){die ($db->connect_error);}


//buscamos la ultima etapa
$query = sprintf('select Max(idEtapa) as ultimaEtapa 
    from historial where idTutoria = %d',$idTutoria);

$result = $db -> query($query);

//como usa funcion de agregado (MAX) siempre nos regresara
// por lo menos una fila.
if(!$result ){
    $xml = '<?xml version="1.0" encoding="utf-8"?><mensajes>';
    $xml .= "<errro><![CDATA[";
    $xml .= "Error: " . $query;
    $xml .= "]]></error>";
    $xml . "</mensajes>";
    print($xml);
    $db ->close();
    exit();
}
$row = $result->fetch_assoc();
$idEtapa =  ($row['ultimaEtapa']=== null)? 1: $row['ultimaEtapa'] ;
$result -> free();

//fin de busqueda de etapa

$query = sprintf("select distinct h.idUsuario,h.fecha,h.mensaje,h.idEtapa, u.nick
    from historial as h, Usuarios as u
        where 
            h.idTutoria = %d and 
            h.idUsuario = u.idUsuario and 
            h.idEtapa = %d and
            h.autorizacion = true
        order by FECHA;",$idTutoria,$idEtapa);
$result = $db ->query($query);

if(! $result){
    $xml = '<?xml version="1.0" encoding="utf-8"?><mensajes>';
    $xml .= "<errro><![CDATA[";
    $xml .= "Error: " . $query;
    $xml .= "]]></error>";
    $xml . "</mensajes>";
    print($xml);
    $db ->close();
    exit();
}

$xml = '<?xml version="1.0" encoding="utf-8"?><mensajes>';

while ($row = $result -> fetch_assoc()){
    $xml .= '<mensaje '. 
            'idUsuario="'. $row['idUsuario'] .'" '.
            'nick="' .$row['nick'] . '" ' .
            'fecha="'. $row['fecha'] . '">';
    $xml .= '<![CDATA[';
    $xml .= $row['mensaje'];
    $xml .= ']]>';
    $xml .= "</mensaje>";
    $idEtapa = $row['idEtapa'];
}

$xml .= '<ultimaverificacion ultimoMili="0">'.$fechaActual.'</ultimaverificacion>';
$xml .= '<ultimaetapa>' . $idEtapa .'</ultimaetapa>' ;
$xml .= '</mensajes>';

if ($result -> free());

print($xml);
?>
