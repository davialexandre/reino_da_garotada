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
			
			if($post['id'] = save_post($post)) {
				set_message('Post criado! <a href="?r=post/view/'. $post['id'] .'" >Clique aqui para visualizar</a>');
				redireciona_para('post/edit/'.$post['id']);
			} else {
				$message = 'Não foi possível salvar o post. Tente novamente.';
			}
		}
	}
	
	add_javascript('js/ckeditor/ckeditor.js');
	set_page_title('Criar novo post | Reino da Garotada');
	
	exibe_view(array('form' => $form, 'message' => $message), 'admin');
?>