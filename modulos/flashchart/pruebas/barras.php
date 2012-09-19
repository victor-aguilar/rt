 <?php
header('Content-Type: text/html; charset=UTF-8');
include_once '../php-ofc-library/open-flash-chart.php';
include '../../../configuracion.php';

$die = false;
$link = @mysql_connect($h, $u, $p) or ($die = true);

mysql_select_db($b);
$query = mysql_query('select sexo, count(*) as cuantos from usuarios where sexo!= 3 group by sexo;');
$max=0;
While($queryRow = mysql_fetch_array($query, MYSQL_ASSOC))
{
    if( $queryRow['cuantos'] > $max){
        $max =$queryRow['cuantos']+10;
    }
    $dataForGraph[] = intval($queryRow['cuantos']);
    $XAxisLabel[] = $queryRow['sexo'];
}

$title = new title( 'Numero de Usuarios por Genero al: '.date(" d M Y"));
$title->set_style( '{color: #000000; font-size: 14px}' );
$chart = new open_flash_chart();
$chart->set_title( $title );
$x_axis_labels = new x_axis_labels();
$x_axis_labels->set_labels($XAxisLabel);
$y_axis = new y_axis();
$x_axis = new x_axis();
$y_axis->set_range( 0, $max, 10 );
$x_axis->set_labels ($x_axis_labels);
$chart->set_x_axis( $x_axis );
$chart->add_y_axis( $y_axis );
 
$bar = new bar_glass();
$bar->colour('#000000');
$bar->key('Numero de Usuarios', 12);
$bar->set_values($dataForGraph);
$chart->add_element($bar);
mysql_close($link);
echo $chart->toPrettyString();
?>