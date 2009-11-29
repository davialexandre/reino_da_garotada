<?php
	
	function save_usuarios($usuario) {
		if(isset($usuario['nome'])) {
			return db_save_record('usuario', $usuario);
		}
	}
	
?>