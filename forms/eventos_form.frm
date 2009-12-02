<?php
	return array(
		'name' => 'adicionar_eventos_form',
		'adicionar_eventos' => array(
			'label' => 'Editar Eventos: ',
			'titulo' => array(
				'label' => 'Título: ',
				'type' => 'text',
				'rules' => array(
					array('type' => 'required', 'message' => 'Você deve informar o título do evento'),
				)
			),
			'data' => array(
				'label' => 'Data: ',
				'type' => 'text',
				'rules' => array(
					array('type' => 'required', 'message' => 'Você deve informar a data do Evento'),
				)
			),
			'evento' => array(
				'label' => 'Evento: ',
				'type' => 'text',
				'rules' => array(
					array('type' => 'required', 'message' => 'Você deve informar detalhes sobre o evento')
				)
			),
		),
                'submit' => array(
			'type' => 'submit',
			'attributes' => array(
				'value' => 'Adicionar evento',
			)
		)
	);
?>