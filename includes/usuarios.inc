<?php
	
	function save_usuarios($usuario) {
		if(isset($usuario['id'])) {
			return db_update_record('usuario', $usuario, array('id' => $usuario['id']));
		} else {
			return db_save_record('usuario', $usuario);	
		}
	}

	function load_usuarios($id) {
		$sql = 'SELECT * FROM usuario WHERE id = ?';
		$usuario = db_fetch_row(db_query($sql, array($id)));
		
		return $usuario;
	}

?>