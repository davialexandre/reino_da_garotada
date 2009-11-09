<?php
	verifica_permissao('editar postsda');
	$pessoas = array(
		array(
			'nome' => 'Davi',
			'idade' => 23,
		),
		array(
			'nome' => 'Karina',
			'idade' => 23,
		)
	);
	
	exibe_view(array('pessoas' => $pessoas));
?>