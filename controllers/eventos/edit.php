<?php
	valida_acesso_admin();
	include_once 'includes/eventos.inc';
	$form = include 'forms/eventos_edit_form.frm';
	$id = $params[0];
	
	$evento = load_evento($id);
	$evento['data'] = date('d/m/Y', strtotime($evento['data']));
	$view_params['message'] = get_message();
	if(isset($_POST['titulo'])) {
		fill_form($form);
		if(validate_form($form)) {
			$evento = form_to_simple_array($form);
			$evento['id'] = $id;
			if(save_evento($evento)) {
				redireciona_para("eventos/list");
			} else {
				$view_params['message'] .= '<br />Nao foi possivel editar este evento. Tente novamente.<br />' . get_last_error();
			}
		}
	} else {
		fill_form($form, $evento);	
	}
	
	$view_params['form'] = $form;
	
	add_javascript('js/jquery-ui/ui/jquery-ui-1.7.2.custom.js');
	
	exibe_view(($view_params), 'admin');
?>