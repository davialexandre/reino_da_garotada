<?php
	include_once 'includes/usuarios.inc';
	$form = include 'forms/usuarios_edit_form.frm';
	$id = $params[0];
	
	$usuario = load_usuarios($id);
	$view_params['message'] = get_message();
	if(isset($_POST['nome'])) {
		fill_form($form);
		if(validate_form($form)) {
			$usuario = form_to_simple_array($form);
			$usuario['id'] = $id;
			if(save_usuarios($usuario)) {
				redireciona_para("usuarios/view/$id");
			} else {
				$view_params['message'] .= '<br />Nao foi possivel editar este usuário. Tente novamente.<br />' . get_last_error();
			}
		}
	} else {
		fill_form($form, $usuario);	
	}
	
	$view_params['form'] = $form;
	
	exibe_view($view_params);
?>