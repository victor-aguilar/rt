<?php
session_start();
header('Content-Type: text/html; charset=UTF-8');
function asigna($dato){
	if(isset($_POST[$dato]))
	{	$_SESSION[$dato]=$_POST[$dato];}
	else
	{	$_SESSION[$dato]="";}
}
asigna('nombre');
asigna('apellidos');
asigna('sexo');
//var_dump($_SESSION);
?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/rt_/modulos/registro/templates/template1.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Documento sin t&iacute;tulo</title>
<link rel="stylesheet" type="text/css" href="../css/esviap.css" />
<!-- InstanceParam name="id" type="text" value="center" -->
<link href="../../lib/css/esviap.css" rel="stylesheet" type="text/css" />
</head>

<body>
<p align="center"><img src="../../lib/img/eimle.png" width="768" height="128" alt="logo ESVIAP" /></p>
<div id="up">
</div>
<!-- InstanceBeginEditable name="Region1" -->
<div id="center">
  <div class="anuncio" >Alta de usuario</div>
  <div class="anuncio" style=" width:400px; height:246px; padding-top:100px; text-align:justify">
    <form action="ingreso3.php" 
          method="POST" 
          name="form" 
          id="form" 
          onsubmit="MM_validateForm('email','','RisEmail');return document.MM_returnValue">
      <p>Para poder estar en contacto contigo  ingresa los siguientes datos:</p>
<table align="center" >
        <tr>
          <td colspan="2" align="center"><h4>Ingresa tus datos</h4></td>
        </tr>
          <tr valign="baseline">
            <td nowrap="nowrap" align="right">Email:</td>
            <td><input name="email" type="text" id="email" value="" size="32" /></td>
          </tr>
          <tr valign="baseline">
            <td nowrap="nowrap" align="right">Tel&eacute;fono:</td>
            <td><input type="text" name="telefono" value="" size="32" /></td>
          </tr>

        <tr valign="baseline">
          <td nowrap="nowrap" align="right">&nbsp;</td>
          <td><input type="submit" onclick="MM_validateForm('email','','RisEmail');return document.MM_returnValue" value="Continuar" /></td>
        </tr>
      </table>
    </form>
    <p>&nbsp;</p>
<p>&nbsp;</p>
  </div>
  <div class="anuncio" style="background:#E3E8EE; height:3px; visibility:hidden" >continuar <a href="ingreso_1.php"><img src="../img/next.png" width="63" height="57" alt="alta de usuario" align="absmiddle"/></a></div>
</div>
<!-- InstanceEndEditable -->
<div id="footer" >
<br />
<?php include "../../lib/php/pieDePagina.php" ?>
</div>

</body>
<!-- InstanceEnd --></html>
