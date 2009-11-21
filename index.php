<?php
	include 'settings.php';
	include 'includes/utils.inc';
	include 'includes/db.inc';
	include 'includes/form.inc';
	
	init_db($db_config['servidor'], $db_config['dbname'], $db_config['username'], $db_config['password']);
	
	$rota = resolve_rota();

	executa_rota($rota);
?>