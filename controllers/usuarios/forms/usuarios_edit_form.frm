<?php
	return array(
		'name' => 'editar_usuarios_form',
		'editar_usuarios' => array(
			'label' => 'Editar Usuários: ',
			'nome' => array(
				'label' => 'Nome: ',
				'type' => 'text',
				'rules' => array(
					array('type' => 'required', 'message' => 'Você deve informar o nome do usuário'),
				)
			),
			'login' => array(
				'label' => 'Login: ',
				'type' => 'text',
				'rules' => array(
					array('type' => 'required', 'message' => 'Você deve informar o login do usuário'),
				)
			),
			'email' => array(
				'label' => 'E-Mail: ',
				'type' => 'text',
				'rules' => array(
					array('type' => 'required', 'message' => 'Você deve informar detalhes sobre o evento',
					      'type' => 'email', 'message' => 'Você deve informar um e-mail válido')
				)
			),
			'senha' => array(
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
				'value' => 'Editar usuário',
			)
		)
	);
?>