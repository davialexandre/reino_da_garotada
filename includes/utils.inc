<?php

	/**
	 * Transforma uma string no formato controller/rota em um vetor contendo as partes da rota
	 * @return array as partes da rota
	 */
	function resolve_rota() {
		$rota = filter_input(INPUT_GET, 'r', FILTER_SANITIZE_STRING);
		$partes_rota = array();
		list($partes_rota['controller'], $partes_rota['action']) = explode('/', $rota);
		return $partes_rota;
	}
	
	
	/**
	 * Envia a requisição para o controller e action especificados pela rota
	 * @param array $rota um vetor com a rota de destino
	 * @param array $variaveis um vetor com variaveis que serao passadas para a action
	 */
	function executa_rota($rota, $variaveis = null) {
		$arquivo_action = 'controllers'.DIRECTORY_SEPARATOR.$rota['controller'].DIRECTORY_SEPARATOR.$rota['action'].'.php';
		if(file_exists($arquivo_action)) {
			include $arquivo_action;
		} else {
			mostra_erro_http(404, 'Página não encontrada!');
		}
	}
	
	
	/**
	 * Verifica se o usuário logado tem uma determinada permissão. Caso não possua, será exibida mensagem de acesso negado
	 * @param string $permissao a permissão a ser verificada
	 */
	function verifica_permissao($permissao) {
		$sql = "select pu.id_usuario from permissao p";
		$sql .= " inner join permissao_usuario pu on p.id = pu.id_permissao";
		$sql .= "  where descricao = ? and pu.id_usuario = 1";
		
		$result = db_query($sql, array($permissao));
		if(!$result->fetch(PDO::FETCH_ASSOC)) mostra_erro_http(403, 'Permissão Negada');
	}
	
	
	/**
	 * Altera o cabeçalho HTTP para o código de erro informado, e exibe a página de erro específica
	 * @param int $codigo o código do erro http
	 * @param string $mensagem a mensagem que será exibida na página de erro
	 */
	function mostra_erro_http($codigo, $mensagem = '') {
		$erros_http = array(
			'403' => 'Forbidden',
			'404' => 'Not Found',
		);
		
		header("HTTP/1.1 $codigo {$erros_http[$codigo]}");
		$view_erro = 'views'.DIRECTORY_SEPARATOR.'erro'.DIRECTORY_SEPARATOR.$codigo.'.html';
		include $view_erro;
		die();
	}
	
	
	/**
	 * Exibe a view específica para a action atual.
	 * @param array $variaveis um vetor com as variáveis que serão enviadas para a view
	 */
	function exibe_view($variaveis) {
		$rota = resolve_rota();
		$arquivo_view = 'views'.DIRECTORY_SEPARATOR.$rota['controller'].DIRECTORY_SEPARATOR.$rota['action'].'.html';
		if(file_exists($arquivo_view)) {
			extract($variaveis);
			include $arquivo_view;
		} else {
			mostra_erro_http(404, 'Página não encontrada!');
		}
	}
	
?>