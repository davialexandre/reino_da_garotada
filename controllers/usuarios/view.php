<?php
	include_once 'includes/eventos.inc';
	
	$evento = db_fetch_column(db_query('SELECT id,titulo,data,evento FROM eventos'));
	
	$evento = load_evento(0, 4);
	
	exibe_view(array('eventos' => $eventos));
?>