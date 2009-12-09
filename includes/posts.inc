<?php
	
	define('POSTS_PER_PAGE', 20);
	
	/**
	 * Retorna um vetor com o Post, referente ao ID informado.
	 *
	 * @param int $id
	 *  O ID do post.
	 *
	 * @return array
	 *  Um vetor contendo o post, referente ao ID informado. As chaves são os
	 *  nomes dos campos no banco de dados.
	 */
	function load_post($id) {
		$sql = 'SELECT * FROM post WHERE id = ?';
		$post = db_fetch_row(db_query($sql, array($id)));
		$post['categorias'] = implode(',', array_keys(load_categorias_post($id)));
		return $post;
	}
	
	function load_posts($from = 0, $count = POSTS_PER_PAGE, $conditions = null, $full = true) {
		$where_clause = '';
		if(is_array($conditions)) {
			$where_clause = 'WHERE ' . implode(' ', $conditions);
		}
		$fields = $full ? '*' : 'id, titulo, chamada, id_autor, data_atualizacao';
		
		$sql = "SELECT $fields FROM post $where_clause ORDER BY destacado DESC, data_criacao DESC";
		
		$posts = db_fetch_all(db_query_range($sql, $from, $count));

		return $posts;
	}
	
	function load_posts_categoria($id_categoria, $from = 0, $count = POSTS_PER_PAGE, $conditions = null, $full = true) {
		$where_clause = '';
		$conditions[] = 'c.id_categoria = ?';
		if(is_array($conditions)) {
			$where_clause = implode(' AND ', $conditions);
		}
		
		$fields = $full ? 'p.*' : 'p.id, p.titulo, p.chamada, p.id_autor, p.data_atualizacao';
		
		$sql = "SELECT $fields FROM categoria_post c INNER JOIN post p ON p.id = c.id_post";
		$sql .= ' WHERE ' . $where_clause;
		$sql .= ' ORDER BY p.destacado DESC, p.data_criacao DESC';
		
		$posts = db_fetch_all(db_query_range($sql, $from, $count, array($id_categoria)));
		
		return $posts;
	}
	
	/**
	 * Salva as alterações de um post.
	 *
	 * Caso seja um novo registro (não possui o atributo id), o post será adicionado
	 * ao banco. Caso já exista, ele será atualizado.
	 *
	 * @param array $post
	 *   Um vetor, onde as chaves são os nomes dos campos, apontando para os valores
	 *   que deverão ser armazenados.
	 *
	 * @return bool
	 *   TRUE caso a operação ocorra com sucesso. FALSE caso ocorra alguma falha.
	 */
	function save_post($post) {
		$categorias = explode(',', $post['categorias']);
		unset($post['categorias']);
		if(isset($post['id'])) {
			$post_salvo = db_update_record('post', $post, array('id' => $post['id']));
		} else {
			$post_salvo = db_save_record('post', $post);
			$post['id'] = db_last_insert_id();
		}
		
		if($post_salvo && save_categorias_post($post['id'], $categorias)) {
			return $post['id'];
		} else {
			return false;
		}
	}
	
	function save_categorias_post($id_post, $categorias) {
		db_query('DELETE FROM categoria_post WHERE id_post = ?', array($id_post));
		
		$categorias_salvadas = true;
		
		foreach($categorias as $id_categoria) {
			$record['id_post'] = $id_post;
			$record['id_categoria'] = $id_categoria;
			$categorias_salvadas = $categorias_salvadas && db_save_record('categoria_post', $record);
		}
		
		return $categorias_salvadas;
	}
	
	
	function load_post_comments($post_id) {
		$sql = 'SELECT * FROM comentario WHERE id_post=?';
		return db_fetch_all(db_query($sql, array($post_id)));
	}
	
	
	function load_categorias_post($post_id) {
		$sql = 'SELECT id_categoria FROM categoria_post WHERE id_post=?';
		$result = db_query($sql, array($post_id));
		$ids_categorias = array();
		while($id = db_fetch_column($result)) {
			$ids_categorias[] = $id;
		}
		
		$sql = 'SELECT id, nome FROM categoria WHERE id IN ('.implode(',', $ids_categorias).')';
		$result = db_query($sql);
		$categorias = array();
		while($categoria = db_fetch_row($result)) {
			$categorias[$categoria['id']] = $categoria['nome'];
		}
		
		return $categorias;
	}
	
	function load_categoria($categoria) {
		return db_fetch_row(db_query('SELECT * FROM categoria WHERE nome = ?', array($categoria)));
	}
	
	function load_categorias($full=false) {
		$fields = $full ? '*' : 'id, nome';
		$sql = "SELECT $fields FROM categoria";
		
		$result = db_query($sql);
		$categorias = array();
		$categorias = db_fetch_all($result);
		
		return $categorias;
	}
	
?>