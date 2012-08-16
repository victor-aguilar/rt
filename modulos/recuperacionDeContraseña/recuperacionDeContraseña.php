<?php

include "../../configuracion.php";

$db = dameConexion();

$query = sprintf("select nick,contraseña from Usuarios where email = '%s';", $_POST['email']);

$result = $db -> query($query);

if (! $result ){
	echo $query;
}

if ($result -> num_rows > 0){
	
	$row = $result -> fetch_assoc();
	
	$asunto = "Recuperacion de contraseña. RT";
	$mensaje = "Hola!\n";
	$mensaje .= "Tu usuario es: " . $row['nick'] . "\n";
	$mensaje .= "Tu contraseña es: " . $row['contraseña'] . "\n";
	$mensaje .= "No lo vuelvas a olvidar.";
			
	mail( $_POST['email'] , $asunto, $mensaje );
	
	echo "Correo enviado. En algunos segundos resiviras un correo con tu";
	echo " usuario y contraseña.";
}else{
	echo "Lo sieto, no hay ningun usuario con esta cuenta de correo";
}

?>
