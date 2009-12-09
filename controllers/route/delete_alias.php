<?php
	valida_acesso_admin();
	
	if(isset($params[0]) && is_numeric($params[0])) {
		if(db_query('DELETE FROM route_alias WHERE id = ?', array($params[0]))) {
			redireciona_para('route/add_alias');
		} else {
			echo get_last_error();
		}
	} else {
		mostra_erro_http(404, 'Página não encontrada');
	}
?>