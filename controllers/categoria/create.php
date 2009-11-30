<?php
	include_once 'includes/posts.inc';
	
	$form = include 'forms/form_categoria.frm';
	
	$view_params = array();
	
	
	if(isset($_POST['nome'])) {
		fill_form($form);
		if(validate_form($form)) {
			$categoria = form_to_simple_array($form);
			if(!db_save_record('categoria', $categoria)) {
				$view_params['message'] = 'Não foi possível adicionar a categoria informada. Tente novamente.<br />Erro: ' . get_last_error();
			}
		}
	}
	
	$view_params['categorias'] = load_categorias(true);
	
	$view_params['form'] = $form;
	exibe_view($view_params);
?>