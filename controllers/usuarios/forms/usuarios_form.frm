<?php
	return array(
		'name' => 'usuarios_form',
		'adicionar_usuarios' => array(
			'label' => 'Adicionar Usuários: ',
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
			'evento' => array(
				'label' => 'Evento: ',
				'type' => 'text',
				'rules' => array(
					array('type' => 'required', 'message' => 'Você deve informar detalhes sobre o evento'),
				)
			),
		),
                'submit' => array(
			'type' => 'submit',
			'attributes' => array(
				'value' => 'Editar evento',
			)
		)
	)
?>