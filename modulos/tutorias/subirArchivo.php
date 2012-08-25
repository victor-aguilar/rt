<?php 
session_start();
header('Content-Type: text/html; charset=UTF-8');
?>
<!DOCTYPE html>
<html>
  <head>
    <title></title>

  </head>
  <body>
      <script type="text/javascript" src="../../lib/js/jquery.js"></script>
      <script type="text/javascript">
          $(document).ready(function(){
            window.setTimeout(window.close, 3000);
            window.opener.window.urlDelArchivo = $('#info').attr("value");
          });
      </script>
<?php

include "../../configuracion.php";
include "../../lib/php/utils.php";
include "../../lib/php/queries.php";

administraSesion();

$idTutoria  = $_POST['idTutoria'];
$url        = "";
$idTema     = "";
$hint       = $_POST['hint'];
$descripcion = $_POST['descripcion'];
$idUsuario = $_SESSION['idUsuario'];


$tipo       = $_POST['tipo'];
$crp        = $_POST['crp']; // = recursos|chat|productos

if ( $_FILES['archivo']['name'] == ""){
	echo "Nombre del archivo invalido";
	exit();
}

if( $_POST['url'] != ""){
    $nombreReal = $_POST['url'];
}else{
    $nombreReal = $_FILES['archivo']['name'];
    $nombreTemporal = $_FILES['archivo']['tmp_name'];
}

$esArchivo = ($tipo == "url" )?false:true; 

$db = dameConexion();

if(!$db){die ("Error al conectarse a la base de datos.");}

//Conseguimos el idTema de la tutoria.
$query = sprintf("select idTema from Tutorias where idTutoria = %d;", $idTutoria);

$result = $db -> query($query);
if($result && $row = $result -> fetch_assoc()){
    $idTema = $row['idTema'];
}


$query = "";

switch($crp){
    case ("chat"):
        
        $directorio = "../../archivosSubidos/chat/". $idTutoria . "/" . $idUsuario . "/";		
        $url = $directorio . $nombreReal;
        
        if(!file_exists($directorio)){
            mkdir($directorio,0777,true);
        }
        
        if (move_uploaded_file($nombreTemporal, $directorio . $nombreReal)){
            echo '<span id="info"';
            echo ' value="' .$url .'">';
            echo '</span>';
            echo $url;
        }else{
            echo "<p>Error al mover el archivo.</p>";
            echo "de " . $nombreTemporal . " a " . $directorio;
			exit();
        }
        echo "Archivo subido con exito. Cerrando...";
        break;
    case ("recursos"):
        
        if($esArchivo){
            
            $directorio = "../../archivosSubidos/recursos/". $idTema . "/";
            $url = $directorio . $nombreReal;
            
            $query = sprintf('insert into Recursos values(%d,"%s","%s","%s")', 
                    $idTema, $url,$descripcion ,$hint);
            
            if (!$db -> query($query)){
                echo "Error en al insertar.<br>";
                echo $query . "<br>";
                echo $db -> error;
                exit();
                
            }
            
            if(!file_exists($directorio)){
                mkdir($directorio,0777,true);
            }
            
            if (move_uploaded_file($nombreTemporal, $directorio . $nombreReal)){
                echo '<span id="info"';
                echo ' value="' . $url . '">';
                echo '</span>';
            }else{
                echo "<p>Error al mover el archivo.</p>";
                echo "de " . $nombreTemporal . " a " . $tmp;
                exit();
            }
        }else{
            
            $url = (strpos($nombreReal,"http://") !== FALSE)? $nombreReal: "http://" . $nombreReal;
            
            $query = sprintf('insert into Recursos values(%d,"%s","%s","%s")', 
                    $idTema, $url,$descripcion ,$hint);
            
            if (!$db -> query($query)){
                echo "Error en al insertar.<br>";
                echo $query . "<br>";
                echo $db -> error;
                exit();
            }
            
            echo '<span id="info"';
            echo ' value="' . $url . '"';
            echo '</span>';
        }
        echo "Archivo subido con exito. Cerrando...";
        break;
    case ("productos"):       
		
		$nombreDelProducto = dameNombreDelProducto($_POST['idBoton'],$db);
		$extension = dameExtension($nombreReal);
        $directorio = "../../archivosSubidos/productos/". $idTutoria . "/";
        $url = $directorio . $nombreDelProducto . $extension;
        $query = sprintf('insert into Productos values(%d,"%s","%s","%s")', 
                    $idTutoria, $url , $descripcion ,$hint );
		
        
        if (!$db -> query($query)){
            echo "Error en al insertar.<br>";
            echo $query . "<br>";
            echo $db -> error;
            exit();
        }
        
        if(!file_exists($directorio)){
            mkdir($directorio,0777,true);
        }
        
        if (move_uploaded_file($nombreTemporal, $url)){
            echo '<span id="info"';
            echo ' value="' . $url . '"';
            echo '</span>';
        }else{
            echo "<p>Error al mover el archivo.</p>";
            echo "de " . $nombreTemporal . " a " . $url;
            exit();
        }
        echo "Archivo subido con exito. Cerrando...";
        break;       
}
?>
      
  </body>
</html>

