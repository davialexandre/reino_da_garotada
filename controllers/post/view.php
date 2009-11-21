<?php
	include 'includes/posts.inc';
	$post = load_post($params[0]);
	$post['corpo'] = newline_to_br($post['corpo']);
	exibe_view(array('post' => $post));
?>