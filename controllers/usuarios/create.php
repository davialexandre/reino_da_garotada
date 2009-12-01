<?php
	
	include 'includes/eventos.inc';
	$form = include 'forms/eventos_form.frm';
	$message = '';
	if(isset($_POST['titulo'])) {
		fill_form($form);
		if(validate_form($form)) {
			$eventos = form_to_simple_array($form);
			if(save_eventos($eventos)) {
				set_message('Evento adicionado! <a href="?r=eventos/view/'. db_last_insert_id() .'" >Clique aqui para visualizar</a>');
				redireciona_para('eventos/edit/'.db_last_insert_id());
			} else {
				$message = 'N�o foi poss�vel adicionar o evento. Tente novamente.';
			}
		}
	}
	
	exibe_view(array('form' => $form, 'message' => $message), 'admin');
	
?>