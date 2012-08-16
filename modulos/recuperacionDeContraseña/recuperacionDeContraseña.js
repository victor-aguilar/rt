$(document).ready(function(){
	
	$('#enviar').click(function(){
		
		var email = $(':input').val();

		$('#m').load('recuperacionDeContraseña.php',{email:email});
	});
});
