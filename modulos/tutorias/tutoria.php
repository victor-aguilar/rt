<?php
session_start();
header('Content-Type: text/html; charset=UTF-8');
include "../../configuracion.php";
include "../../lib/php/queries.php";
administraSesion();

$db = dameConexion();
$nombreDelTema = dameNombreDelTemaDeLaTutoria($_GET['idTutoria'],$db);

switch($_GET['tipoDeUsuario']){
	case ("alumno"):
		$nombreDelOtro = dameNombreDelTutorDeLaTutoria($_GET['idTutoria'],$db);
		$otros = "Tutor: " . $nombreDelOtro;
		break;
	case("demostrador"):
		$nombreDelOtro = dameNombreDelTutorDeLaTutoria($_GET['idTutoria'],$db);
		$otros = "Moderador: " . $nombreDelOtro;
		break;
	case("tutor"):
		$nombreDelOtro = dameNombreDelEstudiante($_GET['idTutoria'],$db);
		$otros = "Tutorado: " .$nombreDelOtro;
		break;
	case("moderador"):
		$nombreDelOtro = dameNombreDelEstudiante($_GET['idTutoria'],$db);
		$otros = "Demostrador: " .$nombreDelOtro;
		break;
	default:
		$otros = "Observador/Sinodal";
}
?>
<!DOCTYPE html>
<html>
  <head>
    <title>Tutorias:
    
<?php 
    echo $_GET['tipoDeUsuario'];
?>
    
    </title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <link rel="StyleSheet" href="lib/css/estilos.css" type="text/css"/>
	<link rel="StyleSheet" href="lib/css/chat.css" type="text/css"/>
    <link rel="StyleSheet" href="../../lib/css/esviap.css" type="text/css"/>
    
    <script type="text/javascript" src="../../lib/js/jquery.js"></script>
    <script type="text/javascript" src="../../lib/js/funciones.js"></script>
    <script type="text/javascript" src="../../lib/js/modernizr.js"></script>
    <script type="text/javascript" src="lib/js/chat.js"></script>

  </head>
  <body>
	 <?php include "../../lib/php/encabezado.php" ?>
	 <?php include "../../lib/php/menu.php"?>
    <div>
        
			<h3> Tema: <?php echo $nombreDelTema ?></h3>
			<h3> <?php echo ucfirst($_GET['tipoDeUsuario']) . ": " .$_SESSION['nombre'] . "," . $otros; ?></h3>
			<h3>Etapa: <span id="etapa"></span></h3>
		<div id="chat">
			<div id="sonido"></div>
            <div id="ventanaDeConversacion"></div>
            <div id="controles">
                <input type="button" value="Enviar Archivo" id="enviarArchivo"/>
                <div style="clear:both"></div>
                <textarea id="mensaje" rows="5" maxlength="255"></textarea>
                <div style="clear:both"></div>
                <label id="caracteresRestantes" >255</label>
                <button id="enviarMensaje">Enviar</button>
				
				<img class="boton" 
					 src="../../lib/img/sonidoOn.png" 
					 alt="Sonido: On"
					 title="Enciende o Apaga el sonido"
					 id="sonidoOnOff"
					 value="on"/>
                
                <?php 
                if($_GET['tipoDeUsuario'] == 'tutor'){ 
                    include 'lib/php/botonesDeTutor.php';
                }
                ?>
                
            </div>
        </div>
      
      <?php 
      
      $tipoDeUsuario = $_GET['tipoDeUsuario'];
      
      switch ( $tipoDeUsuario){
      case ("tutor"):
          ?>
			<div class="columna">        
			<div id="recursos"> 
				<h3>Recursos</h3> 
				<div id="listaDeRecursos"></div>
				<br>
				<button id="subirRecurso">Subir Recurso</button>
			</div>
			
			<div style="clear:both;"></div>
			
			<div id="productos">
				<h3>Productos</h3>
				<div id="listaDeProductos"></div>
				<br>
				<div id="subirProductos">
				<button value="4">Subir Registro de Tutoria</button>
				</div>
			</div>
			</div>
			
			<div style="clear:both;"></div>
			<div id="temaCaptura">
				<input class="bordeNegro" 
					   type="text" 
					   value="" 
					   placeholder="Nombre del Tema"/>
				<button>Guardar </button>
			</div>
        
          <?php
          break;
      case ("moderador"): // Es el tutor en etapa de demostracion
		  echo '<div class="columna">';
		  echo '<div id="pendientes">';
		  echo '<h3>Pendientes </h3>';
          echo '<div id="listaDePendientes"></div>';
		  echo '<div style="clear:left"></div>';
		  echo '<button id="aprobar"><img src="../../lib/img/ok.png"> Aprobar</button>';
		  echo '</div>';
		  echo '</div>';
          break;
      case ("alumno"):?>
        
			<div class="columna">
			<div id="productos">
				<h3>Productos</h3>
					<div id="listaDeProductos"></div>
					<div id="subirProductos">
						<button value="1">Subir Registro de Proceso de Estudio</button>
						<button value="2">Subir Guion de Tutoria</button>
						<button value="3">Subir Demostracion Publica</button>
					</div>
			</div>
			</div>
          <?php
          break;
	  case ("sinodal"):
			break;
      }
      ?>
      
      <div id="m"></div>

    </div>
	 <div style="clear:both"></div>
	 <?php include "../../lib/php/pieDePagina.php" ?>
  </body>
</html>