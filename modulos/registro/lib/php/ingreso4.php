<?php
session_start();
header('Content-Type: text/html; charset=UTF-8');

function asigna($dato){
	if(isset($_POST[$dato]))
	{	$_SESSION[$dato]=$_POST[$dato];}
	else
	{	$_SESSION[$dato]="null";}
}
asigna('idEntidad');
asigna('idNodo');
asigna('idNivel');
asigna('idModalidad');
//var_dump($_SESSION);
?>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml"><!-- InstanceBegin template="/Templates/template1.dwt" codeOutsideHTMLIsLocked="false" -->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Documento sin t&iacute;tulo</title>
<link rel="stylesheet" type="text/css" href="../css/esviap.css" />
<!-- InstanceParam name="id" type="text" value="center" -->
</head>

<body>
<p align="center"><img src="../img/esviap_logo.png" width="523" height="74" alt="logo ESVIAP" /></p>
<div id="up">
</div>
<!-- InstanceBeginEditable name="Region1" -->
<script language="JavaScript">
function validapwd(cad) {
	cad1=document.getElementById("C").value;
//	alert(cad.value);
//	alert(cad1);
	if (cad.value != cad1)
	{alert("las contrase�as deben ser iguales");}
}

function validaForm() { 
errors ='';
if (document.form.Nombre.value=="") 
{errors += 'Nombre es obligatorio,\n '; }

if (document.form.Apellidos.value=="") 
{errors += 'Apellidos es obligatorio,\n ';  }

thisOne = -1;
for (i=0; i<document.form.Sexo.length; i++) {
  if (document.form.Sexo[i].checked) {
	thisOne = i;
	whichOne = (thisOne+1);
	}
  }
if (thisOne == -1) {
errors += 'Sexo es obligatorio '; }

 if (errors==""){return true; }
  else {
	 errors = "Por favor corregir los siguientes errores:\n"+ errors;
	 alert (errors);
	 return false;
	 }
}



</script>

<div id="center">
  <div class="anuncio" style="background:#E3E8EE">Alta de usuario en el Espacio Virtual de Aprendizaje</div>
  <div class="anuncio" style=" width:400px; height:246px; padding-top:100px; text-align:justify">
    <form action="ingreso5.php" method="POST" name="form" id="form" onsubmit="return validaForm()">
      <p>Ingresa tus datos  laborales (Clave de Centro de Trabajo y el turno):</p>
<table align="center" >
        <tr>
          <td colspan="2" align="center"><h4>Ingresa tus datos</h4></td>
        </tr>
          <tr valign="baseline">
            <td nowrap="nowrap" align="right">CCT:</td>
            <td><input name="cct" type="text" id="cct" value="" size="10" maxlength="10" /></td>
          </tr>
          <tr valign="baseline">
            <td nowrap="nowrap" align="right">Turno:</td>
            <td>
              <select name="idTurno" id="turno">
                <option value='0'>Seleccione turno</option>
                <option value='1'>Matutino</option>
                <option value='2'>Vespertino</option>
                <option value='3'>Nocturno</option>
                <option value='4'>Discontinuo</option>
                <option value='5'>Mixto</option>              
              </select>
            </td>
          </tr>

        <tr valign="baseline">
          <td nowrap="nowrap" align="right">&nbsp;</td>
          <td><input type="submit" value="Continuar" /></td>
        </tr>
      </table>
    </form>
    <p>&nbsp;</p>
<p>&nbsp;</p>
  </div>
  <div class="anuncio" style="background:#E3E8EE; height:3px; visibility:hidden" >
      continuar <a href="ingreso_1.php">
          <img src="../img/next.png" width="63" height="57" alt="alta de usuario" align="absmiddle"/>
      </a>  </div>
</div>
<!-- InstanceEndEditable -->
<div id="footer" >
<p align="center" >
    Subsecretar&iacute;a de Educaci&oacute;n B&aacute;sica, 
    Viaducto R&iacute;o Piedad 507, 4o piso. Granjas M&eacute;xico, 
    Iztacalco 08400. M&eacute;xico D.F. </p>
</p>
</div>

</body>
<!-- InstanceEnd --></html>
