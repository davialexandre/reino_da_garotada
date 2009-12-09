<?php
	return array(
		'name' => 'comment_form',
		'adicionar_comentario' => array(
			'label' => 'Adicionar Comentário: ',
			'nome_autor' => array(
				'label' => 'Nome: ',
				'type' => 'text',
				'rules' => array(
					array('type' => 'required', 'message' => 'Você deve informar o seu nome'),
				)
			),
			'email_autor' => array(
				'label' => 'E- mail: ',
				'type' => 'text',
				'rules' => array(
					array('type' => 'required', 'message' => 'Você deve informar seu endereço de e-mail'),
					array('type' => 'email', 'message' => 'Você deve informar um endereço de e-mail válido'),
				)
			),
			'titulo' => array(
				'label' => 'Título: ',
				'type' => 'text',
			),
			'texto' => array(
				'label' => 'Comentário: ',
				'type' => 'textarea',
				'cols' => 40,
				'rows' => 6,
				'rules' => array(
					array('type' => 'required', 'message' => 'O comentário não pode ser vazio'),
				)
			)
		),
		'id_post' => array(
			'type' => 'hidden',
			'attributes' => array(
				'value' => isset($params[0]) ? $params[0] : null,
			)
		),
		'submit' => array(
			'type' => 'submit',
			'attributes' => array(
				'value' => 'Adicionar comentário',
			)
		)
	)
?>