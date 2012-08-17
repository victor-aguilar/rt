<?php
session_start();
header('Content-Type: text/html; charset=UTF-8');
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
    <meta http-equiv="cache-control" content="no-cahce"/>
    <link rel="StyleSheet" href="lib/css/estilos.css" type="text/css"/>
    <link rel="StyleSheet" href="../../lib/css/esviap.css" type="text/css"/>
    
    <script type="text/javascript" src="../../lib/js/jquery.js"></script>
    <script type="text/javascript" src="../../lib/js/funciones.js"></script>
    <script type="text/javascript" src="../../lib/js/modernizr.js"></script>
    <script type="text/javascript" src="lib/js/chat.js"></script>
    <script tupe="text/javascript" src="../demostracion/lib/js/demostraciones.js"></script>

  </head>
  <body>
	 <?php include "../../lib/php/encabezado.php" ?>
    <button name="home" onclick="window.location='../../modulos/loged/loged.php'">
		<img src="../../lib/img/escritorio.png"/>HOME</button>
    <div>
        <div id="chat">
			<div id="audio"></div>
            <div id="ventanaDeConversacion"></div>
            <div id="controles">
                <input type="button" value="Enviar Archivo" id="enviarArchivo"/>
                <div style="clear:both"></div>
                <textarea id="mensaje" cols="40" rows="5" maxlength="255"></textarea>
                <div style="clear:both"></div>
                <label id="caracteresRestantes" >255</label>
                <input type="button" value="enviar" id="enviarMensaje"/>
                
                <?php 
                if($_GET['tipoDeUsuario'] == 'tutor'){ 
                    echo '<input type="button"id="siguienteEtapa" value="Cambiar a la Siguiente Etapa"/>';
                }
                ?>
                
            </div>
        </div>
      
      <?php 
      
      $tipoDeUsuario = $_GET['tipoDeUsuario'];
      
      switch ( $tipoDeUsuario){
      case ("tutor"):
          ?>
        
<div id="recursos"> 
    <h3>Lista de Recursos</h3> 
    <div id="listaDeRecursos"></div>
    <div id="subirRecurso">Subir Nuevo Archivo</div>
    <div style="clear:left"></div>
</div>
          
<div id="productos">
    
    <h3>Productos</h3>
    
    <div id="listaDeProductos"></div>
    
    <div id="subirProductos">
    <input type="button" name="producto" value="Registro De Tutoria"/>
    </div>
</div>
        
          <?php
          break;
      case ("moderador"): // Es el tutor en etapa de demostracion
          printf("<div id=%s> </div>", "listaDePendientes");
//          printf("<div> <input type=%s name=%s value='Comenzar Demostracion'></div>", 
//                  "button","botonDescargaPendientes");
//          printf("<div> <input type=%s name=%s value='Termina Demostracion'></div>", 
//                  "button","botonAcabaDemostracion");
          break;
      case ("alumno"):?>
        
<div id="productos">
        <h3>Productos</h3>

    <div id="listaDeProductos"></div>
    
    <div id="subirProductos">
        <input type="button" name="producto" value="Registro De Proceso De Estudio"/>
        <input type="button" name="producto" value="Guion De Tutoria"/>
        <input type="button" name="producto" value="Demostracion Publica"/>
    </div>
</div>
        
          <?php
          break;
          case ("sinodal"):
              printf("<div id=%s> </div>", "listaDePendientes");
              break;
      }
      ?>
      
      <div id="m"></div>

    </div>
	 <div style="clear:both"></div>
	 <?php include "../../lib/php/pieDePagina.php" ?>
  </body>
</html>