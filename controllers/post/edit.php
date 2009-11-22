<?php
	include_once 'includes/posts.inc';
	$form = include 'forms/post_form.frm';
	$id = $params[0];
	
	$post = load_post($id);
	$view_params['message'] = get_message();
	if(isset($_POST['titulo'])) {
		fill_form($form);
		if(validate_form($form)) {
			$post = form_to_simple_array($form);
			$post['id'] = $id;
			$post['ultima_atualizacao'] = date('c');
			if(save_post($post)) {
				redireciona_para("post/view/$id");
			} else {
				$view_params['message'] .= '<br />Nao foi possivel atualizar este post. Tente novamente.<br />' . get_last_error();
			}
		}
	} else {
		fill_form($form, $post);	
	}
	
	$view_params['form'] = $form;
	
	exibe_view($view_params);
?>