<?php
	valida_acesso_admin();
	
	include_once 'includes/posts.inc';
	
	if(isset($params[0])) {
		$pagina_atual = isset($_GET['page']) ? $_GET['page'] - 1 : 0;
		$categoria = load_categoria($params[0]);
		$total_posts = db_fetch_column(db_query('SELECT COUNT(id_post) FROM categoria_post WHERE id_categoria = ?', array($categoria['id'])));
		$from = $pagina_atual * POSTS_PER_PAGE;
		$posts = load_posts_categoria($categoria['id'], $from, POSTS_PER_PAGE);
		$pager = create_pager($total_posts, POSTS_PER_PAGE);
		exibe_view(array('posts' => $posts, 'categoria' => $categoria, 'pager' => $pager), 'admin');
	} else {
		mostra_erro_http(404, 'Pagina nao encontrada');
	}
?>