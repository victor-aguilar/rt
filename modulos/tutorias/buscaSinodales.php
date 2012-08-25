<?php
header('Content-Type: text/html; charset=UTF-8');
include "../../configuracion.php";
include "../../lib/php/utils.php";

//$idTutoria = $_POST['idTutoria'];
$idTutoria = $_POST['idTutoria'];
$asunto = "Solicitud de Sinodal";
$mensaje = "
<html>
    <head>
        <title></title> 
        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\">
    </head>
    <body>
        <p>";
$mensaje .= "Nos complace el anunciarte, que has sido seleccionado 
	por la red de tutoría EIMLE como sinodal.</p>";

$fecha = getActualDate();

$db = dameConexion();

//comprobamos conexion;
if($db->connect_errno){
  printf($db->connect_error);
  exit();
}

$buscaTema= sprintf("
    select 
    Temas.nombre, 
    Temas.idTema,
    Tutorias.estudiante
    from    Tutorias 
    natural join Temas 
    where Tutorias.idTutoria=%d;", $idTutoria);

$resultadoDeTema =  $db->query($buscaTema);
$filaDeTema = $resultadoDeTema->fetch_assoc();
$nombreDelTema = $filaDeTema['nombre'];
$idTema=$filaDeTema ['idTema'];
$mensaje .= "<p> Del tema <b>".$nombreDelTema.".</b> </p>";
$mensaje .= "<p>Que inpacta a los siguientes términos: </p>";

$buscaEstandar = sprintf("
	select * from EstandaresDeTema 
	where idTema=%d;", $idTema);
$result = $db->query($buscaEstandar);

if (!$result) die("Error. " . $buscaEstandar . $db->error);

while ( $row = $result -> fetch_assoc()){

    $idEstandar= $row['idEstandar'];

	$buscaInpacto = sprintf("
	select

		Asignaturas.nombre                    as asignatura, 
		ComponenteEjeCategoria.nombre         as componente, 
		Periodos.nombre                       as periodo,
		Estandares.descripcion                as estandar

	from     

		Asignaturas, ComponenteEjeCategoria,Estandares,Periodos

	where 
		Asignaturas.idAsignatura = Estandares.idAsignatura and 
		ComponenteEjeCategoria.idComponenteEjeCategoria = Estandares.idComponenteEjeCategoria and 
		Periodos.idPeriodo = Estandares.idPeriodo and
		Estandares.idEstandar = %d;", $idEstandar);

	$resultadoDeInpacto = $db->query($buscaInpacto);

	$filaDeInpacto = $resultadoDeInpacto -> fetch_assoc();

	$asignatura= $filaDeInpacto['asignatura'];
	$componente= $filaDeInpacto['componente'];
	$periodo = $filaDeInpacto['periodo'];
	$estandar = $filaDeInpacto['estandar'];
	
	$mensaje .= "<p>";
	$mensaje .= "Periodo: <b>".$periodo.".</b><br/>";
	$mensaje .= "Asignatura: <b>".$asignatura.".</b><br/>";
	$mensaje .= "Componente: <b>".$componente.".</b><br/>";
	$mensaje .= "Estándar: <b>".$estandar.".</b><br/>";
	$mensaje .= "</p>";

}

$mensaje .= "<p>Le sugerimos las siguientes fechas: </p>";
$mensaje .= "<ul><li>2012-08-25 18:00 </li>";
$mensaje .= "<li>2012-08-24 18:00 </li>";
$mensaje .= "<li>2012-08-23 18:00 </li></ul>";



$mensaje .= "<p>Favor de consultar los siguientes productos de la tutoria:</p>";

$buscaProductos=  sprintf("select 
    Productos.url           as url,
	Productos.hint			as hint,
    Productos.descripcion   as descripcion
    from                    Productos 
    natural join            Tutorias 
    where                   Tutorias.idTutoria=%d;",$idTutoria);

$result = $db->query($buscaProductos);

if(!$result) die('Error.' . $db->error);

while ($row = $result -> fetch_assoc()){
	$visual = ($row['descripcion'] == "")? $row['url']: $row['descripcion'];
    $mensaje .= '<a href="' . $row['url'] . '"';
	$mensaje .= ' title="' . $row['hint'] . '">';
	$mensaje .= $visual . '</a>';
	$mensaje .= "<br><br>";
}

$buscaAlumno = sprintf("
    select 
    u.nombre, u.email, u.idUsuario
    from 
    Usuarios as u, Tutorias as t
    where 
    u.idUsuario = t.estudiante 
    and t.idTutoria = %d;",$idTutoria);

$resultadoDeAlumno= $db->query($buscaAlumno);
$filaDeAlumno=$resultadoDeAlumno->fetch_assoc();
$alumno = $filaDeAlumno['nombre'];
$emailAlumno = $filaDeAlumno['email'];
$idAlumno = $filaDeAlumno['idUsuario'];

$mensaje .= "<p>Favor de contactar al estudiante <b>".$alumno;
$mensaje .= "</b> en el correo: <b>".$emailAlumno . '</b></p>';
$mensaje .= "<p>Gracias.</p>";
$mensaje .= " </body></html>";

$buscaSinodales= sprintf("select * from Usuarios order by rand() limit 3;");

$resultadoDeSinodales = $db->query($buscaSinodales);

if(!$resultadoDeSinodales) die("Error." . $query . $db->error);

while( $filaDeSinodales = $resultadoDeSinodales->fetch_assoc()){
    
$idSinodal=$filaDeSinodales['idUsuario'];
$correoDeSinodal= $filaDeSinodales['email'];


	$query = sprintf("insert into Sinodales 
		values (%d,%d,false);",$idTutoria,$idAlumno);
	
	if(! $db->query($query) ) die("Error." . $query . $db->error);
	
	echo $mensaje;
    
	$headers = "MIME-Version: 1.0\r\n";
	$headers .= "Content-type: text/html; charset=utf8\r\n";
	$headers .= "From: Red de Tutorias (RT)\r\n";
	$headers .= "Reply-To: no-reply\r\n";
	
    //mail($correoDeSinodal,$asunto,$mensaje,$headers);
    $query = sprintf('insert into 
        MensajesPrivados (de,para,asunto,mensaje,fecha) values(%d,%d,"%s",\'%s\',"%s");',
            $idAlumno,$idSinodal,$asunto,$mensaje,$fecha);
}

$db->close();

?>
