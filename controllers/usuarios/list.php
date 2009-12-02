<?php
	include_once 'includes/usuarios.inc';
	
	$total_usuarios = db_fetch_column(db_query('SELECT COUNT(id) FROM usuarios'));
	
	$pagina_atual = isset($_GET['page']) ? $_GET['page'] - 1 : 0;
	$from = $pagina_atual * 4;
	$usuarios = load_usuarios($from, 4);
	
	$pager = create_pager($total_usuarios, 4);
	
	exibe_view(array('form' => $form, 'usuarios' => $usuarios, 'pager' => $pager));
?>