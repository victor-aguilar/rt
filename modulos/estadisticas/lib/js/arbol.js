var lista="";
var nodoPadre;
var anterior;
function temas(accion,padre){
    $.ajax({
        type:"POST",
        url:"lib/php/buscaTemas.php",
        dataType: "xml",
        data:{
            accion: accion
        },
        success: escribeTemas,
        error: error
    })
}

function escribeTemas(xml){
    $(xml).find("tema").each(function(){
        anterior=$('#temas').html();
        lista  = '<ul>';
        lista += '<li';
        lista += '>';
        lista += '<p';    
        lista += ' idTema="'+$(this).attr('idTema')+'"';
        lista += ' padre="'+$(this).attr('padre')+'"';
        lista += ' nick="'+$(this).attr('nick')+'"';
        lista += ' >'
        lista += $(this).text();
        lista += '</p>'    
        lista += ' <h3>?</h>'
        lista += '</li>';
        lista += '</ul>';
        $('#temas').html(anterior+lista);
    })       

    $('p').click(function(event){
        busca(event);
    });
    $('h3').click(function(event){
        informacion(event);
    })
    lista="";
    anterior="";
    nodoPadre="";
}

function busca(event){

    var idTema = event.target.getAttribute('idTema');
    nodoPadre = event.target.parentNode;
    anterior = nodoPadre.innerHTML;

    $.ajax({
        type:"POST",
        url:'lib/php/buscaTemas.php',
        dataType:'xml',
        data:{
            accion:'hijo',
            tema: idTema
        },
        success: escribeTemasA,
        error:error
    });

}

function informacion(event){
    var nodoPadre=event.target.parentNode;
    var nodoP= nodoPadre.firstChild;
    var idTema =nodoP.getAttribute('idTema');
    var nick = nodoP.getAttribute('nick');
    var nombre = nodoP.innerHTML;
    var info = '<table border="1"><tr><td>ID Tema</td><td>'+idTema+'</td></tr>';
    info+= '<tr><td>Nombre del tema</td><td>'+nombre+'</td></tr>';
    info+= '<tr><td>Tutor</td><td>'+nick+'</td></tr>';
    $('#informacion').html(info);
}



function escribeTemasA(xml){
    $(xml).find("tema").each(function(){
        lista = '<ul>';
        lista += '<li';
        lista += '>';
        lista += '<p';    
        lista += ' idTema="'+$(this).attr('idTema')+'"';
        lista += ' padre="'+$(this).attr('padre')+'"';
        lista += ' nick="'+$(this).attr('nick')+'"';
        lista += ' >'
        lista += $(this).text();
        lista += '</p>'
        lista += ' <h3>?</h>'
        lista += '</li>';
        lista += '</ul>';
    }) 
    nodoPadre.innerHTML= anterior + lista;
    $('p').click(function(event){
        busca(event);
    });

    $('h3').click(function(event){
        informacion(event);
    })
    lista="";
    anterior="";
    nodoPadre="";
}

$(document).ready(function(){

    $('#informacion').portamento({
        wrapper: $('#wrapper')
    });	
    temas('todos');
})