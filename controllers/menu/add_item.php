<?php
	include_once 'includes/menu.inc';
	
	$form = include_once 'forms/menu_form.frm';
	
	if(isset($_POST['titulo'])) {
		fill_form($form);
		if(validate_form($form)) {
			$menu = form_to_simple_array($form);
			if(!db_save_record('item_menu', $menu)) {
				set_message(get_last_error());
			}
		}
	}
	
	$result = db_query('SELECT * FROM item_menu');
	$item_superior_options = array();
	
	while($row = db_fetch_row($result)) {
		$item_superior_options[$row['id']] = $row['titulo'];
	}
	
	$form['item_menu']['item_superior']['options'] = $item_superior_options;
	
	$menu = get_menu();
	
	exibe_view(array('form' => $form, 'menu_itens' => $item_superior_options, 'message' => get_message(), 'menu' => $menu));
?>