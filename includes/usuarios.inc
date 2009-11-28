<?php
	
	function create_usuarios($usuarios){
		if(isset($usuarios['nome_usuarios'])) {
			return db_save_record('usuario', $usuarios);	
		}
	}
	
?>