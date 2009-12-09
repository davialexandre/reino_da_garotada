<?php
	$form = include_once('forms/form_login.frm');
	
	if(isset($_POST['username'])) {
		fill_form($form);
		if(validate_form($form)) {
			$login = form_to_simple_array($form);
			$login['password'] = sha1($login['password']);
			$usuario = db_fetch_row(db_query('SELECT id,nome FROM usuario WHERE login = ? AND senha = ?', array_values($login)));
			if($usuario) {
				$_SESSION['admin'] = true;
				$_SESSION['user_id'] = $usuario['id'];
				$_SESSION['nome_usuario'] = $usuario['nome'];
				db_update_record('usuario', array('data_ultimo_acesso' => date('c')), array('id' => $usuario['id']));
				redireciona_para('site/admin');
			} else {
				$view_params['message'] = 'Usuário ou senha inválidos. Tente novamente.';
			}
		}
	}
	$view_params['form'] = $form;
	exibe_view($view_params, 'login');
?>