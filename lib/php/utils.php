<?php

define("UTF_8", 1);
define("ASCII", 2);
define("ISO_8859_1", 3);

/*
 * Regresa la fecha en el formato de mysql. Ejemplo, 2012-12-29 11:11:11,
 */
function getActualDate(){
    $fecha = new DateTime();
    $fecha->setTimezone(new DateTimeZone('America/Mexico_City'));
    $fecha = date("Y-m-d H:i:s");
    return $fecha;
}

function codificacion($texto){
      
    $c = 0;
    $ascii = true;
    
    for ($i = 0;$i<strlen($texto);$i++) {

        // Primer byte del i-esimo caracter del texto.
        $byte = ord($texto[$i]);
        
        if ($c>0) {
            if (($byte>>6) != 0x2) {
                return ISO_8859_1;
            } else {
                $c--;
            }
        } elseif ($byte&0x80) {

            $ascii = false;
            if (($byte>>5) == 0x6) {
                $c = 1;
            } elseif (($byte>>4) == 0xE) {
                $c = 2;
            } elseif (($byte>>3) == 0x1E) {
                $c = 3;
            } else {
                return ISO_8859_1;
            }
        }
    }

    return ($ascii) ? ASCII : UTF_8;
}

function utf8_encode_seguro($texto){
    return (codificacion($texto)==ISO_8859_1) ? utf8_encode($texto) : $texto;
}

function dameExtension($fileName){
	return "." .strrev(strstr(strrev($fileName),".",true));
}

/*
 * Log errors in error.log file.
 */
function logging($texto){
	echo $texto;
	$ddf = fopen('error.log','a');
	fwrite($ddf,"[".date("r")."] Error: $texto");
	fclose($ddf);
}
?>
