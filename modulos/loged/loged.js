$(document).ready(function(){
	
	$('#descripcion').hide();
	
	$('ul li').click(function(){
		var v = this.getAttribute('value');
		var nd = v; //nombre del modulo
		switch(v){
			case ('bandejaDeEntrada'):
				nd = 'mensajesPrivados';
				v += ".php";
				break;
			default:
				if (v.substr(0,5) == 'index'){
					nd = '../alta_en_arbol';
				}else{
				    v = v + ".php";
				}
		}
		window.location = '../' + nd + '/' + v;
	});
	
	$('#menu li').mouseenter(function(){
		//bug de jquery
		//$('#descripcion').html( $(this).attr('value') );
		var v = this.getAttribute('value');
		if (v.substr(0,5) == 'index'){
		  v = "misTemasDeCatalogo";
	     }
		$('#descripcion').load('descripciones/' + v + ".html");
		$('#descripcion').show('fast');
	});
	
	$('ul li').mouseleave(function(){
		$('#descripcion').hide('fast');
	});
})
