<?php
session_start();
header('Content-Type: text/html; charset=UTF-8');
include "../../configuracion.php";
include "../../lib/php/utils.php";

administraSesion();
$db = dameConexion();

//Datos enviados por el usuario.
$idTutoria = $_POST['idTutoria'];
$idUsuario = $_SESSION['idUsuario'];
$mensaje = $db->real_escape_string($_POST['mensaje']);
$idEtapa = $_POST['idEtapa'];
$tipoDeUsuario = $_POST['tipoDeUsuario'];
$idUltimoMensaje = $_POST['idUltimoMensaje'];


//$borrar = "1"; //minutos
$error = "";
$etapaDemostracion = 5;
$autorizacion = ($tipoDeUsuario === "sinodal")? 0: 1;

// The sended message.
if( $mensaje != ""){
	$insert = sprintf(
			'insert into MensajesPlus 
				(idTutoria,idUsuario,idEtapa, autorizacion,mensaje) value
				(%d,%d,%d,%d,"%s");',
			$idTutoria,$idUsuario,$idEtapa,$autorizacion,$mensaje);
	if(!$db->query($insert)){
		logging("Consulta: " . $insert . "\n\t" . $db->error );
		$error .= "<error>Error al guardar el mensaje</error>";
	}
}

////Borramos mensajes viejos.
//$query = sprintf('
//    delete from Mensajes 
//        where idtutoria=%d and fecha < DATE_SUB("%s", INTERVAL %d MINUTE);'
//        ,$idTutoria,$fecha, $borrar);
//
//if(! $db -> query($query)){
//    echo $query;
//}

//Recuperamos los mensajes nuevos. Si se ralizo una insercion
//(la condicion anterior) tambien se recupera esta ultima insercion.
if ($idEtapa < $etapaDemostracion ){
    $query = sprintf('
		select m.*, u.nick 
		from MensajesPlus as m natural join Usuarios as u
		where 
			m.idTutoria = %d and 
			u.idUsuario = m.idUsuario and
			m.idMensaje > %d;',
				$idTutoria, $idUltimoMensaje);
}else{ //la etapa
    $query = sprintf('
		select m.*, u.nick 
		from MensajesPlus as m natural join usuarios as u
		where 
			m.idTutoria = %d and 
			u.idUsuario = m.idUsuario and
			m.autorizacion = true and
			m.idMensaje > %d;',
				$idTutoria, $idUltimoMensaje); 
}

$result = $db->query($query);

if(!$result){
	logging("Consulta: " . $query ."\n\t" . $db->error);
	$error = "<error>Error al obtener mensajes nuevos. " .$query. "</error>";
}

$idum = 0;
$xml = '<?xml version="1.0" encoding="utf-8"?><mensajes>';
while ($row = $result -> fetch_assoc()){
	$xml .= '<mensaje' .
            ' idUsuario="' . $row['idUsuario'] . '"'.
            ' nick="' . $row['nick'] . '"' .
            ' fecha="'. $row['fecha']  .'">';
    $xml .= '<![CDATA[';
    $xml .= $row['mensaje'];
    $xml .= ']]>';
    $xml .= '</mensaje>';
    
    //Guardamos el milisegundo (mili) y la fecha del ultimo mensaje.
    $idUltimoMensaje= $row['idMensaje'];
    
    if ($idEtapa < $row['idEtapa']){
        $idEtapa = $row['idEtapa'];
    }
}

$resultp = $db->query(
		sprintf('
			select count(*) 
			from Productos 
			where idTutoria = %d;',$idTutoria));

 if (!$resultp) die ("Error: " .$db->error);
 
 $row = $resultp->fetch_row();
 
 $xml .= "<productosNuevos>" . $row[0] . "</productosNuevos>";


$xml .= $error;
$xml .= '<idUltimoMensaje>' . $idUltimoMensaje .'</idUltimoMensaje>';
$xml .= '<ultimaEtapa>' . $idEtapa .'</ultimaEtapa>' ;
$xml .= '</mensajes>';

$db->close();
print($xml);
?>
