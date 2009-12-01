<?php
	include_once 'includes/eventos.inc';
	$id = $params[0];
	
	$eventos = load_evento($id);
	
	exibe_view(array('eventos' => $eventos), 'admin');
	
?>