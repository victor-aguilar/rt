<?php 
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

$idTutoria  = $_POST['idTutoria'];
$url        = "";
$idTema     = "";
$hint       = $_POST['hint'];
$descripcion = $_POST['descripcion'];
$idUsuario = $_POST['idUsuario'];


$tipo       = $_POST['tipo'];
$crp        = $_POST['crp']; // = recursos|chat|productos

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
        
        $directorio = "chat/". $idTutoria . "/" . $idUsuario . "/";
        $tmp = DIRECTORIO_BASE . $directorio;
        $url = $directorio . $nombreReal;
        
        if(!file_exists($tmp)){
            mkdir($tmp,0777,true);
        }
        
        $tmp .= $nombreReal;
        if (move_uploaded_file($nombreTemporal, $tmp)){
            echo '<span id="info"';
            echo ' value="' .$url .'">';
            echo '</span>';
        }else{
            echo "<p>Error al mover el archivo.</p>";
            echo "de " . $nombreTemporal . " a " . $tmp;
        }
        echo "Archivo subido con exito. Cerrando...";
        break;
    case ("recursos"):
        
        if($esArchivo){
            
            $directorio = "recursos/". $idTema . "/";
            $tmp = DIRECTORIO_BASE . $directorio;
            $url = $directorio . $nombreReal;
            
            $query = sprintf("insert into recursos values(%d,%s,%s,%s)", 
                    $idTema, '"' . $url . '"','"' . $descripcion .'"','"' .$hint . '"');
            
            if (!$db -> query($query)){
                echo "Error en al insertar.<br>";
                echo $query . "<br>";
                echo $db -> error;
                exit();
                
            }
            
            if(!file_exists($tmp)){
                mkdir($tmp,0777,true);
            }
            
            $tmp .= $nombreReal;
            
            if (move_uploaded_file($nombreTemporal, $tmp)){
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
            
            $query = sprintf("insert into recursos values(%d,%s,%s,%s)", 
                    $idTema, '"' . $url . '"','"' . $descripcion .'"','"' .$hint . '"');
            
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
        
        $directorio = "productos/". $idTutoria . "/";
        $tmp = DIRECTORIO_BASE . $directorio;
        $url = $directorio . $nombreReal;
        $query = sprintf("insert into productos values(%d,%s,%s,%s)", 
                    $idTutoria, '"' . $url . '"','"' . $descripcion .'"','"' .$hint . '"');
        
        if (!$db -> query($query)){
            echo "Error en al insertar.<br>";
            echo $query . "<br>";
            echo $db -> error;
            exit();
        }
        
        if(!file_exists($tmp)){
            mkdir($tmp,0777,true);
        }

        $tmp .= $nombreReal;
        
        if (move_uploaded_file($nombreTemporal, $tmp)){
            echo '<span id="info"';
            echo ' value="' . $url . '"';
            echo '</span>';
        }else{
            echo "<p>Error al mover el archivo.</p>";
            echo "de " . $nombreTemporal . " a " . $tmp;
            return false;
        }
        echo "Archivo subido con exito. Cerrando...";
        break;       
}
?>
      
  </body>
</html>

