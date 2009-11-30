<?php
	if(isset($params[0])) {
		$sql = 'DELETE FROM categoria WHERE id=?';
		db_query($sql, array($params[0]));
	} else {
		mostra_erro_http(404, 'Página não encontrada');
	}
?>