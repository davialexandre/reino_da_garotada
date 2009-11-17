<?php
	
	include 'includes/posts.inc';
	$form = array(
		'method' => 'post',
		'name' => 'criar_post',
		'criar_post' => array(
			'label' => 'Criar nova postagem',
			'titulo' => array(
				'label' => 'Título do post: ',
				'type' => 'text',
				'maxlength' => 100,
				'rules' => array(
					array('type' => 'required', 'message' => 'Este campo é obrigatório'),
				)
			),
			'chamada' => array(
				'label' => 'Chamada para a postagem: ',
				'type' => 'textarea',
				'cols' => 100,
				'rows' => 4,
			),
			'corpo' => array(
				'label' => 'Texto da postagem: ',
				'type' => 'textarea',
				'cols' => 100,
				'rows' => 50,
				'rules' => array(
					array('type' => 'required', 'message' => 'Este campo é obrigatório'),
				)
			),
		),
		'opcoes_publicacao' => array(
			'label'	=> 'Opções de publicação: ',
			'publicado' => array(
				'label' => 'Publicar? ',
				'type' => 'checkbox'
			),
			'destacado' => array(
				'label' => 'Destacar no topo da listagem? ',
				'type' => 'checkbox',
			)
		),
		'submit' => array(
			'type' => 'submit',
			'attributes' => array(
				'value' => 'Enviar',
			),
		),
	);
	
	if(isset($_POST['titulo'])) {
		fill_form($form);
		if(validate_form($form)) {
			$post = form_to_simple_array($form);
			$post['id_autor'] = 1;
			if(!save_post($post)) {
				echo 'dasdsadasdas';
			} else {
				echo 'POST SALVO COM SUCESSO!';
			}
		}
	}
	
	exibe_view(array('form' => $form));
?>