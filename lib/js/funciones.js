/* 
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */


var arrayToString = function(array){
  var tmp = "";
  alert(array.length);
  for (var i = 0; i< array.length; i++){
      tmp += "mensaje"+i+ "="+array[i];
      tmp += (i != array.length-1 )? "&":"";
  }
  alert(tmp);
  return tmp;
}

  //quita los espacio en blanco al principio y al final.
  // Ejemplo de uso:
  //  var cadena = " hola ";
  //  var sin_espacios = cadena.trim();
  //
  String.prototype.trim = function() {
	return this.replace(/^\s+|\s+$/g,"");}
      
 var dameDirectorioBase = function(url){
     var end = url.lastIndexOf("/") + 1;
     return url.substring(0,end);
 }
 
 function getUrlVars() {
    var vars = {};
    var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi, function(m,key,value) {
        vars[key] = value;
    });
    return vars;
}

autoScroll = function(div){
    $('#'+ div).scrollTop($('#' + div)[0].scrollHeight);
}

/**
 * Recibe el la url (ruta) del archivo y devuelve unicamente el nombre.
 */
dameNombreDelArchivo = function(ruta){
    return ruta;
}

/*
 * Esta funcion asume que existe un arreglo global llamado temporalizador.
 * 
 * Recibe, un numero que indica la posicion del temporalizador en el arreglo 
 * a reiniciar (o iniciar), la funcion que ejecutara y el intervalo en el cual
 * en el cual se ejecutara.
 */
reiniciaTemporalizador = function(tempo,funcion,intervalo){
    window.clearInterval(temporalizadores[tempo]);
    temporalizadores[tempo] = window.setInterval(funcion,intervalo);
}

dameIdUsuario = function (){
	var idUsuario = 0;
	
	$.ajax({
		async: false,
		type: "POST",
		url: "../../lib/php/consigueIdUsuario.php",
		typeData: "text",
                    
		success:function(text){
			idUsuario = parseInt(text);
		}
	});
	return idUsuario;
}

dameNickDeUsuario = function (){
	var nick = "";
	
	$.ajax({
		async: false,
		type: "POST",
		url: "../../lib/php/consigueNickDeUsuario.php",
		typeData: "text",
                    
		success:function(text){
			nick = text;
		}
	});
	return nick;
}

error = function(m){
	alert(m);
}
