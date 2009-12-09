<?php
	
	global $scripts, $inline_scripts;

	/**
	 * Transforma uma string no formato controller/rota/parametros em um vetor contendo as partes da rota
	 *
	 * Caso um controller não seja informado, será utilizado o controller <i>site</i>.
	 *
	 * Caso uma action nao seja informada, sera utilizada a action <i>index</i>.
	 * @return array
	 *   As partes da rota, no formato:
	 *   <code>
	 *   	array(
	 *			'controller' => 'controllerId',
	 *			'action' => 'actionID',
	 *			'params' => array(1, 2, 3, ...),
	 *		)
	 *   </code>
	 */
	function resolve_rota() {
		$unfiltered_r = isset($_GET['r']) ? $_GET['r'] : '';
		$rota = filter_var($unfiltered_r, FILTER_SANITIZE_STRING);
		
		$partes = explode('/', $rota);
		$partes_rota = array();
		
		if(empty($partes[1])) {
			$partes[1] = 'index';
		}
		if(empty($partes[0])) {
			$partes[0] = 'site';
		}
		list($partes_rota['controller'], $partes_rota['action']) = $partes;
		
		$partes_rota['params'] = array_slice($partes, 2);
		return $partes_rota;
	}
	
	
	/**
	 * Envia a requisição para o controller e action especificados pela rota
	 * 
	 * @param array $rota
	 *   Um vetor com a rota de destino
	 */
	function executa_rota($rota = null) {
		$arquivo_action = 'controllers'.DIRECTORY_SEPARATOR.$rota['controller'].DIRECTORY_SEPARATOR.$rota['action'].'.php';
		if(file_exists($arquivo_action)) {
			$params = $rota['params'];
			include $arquivo_action;
		} else {
			$route_params = implode('/', $rota['params']);
			$alias = implode('/', array_reverse(array_slice($rota,0,2)));
			$alias .= implode('/', $rota['params']);
			$rota = get_alias_route($alias);
			if($rota) {
				$_GET['r'] = $rota;
				executa_rota(resolve_rota());
			} else {
				mostra_erro_http(404, 'Página não encontrada!');
			}
		}
	}
	
	/**
	 * Redireciona para a rota informada
	 *
	 * @param string $rota
	 *  Uma string no formato controller/action/parametro ou um vetor onde
	 */
	function redireciona_para($rota) {
		header('Location: index.php?r='.$rota, true, 302);
	}
	
	
	/**
	 * Verifica se o usuário logado tem uma determinada permissão. Caso não possua, será exibida mensagem de acesso negado
	 * 
	 * @param string $permissao
	 *   A permissão a ser verificada
	 */
	function verifica_permissao($permissao) {
		$sql = "select pu.id_usuario from permissao p";
		$sql .= " inner join permissao_usuario pu on p.id = pu.id_permissao";
		$sql .= "  where descricao = ? and pu.id_usuario = 1";
		
		$result = db_query($sql, array($permissao));
		if(!$result->fetch(PDO::FETCH_ASSOC)) mostra_erro_http(403, 'Permissão Negada');
	}
	
	/**
	 * Verifica se o usuário logado tem acesso administrativo.
	 * 
	 */
	function valida_acesso_admin() {
		if(!isset($_SESSION['admin']) || $_SESSION['admin'] !== true) {
			mostra_erro_http(403, 'Permissão Negada');
		}
	}
	
	
	/**
	 * Altera o cabeçalho HTTP para o código de erro informado, e exibe a página de erro específica
	 * 
	 * @param int $codigo
	 *  O código do erro http
	 * @param string $mensagem
	 *  A mensagem que será exibida na página de erro
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
	function exibe_view($variaveis = array(), $template = 'default') {
		$rota = resolve_rota();
		$arquivo_view = 'views'.DIRECTORY_SEPARATOR.$rota['controller'].DIRECTORY_SEPARATOR.$rota['action'].'.html';
		
		if(file_exists($arquivo_view)) {
			$content = get_include_contents($arquivo_view, $variaveis);
			$head_scripts = render_javascript_tag('externo');
			$title = set_page_title();
			include "templates/$template.php";
		} else {
			mostra_erro_http(404, 'Página não encontrada!');
		}
	}
	
	
	/**
	 * Troca os caracteres de newline por <br />
	 *
	 * Os caracteres trocados são \r\n, \n e \r.
	 *
	 * @param string $texto
	 *   O texto que terá os caracteres de newline trocados
	 *
	 * @return string
	 *   O texto com a tag <br /> no lugar da newline
	 */
	function newline_to_br($texto) {
		$texto = nl2br($texto);
		return strtr($texto, array('\r\n'=>'<br />', '\n' => '<br />', '\r'=>'<br />'));
	}
	
	/**
	 * Adiciona uma mensagem na seção.
	 *
	 * A mensagem ficará disponível até ser recuperada através da função <i>get_message</i>.
	 * Um chamada a esta funçao, ira sobrescrever qualquer mensagem que esteja armazenada
	 * na seçao.
	 *
	 * @param string $message
	 *   A mensagem a ser armazenada na seçao.
	 */
	function set_message($message) {
		$_SESSION['system_message'] = $message;
	}
	
	/**
	 * Retorna a última mensagem armazenada na seção, via <i>set_message</i>.
	 *
	 * Apos a utilizaçao desta funçao, a mensagem retornada e removida da seçao.
	 *
	 * @return string
	 *   A ultima mensagem armazenada na seçao.
	 */
	function get_message() {
		$message = isset($_SESSION['system_message']) ? $_SESSION['system_message'] : '';
		unset($_SESSION['system_message']);
		return $message;
	}
	
	function create_pager($total_itens, $itens_pagina = 10) {
		$rota = filter_input(INPUT_GET, 'r', FILTER_SANITIZE_STRING);
		$num_paginas = ceil($total_itens / $itens_pagina);
		$pagina_atual = isset($_GET['page']) ? $_GET['page'] : 1;
		$pager = '<ul class="pager">';
		for($i = 1; $i <= $num_paginas; $i++) {
			if($pagina_atual == $i) {
				$link = $i;
			} else {
				$_GET['page'] = $i;
				$link = '<a href="index.php?'. get_query_string() .'">'.$i.'</a>';
			}
			$pager .= '<li>'.$link.'</li>';
		}
		return $pager;
	}
	
	function get_query_string() {
		$params = array();
		foreach($_GET as $key => $value) {
			$params[] = $key .'='. $value;
		}
		return implode('&', $params);
	}
	
	function set_breadcrumb($breadcrumb = array()) {
		static $system_breadcrumb;
		
		if(!isset($system_breadcrumb)) {
			$system_breadcrumb['Página Inicial'] = 'index.php';
		}
		
		$system_breadcrumb = array_merge($system_breadcrumb, $breadcrumb);
		
		return $system_breadcrumb;
	}
	
	function render_breadcrumb($breadcrumb) {
		$tag = '<div class="breadcrumb">';
		
		
		$tag_links = array();
		foreach($breadcrumb as $item => $link) {
			$tag_links[] = '<a href="'.$link.'">'.$item.'</a>';
		}
		
		$tag .= implode(' > ', $tag_links);
		$tag .= '</div>';
		
		return $tag;
	}
	
	function get_include_contents($filename, $variaveis = array()) {
		if (is_file($filename)) {
			extract($variaveis);
			ob_start();
			include $filename;
			$contents = ob_get_contents();
			ob_end_clean();
			return $contents;
		}
		return false;
	}
	
	function add_javascript($javascript, $tipo = 'externo') {
		global $scripts, $inline_scripts;
		
		switch($tipo) {
			case 'externo':
				$scripts[] = $javascript;
				break;
			case 'inline':
				$inliden_scripts .= $javascript;
		}
	}
	
	function render_javascript_tag($tipo) {
		global $scripts, $inline_scripts;
		
		if(!isset($scripts)) {
			$scripts = array();
		}
		
		$tag = '';
		
		switch($tipo) {
			case 'externo':
				foreach($scripts as $script_src) {
					$tag .= '<script type="text/javascript" src="'.$script_src.'"></script>';
				}
				break;
			case 'inline':
				$tag = '<script type="text/javascript">';
				$tag .= $inline_scripts;
				$tag .= '</script>';
				break;
		}
		
		return $tag;
	}
	
	function set_page_title($title = null) {
		static $page_title;
		
		if(!$title && !isset($page_title)) {
			$title = 'Reino da Garotada';
		}
		if (isset($title)) {
		  $page_title = $title;
		}
		
		return $page_title;
	}
	
	function get_alias_route($alias) {
		$sql = 'SELECT route FROM route_alias WHERE alias = ?';
		$alias_route = db_fetch_column(db_query($sql, array($alias)));
		return $alias_route;
	}
?>