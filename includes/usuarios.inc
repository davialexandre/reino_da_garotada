<?php
	
	function save_usuarios($usuario) {
		if(isset($usuario['nome'])) {
			return db_save_record('usuario', $usuario);
		}
	}

	function load_usuario($id) {
		$sql = 'SELECT * FROM usuario WHERE id = ?';
		$usuario = db_fetch_row(db_query($sql, array($id)));
		
		return $usuario;
	}

?>