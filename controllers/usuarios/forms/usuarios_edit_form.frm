<?php
	return array(
		'name' => 'usuarios_form',
		'editar_usuario' => array(
			'label' => 'Adicionar Usu�rio: ',
			'nome' => array(
				'label' => 'Nome: ',
				'type' => 'text',
				'rules' => array(
					array('type' => 'required', 'message' => 'Voc� deve informar o nome do usu�rio'),
				)
			),
			'label' => 'Login: ',
			'login' => array(
				'label' => 'Login: ',
				'type' => 'text',
				'rules' => array(
					array('type' => 'required', 'message' => 'Voc� deve informar o login'),
				)
			),
			'email' => array(
				'label' => 'E-mail: ',
				'type' => 'text',
				'rules' => array(
					array('type' => 'required', 'message' => 'Voc� deve informar seu endere�o de e-mail'),
					array('type' => 'email', 'message' => 'Voc� deve informar um endere�o de e-mail v�lido'),
				)
			),
                        'senha' => array(
				'label' => 'Senha: ',
				'type' => 'password',
				'rules' => array(
					array('type' => 'required', 'message' => 'Voc� deve informar uma senha v�lida'),
				)
			),
		),
                'submit' => array(
			'type' => 'submit',
			'attributes' => array(
				'value' => 'Editar usu�rio',
			)
		)
	)
?>