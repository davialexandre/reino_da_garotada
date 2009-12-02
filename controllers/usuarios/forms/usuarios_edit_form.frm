<?php
	return array(
		'name' => 'eventos_form',
		'editar_eventos' => array(
			'label' => 'Editar Evento: ',
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
					array('type' => 'required', 'message' => 'Você deve informar a data do evento'),
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