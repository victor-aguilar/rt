<?php
header('Content-Type: text/html; charset=UTF-8');

# FileName="Connection_php_mysql.htm"
# Type="MYSQL"
# HTTP="true"
$ubicacion="local";
//if ($ubicacion=="local"){
//	$database_esviap_conn = "esviap3";
//	$username_esviap_conn = "esviap";}
//	
//else {	
//	$database_esviap_conn = "mardebro_esviap3";
//	$username_esviap_conn = "mardebro_esviap";
//}
$hostname_esviap_conn = "localhost";
$password_esviap_conn = "r2d2";
$database_esviap_conn = "liceocom_tutorias";
$username_esviap_conn = "liceocom_rt";
$esviap_conn = mysql_pconnect($hostname_esviap_conn, $username_esviap_conn, $password_esviap_conn) or trigger_error(
mysql_error(),E_USER_ERROR); 
$database_conn=$database_esviap_conn;
$conn=$esviap_conn;
mysql_select_db($database_esviap_conn);
mysql_query("SET NAMES 'utf8'"); 
?>