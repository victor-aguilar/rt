<?php

header('Content-Type: text/html; charset=UTF-8');
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

$f = new SplFileObject("../lib/sql/tmp2.sql");

foreach($f as $l){
    //if (strlen($l) == 0 or strlen($l) == 1) return;
    //quitamos el ),
    $l = substr($l,0,strlen($l)-4);
    //quitamos el primer (
    $l = substr($l,1, strlen($l));
    $c = explode("'",$l);
    
    $id = substr($c[0],0, strlen($c[0])-1);
    $nick = "\"" .$c[1]."\"";
    $nombre= "\"" .$c[3]."\"";
    $apellidos ="\"" . $c[5]."\"";
    $sexo = "\"" .$c[7]."\"";
    
    $tmp = explode(",",$c[8]);
    
    $entidad = $tmp[1];
    $municipio = $tmp[2];
    $localidad = $tmp[3];
    
    $nodo = $c[9];
    $email = "\"\"";
    $telefono = "\"\"";
    
    $contraseña = "\"" .$c[13] ."\""; 
    $cct = "\"\"";
    $turno = 1;
    
    
    
    printf( '(%d,%s,%s,%s,%s,%s,%s,%s,%s,%d,%d,%d,%d,%d),<br>',
            $id,$nick,$nombre,$apellidos,$sexo,$email,"\"\"",$contraseña,"\"\"",
            $entidad, 0,0, $nodo,$turno);   
}

?>
