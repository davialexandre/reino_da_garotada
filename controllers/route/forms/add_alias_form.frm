<?php
	return array(
		'name' => 'add_alias',
		'adicionar' => array(
			'label' => 'Criar novo alias',
			'route' => array(
				'type' => 'text',
				'label' => 'Rota: ',
				'rules' => array(
					array('type' => 'required', 'message' => 'Este campo é obrigatório'),
				)
			),
			'alias' => array(
				'type' => 'text',
				'label' => 'Alias: ',
				'rules' => array(
					array('type' => 'required', 'message' => 'Este campo é obrigatório'),
				)
			)
		),
		'submit' => array(
			'type' => 'submit',
			'attributes' => array(
				'value' => 'Adicionar alias',
			)
		)
	);
?>