var idUsuario = 0;
var ruta="../tutorias/tutoria.php"

$(document).ready(function(){
   
	creaBarraDeNavegacion();
	//todo esto se puede mejorar con un $.load
	$('ul li').click(function(){
		var c = $('#contenido');
		var v = $(this).attr('title')
		
		switch(v){
			case ('buscaTutorias'):
				c.html("<h1>Soy Tutor en:</h1>");
				buscaTutorias();
				break;
			case('buscaTutorados'):
				c.html("<h1>Soy Tutorado en:");
				buscaTutorados();
				break;
			case('buscaDondeSoySinodal'):
				c.html("<h1>Soy Sinodal en:");
				buscaDondeSoySinodal();
				break;
		}
		
	});
});


function buscaTutorias(){
    $.ajax({
        type:       "POST",
        url:        "lib/php/buscaTutorias.php",
        data:{
                    idUsuario:idUsuario
        },
        dataType:   "xml",
        success:    escribeTutorias
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
        success:    escribeTutorados
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
    })
}

function escribeTutorias(xml){	
    $(xml).find("tutoria").each(function(){
    var tutorias = $('#contenido');
    var mensajeAnterior = tutorias.html(); // tutorias anteriores
    var tutor=$(this).attr("tutor");
    var idTutoria=$(this).attr("idtutoria");
    var nombre=$(this).text();//nombre de la tutoria
    var mensajeNuevo = "<a href="+ruta+"?idUsuario="+idUsuario+
                       "&idTutoria="+idTutoria+"&tipoDeUsuario=alumno><br>"+
                       nombre+"</a> <br/><span id=titulo>Tutor:</span>"+tutor+"<br><br><br>";//mensajesNuevos
    
    tutorias.html(mensajeAnterior + mensajeNuevo);
    autoScroll("tutorias");
    });
        
}

function escribeTutorados(xml){
    $(xml).find("tutoria").each(function(){
    var tutorados = $('#contenido');
    var mensajeAnterior = tutorados.html(); // tutorias anteriores
    var alumno=$(this).attr("tutorado");
    var idTutoria=$(this).attr("idtutoria");
    var nombre=$(this).text();//nombre de la tutoria
    var mensajeNuevo = "<a href="+ruta+"?idUsuario="+idUsuario+
                       "&idTutoria="+idTutoria+"&tipoDeUsuario=tutor><br>"+
                       nombre+"</a> <br/><span id=titulo>Alumno:</span>"+alumno+"<br><br><br>";//mensajesNuevos
    
    tutorados.html(mensajeAnterior + mensajeNuevo);
    autoScroll("tutorados");
    });
        
}


function escribeDondeSoySinodal(xml){
    $(xml).find("tutoria").each(function(){
    var tutorados = $('#contenido');
    var mensajeAnterior = tutorados.html(); // tutorias anteriores
    var alumno=$(this).attr("tutorado");
    var idTutoria=$(this).attr("idtutoria");
    var nombre=$(this).text();//nombre de la tutoria
    var mensajeNuevo = "<a href="+ruta+"?idUsuario="+idUsuario+
                       "&idTutoria="+idTutoria+"&tipoDeUsuario=sinodal><br>"+
                       nombre+"</a> <br/><span id=titulo>Alumno:</span>"+alumno+"<br><br><br>";//mensajesNuevos
    
    tutorados.html(mensajeAnterior + mensajeNuevo);
    autoScroll("sinodales");
    });
        
}
