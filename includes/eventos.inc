<?php
	
	define('EVENTOS_PER_PAGE', 10);
        
	function save_eventos($eventos) {
		if(isset($eventos['id'])) {
			return db_update_record('eventos', $eventos, array('id' => $eventos['id']));
		} else {
			return db_save_record('eventos', $eventos);	
		}
	}

	function load_evento($id) {
		$sql = 'SELECT * FROM eventos WHERE id = ?';
		$eventos = db_fetch_row(db_query($sql, array($id)));
		
		return $eventos;
	}
        
	function load_eventos($from = 0, $count = EVENTOS_PER_PAGE, $conditions = null, $full = true) {
		$where_clause = '';
		$params = array();
		if(is_array($conditions)) {
			$where_clause = 'WHERE ' . implode(' ', $conditions);
		}
		$fields = $full ? '*' : 'id, titulo, data, evento';
		
		$sql = "SELECT $fields FROM eventos $where_clause";
		
		$eventos = db_fetch_all(db_query_range($sql, $from, $count));

		return $eventos;
	}

?>