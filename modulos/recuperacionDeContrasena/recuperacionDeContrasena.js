$(document).ready(function(){
	
	$('#enviar').click(function(){
		
		var email = $(':input').val();

		$('#m').load('recuperacionDeContrasena.php',{email:email});
	});
});
