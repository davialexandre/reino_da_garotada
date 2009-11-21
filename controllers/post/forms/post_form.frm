<?php
	return $form = array(
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
?>