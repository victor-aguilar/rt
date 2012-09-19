//$(document).ready(function(){
//    $('#nombre').click(function(){
//        var id =$(this).siblings('#id').html();
//        var accion=$(this).attr('accion');
//        busca(id,accion)
//    })
//})

function busca(event){
    var id;
    var accion=event.target.getAttribute('accion');
    switch(accion){
        case 'tema':
            id = event.target.parentNode.firstChild.innerHTML;
            break;
        case 'usuario':
            id = event.target.innerHTML;
            break;
    }
    $.ajax({
        type:"POST",
        url:"lib/php/busca.php",
        data:{
            id: id,
            accion: accion
        },
        dataType: "xml",
        success: escribe
    });
}

function escribe (xml){
    var dato;
    dato = '<tr>';

    $(xml).find("tipo").each(function(){
        switch($(this).text()){
            case 'tema':
                dato+= '<td>';
                dato+= 'ID TEMA';
                dato+= '</td>';
                dato+= '<td>';
                dato+= 'TEMA';
                dato+= '</td>';
                dato+= '<td>';
                dato+= 'ID TUTOR';
                dato+= '</td>';
                dato+= '<td>';
                dato+= 'TUTOR';
                dato+= '</td>';
                dato+= '<td>';
                dato+= 'ID ESTANDAR';
                dato+= '</td>';
                dato+= '<td>';
                dato+= 'ESTANDAR';
                dato+= '</td>';
                dato+= '<td>';
                dato+= 'ID ASIGNATURA';
                dato+= '</td>';
                dato+= '<td>';
                dato+= 'ASIGNATURA';
                dato+= '</td>';
                dato+= '<td>';
                dato+= 'ID PERIODO';
                dato+= '</td>';
                dato+= '<td>';
                dato+= 'PERIODO';
                dato+= '</td>';
                dato+= '<td>';
                dato+= 'ID COMPONENTE EJE CATEGORIA';
                dato+= '</td>';
                dato+= '<td>';
                dato+= 'COMPONENTE EJE CATEGORIA';
                dato+= '</td>';
                dato+= '</tr>';
                $(xml).find('tema').each(function(){
                    dato +='<tr>';
                    dato+= '<td>';
                    dato+= $(this).attr('idTema');
                    dato+= '</td>';
                    dato+= '<td>';
                    dato+= $(this).attr('tema');
                    dato+= '</td>';
                    dato+= '<td>';
                    dato+= $(this).attr('idTutor');
                    dato+= '</td>';
                    dato+= '<td>';
                    dato+= $(this).attr('tutor');
                    dato+= '</td>';
                    dato+= '<td>';
                    dato+= $(this).attr('idEstandar');
                    dato+= '</td>';
                    dato+= '<td>';
                    dato+= $(this).attr('estandar');
                    dato+= '</td>';
                    dato+= '<td>';
                    dato+= $(this).attr('idAsignatura');
                    dato+= '</td>';
                    dato+= '<td>';
                    dato+= $(this).attr('asignatura');
                    dato+= '</td>';
                    dato+= '<td>';
                    dato+= $(this).attr('idPeriodo');
                    dato+= '</td>';
                    dato+= '<td>';
                    dato+= $(this).attr('periodo');
                    dato+= '</td>';
                    dato+= '<td>';
                    dato+= $(this).attr('idEje');
                    dato+= '</td>';
                    dato+= '<td>';
                    dato+= $(this).attr('eje');
                    dato+= '</td>';
                })
                break;
            case 'usuario':
                dato+= '<td>';
                dato+= 'ID';
                dato+= '</td>';
                dato+= '<td>';
                dato+= 'NICK';
                dato+= '</td>';
                dato+= '<td>';
                dato+= 'NOMBRE';
                dato+= '</td>';
                dato+= '<td>';
                dato+= 'APELLIDOS';
                dato+= '</td>';
                dato+= '<td>';
                dato+= 'SEXO';
                dato+= '</td>';
                dato+= '<td>';
                dato+= 'EMAIL';
                dato+= '</td>';
                dato+= '<td>';
                dato+= 'TELEFONO';
                dato+= '</td>';
                dato+= '<td>';
                dato+= 'CCT';
                dato+= '</td>';
                dato+= '<td>';
                dato+= 'ENTIDAD';
                dato+= '</td>';
                dato+= '<td>';
                dato+= 'MUNICIPIO';
                dato+= '</td>';
                dato+= '<td>';
                dato+= 'LOCALIDAD';
                dato+= '</td>';
                dato+= '<td>';
                dato+= 'NODO';
                dato+= '</td>';
                dato+= '<td>';
                dato+= 'TURNO';
                dato+= '</td>';
                dato+= '<td>';
                dato+= 'NIVEL';
                dato+= '</td>';
                dato+= '<td>';
                dato+= 'MODALIDAD';
                dato+= '</td>';
                $(xml).find('usuario').each(function(){
                    dato +='<tr>';
                    dato+= '<td>';
                    dato+= $(this).attr('idUsuario');
                    dato+= '</td>';
                    dato+= '<td>';
                    dato+= $(this).attr('nick');
                    dato+= '</td>';
                    dato+= '<td>';
                    dato+= $(this).attr('nombre');
                    dato+= '</td>';
                    dato+= '<td>';
                    dato+= $(this).attr('apellidos');
                    dato+= '</td>';
                    dato+= '<td>';
                    dato+= $(this).attr('sexo');
                    dato+= '</td>';
                    dato+= '<td>';
                    dato+= $(this).attr('email');
                    dato+= '</td>';
                    dato+= '<td>';
                    dato+= $(this).attr('telefono');
                    dato+= '</td>';
                    dato+= '<td>';
                    dato+= $(this).attr('cct');
                    dato+= '</td>';
                    dato+= '<td>';
                    dato+= $(this).attr('entidad');
                    dato+= '</td>';
                    dato+= '<td>';
                    dato+= $(this).attr('municipio');
                    dato+= '</td>';
                    dato+= '<td>';
                    dato+= $(this).attr('localidad');
                    dato+= '</td>';
                    dato+= '<td>';
                    dato+= $(this).attr('nodo');
                    dato+= '</td>';
                    dato+= '<td>';
                    dato+= $(this).attr('turno');
                    dato+= '</td>';
                    dato+= '<td>';
                    dato+= $(this).attr('nivel');
                    dato+= '</td>';
                    dato+= '<td>';
                    dato+= $(this).attr('modalidad');
                    dato+= '</td>';
                })
        }
        dato+= '</tr>';

        $('#informaciones').html(dato);
    })
}