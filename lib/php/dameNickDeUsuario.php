<?php
session_start();
header('Content-Type: text/html; charset=UTF-8');

echo $_SESSION['nick'];

?>