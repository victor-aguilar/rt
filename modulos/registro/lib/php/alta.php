<?php require_once('../Connections/esviap_conn.php'); 
session_start();
header('Content-Type: text/html; charset=UTF-8');

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
if($idEntidad == ""){
    $idEntidad=1;
    intval($idEntidad);
    }
$idMunicipio = $_SESSION['idMunicipio'];
if($idMunicipio==""){
    $idMunicipio =0;
    intval($idMunicipio);
}
$idLocalidad = $_SESSION['idLocalidad'];
if($idLocalidad==""){
    $idLocalidad=0;
    intval($idLocalidad);
}
$idNodo = $_SESSION['idNodo'];
if($idNodo==""){
    $idNodo=1;
    intval($idNodo);
}
$idTurno = $_SESSION['idTurno'];
if($idTurno==""){
    $idTurno=1;
    intval($idTurno);
}
if($idTurno==0){
    $idTurno =1;
}
$idNivel = $_SESSION['idNivel'];
if($idNivel==""){
    $idNivel=1;
    intval($idNivel);
}
$idModalidad = $_SESSION['idModalidad'];
if($idModalidad==""){
    $idModalidad=1;
    intval($idModalidad);
}
$insertSQL=  sprintf("
insert 
    into Usuarios 
    (nick,nombre,apellidos,sexo,
    email,telefono,contraseña,
    cct,idEntidad,idMunicipio,
    idLocalidad,idNodo,idTurno,idNivel,idModalidad) 
    values 
    ('%s','%s','%s','%s','%s',%d,'%s','%s',%d,%d,%d,%d,%d,%d,%d);",
        $nick,$nombre,$apellidos,$sexo,
        $email,$telefono,$contraseña,$cct,
        $idEntidad,$idMunicipio,$idLocalidad,
        $idNodo,$idTurno,$idNivel,$idModalidad);

//echo $qstr;
  mysql_select_db($database_esviap_conn, $esviap_conn);
  $Result1 = mysql_query($insertSQL, $esviap_conn) or die(mysql_error());
  $insertGoTo = "../../../../index.php";
  header(sprintf("Location: %s", $insertGoTo));

?>

