<?php
	return array(
		'name' => 'form_login',
		'login' => array(
			'label' => 'Efetuar Login',
			'username' => array(
				'type' => 'text',
				'label' => 'Nome de usuário: ',
				'rules' => array(
					array('type' => 'required', 'message' => 'Você deve informar o seu nome de usuário'),
				)
			),
			'password' => array(
				'type' => 'password',
				'label' => 'Senha: ',
				'rules' => array(
					array('type' => 'required', 'message' => 'Você deve informar a sua senha'),
				)
			)
		),
		'submit' => array(
			'type' => 'submit',
			'attributes' => array(
				'value' => 'Entrar',	
			)
		)
	)
?>