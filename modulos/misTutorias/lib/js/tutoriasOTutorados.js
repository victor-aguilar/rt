var idUsuario = 0;
var ruta="../tutorias/tutoria.php"

$(document).ready(function(){
	
	idUsuario = dameIdUsuario();

	buscaTutorias();
	buscaTutorados();
	buscaDondeSoySinodal();
});


function buscaTutorias(){
    $.ajax({
        type:       "POST",
        url:        "lib/php/buscaTutorias.php",
        data:{
                    idUsuario:idUsuario
        },
        dataType:   "xml",
        success:    escribeTutorias,
        error:      error
    })
}

function buscaTutorados(){
    $.ajax({
        type:       "POST",
        url:        "lib/php/buscaTutorados.php",
        data:{
                    idUsuario:idUsuario
        },
        dataType:   "xml",
        success:    escribeTutorados,
        error:      error
    })
}

function buscaDondeSoySinodal(){
        $.ajax({
        type:       "POST",
        url:        "lib/php/buscaDondeSoySinodal.php",
        data:{
                    idUsuario:idUsuario
        },
        dataType:   "xml",
        success:    escribeDondeSoySinodal,
        error:      error
    })
}

function escribeTutorias(xml){
    $(xml).find("tutoria").each(function(){
    var tutorias = $('#tutorias');
    var mensajeAnterior = tutorias.html(); // tutorias anteriores
    var tutor=$(this).attr("tutor");
    var idTutoria=$(this).attr("idtutoria");
    var nombre=$(this).text();//nombre de la tutoria
    var mensajeNuevo = "Recibiendo tutoria: <br/><a href="+ruta+"?idUsuario="+idUsuario+
                       "&idTutoria="+idTutoria+"&tipoDeUsuario=alumno><br>"+
                       nombre+"</a> <br/><span id=titulo>Tutor:</span>"+tutor+"<br><br><br>";//mensajesNuevos
    
    tutorias.html(mensajeAnterior + mensajeNuevo);
    autoScroll("tutorias");
    });
        
}

function escribeTutorados(xml){
    $(xml).find("tutoria").each(function(){
    var tutorados = $('#tutorados');
    var mensajeAnterior = tutorados.html(); // tutorias anteriores
    var alumno=$(this).attr("tutorado");
    var idTutoria=$(this).attr("idtutoria");
    var nombre=$(this).text();//nombre de la tutoria
    var mensajeNuevo = "Tutorando: <br/><a href="+ruta+"?idUsuario="+idUsuario+
                       "&idTutoria="+idTutoria+"&tipoDeUsuario=tutor><br>"+
                       nombre+"</a> <br/><span id=titulo>Alumno:</span>"+alumno+"<br><br><br>";//mensajesNuevos
    
    tutorados.html(mensajeAnterior + mensajeNuevo);
    autoScroll("tutorados");
    });
        
}


function escribeDondeSoySinodal(xml){
    $(xml).find("tutoria").each(function(){
    var tutorados = $('#sinodales');
    var mensajeAnterior = tutorados.html(); // tutorias anteriores
    var alumno=$(this).attr("tutorado");
    var idTutoria=$(this).attr("idtutoria");
    var nombre=$(this).text();//nombre de la tutoria
    var mensajeNuevo = "Sinodal En: <br/><a href="+ruta+"?idUsuario="+idUsuario+
                       "&idTutoria="+idTutoria+"&tipoDeUsuario=sinodal><br>"+
                       nombre+"</a> <br/><span id=titulo>Alumno:</span>"+alumno+"<br><br><br>";//mensajesNuevos
    
    tutorados.html(mensajeAnterior + mensajeNuevo);
    autoScroll("sinodales");
    });
        
}
