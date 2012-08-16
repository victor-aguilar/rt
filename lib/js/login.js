//var url= "http://168.255.101.69/c3po/config/apache/htdocs/rt/loged.php"
var url="modulos/loged/loged.php"

$(document).ready(function(){
    
    $('#ingreso').click(function(){
        var nick = $('#usuario').val();
        var contraseña = $('#contraseña').val();
        ingresar(nick, contraseña);
        
    });
    
    $('#contraseña').keydown(function(event){
      if(event.which == 13 && !event.shiftKey){
        var nick = $('#usuario').val();
        var contraseña = $('#contraseña').val();
        ingresar(nick, contraseña);
      }
    })   
});


function ingresar (nick, contraseña){
    $.ajax({
       type:"POST",
       url:"ingresar.php",
       data:{
           nick: nick,
           contraseña:contraseña           
       },
       dataType: "text",
       success: function(text){
           if(text != ""){
               window.location=url;
           }else{
               noLoguea();
           }
       },
       error: noLoguea
    });
        
}

function noLoguea(){
    
    alert("Comprueba tu usuario y contraseña e intentalo nuevamente");
    $('#usuario').val("");
    $('#contraseña').val("");
}