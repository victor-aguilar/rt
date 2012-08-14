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
  	$('#botonMail').html('<img src="lib/img/Correo.jpg" />');  
}else{
	$('#botonMail').html('<img src="lib/img/hayCorreo.jpg" />');
}
}



$(document).ready(function(){
    $('#botonMail').click(function(){
         var url="modulos/mensajesPrivados/bandejaDeEntrada.html"
        window.location=url;
    })
    
    
//   $.ajax({
//        type:"POST",
//        url: "modulos/notificaciones/lib/php/consigueIdUsuario.php",
//        dataType:"text",
//        success: function(text){
//            idUsuario= parseInt(text);
//        },
//        error: function(error){
//            alert(error);
//        }
//   })
	
	buscaNotificaciones();

});
