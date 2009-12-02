<?php
	
	include 'includes/eventos.inc';
	$form = include 'forms/eventos_form.frm';
	$message = '';
	if(isset($_POST['titulo'])) {
		fill_form($form);
		if(validate_form($form)) {
			$eventos = form_to_simple_array($form);
			if(save_eventos($eventos)) {
				set_message('Evento criado com sucesso! <a href="?r=usuarios/view/'. db_last_insert_id() .'" >Clique aqui para visualizar</a>');
				redireciona_para('eventos/edit/'.db_last_insert_id());
			} else {
				$message = 'Não foi possível adicionar o evento. Tente novamente.';
			}
		}
	}
	
	exibe_view(array('form' => $form, 'message' => $message), 'admin');
	
?>