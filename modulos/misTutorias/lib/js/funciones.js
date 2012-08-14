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

    function error(xhr,status,error){
        alert(status + ". " + error+". "+xhr);
    }
    
    function consigueIdUsuario(){
        $.ajax({
            type:"POST",
            url: "lib/php/cosigueIdUsuario.php",
            datatype:"text",
            success: function(text){
                idUsuario= parseInt(text);
            }
        })
        
    }