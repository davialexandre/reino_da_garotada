<?php
	include_once 'includes/eventos.inc';
	
	$total_eventos = db_fetch_column(db_query('SELECT COUNT(id) FROM eventos'));
	
	$pagina_atual = isset($_GET['page']) ? $_GET['page'] - 1 : 0;
	$from = $pagina_atual * EVENTOS_PER_PAGE;
	$eventos = load_eventos($from, EVENTOS_PER_PAGE);
	
	$pager = create_pager($total_eventos, EVENTOS_PER_PAGE);
	
	exibe_view(array('eventos' => $eventos, 'pager' => $pager));
?>