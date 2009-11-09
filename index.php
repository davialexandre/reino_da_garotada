<?php
	include 'settings.php';
	include 'includes/utils.inc';
	include 'includes/db.inc';
	
	$rota = resolve_rota();
	
	executa_rota($rota);
?>