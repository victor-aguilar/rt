<?php 

header('Content-Type: text/html; charset=UTF-8');
session_start();
function asigna($dato){
	if(isset($_POST[$dato]))
	{	$_SESSION[$dato]=$_POST[$dato];}
	else
	{	$_SESSION[$dato]="";}
}
function GenCampo($nombre){
	$dato=$_SESSION[$nombre];
	$definicion='<input name="'.$nombre.'" type="hidden" id="'.$nombre.'" value="'.$dato.'" />'."\n";
	echo $definicion;	
}

?>
