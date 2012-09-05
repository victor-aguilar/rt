<?php
header('Content-Type: text/xml; charset=UTF-8');

include "../../configuracion.php";
include "../../lib/php/utils.php";

$idTutoria = $_POST['idTutoria'];

$db = dameConexion();

if(!$db){die ($db->connect_error);}


//buscamos la ultima etapa
$query = sprintf('select Max(idEtapa) as ultimaEtapa 
    from MensajesPlus where idTutoria = %d;',$idTutoria);

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

$query = sprintf("
	select 
		h.*,
		u.nick
    from MensajesPlus as h, Usuarios as u
        where 
            h.idTutoria = %d and 
            h.idUsuario = u.idUsuario and 
            h.idEtapa = %d and
            h.autorizacion = true
        order by fecha asc;",$idTutoria,$idEtapa);
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
$idum = 0;
while ($row = $result -> fetch_assoc()){
    $xml .= '<mensaje '. 
            'idUsuario="'. $row['idUsuario'] .'" '.
            'nick="' .$row['nick'] . '" ' .
            'fecha="'. $row['fecha'] . '">';
    $xml .= '<![CDATA[';
    $xml .= $row['mensaje'];
    $xml .= ']]>';
    $xml .= "</mensaje>";
	
	$idum = $row['idMensaje'];
}

 $result = $db->query(
		 sprintf('
			select count(*) as numPro 
			from Productos 
			where idTutoria = %d;',$idTutoria));

 if (!$result) die ("Error: " .$db->error);
 
 $row = $result->fetch_assoc();

 $xml .= "<productosNuevos>" . $row['numPro'] . "</productosNuevos>";

$xml .= '<idUltimoMensaje>' .$idum . '</idUltimoMensaje>';
$xml .= '<ultimaEtapa>' . $idEtapa .'</ultimaEtapa>' ;
$xml .= '</mensajes>';

if ($result -> free());
$db->close();
print($xml);
?>
