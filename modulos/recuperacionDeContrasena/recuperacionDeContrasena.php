<?php



include "../../configuracion.php";

$db = dameConexion();

$query = sprintf("select nombre,nick,contraseña from Usuarios where email = '%s';", $_POST['email']);

$headers = "MIME-Version: 1.0\r\n";
$headers .= "Content-type: text/html; charset=utf8\r\n";
$headers .= "From: Red de Tutorias (RT)\r\n";
$headers .= "Reply-To: no-reply\r\n";

//$headers .= "Cc: victor.aguilar@yahoo.com.mx\r\n";

$result = $db -> query($query);

if (! $result ){
	echo $query;
}

if ($result -> num_rows > 0){
	
	$row = $result -> fetch_assoc();
	
	$asunto = "Recuperacion de contraseña. RT";
	$mensaje = "<p>Hola <b>" . $row['nombre'] . "</b>!";
	$mensaje .= "<p>Tu usuario es: <b>" . $row['nick'] . "</b></p>";
	$mensaje .= "<p> contraseña es: <b>" . $row['contraseña'] . "</b></p>";
	$mensaje .= "<p>No lo vuelvas a olvidar.</p>";
	
	mail( $_POST['email'] , $asunto, $mensaje ,$headers);
	
	echo "Correo enviado. En algunos segundos recibiras un correo con tu";
	echo " usuario y contraseña.";
        echo "<br> <br> Ya puedes cerrar esta ventan.";
}else{
	echo "Lo sieto, no hay ningun usuario con esta cuenta de correo";
}

?>
