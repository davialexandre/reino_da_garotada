<?php
	include 'includes/posts.inc';
	
	$post = load_post(17);
	$post['corpo'] = nl2br($post['corpo']);
	exibe_view(array('post' => $post));
?>