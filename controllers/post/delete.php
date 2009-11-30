<?php
	if(isset($params[0])) {
		db_query('DELETE FROM post WHERE id = ?', array($params[0]));
		redireciona_para('post/list');
	} else {
		mostra_erro_http(404, 'Página não encontrada');
	}
?>