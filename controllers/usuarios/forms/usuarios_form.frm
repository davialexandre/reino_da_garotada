<?php
	return array(
		'name' => 'usuarios_form',
		'adicionar_usuarios' => array(
			'label' => 'Adicionar Usu�rios: ',
			'nome' => array(
				'label' => 'Nome: ',
				'type' => 'text',
				'rules' => array(
					array('type' => 'required', 'message' => 'Voc� deve informar o nome do usu�rio'),
				)
			),
			'login' => array(
				'label' => 'Login: ',
				'type' => 'text',
				'rules' => array(
					array('type' => 'required', 'message' => 'Voc� deve informar o login do usu�rio'),
				)
			),
			'evento' => array(
				'label' => 'Evento: ',
				'type' => 'text',
				'rules' => array(
					array('type' => 'required', 'message' => 'Voc� deve informar detalhes sobre o evento'),
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