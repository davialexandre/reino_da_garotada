<?php
	include_once 'includes/posts.inc';
	
	exibe_view(array('posts' => load_posts(array('publicado=true'))));
?>