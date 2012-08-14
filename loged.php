<?php 
session_start();
header('Content-Type: text/html; charset=UTF-8');
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title></title>
<link rel="stylesheet" type="text/css" href="lib/css/esviap.css"></link>
<script type="text/javascript" src="lib/js/jquery.js"></script>
<script type="text/javascript" src="lib/js/funciones.js"></script>
<script type="text/javascript" src="modulos/notificaciones/lib/js/notificaciones.js"></script>
</head>

<body>
<p align="center"><img src="lib/img/esviap_logo.png" width="523" height="74" alt="logo ESVIAP" /></p>
<center><h3><?php echo $_SESSION['nick']; ?></h3></center>
<table height="800" align="center" width="700px">
  <tr>
    <td valign="top" align="justify">

	  <p>&nbsp;</p>
           
        <button id="botonMail" onclick="buscaNotificaciones()"><img src="lib/img/correo.jpg" /></button>

     
          <p><a href="modulos/misTutorias/tutoriasOTutorados.html">
                  Mis tutorias
              </a></p>
        <p><a href="modulos/solicitudDeTutorias/solicitudDeTutoria.html">Solicitud de Tutorías</a></p>
    <a href="alta_en_arbol/index.php?uid=<?php echo $_SESSION['IdUserNum']; ?>">Mis temas de cat&aacute;logo</a>    <tr><td valign="top" height="20">
<p align="center" class="azul1" >
Subsecretar&iacute;a de Educaci&oacute;n B&aacute;sica, Viaducto R&iacute;o Piedad 507, 4o piso. Granjas M&eacute;xico, Iztacalco 08400. M&eacute;xico D.F.
</p>
</td></tr></table>
</body>
</html>
