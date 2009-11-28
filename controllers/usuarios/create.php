<?php
	
	include 'includes/usuarios.inc';
	$form = include 'forms/usuarios_form.frm';
	$message = '';
	if(isset($_POST['nome'])) {
		fill_form($form);
		if(validate_form($form)) {
			$usuario = form_to_simple_array($form);
			if(save_usuario($usuario)) {
				set_message('Usuário criado! <a href="?r=usuario/view/'. db_last_insert_id() .'" >Clique aqui para visualizar</a>');
				redireciona_para('usuario/edit/'.db_last_insert_id());
			} else {
				$message = 'Não foi possível salvar o usuário. Tente novamente.';
			}
		}
	}
	
	exibe_view(array('form' => $form, 'message' => $message));
	
?>