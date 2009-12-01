<?php
	include_once 'includes/eventos.inc';
	
	$total_eventos = db_fetch_column(db_query('SELECT COUNT(id) FROM eventos'));
	
	$pagina_atual = isset($_GET['page']) ? $_GET['page'] - 1 : 0;
	$from = $pagina_atual * 4;
	$eventos = load_eventos($from, 4);
	
	$pager = create_pager($total_eventos, 4);
	
	exibe_view(array('eventos' => $eventos, 'pager' => $pager), 'admin');
?>