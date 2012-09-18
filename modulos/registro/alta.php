<?php 
include "../../configuracion.php";
session_start();
header('Content-Type: text/html; charset=UTF-8');

$db = dameConexion();

function asigna($dato){
	if(isset($_POST[$dato]))
	{	$_SESSION[$dato]=$_POST[$dato];}
	else
	{	$_SESSION[$dato]="";}
}
asigna('nick');
asigna('contraseña');
$_SESSION['idLocalidad']=0;
$_SESSION['idMunicipio']=0;

//var_dump($_SESSION);
//$insertSQL='insert into usuarios
//    values(default,"'.$_SESSION['nick'].'","'.$_SESSION['nombre'].'","'.
//        $_SESSION['apellidos'].'","'.$_SESSION['sexo'].'",'.$_SESSION['idEntidad'].
//        ','.$_SESSION['idNodo'].',"img/users/gilberto.gif","'.
//        $_SESSION['email'].'","'.$_SESSION['telefono'].'","'.$_SESSION['C'].'","'.
//        $_SESSION['cct'].'",'.$_SESSION['turno'].')';

$nick = $_SESSION['nick'];
$nombre = $_SESSION['nombre'];
$apellidos = $_SESSION['apellidos'];
$sexo = $_SESSION['sexo'];
$email = $_SESSION['email'];
$telefono = $_SESSION['telefono'];
$contraseña = $_SESSION['contraseña'];
$cct = $_SESSION['cct'];
$idEntidad = $_SESSION['idEntidad'];
$idMunicipio = $_SESSION['idMunicipio'];
$idLocalidad = $_SESSION['idLocalidad'];
$idNodo = $_SESSION['idNodo'];
$idTurno = $_SESSION['idTurno'];
if($idTurno==""){
    $idTurno=1;
    intval($idTurno);
}
if($idTurno==0){
    $idTurno =1;
}
$idNiveles = $_SESSION['idNivel']; //esto puede ser una lista separada por comas. Mas de una seleccion.
$idModalidad = $_SESSION['idModalidad'];
//todo
if($idModalidad==0){
    $idModalidad="null";
}else{
	$idModalidad = "" . $idModalidad; //lo hacemos cadena
}

$insertSQL=  sprintf("
insert 
    into Usuarios 
    (nick,nombre,apellidos,sexo,
    email,telefono,contraseña,
    cct,idEntidad,idMunicipio,
    idLocalidad,idNodo,idTurno,idModalidad) 
    values 
    ('%s','%s','%s','%s','%s',%d,'%s','%s',%d,%d,%d,%d,%d,%s);",
        $nick,$nombre,$apellidos,$sexo,
        $email,$telefono,$contraseña,$cct,
        $idEntidad,$idMunicipio,$idLocalidad,
        $idNodo,$idTurno,$idModalidad);

if(!$db -> query($insertSQL)){
	echo "Error al insertar usuario" . $insertSQL . $db->error;
}
$idUsuario = $db->insert_id;

//Tenemos que insertar una fila por cada nivel.

$s = "";
foreach($idNiveles as $v){
	$s .= "(" .$v ."," .$idUsuario ."),";
}

$s = substr($s, 0, strlen($s)-1);

$insertNiveles = sprintf('
	insert into Niveles values %s;',$s);

if(!$db->query($insertNiveles)){
	echo $insertNiveles;
	echo $db->error;
}

$insertGoTo = "../../index.php";
header(sprintf("Location: %s", $insertGoTo));

?>

