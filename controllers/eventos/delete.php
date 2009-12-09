<?php
	valida_acesso_admin();
	if(isset($params[0])) {
		$sql = 'DELETE FROM eventos WHERE id=?';
		db_query($sql, array($params[0]));
		redireciona_para('eventos/list');
	} else {
		mostra_erro_http(404, 'Página não encontrada');
	}
?>