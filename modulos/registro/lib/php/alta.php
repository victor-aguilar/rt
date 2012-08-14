<?php require_once('../Connections/esviap_conn.php'); 
session_start();
header('Content-Type: text/html; charset=UTF-8');

function asigna($dato){
	if(isset($_POST[$dato]))
	{	$_SESSION[$dato]=$_POST[$dato];}
	else
	{	$_SESSION[$dato]="null";}
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
$idNivel = $_SESSION['idNivel'];
$idModalidad = $_SESSION['idModalidad'];

$insertSQL=  sprintf("
insert 
    into usuarios 
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
echo $insertSQL;

//echo $qstr;
  mysql_select_db($database_esviap_conn, $esviap_conn);
  $Result1 = mysql_query($insertSQL, $esviap_conn) or die(mysql_error());
  $insertGoTo = "../../../../index.php";
  header(sprintf("Location: %s", $insertGoTo));

?>

