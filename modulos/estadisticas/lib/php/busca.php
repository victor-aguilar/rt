<?php 

include '../../../../configuracion.php';
header('Content-Type: text/xml; charset=UTF-8');

    $db = dameConexion();

    if($db->connect_errno){
    printf($db->connect_error);
    exit();
    }       

    switch ($_POST['accion']){
        case 'tema':
            $busca=  sprintf('SELECT 
                                    T.idTema AS idTema,
                                    T.nombre AS tema,
                                    U.idUsuario AS idTutor,
                                    U.nick AS tutor,
                                    ET.idEstandar,
                                    E.descripcion AS estandar,
                                    A.idAsignatura,
                                    A.nombre AS asignatura,
                                    P.idPeriodo,
                                    P.nombre AS periodo,
                                    Eje.idComponenteEjeCategoria AS idEje,
                                    Eje.nombre AS eje
                                FROM
                                    Temas AS T,
                                    Usuarios AS U,
                                    EstandaresDeTema AS ET,
                                    Estandares AS E,
                                    Asignaturas AS A,
                                    Periodos AS P,
                                    ComponenteEjeCategoria AS Eje

                                WHERE
                                    T.idUsuario = U.idUsuario 
                                AND 
                                    T.idTema = ET.idTema 
                                AND 
                                    E.idEstandar = ET.idEstandar
                                AND 
                                    A.idAsignatura = E.idAsignatura
                                AND 
                                    E.idPeriodo = P.idPeriodo
                                AND
                                    Eje.idComponenteEjeCategoria = E.idComponenteEjeCategoria
                                AND 
                                    T.idTema=%d
                                GROUP BY
                                    idEstandar;
                                    ', $_POST['id']);
            break;
        case 'usuario':
            $busca=  sprintf('SELECT 
                                    U.idUsuario,
                                    U.nick,
                                    U.nombre,
                                    U.apellidos,
                                    U.sexo,
                                    U.email,
                                    U.telefono,
                                    U.cct,
                                    E.nombre AS entidad,
                                    Mun.nombre AS municipio,
                                    L.nombre AS localidad,
                                    Nod.nombre AS nodo,
                                    T.nombre AS turno,
                                    Niv.nombre AS nivel,
                                    Moda.nombre AS modalidad
                                FROM
                                    Usuarios AS U,
                                    Entidades AS E,
                                    Municipios AS Mun,
                                    Localidades AS L,
                                    Nodos AS Nod,
                                    Turno AS T,
                                    Nivel AS Niv,
                                    Modalidad AS Moda
                                WHERE
                                    U.idEntidad = E.idEntidad 
                                    AND U.idMunicipio = Mun.idMunicipios 
                                    AND U.idLocalidad = L.idLocalidad 
                                    AND U.idNodo = Nod.idNodo 
                                    AND U.idTurno = T.idTurno 
                                    AND U.idNivel = Niv.idNivel 
                                    AND U.idModalidad = Moda.idModalidad
                                    AND U.nick="%s";
                                ', $_POST['id']);
            break;
        
}
/*Para temas
 * 
 * 
 */
$result = $db->query($busca);

$xml ='<busqueda>';
$xml.='<query>'.$busca.'</query>';
$xml .='<tipo>'.$_POST['accion'].'</tipo>';
switch ($_POST['accion']){
    case 'tema':
        while ($result && $fila = $result->fetch_assoc()){
            $xml.='<tema';
            $xml.=' idTema="'.$fila['idTema'].'"';
            $xml.=' tema="'.$fila['tema'].'"';
            $xml.=' idTutor="'.$fila['idTutor'].'"';
            $xml.=' tutor="'.$fila['tutor'].'"';
            $xml.=' idEstandar="'.$fila['idEstandar'].'"';
            $xml.=' estandar="'.$fila['estandar'].'"';
            $xml.=' idAsignatura="'.$fila['idAsignatura'].'"';
            $xml.=' asignatura="'.$fila['asignatura'].'"';
            $xml.=' idPeriodo="'.$fila['idPeriodo'].'"';
            $xml.=' periodo="'.$fila['periodo'].'"';
            $xml.=' idEje="'.$fila['idEje'].'"';
            $xml.=' eje="'.$fila['eje'].'"';
            $xml.='>';
            $xml.='</tema>';
        }
        break;
    case 'usuario':
        $fila = $result->fetch_assoc();
        $xml.='<usuario';
        $xml.=' idUsuario="'.$fila['idUsuario'].'"';
        $xml.=' nick="'.$fila['nick'].'"';
        $xml.=' nombre="'.$fila['nombre'].'"';
        $xml.=' apellidos="'.$fila['apellidos'].'"';
        $xml.=' sexo="'.$fila['sexo'].'"';
        $xml.=' email="'.$fila['email'].'"';
        $xml.=' telefono="'.$fila['telefono'].'"';
        $xml.=' cct="'.$fila['cct'].'"';
        $xml.=' entidad="'.$fila['entidad'].'"';
        $xml.=' municipio="'.$fila['municipio'].'"';
        $xml.=' localidad="'.$fila['localidad'].'"';
        $xml.=' nodo="'.$fila['nodo'].'"';
        $xml.=' turno="'.$fila['turno'].'"';
        $xml.=' nivel="'.$fila['nivel'].'"';
        $xml.=' modalidad="'.$fila['modalidad'].'"';
        $xml.='>';
        $xml.='</usuario>';
}
$xml .= '</busqueda>';
print $xml;
$db->close();
?>