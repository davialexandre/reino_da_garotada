<?php
	
	include 'includes/usuarios.inc';
	$form = include 'forms/usuarios_form.frm';
	$message = '';
	if(isset($_POST['nome_usuarios'])) {
		fill_form($form);
		if(validate_form($form)) {
			$usuarios = form_to_simple_array($form);
			if(save_usuario($usuarios)) {
				set_message('Usuário criado! <a href="?r=usuarios/view/'. db_last_insert_id() .'" >Clique aqui para visualizar</a>');
				redireciona_para('usuarios/edit/'.db_last_insert_id());
			} else {
				$message = 'Não foi possível salvar o usuário. Tente novamente.';
			}
		}
	}
	
	exibe_view(array('form' => $form, 'message' => $message));
	
?>