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
		
		return $post;
	}
	
	function load_posts($conditions = null, $full = true, $from = 0, $count = POSTS_PER_PAGE) {
		$where_clause = '';
		$params = array();
		if(is_array($conditions)) {
			$where_clause = 'WHERE ' . implode(' ', $conditions);
		}
		$fields = $full ? '*' : 'id, titulo, chamada, id_autor, data_atualizacao';
		
		$sql = "SELECT $fields FROM post $where_clause";
		
		$posts = db_fetch_all(db_query_range($sql, 0, POSTS_PER_PAGE));
		
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
		if(isset($post['id'])) {
			return db_update_record('post', $post, array('id' => $post['id']));
		} else {
			return db_save_record('post', $post);	
		}
	}
	
?>