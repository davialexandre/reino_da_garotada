<?php
	
	include 'includes/posts.inc';
	
	$form = include 'forms/post_form.frm';
	
	$categorias = load_categorias();
	
	$categorias_options = array();
	
	foreach($categorias as $categoria) {
		$categorias_options[$categoria['id']] = $categoria['nome'];
	}
	
	$form['criar_post']['categorias']['options'] = $categorias_options;
	
	$message = '';
	if(isset($_POST['titulo'])) {
		fill_form($form);
		if(validate_form($form)) {
			$post = form_to_simple_array($form);
			$post['id_autor'] = 1;
			
			if(save_post($post)) {
				$post['id'] = db_last_insert_id();
				set_message('Post criado! <a href="?r=post/view/'. $post['id'] .'" >Clique aqui para visualizar</a>');
				redireciona_para('post/edit/'.db_last_insert_id());
			} else {
				$message = 'Não foi possível salvar o post. Tente novamente.';
			}
		}
	}
	
	exibe_view(array('form' => $form, 'message' => $message));
?>