<?php
	
	$form = include_once('forms/form_fale_conosco.frm');
	
	if(isset($_POST['nome'])) {
		fill_form($form);
		
		if(validate_form($form)) {
			$mensagem = form_to_simple_array($form);
			mail('fale@reinodagarotada.org.br', $mensagem['assunto'], $mensagem['mensagem'], "From: {$mensagem['nome']} <{$mensagem['email']}>");
			set_message('Mensagem Enviada!');
		}
	}
	
	exibe_view(array('form' => $form, 'message' => get_message()));
?>