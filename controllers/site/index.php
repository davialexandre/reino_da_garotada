<?php
	include_once 'includes/posts.inc';
	include_once 'includes/eventos.inc';
	
	$cat_noticia = load_categoria('noticias');
	$ultimas_noticias = load_posts_categoria($cat_noticia['id'], 0, 4, array('p.publicado = true'));
	$ultimos_eventos = load_eventos(0, 3);
	exibe_view(array('ultimas_noticias' => $ultimas_noticias, 'ultimos_eventos' => $ultimos_eventos), 'home');
?>