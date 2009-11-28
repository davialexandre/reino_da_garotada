<?php
	return array(
		'name' => 'usuario_form',
		'adicionar_usuario' => array(
			'label' => 'Adicionar Usuário: ',
			'nome_usuarios' => array(
				'label' => 'Nome: ',
				'type' => 'text',
				'rules' => array(
					array('type' => 'required', 'message' => 'Você deve informar o nome do usuário'),
				)
			),
			'label' => 'Login: ',
			'login_usuarios' => array(
				'label' => 'Login: ',
				'type' => 'text',
				'rules' => array(
					array('type' => 'required', 'message' => 'Você deve informar o login'),
				)
			),
			'email_usuarios' => array(
				'label' => 'E-mail: ',
				'type' => 'text',
				'rules' => array(
					array('type' => 'required', 'message' => 'Você deve informar seu endereço de e-mail'),
					array('type' => 'email', 'message' => 'Você deve informar um endereço de e-mail válido'),
				)
			),
                        'senha_usuarios' => array(
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