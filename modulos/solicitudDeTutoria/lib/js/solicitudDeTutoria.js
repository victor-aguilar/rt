var idsTemas = 0;
var idTema = 0;
var idTutor = 0;
var idUsuario = 0;
var numeroDePagina = 0;

var asunto = "Solicitud de Tutoria";
var mensaje ="";


/* Datos usados para el mensaje */
var nombreDelTutor = "";
var nombreDelTema = "";
var nobmreDelAlumno = "";

var directorioBase = "";

$(document).ready(function(){

	creaBarraDeNavegacion();
	
    //conseguimos el id del usuario
    idUsuario = dameIdUsuario();
    nombreDelAlumno = dameNickDeUsuario();
    
    $('#lista1,#lista2').hide();
    $('#enviarSolicitud button').prop('disabled',true);
    
    //inicializamos eventos
    $('#enviarSolicitud button').click(function(){
        
        $('#lista1,#lista2').hide("slow");
        
        $(this).prop('disabled',true);
        
        mensaje += "<h1>Solicitud de tutoria</h1>";
        mensaje += "<p> Hola <b>" + nombreDelTutor + "</b></p>";
        mensaje += "<p>¿Te gustaría ser tutor de " + nombreDelAlumno + " en el tema: ";
        mensaje += "<b>" + nombreDelTema +"</b>?</p>";
        mensaje += "<p>Si la respuesta es afirmativa, has click:";
        mensaje += '<a href="';
        mensaje += "../../modulos/solicitudDeTutoria/creaTutoria.php?idTema=";
        mensaje += idTema+"&idTutorado="+idUsuario+'">';
        mensaje += "Aceptar Tutoria</a> </p>";
        mensaje += "<p>En caso contrario da click en: ";
        mensaje += '<a href=';
        mensaje += '../../modulos/solicitudDeTutoria/rechasaTutoria.php?';
	   mensaje += 'de='+ idTutor;
	   mensaje += '&para=' + idUsuario;
	   mensaje += '&nombreDelTutor=' + encodeURIComponent(nombreDelTutor);
	   mensaje += '&nombreDelTema=' + encodeURIComponent(nombreDelTema);
        

		mensaje += '>';
        mensaje += 'No aceptar</a>';
        mensaje += '</p>'
        
        
        $.ajax({
            type: "POST",
            url: "../../modulos/mensajesPrivados/mensajesPrivados.php",
            typeData: "xml",
            data:{
                accion: "guarda",
                de:idUsuario,
                para: idTutor,
                asunto: asunto,
                mensaje: mensaje 
            },
            success: function(){
                $('#m').html("Solicitud enviada a <b>" + 
                    nombreDelTutor + "</b> del tema <b>" + nombreDelTema + "</b>");
                mensaje = "";
            }
        });
    });

    $('#buscarPor select').change(function(){

        $('#lista1,#lista2').hide();
      
        $('#enviarSolicitud button').prop("disabled",true); 

        var buscarPor = $(this).val();       
        
        
        switch(buscarPor){
            case ("tema"):
                $('#lista1').show("slow");
                    //accion = temas | tutores
                buscaTemasPorNombre();
                break;
            case ("tutor"):
                $('#lista1').show("slow");
                buscaTutoresPorNick();
                break;
        }
    });
    
});

/**
 * Descarga un html con etiquetas option para ser incluido dentro de una 
 * etiqueta select.
 */
buscaTemasPorNombre = function()
{
	$.ajax({
		type: "POST",
		url: "listaDeTemasPorNombre.php",
		typeData: "html",
		success: function(html){
		
		$('#lista1 select').html(html);
		
		$('#lista1 select option').click(function(){
		    
			$('#enviarSolicitud button').prop('disabled',true);
		    
		    idsTemas = $(this).attr("value");
		    nombreDelTema = $(this).text();

		    buscaTutoresPorTema(idsTemas, nombreDelTema);
		    
		})
		},
		error: function(xhr,status,error){alert("Error: " + error);}
	});
}
/**
 * Descarga un html con etiquetas option para ser incluido dentro de una 
 * etiqueta select.
 */


buscaTutoresPorNick = function()
{
    $.ajax({
        type: "POST",
        url: "listaDeTutores.php",
        typeData: "html",
        success: function(html){
            
        $('#lista1 select').html(html);
        
        $('#lista1 select option').click(function(){

            $('#enviarSolicitud button').prop('disabled',true);
            
            idTutor = $(this).attr("value");
            nombreDelTutor = $(this).text();

            //Cargamos los temas asociados a un tutor
            $.ajax({
                type: "POST",
                url: "listaDeTemasPorTutor.php",
                typeData: "html",
                data:{
                    idTutor: idTutor
                },
                success: function(html){
                    $('#lista2 select').html(html);

                    $('#lista2 select option').click(function(){
                        nombreDelTema = $(this).text();
                        idTema = $(this).val();
                        $('#enviarSolicitud button').prop('disabled',false);
                    })

                    $('#lista2').show("slow");
                },
                error:function(xhr,status,error){alert("Error: " + error)}
            })
        })
        },
        error: function(xhr,status,error){alert("Error: " + error);}
    })
}

buscaTutoresPorTema = function(idsTemas){

	$.ajax({
		    type: "POST",
		    url: "listaDeTutoresPorNombreDeTema.php",
		    typeData: "html",
		    data:{
		        idsTemas: idsTemas
		    },
		    success: function(html){

		        $('#lista2 select').html(html);

		        $('#lista2 select option').click(function(){
		            //(idTema,idTutor)
		            var x = $(this).attr('value').split(",");

		            idTema = x[0];
		            idTutor = x[1];
		            nombreDelTutor = $(this).text();

		            $('#enviarSolicitud button').prop('disabled',false);
		        });

		        $('#lista2').show("slow");
		    },
		    error:function(xhr,status,error){alert("Error: " + error)}
		});
}

