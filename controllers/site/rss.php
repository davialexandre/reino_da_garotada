<?php
	include_once 'includes/posts.inc';
	$posts = load_posts(0, 30, array('publicado = true'));
	exibe_view(array('posts' => $posts), 'rss');
?>