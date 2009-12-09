<?php
	valida_acesso_admin();
	
	$form = include_once('forms/add_alias_form.frm');
	
	if(isset($_POST['route'])) {
		fill_form($form);
		if(validate_form($form)) {
			$route_alias = form_to_simple_array($form);
			db_save_record('route_alias', $route_alias);
		}
	}
	
	$aliases = db_fetch_all(db_query('SELECT * FROM route_alias'));
	
	exibe_view(array('form' => $form, 'aliases' => $aliases), 'admin');
?>