<?php
	include_once 'includes/posts.inc';
	
	$total_posts = db_fetch_column(db_query('SELECT COUNT(id) FROM post'));
	
	$pagina_atual = isset($_GET['page']) ? $_GET['page'] - 1 : 0;
	$from = $pagina_atual * 4;
	$posts = load_posts($from, 4);
	
	$pager = create_pager($total_posts, 4);
	
	exibe_view(array('posts' => $posts, 'pager' => $pager));
?>