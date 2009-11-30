<?php
	include_once 'includes/eventos.inc';
	$form = include 'forms/eventos_edit_form.frm';
	$id = $params[0];
	
	$eventos = load_evento($id);
	$view_params['message'] = get_message();
	if(isset($_POST['titulo'])) {
		fill_form($form);
		if(validate_form($form)) {
			$eventos = form_to_simple_array($form);
			$eventos['id'] = $id;
			if(save_eventos($eventos)) {
				redireciona_para("eventos/list");
			} else {
				$view_params['message'] .= '<br />Nao foi possivel editar este evento. Tente novamente.<br />' . get_last_error();
			}
		}
	} else {
		fill_form($form, $eventos);	
	}
	
	$view_params['form'] = $form;
	
	exibe_view($view_params);
?>