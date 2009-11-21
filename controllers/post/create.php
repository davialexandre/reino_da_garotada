<?php
	
	include 'includes/posts.inc';
	$form = include 'forms/post_form.frm';
	$message = '';
	if(isset($_POST['titulo'])) {
		fill_form($form);
		if(validate_form($form)) {
			$post = form_to_simple_array($form);
			$post['id_autor'] = 1;
			if(save_post($post)) {
				redireciona_para('post/view/'.db_last_insert_id());
				//$message = 'Post criado! <a href="?r=post/view/'. db_last_insert_id() .'" >Clique aqui para visualizar</a>';
			} else {
				$message = 'Não foi possível salvar o post. Tente novamente.';
			}
		}
	}
	
	exibe_view(array('form' => $form, 'message' => $message));
?>