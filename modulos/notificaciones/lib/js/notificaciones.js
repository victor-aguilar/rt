var idUsuario=0;



function buscaNotificaciones(){
    $.ajax({
        type: "POST",
        url: "modulos/notificaciones/lib/php/buscaNotificaciones.php",
        data:{
            idUsuario:idUsuario
        },
        dataType:"text",
        success: hayNotificaciones
    })    
}


function hayNotificaciones(text){

    if (text == ""){
  	$('#misDatos img').attr('src','../../lib/img/correo.png');  
}else{
	$('#misDatos img').attr('src','../../lib/img/hayCorreo.png');  
}
}



$(document).ready(function(){
    $('#botonMail').click(function(){
         var url="modulos/mensajesPrivados/bandejaDeEntrada.html"
        window.location=url;
    })
	
	buscaNotificaciones();

});
