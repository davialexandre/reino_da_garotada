<?php
	global $db;
	global $last_eror;
	
	/**
	 * Inicia a conexão com o banco de dados
	 *
	 * @param string $servidor
	 * 	O endereço do servidor de banco de dados
	 * 	
	 * @param string $database
	 *  O nome da base de dados
	 *
	 * @param string $username
	 *  O nome de usuário utilizado para se conectar ao banco
	 *
	 * @param string $password
	 *  A senha do usuário utilizado para se conectar ao banco
	 */
	function init_db($servidor, $database, $username, $password) {
		global $db;
		try {
			$db = new PDO(
				"mysql:host=$servidor;dbname=$database",$username, $password,
				array(PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES "utf8"')
			);	
		} catch (PDOException $ex) {
			print "Error!: " . $ex->getMessage() . "<br/>";
			die();
		}
	}
	
	/**
	 * Executa uma query
	 *
	 * Executa uma consulta ao banco de dados, retornando o resultset com os
	 * resultados obtidos.
	 *
	 * @param string $sql
	 *   A consulta sql a ser executada. É possível utilizar demarcadores <i>?</i>
	 *   para indicar a posiçao dos parametros que serao substituidos na consulta.
	 *
	 * @param array $params
	 *  Um vetor com os parametros que serao utilizados na consulta. A ordem dos
	 *  paramentos no vetor deve ser a mesma dos marcadores na consulta:
	 *
	 *  <code>
	 *    $sql = SELECT * FROM TABELA WHERE id=? AND data > ?;
	 *    $params = array(1, '24-02-1986 00:00:00');
	 *    db_query($sql, $params);
	 *  </code>
	 *
	 *  No exemplo acima, os marcadores em $sql (?), serao substituidos pelos valores
	 *  em $params, resultando na consulta:
	 *
	 *  <code>SELECT * FROM TABELA WHERE id=1 AND data > '24-02-1986 00:00:00';</code>
	 *
	 *  Note que os parametros sao escapados automaticamente.
	 *
	 *  @return PDOStatement
	 *    O resultset da consulta executada
	 */
	function db_query($sql, $params = array()) {
		global $db;
		$statement = $db->prepare($sql);
		$statement->execute($params);
		return $statement;
	}
	
	
	/**
	 * Retorna um vetor, representando uma unica linha de um resultset.
	 *
	 * Os chaves do vetor possuem os mesmos nomes das colunas existentes no resultado.
	 *
	 * @param PDOStatement $result
	 *   O resultset de onde deseja-se obter a linha
	 *
	 * @return array|bool
	 *   Retorna um array com uma linha do resultset ou FALSE caso nao existam
	 *   registros disponiveis.
	 */
	function db_fetch_row($result) {
		return $result->fetch(PDO::FETCH_ASSOC);
	}
	
	/**
	 * Retorna um vetor de vetores, contendo todos os registros de uma consulta.
	 *
	 * @param PDOStatement $result
	 *   O resultset de onde deseja-se obter a linha
	 *
	 * @return array|bool
	 *   Retorna um array com todos os registros do resultset ou FALSE caso nao existam
	 *   registros disponiveis.
	 */
	function db_fetch_all($result) {
		return $result->fetchAll(PDO::FETCH_ASSOC);
	}
	
	
	/**
	 * Executa uma consulta no banco e retorna apenas os resultados dentro de um
	 * range específico.
	 *
	 * Ideal para paginação de resultados.
	 *
	 * @param string $sql
	 *   A consulta sql a ser executada. É possível utilizar demarcadores <i>?</i>
	 *   para indicar a posiçao dos parametros que serao substituidos na consulta.
	 *
	 * @param int $from
	 *   O número do registro a partir do qual será retornado o resultado.
	 *
	 * @param int $count
	 *   A quantidade de registros que será retornada
	 *
	 * @param array $params
	 *  Um vetor com os parametros que serao utilizados na consulta. A ordem dos
	 *  paramentos no vetor deve ser a mesma dos marcadores na consulta.
	 *
	 * @see db_query()
	 *
	 * @return PDOStatement
	 *  O resultset da consulta executada
	 */
	function db_query_range($sql, $from, $count, $params = array()) {
		global $db;
		if(!is_integer($from) && !is_integer($count)) {
			$from = 0;
			$count = 0;
		}
		$query .= " LIMIT $from, $count";
		
		$statement = $db->prepare($sql);
		$statement->execute($params);
		return $statement;
	}
	
	
	/**
	 * Cria um novo registro em uma tabela, com base em um vetor de dados.
	 *
	 * Essa função insere um novo registro na tabela informada, com base nas chaves e
	 * valores do vetor informado. Cada chave será utilizada como nome de campos na
	 * tabela e cada valor será utilizado como o valor do respectivo campo.
	 *
	 * @param string $tabela
	 *   O nome da tabela onde será inserido o registro
	 *
	 * @param array $record
	 *   Um vetor com os dados do registro a ser inserido, no formato:
	 *
	 *   <code>array(
	 *   	'coluna1' => 'valor coluna 1',
	 *   	'coluna2' => 'valor coluna 2',
	 *   	...
	 *   )</code>
	 * @return bool
	 *   True em caso de sucesso, false em caso de falha.
	 */
	function db_save_record($tabela, $record) {
		global $db;
		$record_values = array_values($record);
		$value_tokens = array_fill(0, count($record_values), '?');
		$sql = "INSERT INTO $tabela(". implode(',', array_keys($record)) . ") VALUES(". implode(',', $value_tokens) .")";
		return (bool) db_query($sql, $record_values)->rowCount();
	}
	
	function db_update_record($tabela, $record, $primary_key) {
		global $db;
		unset($record[key($primary_key)]);
		$record_values = array_values($record);
		$record_values[] = reset($primary_key);
		$sets = implode('=?, ', array_keys($record));
		$sets .= '=?';
		
		$sql = "UPDATE $tabela SET $sets WHERE ".key($primary_key)."=?";
		
		$statement = db_query($sql, $record_values);
		if($statement->rowCount()) {
			return true;
		} else {
			set_last_error($statement);
			return false;
		}
	}
	
	function db_last_insert_id() {
		global $db;
		return $db->lastInsertId();
	}
	
	function get_last_error() {
		global $last_error;
		return $last_error;
	}
	
	function set_last_error($db_object) {
		global $last_error;
		$erro = $db_object->errorInfo();
		$last_error = $erro[2];
	}
	
?>