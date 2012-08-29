
function creaBotones(){

	var textoAnterior=$("#listaDePendientes").html();
	var numero=numeroDeBoton;

	var texto='<div name="div'+numero+'">'+textoAnterior+'<br /><input type=button id="botonAceptarMensaje'+
	numero+'" value="Permitir" class="botonAceptar" name="aceptar" ('+numero+')"><hr>'
	//        +
	//        '<input type=button id="botonRechazarMensaje'+
	//        numero+'" value="Rechazar" class="botonRechazar" name="rechazar" ('+numero+')"> <br />'+"</div>";
	$("#listaDePendientes").html(texto); 

	//        $('[name="rechazar"]').click(function(){
	//            $(this).siblings('[name="aceptar"]').hide();
	//        var rechaza =  $(this).siblings('[name="mensaje"]').html();
	//        rechaza+="<br> <b> Has Rechazado el Mensaje Previo";
	//        $(this).siblings('[name="mensaje"]').html(rechaza);
	//            $(this).hide();
	//        })

	$('[name="aceptar"]').click(function(){
	var mensajeAceptado=$(this).siblings("[name=mensaje]");
	var aceptado = mensajeAceptado.html(); 
	mensajeAceptado = mensajeAceptado.html();
	mensajeAceptado+="<br> <b> Has Aceptado el Mensaje Previo"
	$(this).siblings('[name="mensaje"]').html(mensajeAceptado);
	var fechaDeMensajeAnterior= $(this).siblings('[name="fecha"]').html();
	var idUsuarioAnterior=$(this).siblings('[name="idUsuarioMensaje"]').html();

	enviaMensaje(aceptado, idUsuarioAnterior);
	borraMensaje(idUsuarioAnterior,fechaDeMensajeAnterior);
	$(this).hide();                     
	});


	numeroDeBoton++;
}

function acabaDemostracion(){
    if(tipoDeUsuario!="moderador"){
        autorizacion=0;        
    }else{
        enviaMensaje("Concluye la Tutoria",idUsuario);
    }
}

function empiezaDemostracion(){
    t=setTimeout('empiezaDemostracion()',1000);

  
    if (s<1 && m<1 && h<1){
        enviaMensaje("Se Acabo El tiempo",idUsuario);
         window.clearInterval(t);
    }else if (s < 1 && m < 1){
        s=59;
        m=59;
        h--;
    }else if (s<1){
        s=59;
        m--;
    }else {
        s--;
    }
    $("#reloj").html(h+":"+m+":"+s);   
    
}


function descargaListaDePendientes(){
    $.ajax({
    type: "POST",
    url: "../demostracion/descargaPendientes.php",
    data: 
        {idTutoria : idTutoria, 
        ultimoMiliPendientes: ultimoMiliPendientes,
        ultimaVerificacionDePendientes : ultimaVerificacionDePendientes
        },
    dataType: "xml",
    success: actualizaListaDePendientes
    //error: error
    });
    
    reiniciaTemporalizadorT();
}
    
function actualizaListaDePendientes(xml){
    $(xml).find("mensaje").each(function(){
    var pendiente = $('#listaDePendientes');
    var mensajeAnterior = pendiente.html(); // mensajesAnteriores
    var usuario=$(this).attr("nick");
    var fecha=$(this).attr("fecha");
    var mensaje=$(this).text();
    var idUsuarioMensaje=$(this).attr("idUsuario");
    var mensajeNuevo = "<span name=fecha>"+fecha+
        "</span> : <span name=usuario>"+usuario +
        "</span>: <span name=mensaje>"+mensaje+
        "</span> <span name=idUsuarioMensaje style=\"display:none\">"+idUsuarioMensaje+
        "</span>";//mensajesNuevos
    
    pendiente.html(mensajeAnterior + mensajeNuevo);
    creaBotones();
    
    });
        
    var uv = $(xml).find("ultimaVerificacionDePendientes");
    ultimaVerificacionDePendientes = uv.text();
    ultimoMiliPendientes = uv.attr("ultimoMiliPendientes");
    mensaje = "";
}




function enviaMensaje(aceptado, idUsuarioA){

	var mensajeAReenviar=aceptado;
	$.ajax({
		type: "POST",
		url: "../demostracion/guardaMensaje.php",
		data: 
			{idTutoria : idTutoria, 
			idUsuario : idUsuarioA,
			idEtapa: idEtapa,
			mensaje: mensajeAReenviar
			},
		 error : error
	});
}
    
    
function autoScroll(div){
    $('#'+ div).scrollTop($('#' + div)[0].scrollHeight);
}

function reiniciaTemporalizadorT(){
    window.clearInterval(tempoPendientes);
    tempoPendientes = window.setInterval("descargaListaDePendientes()",intervaloPendientes);
}


    
function inicializaPendientes(){
    window.clearInterval(tempoPendientes);
    tempoPendientes = window.setInterval("descargaListaDePendientes()",intervaloPendientes);
  

  
  $('[name="botonDescargaPendientes"]').click(function(){
      $(this).hide();
      h=0;
      m=1;
      s=0;
      $("#reloj").html(h+":"+m+":"+s);   
      empiezaDemostracion();
      descargaListaDePendientes();
  $('[name="botonAcabaDemostracion"]').click(function(){
      acabaDemostracion();
	})
  });
    
}

function inicializaComponentesDeSinodal(){

//$("#botonesDeSinodal").html(
//'<input type=button name="aprobado" value="Aprobado" onclick="aprueba()">'
//)
    window.clearInterval(tempoPendientes);
    tempoPendientes = window.setInterval("descargaListaDePendientes()",intervaloPendientes);
  

}

function aprueba(){
    
    $.ajax({
        type: "POST",
        url: "../demostracion/aprobar.php",
        data: {
            idUsuario : idUsuario,
            idTutoria : idTutoria 
        },
        success: function(){
            $("#botonesDeSinodal").hide();  
            obtenDictamen();
        }
    });
        
}

function borraMensaje(idUsuarioAnterior,fechaDeMensajeAnterior){
    var idU = idUsuarioAnterior;
    var fechaM = fechaDeMensajeAnterior;
    $.ajax({
        type: "POST",
        url: "../demostracion/borraMensaje.php",
        data: {
            idUsuario : idU,
            fecha : fechaM,
            idTutoria : idTutoria
        },
        error: error      
    })
}
//
//function inicializaAlumno(){
//    $("#botonAlumno").html(
//'<input type=button name="calificacion" value="Dictamen" onclick="obtenDictamen()"></input>'
//)
//    
//}
function obtenDictamen(){
    $.ajax({
        type: "POST",
        url: "../demostracion/obtenDictamen.php",
        data:{
            idTutoria : idTutoria
            },
        dataType: "xml",
        success: escribeDictamen,
        error:  error
            
    }
);}

function escribeDictamen(xml){
    $(xml).find("dictamen").each(function(){
    var dictamen=$(this).text();
    enviaMensaje(dictamen,idUsuario);
    });}

function obtenMensajesDeEtapa(){
      $.ajax({
        type: "POST",
        url: "../demostracion/obtenMensajesDeEtapa.php",
        data:{
            idTutoria : idTutoria,
            idEtapa : idEtapa
            },
        dataType: "xml",
        success: actulizaConversacion,
        error:  error
            
    }
);
}
