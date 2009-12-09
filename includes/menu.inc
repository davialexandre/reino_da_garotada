<?php
	function get_menu($start_depth = 0, $depth = 0) {
		$unparsed_menu_itens = db_fetch_all(db_query("SELECT * FROM item_menu"));
		
		return parse_menu($unparsed_menu_itens);
	}
	
	function get_parent_item($menu, $child_address) {
		static $parent_item;
		
		$parent_item = null;
		
		foreach($menu['children'] as $child) {
			//$parent_item = $menu;
			$found_menu = get_menu_item($child, $child_address);
			if($found_menu && count($child['children'])) {
				$parent_item = $child;
                break;
			} else {
				get_parent_item($child, $child_address);
			}
		}
		
		return $parent_item;
	}
	
	function get_menu_item($menu, $endereco) {
		static $parent_item;
		
		$find_menu = null;
		if(isset($menu['endereco'])) {
			if($menu['endereco'] == $endereco){
				$find_menu = $menu;
			}
		}
        if(isset($menu['children'])) {
			foreach($menu['children'] as $submenu) {
				$parent_item = $submenu;
				$find_menu = get_menu_item($submenu, $endereco);
				if($find_menu) break;
			}
		}
		
		return $find_menu;
	}
	
	function parse_menu($menu_itens) {
		$parsed_menu = array('children' => array());
		
		foreach($menu_itens as $key => $item) {
			if(!$item['item_superior']) {
				$item['children'] = array();
				$parsed_menu['children'][] = $item;
				unset($menu_itens[$key]);
			}
		}
		
		if(!empty($parsed_menu)) {
			foreach($parsed_menu['children'] as &$item) {
				fill_menu_item_children($item, $menu_itens);
			}		
		}
		
		return $parsed_menu;
	}
	
	function fill_menu_item_children(&$item, &$menu_itens) {
		if(!isset($item['children'])) {
			$item['children'] = array();
		}
		
		foreach($menu_itens as $key => &$mitem) {
			if($item['id'] == $mitem['item_superior']) {
				fill_menu_item_children($mitem, $menu_itens);
				$item['children'][] = $mitem;
				unset($menu_itens[$key]);
			}
		}
	}
	
	function render_menu($menu, $show_admin_links = false) {
        $tag = '';
		
		if(!empty($menu)) {
			$tag = '<ul id="menu">';
			if(isset($menu['titulo'])) {
				$tag .= '<h2>'.$menu['titulo'].'</h2>';
			}
			foreach($menu['children'] as $submenu) {
				$tag .= render_submenu($submenu, $show_admin_links);
			}
			$tag .= '</ul>';
		}
		
		return $tag;
	}
	
	function render_submenu($submenu, $show_admin_links) {
		$request_route = isset($_REQUEST['r']) ? implode('/',array_slice(explode('/', $_REQUEST['r']), 0, 2)) : null;
		if($request_route && strpos($submenu['endereco'], $request_route) !== FALSE) {
			$tag = '<li class="active-item">';
		} else {
			$tag = '<li>';	
		}
		if(isset($submenu['titulo'])) {
			if($show_admin_links) $admin_link = ' -  [<a href="index.php?r=menu/delete_item/' . $submenu['id'] . '" class="apagar">apagar</a>] ';
			else $admin_link = '';
			$tag .= '<a href="'. $submenu['endereco'] .'">' . $submenu['titulo'] . '</a>' . $admin_link . '';
			if(isset($submenu['children']) && count($submenu['children'])) {
				$tag .= '<ul class="sub">';
				foreach($submenu['children'] as $menu) { 
					$tag .= render_submenu($menu, $show_admin_links);
				}
				$tag .= '</ul>';
			}
		}
		$tag .= '</li>';
		
		return $tag;
	}
	
?>