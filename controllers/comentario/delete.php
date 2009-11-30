<?php
	if(isset($params[0])) {
		db_query('DELETE FROM comentario WHERE id = ?', array($params[0]));
		redireciona_para('comentario/list');
	} else {
		mostra_erro_http(404, 'Página não encontrada');
	}
?>