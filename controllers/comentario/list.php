<?php
	
	define('COMMENTS_PER_PAGE', 20);

	$sql = "SELECT c.*, p.titulo as 'titulo_post' FROM comentario c INNER JOIN post p ON c.id_post = p.id ORDER BY c.data_criacao DESC";
	$total_comentarios = db_fetch_column(db_query('SELECT COUNT(id) FROM comentario'));
	$pagina_atual = isset($_GET['page']) ? $_GET['page'] - 1 : 0;
	$from = $pagina_atual * COMMENTS_PER_PAGE;
	$comentarios = db_query_range($sql, $from, COMMENTS_PER_PAGE);
	
	$pager = create_pager($total_comentarios, COMMENTS_PER_PAGE);
	
	exibe_view(array('comentarios' => $comentarios, 'pager' => $pager), 'admin');
?>