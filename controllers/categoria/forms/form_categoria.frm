<?php
	return array(
		'name' => 'form_categoria',
		'adicionar_categoria' => array(
			'label' => 'Adicionar Categoria: ',
			'nome' => array(
				'type' => 'text',
				'label' => 'Nome da categoria: ',
				'rules' => array(
					array('type' => 'required', 'message' => 'Este campo e obrigatorio'),
				)
			),
			'descricao' => array(
				'type' => 'textarea',
				'label' => 'Descriçao da categoria: ',
				'rows' => 4,
			)
		),
		'submit' => array(
			'type' => 'submit',
			'attributes' => array(
				'value' => 'Adicionar categoria',
			)
		)
	);
?>