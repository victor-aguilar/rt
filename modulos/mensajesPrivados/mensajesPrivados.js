$(document).ready(function(){
    
    var para = $("#para").val();
    
    $('#enviarMensaje').click(function(){
        
        var asunto = $('#asunto').val();
        var mensaje =$('#mensaje').val();
        var para =$('#para').val();
        
        $.ajax({
            type:"POST",
            url: "mensajesPrivados.php",
            dataType: "xml",
            data: {
                accion:"guarda",
                para: para,
                asunto: asunto,
                mensaje: mensaje
            },
            success: function(){alert("Mensaje enviado")},
            error: function(){alert("Error al enviar el mensaje.")}
        });
    });
})
