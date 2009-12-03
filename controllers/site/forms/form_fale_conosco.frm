<?php
	return array(
		'name' => 'fale_conosco',
		'fale_conosco' => array(
			'label' => 'Fale Conosco',
			'nome' => array(
				'type' => 'text',
				'label' => 'Seu nome: ',
				'rules' => array(
					array('type' => 'required', 'message' => 'Este campo e obrigatorio'),
				)
			),
			'email' => array(
				'type' => 'text',
				'label' => 'Seu e-mail: ',
				'rules' => array(
					array('type' => 'required', 'message' => 'Este campo e obrigatorio'),
					array('type' => 'email', 'message' => 'Este nao e um e-mail valido'),
				)
			),
			'assunto' => array(
				'type' => 'text',
				'label' => 'Assunto da mensagem: ',
				'rules' => array(
					array('type' => 'required', 'message' => 'Este campo e obrigatorio'),
				)
			),
			'mensagem' => array(
				'type' => 'textarea',
				'label' => 'Mensagem: ',
				'rules' => array(
					array('type' => 'required', 'message' => 'Este campo e obrigatorio'),
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