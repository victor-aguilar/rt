<?php
header('Content-Type: text/html; charset=UTF-8');
include "../../configuracion.php";
include "../../lib/php/utils.php";

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
$mensaje .= "Nos complace el anunciarte, que has sido seleccionado por la red de tutoría <br>
           EIMLE como sinodal";

$fecha = getActualDate();

$directorioBaseWeb = "192.168.252/chat/archivosSubidos/";

$db = dameConexion();

//comprobamos conexion;
if($db->connect_errno){
  printf($db->connect_error);
  exit();
}

$buscaTema= sprintf("
    select 
    temas.nombre, 
    temas.idtema,
    tutorias.estudiante
    from    tutorias 
    natural join temas 
    where tutorias.idtutoria=%d;", $idTutoria);

$resultadoDeTema =  $db->query($buscaTema);
$filaDeTema = $resultadoDeTema->fetch_assoc();
$nombreDelTema = $filaDeTema['nombre'];
$idTema=$filaDeTema ['idtema'];
$mensaje .= "<br><br> Del tema ".$nombreDelTema.". <br><br>";
$mensaje .= "Que inpacta a los siguientes términos: <br><br><br>";
$buscaEstandar = sprintf("select from estandaresdetema where idtema=%d", $idTema);

$resultadoDeEstandaresDeTema = $db->query($buscaEstandar);



while ( $resultadoDeEstandaresDeTema && $filaDeEstandaresDeTema -> fetch_assoc()){

    $idEstandar= $filaDeEstandaresDeTema['idestandar'];
 
    
$buscaInpacto = sprintf("
select
    
    asignaturas.nombre                    as asignatura, 
    componenteEjeCategoria.nombre         as componente, 
    periodos.nombre                       as periodo,
    estandares.descripcion                as estandar
    
from     
    
    asignaturas, componenteejecategoria,estandares,periodos
    
where 
    asignaturas.idasignatura=estandares.idasignatura and 
    componenteejecategoria.idComponenteEjeCategoria=estandares.idComponenteEjeCategoria and 
    periodos.idperiodo=estandares.idperiodo and
    estandares.idEstandar=%d;", $idEstandar);

$resultadoDeInpacto = $db->query($buscaInpacto);

$$filaDeInpacto = $resultadoDeInpacto -> fetch_assoc();

$asignatura= $filaDeInpacto['asignatura'];
$componente= $filaDeInpacto['componente'];
$periodo = $filaDeInpacto['periodo'];
$estandar = $filaDeInpacto['estandar'];

$mensaje .= "Periodo: ".$periodo.".<br>";
$mensaje .= "Asignatura: ".$asignatura.".<br>";
$mensaje .= "Componente: ".$componente.". <br>";
$mensaje .= "Estándar: ".$estandar.". <br><br>";

}

$mensaje .= "Le sugerimos las siguientes fechas: <br><br>";
$mensaje .= "2012-08-25 18:00 <br>";
$mensaje .= "2012-08-24 18:00 <br>";
$mensaje .= "2012-08-23 18:00 <br>";



$mensaje .= "Favor de consultar los siguientes productos de la tutoria:<br><br>";

$buscaProductos=  sprintf("select 
    productos.url           as producto 
    productos.descripcion   as descripcion
    from                    productos 
    natural join            tutorias 
    where                   tutorias.idtutoria=%d;",$idTutoria);

$resultadoDeProductos = $db->query($buscaProductos);

while ($resultadoDeProductos && $filaDeProductos-> fetch_assoc()){
   
    $descripcion =     $filaDeProductos['descripcion'];
    $producto    =     $directorioBaseWeb.$filaDeProductos['producto'];
    
$mensaje .= "<br><br>".$descripcion.": <br>";
$mensaje .= $producto."<br><br>";
    
    
}

$buscaAlumno = sprintf("
    select 
    usuarios.nick, usuarios.email, usuarios.idUsuario
    from 
    usuarios, tutorias 
    where 
    usuarios.idusuario=tutorias.estudiante 
    and idtutoria=1;",$idTutoria);

$resultadoDeAlumno= $db->query($buscaAlumno);
$filaDeAlumno=$resultadoDeAlumno->fetch_assoc();
$alumno = $filaDeAlumno['nick'];
$emailAlumno = $filaDeAlumno['email'];
$idAlumno = $filaDeAlumno['idUsuario'];

$mensaje .= "Favor de contactar al estudiante ".$alumno;
$mensaje .= "<br> En el correo: <br>".$emailAlumno;
$mensaje .= "<br> Gracias.";
$mensaje .= " 
        </p>
    </body>
                 
</html>";

$buscaSinodales= sprintf("select * from usuarios order by rand() limit 3;");

$resultadoDeSinodales = $db->query($buscaSinodales);

while($resultadoDeSinodales && $filaDeSinodales = $resultadoDeSinodales->fetch_assoc()){
    
$idSinodal=$filaDeSinodales['idUsuario'];
$correoDeSinodal= $filaDeSinodales['email'];


    $query = "insert into sinodales values (?,?,0) ;";
    $stmt = $db ->stmt_init(); 
    if(!$stmt->prepare($query)) {echo "error prepared";}
    if(!$stmt->bind_param("dd",$idTutoria,$idSinodal)){ echo "errro bind";};
    if(! $stmt->execute() ){
        echo "Error al establecer sinodal: " . $query;
    }
    
    //mail($correoDeSinodal,$asunto,$mensaje);
    $query = sprintf('insert into 
        MensajesPrivados (de,para,asunto,mensaje,fecha) values(%d,%d,"%s",\'%s\',"%s");',
            $idAlumno,$idSinodal,$asunto,$mensaje,$fecha);
    
    $stmt->close();
    
       
}



$db->close();

?>
