<?php
	
	define('USUARIOS_PER_PAGE', 10);
        
	function save_usuarios($usuario) {
		if(isset($usuario['id'])) {
			return db_update_record('usuario', $usuario, array('id' => $usuario['id']));
		} else {
			return db_save_record('usuario', $usuario);	
		}
	}

	function load_usuario($id) {
		$sql = 'SELECT * FROM usuario WHERE id = ?';
		$usuario = db_fetch_row(db_query($sql, array($id)));
		
		return $usuario;
	}
        
	function load_usuarios($from = 0, $count = USUARIOS_PER_PAGE, $conditions = null, $full = true) {
		$where_clause = '';
		$params = array();
		if(is_array($conditions)) {
			$where_clause = 'WHERE ' . implode(' ', $conditions);
		}
		$fields = $full ? '*' : 'id, nome, login, email, data_ultimo_acesso';
		
		$sql = "SELECT $fields FROM usuario $where_clause";
		
		$usuarios = db_fetch_all(db_query_range($sql, $from, $count));

		return $usuarios;
	}

?>