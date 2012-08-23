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
var nombreDelAlumno = "";

$(document).ready(function(){

	creaBarraDeNavegacion();
	
    //conseguimos el id del usuario
    idUsuario = dameIdUsuario();
    nombreDelAlumno = dameNombreDeUsuario();
    
    $('#lista1,#lista2').hide();
    $('#enviarSolicitud button').prop('disabled',true);
    
    //inicializamos eventos
    $('#enviarSolicitud button').click(function(){
        
        $('#lista1,#lista2').hide("slow");
		$('#lista1 select').unbind('change');
		$('#lista2 select').unbind('change');
        
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
	   //bug de internet explorer.
	   //mensaje += '&para=' + idUsuario;
	   mensaje += '&from=' + idUsuario;
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
		$('#lista1 select').unbind('change');
		$('#lista2 select').unbind('change');
      
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

            $('#lista1 select').change(function(){
                var option = $('#lista1 select>option:selected');
                $('#enviarSolicitud button').prop('disabled',true);

                idsTemas = $(this).val();
                nombreDelTema = option.text();

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
        
        $('#lista1 select').change(function(){
            
            var option = $('#lista1 select>option:selected');
            $('#enviarSolicitud button').prop('disabled',true);
            
            idTutor = $(this).val();
            nombreDelTutor = option.text();

            buscaTemasPorTutor(idTutor);
            
        });
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

		        $('#lista2 select').change(function(){
		            //(idTema,idTutor)
		            var x = $(this).val().split(",");
					var option = $('#lista2 select>option:selected');
		            idTema = x[0];
		            idTutor = x[1];
		            nombreDelTutor = option.text();

		            $('#enviarSolicitud button').prop('disabled',false);
		        });

		        $('#lista2').show("slow");
		    },
		    error:function(xhr,status,error){alert("Error: " + error)}
		});
}

buscaTemasPorTutor = function(){

        $.ajax({
            type: "POST",
            url: "listaDeTemasPorTutor.php",
            typeData: "html",
            data:{
            idTutor: idTutor
            },
            success: function(html){
                $('#lista2 select').html(html);

                $('#lista2 select').change(function(){
                    var option = $('#lista2 select>option:selected');
                    nombreDelTema = option.text();
                    idTema = $(this).val();
                    $('#enviarSolicitud button').prop('disabled',false);
                })

                $('#lista2').show("slow");
            },
        error:function(xhr,status,error){alert("Error: " + error)}
    });
}