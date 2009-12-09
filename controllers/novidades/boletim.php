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
	
	if(isset($params[0])) {
		$post = load_post($params[0]);
		if(isset($post['id'])) {
			set_page_title($post['titulo'] . ' | Reino da Garotada');
			$post['corpo'] = $post['corpo'];
			$categorias = load_categorias_post($post['id']);
			$comentarios = load_post_comments($post['id']);
			set_breadcrumb(array_merge(set_breadcrumb(), array('Boletim' => 'index.php?r=novidades/boletim')));
			exibe_view(array('post' => $post, 'categorias' => $categorias, 'comentarios' => $comentarios, 'form_comentario' => $form_comentario, 'message' => get_message()));	
		} else {
			mostra_erro_http(404, 'Página não encontrada');
		}	
	} else {
		$cat_noticia = load_categoria('boletim');
		$sql = 'SELECT COUNT(p.id) FROM categoria_post pc ';
		$sql .= 'INNER JOIN post p on p.id = pc.id_post ';
		$sql .= 'WHERE pc.id_categoria = ? AND p.publicado = true';
		$total_posts = db_fetch_column(db_query($sql, array($cat_noticia['id'])));
	
		$pagina_atual = isset($_GET['page']) ? $_GET['page'] - 1 : 0;
		$from = $pagina_atual * POSTS_PER_PAGE;
	
		$pager = create_pager($total_posts, POSTS_PER_PAGE);
		$posts = load_posts_categoria($cat_noticia['id'], $from, POSTS_PER_PAGE, array('p.publicado = true'));
		exibe_view(array('posts' => $posts, 'pager' => $pager));
	}
	
?>