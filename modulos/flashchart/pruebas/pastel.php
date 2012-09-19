<?php

header('Content-Type: text/html; charset=UTF-8');
include_once '../php-ofc-library/open-flash-chart.php';
include '../../../configuracion.php';

$die = false;
$link = @mysql_connect($h, $u, $p) or ($die = true);

mysql_select_db($b);
$query = mysql_query('select sexo, count(*) as cuantos from usuarios where sexo != 3 group by sexo;');
While ($queryRow = mysql_fetch_array($query, MYSQL_ASSOC)) {
    $label[] = $queryRow['sexo'];
    $dataForGraph[] = intval($queryRow['cuantos']);
}
$title = new title('The grades distribution : ' . date("D M d Y") . ' are');
$title->set_style('{color: #567300; font-size: 14px}');
$chart = new open_flash_chart();
$chart->set_title($title);

$pie = new pie();
$pie->set_alpha(0.6);
$pie->set_start_angle(35);
$pie->add_animation(new pie_fade());
$pie->set_tooltip('#val# of #total#<br>#percent# of total strength');
$pie->set_colours(array('#1C9E05', '#FF368D', '#1A3453', '#1A3789'));
$pie->set_values(array(
    new pie_value($dataForGraph[0], $label[0]),
    new pie_value($dataForGraph[1], $label[1]),
    ));

$chart->add_element($pie);
echo $chart->toPrettyString();
?>