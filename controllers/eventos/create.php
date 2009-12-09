<?php
	valida_acesso_admin();
	include 'includes/eventos.inc';
	$form = include 'forms/eventos_form.frm';
	$message = '';
	if(isset($_POST['titulo'])) {
		fill_form($form);
		if(validate_form($form)) {
			$evento = form_to_simple_array($form);
			if(save_evento($evento)) {
				set_message('Evento criado com sucesso!');
				redireciona_para('eventos/edit/'. db_last_insert_id());
			} else {
				$message = 'Não foi possível adicionar o evento. Tente novamente.';
			}
		}
	}
	add_javascript('js/jquery-ui/ui/jquery-ui-1.7.2.custom.js');
	
	exibe_view(array('form' => $form, 'message' => $message), 'admin');
	
?>