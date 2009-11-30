<?php
	include_once 'includes/posts.inc';
	
	if(isset($params[0])) {
		$categoria = load_categoria($params[0]);
		$posts = load_posts_categoria($categoria['id']);
		exibe_view(array('posts' => $posts, 'categoria' => $categoria));
	} else {
		mostra_erro_http(404, 'Pagina nao encontrada');
	}
?>