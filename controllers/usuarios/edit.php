<?php
	include_once 'includes/usuarios.inc';
	$form = include 'forms/usuarios_edit_form.frm';
	$id = $params[0];
	
	$usuarios = load_usuario($id);
	$view_params['message'] = get_message();
	if(isset($_POST['nome'])) {
		fill_form($form);
		if(validate_form($form)) {
			$usuarios = form_to_simple_array($form);
			$usuarios['id'] = $id;
			if(save_usuarios($usuarios)) {
				redireciona_para("usuarios/list");
			} else {
				$view_params['message'] .= '<br />Nao foi possivel editar este usuário. Tente novamente.<br />' . get_last_error();
			}
		}
	} else {
		fill_form($form, $usuarios);	
	}
	
	$view_params['form'] = $form;
	
	exibe_view($view_params);
?>