<?php
	valida_acesso_admin();
	if(isset($params[0]) && is_numeric($params[0])) {
		if(db_query('DELETE FROM item_menu WHERE id = ?', array($params[0]))) {
			redireciona_para('menu/add_item');
		} else {
			echo get_last_error();
		}
	} else {
		mostra_erro_http(404, 'Página não encontrada');
	}
?>