<?php
	include 'settings.php';
	include 'includes/utils.inc';
	include 'includes/db.inc';
	include 'includes/form.inc';
	include 'includes/menu.inc';
	setlocale(LC_TIME, "pt_BR", "pt_BR.iso-8859-1", "pt_BR.utf-8", "portuguese");
	init_db($db_config['servidor'], $db_config['dbname'], $db_config['username'], $db_config['password']);
	session_start();
	
	$rota = resolve_rota();
	
	executa_rota($rota);
?>