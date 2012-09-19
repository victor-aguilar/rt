 <?php

include_once '../php-ofc-library/open-flash-chart.php';
include '../../../configuracion.php';

$db = dameConexion();


$result = $db->query("select * from sourceforge_downloads order by date");

if (!$result) {
    die('Invalid query: ' . mysql_error());
}

$data = array();
$max = 0;
while($row = $result->fetch_assoc())
{
  $data[] = $row['downloads'];
}

print '<pre>';
print_r( $data );
print '</pre>';
$db->close();
?>