<?php
	return array(
		'name' => 'fale_conosco',
		'fale_conosco' => array(
			'label' => 'Fale Conosco',
			'nome' => array(
				'type' => 'text',
				'label' => 'Seu nome: ',
				'rules' => array(
					array('type' => 'required', 'message' => 'Este campo é obrigatório'),
				)
			),
			'email' => array(
				'type' => 'text',
				'label' => 'Seu e-mail: ',
				'rules' => array(
					array('type' => 'required', 'message' => 'Este campo é obrigatório'),
					array('type' => 'email', 'message' => 'Este não é um e-mail válido'),
				)
			),
			'assunto' => array(
				'type' => 'text',
				'label' => 'Assunto da mensagem: ',
				'rules' => array(
					array('type' => 'required', 'message' => 'Este campo é obrigatório'),
				)
			),
			'mensagem' => array(
				'type' => 'textarea',
				'label' => 'Mensagem: ',
				'rules' => array(
					array('type' => 'required', 'message' => 'Este campo é obrigatório'),
				)
			)
		),
		'submit' => array(
			'type' => 'submit',
			'attributes' => array(
				'value' => 'Enviar',
			)
		)
		
	)
?>