<?php
	valida_acesso_admin();
	
	include_once 'includes/posts.inc';
	
	$total_posts = db_fetch_column(db_query('SELECT COUNT(id) FROM post'));
	
	$pagina_atual = isset($_GET['page']) ? $_GET['page'] - 1 : 0;
	$from = $pagina_atual * POSTS_PER_PAGE;
	$posts = load_posts($from, POSTS_PER_PAGE);
	
	$pager = create_pager($total_posts, POSTS_PER_PAGE);
	
	exibe_view(array('posts' => $posts, 'pager' => $pager), 'admin');
?>