<?php
	global $db;
	
	init_db();
	
	/**
	 * Inicia a conexão com o banco de dados
	 */
	function init_db() {
		global $db_config, $db;
		try {
			$db = new PDO("mysql:host={$db_config['servidor']};dbname={$db_config['dbname']}", $db_config['username'], $db_config['password']);	
		} catch (PDOException $ex) {
			print "Error!: " . $e->getMessage() . "<br/>";
			die();
		}
	}
	
	/**
	 * Executa uma query
	 */
	function db_query($sql, $params = array()) {
		global $db;
		$statement = $db->prepare($sql);
		$statement->execute($params);
		return $statement;
	}
?>