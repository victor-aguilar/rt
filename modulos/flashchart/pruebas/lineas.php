<?php
header('Content-Type: text/html; charset=UTF-8');
include_once '../php-ofc-library/open-flash-chart.php';
include '../../../configuracion.php';

$die = false;
$link = @mysql_connect($h, $u, $p) or ($die = true);
if($die)
{
    echo '<h3>Database connection error!!!</h3>';
    echo 'A connection to the Database could not be established.<br />';
    echo 'Please check your username, password,database name and host.<br />';
    echo 'Also make sure <i>mysql.class.php</i> is rightly configured!<br /><br />';
}
mysql_select_db($b);
$query = mysql_query('SELECT 
                            Temas.nombre AS tema,
                            COUNT(DISTINCT idEstandar) AS estandares,
                            tu.cuant AS tutorias
                        FROM
                            EstandaresDeTema,
                            Temas,
                            ((SELECT 
                                idTema, COUNT(DISTINCT idTutoria) AS cuant
                            FROM
                                Tutorias
                            GROUP BY idTema) AS tu)
                        WHERE
                            Temas.idTema = EstandaresDeTema.idTema and tu.idTema = EstandaresDeTema.idTema
                        GROUP BY tu.idTema;');
While($queryRow = mysql_fetch_array($query,MYSQL_ASSOC))
{
    $labels[] = $queryRow['tema'];
    $data_1[] = intval($queryRow['estandares']);
    $data_2[] = intval($queryRow['tutorias']);  
}

$default_dot = new dot();
$default_dot->size(5)->colour('#DFC329');

$line_dot = new line();
$line_dot->set_default_dot_style($default_dot);
$line_dot->set_width( 4 );
$line_dot->set_colour( '#DFC329' );
$line_dot->set_values( $data_1 );
$line_dot->set_key( "Students Appearing", 10 );

$default_hollow_dot = new hollow_dot();
$default_hollow_dot->size(5)->colour('#6363AC');
 
$line_hollow = new line();
$line_hollow->set_default_dot_style($default_hollow_dot);
$line_hollow->set_width( 1 );
$line_hollow->set_colour( '#6363AC' );
$line_hollow->set_values( $data_2 );
$line_hollow->set_key( "Students Getting First Class", 10 );
 
$y = new y_axis();
$y->set_range( 0, 100, 10 );
 
$x_label = new x_axis_labels();
$x_label->set_labels($labels);
 
$x = new x_axis();
$x->set_labels($x_label);
 
$chart = new open_flash_chart();
$chart->set_title( new title( 'Line Charts Example' ) );
$chart->set_y_axis( $y );
$chart->set_x_axis( $x );
//
// here we add our data sets to the chart:
//
$chart->add_element( $line_dot );
$chart->add_element( $line_hollow );
 
echo $chart->toPrettyString();
?>