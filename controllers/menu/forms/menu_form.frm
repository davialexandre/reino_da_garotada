<?php
	return array(
		'name' => 'menu_item',
		'item_menu' => array(
			'label' => 'Item de Menu',
			'titulo' => array(
				'type' => 'text',
				'label' => 'Titulo: ',
				'rules' => array(
					array('type' => 'required', 'message' => 'Este campo e obirgatorio'),
				)
			),
			'endereco' => array(
				'type' => 'text',
				'label' => 'Endereço: ',
				'rules' => array(
					array('type' => 'regex', 'regex' => '/index\.php\?r=.+?(\/.+?)?\/?/', 'message' => 'Este endereço nao esta em um formato valido'),
				)
			),
			'descricao' => array(
				'type' => 'textarea',
				'label' => 'Descriçao: ',
				'cols' => 30,
				'rows' => 3,
			),
			'item_superior' => array(
				'type' => 'dropdownlist',
				'label' => 'Item superior: ',
				'prompt' => '',
				'options' => array(),
			)
		),
		'submit' => array(
			'type' => 'submit',
			'attributes' => array(
				'value' => 'Adicionar',
			)
		)
	);
?>