<?php
	return array(
		'name' => 'usuario_form',
		'adicionar_usuario' => array(
			'label' => 'Adicionar Usuário: ',
			'nome_usuario' => array(
				'label' => 'Nome: ',
				'type' => 'text',
				'rules' => array(
					array('type' => 'required', 'message' => 'Você deve informar o nome do usuário'),
				)
			),
			'label' => 'Login: ',
			'login_usuario' => array(
				'label' => 'Login: ',
				'type' => 'text',
				'rules' => array(
					array('type' => 'required', 'message' => 'Você deve informar o login'),
				)
			),
			'email_usuario' => array(
				'label' => 'E-mail: ',
				'type' => 'text',
				'rules' => array(
					array('type' => 'required', 'message' => 'Você deve informar seu endereço de e-mail'),
					array('type' => 'email', 'message' => 'Você deve informar um endereço de e-mail válido'),
				)
			),
                        'senha_usuario' => array(
				'label' => 'Senha: ',
				'type' => 'password',
				'rules' => array(
					array('type' => 'required', 'message' => 'Você deve informar uma senha válida'),
				)
			),
		),
		'submit' => array(
			'type' => 'submit',
			'attributes' => array(
				'value' => 'Adicionar usuário',
			)
		)
	)
?>