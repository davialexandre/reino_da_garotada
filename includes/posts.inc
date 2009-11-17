<?php
	
	function load_post($id) {
		$sql = 'SELECT * FROM post WHERE id = ?';
		$post = db_fetch_row(db_query($sql, array($id)));
		
		return $post;
	}
	
	function save_post($post) {
		return db_save_record('post', $post);
	}
	
?>