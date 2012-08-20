
//Estas se incializan desde la session (url)
var idTutoria   = 0;
var idUsuario   = 0;
var tipoDeUsuario = "alumno";
var idEtapa = -1;
var etapas = new Array("cero","uno","dos","tres","Busqueda De Sinodales","Demostracion");

var autorizacion = 1;
var mensaje = "";
var ultimaVerificacion = "0";
var ultimoMili = "0"; // usada para distiguir fechas guardada en la misma fecha ( o segundo);

//Para la sincronizacion de la peticiones AJAX
var hayPeticionAjax = false;
var cancelarPeticion = false;


//Etapas
var DEMOSTRACION = 5;
var BUSQUEDA_DE_SINODALES = 4;

/* Temporalizadores
 * 
 * Estos temporalizadores se usaran de la siguiente forma.
 * temporalizador[TEMPO_CHAT]
 * 
 * Así se podra hacer paso de parametros por referencia.
 * 
 * Ver la funcion reiniciaTemporalizador.
 */

var TEMPO_CHAT = 0;
var TEMPO_SUBIR_ARCHIVO = 1;
var TEMPO_PENDIENTES = 2;
var temporalizadores = new Array(0,0,0);

var INTERVALO_CHAT = 3000;
var intervaloSubirArchivo = 2500;

var tempoChat;
var tempoSubirArchivo;
var tempoPendientes;

var winSubir = null // referencia a la ventana subir archivos. 
var winSubirArchivo = null;
var nombreDelArchivo = "";
var urlDelArchivo = "";
var esUrl = false;


//Variables para la etapa de Demostracion.
var numeroDeBoton=0; 
var ultimaVerificacionDePendientes = "0"; 
var ultimoMiliPendientes = "0"; // usada para distiguir fechas guardada en la misma fecha ( o segundo); 
var intervaloPendientes = 2902; // intrevalo de actualizacion  

// Variables para el reloj. Posiblemente inutiles.
var hora; 
var h=1; 
var m=0; 
var s=0; 

var player = "";
var rutaDelAudio = "lib/audio/mensaje_nuevo";

/*
 * Carga Mensajes Previos (solo se usa una vez)
 */
descargaMensajesPrevios = function(){
    $.ajax({
        type: "POST",
        url: "conversacionesPrevias.php",
        data: {
            idTutoria : idTutoria
        },
        dataType: "xml",
        success:actulizaConversacion,
        error: error
    });
};

/*
 * Actualiza con nuevos mensajes la ventana de conversacion.
 * 
 * Recibe un acrhivo xml.
 */

actulizaConversacion = function(xml){
    
    var uv = $(xml).find("ultimaverificacion");
    var mensajes = $(xml).find("mensaje");
    
    ultimaVerificacion = uv.text();
    ultimoMili = uv.attr("ultimoMili");
    mensaje = "";
        
    //Agregra los mensajes a la ventana de conversacion.
    mensajes.each(function(){
    var conversacion = $('#ventanaDeConversacion');
    var mAnteriores = conversacion.html(); // mensajesAnteriores
    var mNuevos = "";//mensajesNuevos
    
    mNuevos += '<span class="nick">';
    mNuevos += $(this).attr("nick") + "</span>: ";
    mNuevos += '<span class="fecha">' + $(this).attr("fecha") + "</span><br/>";
    mNuevos += '<span class="mensaje">' + $(this).text() + "</span><br/>";
    conversacion.html(mAnteriores + mNuevos);
    autoScroll("ventanaDeConversacion");
    });
	
	if(mensajes.length != 0){
		$('#audio').html(player);
	}
	
    
    idEtapa = parseInt($(xml).find('ultimaetapa').text());

    $('#etapa').text(etapas[idEtapa]);
    switch(idEtapa){
        case (DEMOSTRACION):
            if(tipoDeUsuario != "moderador" &&
                tipoDeUsuario != "demostrador" &&
                tipoDeUsuario != "sinodal"){
                cambiaADemostracion();
            }
            break;
            
    }
    
    

    //para errores.
    //$('#m').html($('#m').html() + $(xml).find('error').text() + "\n<br>");

    reiniciaTemporalizador(TEMPO_CHAT,descargaMensajesNuevos,INTERVALO_CHAT);
}

/*
 * Guarda un mensajes (si hay) y descarga los nuevos mensajes desde el
 * servidor en formato xml.
 */
descargaMensajesNuevos= function(){ 
    
    window.clearInterval(temporalizadores[TEMPO_CHAT]);

    $.ajax({
    type: "POST",
    url: "chat.php",
    data: 
        {idTutoria : idTutoria, 
        mensaje: mensaje,
        ultimaVerificacion : ultimaVerificacion,
        ultimoMili: ultimoMili,
        idEtapa: idEtapa,
        tipoDeUsuario : tipoDeUsuario},
    dataType: "xml",
    success: actulizaConversacion,
    error: error
    }); 
    
};


inicializaChat = function(){
    
    $('#mensaje').val("");
    
    $('#mensaje').keydown(function(event){
        
        var cr = $('#mensaje');
        $('#caracteresRestantes').html(
            parseInt(cr.attr('maxLength')) - cr.val().length );
        if (event.which == 13 && !event.shiftKey){
            event.preventDefault();
            $('#enviarMensaje').click();
            $('#caracteresRestantes').html( cr.attr('maxLength'));
        }
    });
  
    $('#enviarMensaje').click(function(){
        mensaje = $("#mensaje").val().trim();
        //mensajes[mensajes.length] = $("#message").val();
        $("#mensaje").val("");
        //guardaMensaje();
        descargaMensajesNuevos();
    });

    $('#enviarArchivo').click(function(){
    var params = "directories=no,height=150px,";
    params += "width=500px,location=no,menubar=no,resizable=no,";
    params += "titlebar=no,toolbar=no";

    var url = "subirArchivo.html?idUsuario="+idUsuario+"&";
    url += "&crp=chat" +"&idTutoria=" + idTutoria;

    //Si el segundo parametro lleva espacios en blanco no funcionara en
    //internet explorer
    winSubirArchivo = window.open(url, "SubirArchivo", params);

    reiniciaTemporalizador(
    TEMPO_SUBIR_ARCHIVO,
    function(){
        if (winSubirArchivo.closed && urlDelArchivo !=""){
            // Una vez que la ventana ah sido cerrada, ya no necesitamos
            // el temporalizador para subir archivos.
            window.clearInterval(temporalizadores[TEMPO_SUBIR_ARCHIVO]);

            //todo conseguir nombre del urlDelArchivo
            // En el chat solo se puden eviar archivos. Urls no.
            mensaje = '<a href=' + urlDelArchivo+ ' target=_blank>';
            mensaje += urlDelArchivo + "</a>";

            nombreDelArchivo = "";
            urlDelArchivo = "";

            $('#mensaje').attr("value",mensaje);
            $('#enviarMensaje').click();
        }
    }, 
    intervaloSubirArchivo);
    })
}



error = function(xhr,status,error){
    $("#m").html( $("#m").html() + "<br> " + status +" <br> " + error);
}

inicializaRecursos = function (){
  
  actualizaListaDeRecursos();
  
  // Abre una nueva ventana y monitoriza cuando esta se cierra
  // para actualizar la lista de recursos con el nuevo
  // archivo que se acaba de subir al servidor.
  $('#subirRecurso').click(function(){
    var params = "directories=no,height=150px,";
    params += "width=500px,location=no,menubar=yes,resizable=no,";
    params += "titlebar=yes,toolbar=yes";
    
    var url = "?idUsuario="+idUsuario+"&crp=recursos&idTutoria=" +idTutoria;

    //Si el segundo parametro lleva espacios en blanco no funcionara en
    //internet explorer
    winSubirRecurso = window.open("subirArchivo.html" + url, "SubirArchivo", params);

    reiniciaTemporalizador(
    TEMPO_SUBIR_ARCHIVO,
    function(){
        if (winSubirRecurso.closed){
            // Una vez que la ventana ah sido cerrada, ya no necesitamos
            // el temporalizador para subir archivos.
            window.clearInterval(temporalizadores[TEMPO_SUBIR_ARCHIVO]);
            actualizaListaDeRecursos();
        }
    }, 
    intervaloSubirArchivo);
  });
  
}

actualizaListaDeRecursos = function(){

    $.ajax({
        type:"post",
        url:"listaDeRecursos.php",
        data: {
            idTutoria: idTutoria},
        dataType: "html",
        success: function(html)
        {
            $('#listaDeRecursos').html(html);
            
            var producto = $('div[name="recurso"]');
            
            producto.children('span').click(function(){
                var esUrl = ($(this).html().indexOf('http://') == -1)? false: true;
                var url = $(this).html();
                
                if (esUrl){
                    mensaje = "Por favor revisa la siguiente direccion: "+
                        '<a href=' + url + ' target=_blank>' + url + '</a>';
                }else{
                    mensaje = "Por favor revisa el siguiente archivo: " +
                        '<a href=' + url +' target=_blank>' + url + '</a>';
                }
                $('#mensaje').val(mensaje);
                $('#enviarMensaje').click();
            });

            //borrar Recurso
            producto.children('img').click(function(){
                    
                    var url = $(this).siblings().attr("value");
                    var idTema = $(this).attr('value');
                    
                    $.ajax({
                        type:"POST",
                        url:"borraArchivo.php",
                        context: this,
                        dataType: "text",
                        data:{
                            tipo : "recurso",
                            idTema: idTema,
                            url : url
                        },
                        success: function(text){
                        if(text == "exito"){
                            $(this).parent().hide('slow');
                        }else{
                            alert(text);
                        }
                        },
                        error: function(xhr,status,error){
                            alert(status + " " + error);
                        }
                    });
            });
            autoScroll('listaDeRecursos');
        },
        error: error
    })
}

actualizaListaDeProductos = function(){
    $.ajax({    
        type: "POST",
        url: "listaDeProductos.php",
        dataType: "html",
        data: {idTutoria: idTutoria},
        success: function(html){
			
            $('#listaDeProductos').html(html);
            var producto = $('#listaDeProductos div');
			
			//manda el producto por el chat
			producto.children('span').click(function(){
                var url = $(this).html();
                
				mensaje = "Por favor revisa el siguiente archivo: " +
					'<a href=' + url +' target=_blank>' + url + '</a>';
                $('#mensaje').val(mensaje);
                $('#enviarMensaje').click();
            });
            
            //borrar el producto
            producto.children('img').click(function(){

                url = $(this).siblings().attr('value');
                
                $.ajax({
                    type:"POST",
                    url:"borraArchivo.php",
                    context: this,
                    dataType: "text",
                    data:{
                        tipo : "producto",
                        idTutoria: idTutoria,
                        url : url
                    },
                    success: function(text){
                        if(text == "exito"){
                            $(this).parent().hide('slow');
                        }else{
                            alert(text);
                        }
                    },
                    error: function(xhr,status,error){
                        alert(status + " " + error);
                    }
                });
                
            });
        },
        error: error
    });
}

inicializaProductos = function(){
  
  actualizaListaDeProductos();
  
  $('#subirProductos input:[name=producto]').click(function(){
      
    var params = "directories=no,height=150px,";
    params += "width=500px,location=no,menubar=yes,resizable=no,";
    params += "titlebar=no,toolbar=no";
    
    var url = "subirArchivo.html?idTutoria=" + idTutoria+"&crp=productos" ;

    //Si el segundo parametro lleva espacios en blanco no funcionara en
    //internet explorer
    winSubirArchivo = window.open(url, "SubirArchivo", params);

    reiniciaTemporalizador(
    TEMPO_SUBIR_ARCHIVO,
    function(){
        if (winSubirArchivo.closed && urlDelArchivo != ""){
            // Una vez que la ventana ah sido cerrada, ya no necesitamos
            // el temporalizador para subir archivos.
            window.clearInterval(temporalizadores[TEMPO_SUBIR_ARCHIVO]);
            
            //todo conseguir nombre del urlDelArchivo
            mensaje = "Por favor revisa el siguiente archivo: ";
            mensaje += '<a href=' + urlDelArchivo + ' target=_blank>';
            mensaje += dameNombreDelArchivo(urlDelArchivo) + "</a>";
            
            actualizaListaDeProductos();
            nombreDelArchivo = "";
            urlDelArchivo = "";
            
            $('#mensaje').attr("value",mensaje);
            $('#enviarMensaje').click();
        }
    }, 
    intervaloSubirArchivo);
  });
}

cambiaADemostracion = function(){
    
    window.clearInterval(temporalizadores[TEMPO_CHAT]);
    window.clearInterval(temporalizadores[TEMPO_SUBIR_ARCHIVO]);
    window.clearInterval(temporalizadores[TEMPO_PENDIENTES]);
   

//var fun = function(){
	var url = "";
    switch(tipoDeUsuario){
        case("tutor"):
            tipoDeUsuario = "moderador";
            break;
        case("alumno"):
            tipoDeUsuario = "demostrador";  
            break;
        case("observador"):
            tipoDeUsuario = "sinodal";
            break;
    }
    
    url += "tutoria.php?";
    url += "idUsuario=" + idUsuario + "&";
    url += "tipoDeUsuario=" + tipoDeUsuario +"&";
    url += "idTutoria=" + idTutoria;
    window.location = url;
//}
//window.setInterval(fun, 3000);

}

buscaSinodales = function(){   
    $.ajax({
        type:"POST",
        url: "buscaSinodales.php",
        data:{idTutoria:idTutoria},
        error: error
    });
}

/*
 * Inicializa variables y eventos.
 */
$(document).ready(function(){

  window.clearInterval(temporalizadores[TEMPO_CHAT]);
  window.clearInterval(temporalizadores[TEMPO_SUBIR_ARCHIVO]);
  window.clearInterval(temporalizadores[TEMPO_PENDIENTES]);
  
  tipoDeUsuario = getUrlVars()['tipoDeUsuario'];
  idTutoria = getUrlVars()['idTutoria'];
  idUsuario = getUrlVars()['idUsuario'];
  
  //inicializamos el reproductor de sonido segun el soporte que tenga el navegador
	var html5 = '<audio controls preload="auto" autobuffer autoplay="autoplay">';
		html5 += '<source src="' + rutaDelAudio + '.ogg" type="audio/ogg"/>';
		html5 += '<source src="' + rutaDelAudio + '.mp3" type="audio/mpeg"/>';
		html5 += '¬¬ tu navegador no soprota html. ¿porque no se cargo el flash?'
		html5 += '</audio>';
	var flash = '<object type="application/x-shockwave-flash" ';
		flash += 'data="lib/flash/dewplayer-mini.swf" ';
		flash += 'width="160" height="20" id="dewplayermini" name="dewplayermini">';
		flash += '<param name="movie" value="lib/flash/dewplayer-mini.swf" />';
		flash += '<param name="flashvars" value="mp3=' + rutaDelAudio +'.mp3&amp;autostart=1" /></object>';

	if (Modernizr.audio){
		player = html5;
	}else{
		player = flash;
	}
	
	$('#audio').hide();
  
  descargaMensajesPrevios();
  
  inicializaChat();
  
  //Particularidades para cada tipo de usuario.
  switch(tipoDeUsuario){
      case "tutor":
          inicializaRecursos();
          inicializaProductos();
          $('#siguienteEtapa').click(function(){
              idEtapa++;
              switch(idEtapa){
                  case(DEMOSTRACION):
                      $('#mensaje').val("En la Etapa de Demostracion");
                      break;
                  default:
                      $('#mensaje').val("Nueva Etapa Iniciada");
              }
              $('#enviarMensaje').click();
              
              if(idEtapa == BUSQUEDA_DE_SINODALES){
                buscaSinodales();
              }
          })
          break;
     case "moderador":
          inicializaPendientes();
          break;
     case "observador":
           $('#enviarMensaje').prop('disabled',true);
           $('#mensaje').prop('disabled',true);
           $('#enviarArchivo').prop('disabled',true);
          break;
     case "sinodal":
          autorizacion = 0;
          inicializaComponentesDeSinodal()
          break;
     case "alumno":
         if(idEtapa == DEMOSTRACION){
            cambiaADemostracion();
         }else{
             inicializaProductos();
         }

        break;
     case "demostrador":

         //El no tiene nada especial. Solamente el chat.
     break;
     default:
         break;
  }
  
  reiniciaTemporalizador(TEMPO_CHAT,descargaMensajesNuevos,INTERVALO_CHAT);
});



