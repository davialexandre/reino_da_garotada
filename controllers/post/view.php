<?php
	include 'includes/posts.inc';
	
	$form_comentario = include_once 'forms/comment_form.frm';
	
	if(isset($_POST['id_post'])) {
		fill_form($form_comentario);
		if(validate_form($form_comentario)) {
			$comentario = form_to_simple_array($form_comentario);
			if(db_save_record('comentario', $comentario)) {
				set_message('Comentário adicionado!');
			} else {
				set_message('Não foi possível adicionar o comentário' . get_last_error());
			}
		}
	}
	
	$post = load_post($params[0]);
	$post['corpo'] = newline_to_br($post['corpo']);
	$comentarios = load_comments($post['id']);
	exibe_view(array('post' => $post, 'comentarios' => $comentarios, 'form_comentario' => $form_comentario, 'message' => get_message()));
?>