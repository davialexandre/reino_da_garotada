<?php
	function get_menu($start_depth = 0, $depth = 0) {
		$unparsed_menu_itens = db_fetch_all(db_query("SELECT * FROM item_menu"));
		
		return parse_menu($unparsed_menu_itens);
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
            $tag = '<ul>';
            foreach($menu['children'] as $submenu) {
				if($show_admin_links) $admin_link = ' -  [<a href="index.php?r=menu/delete_item/' . $submenu['id'] . '">apagar</a>] ';
				else $admin_link = '';
                $tag .= '<li><a href="'. $submenu['endereco'] .'">' . $submenu['titulo'] . '</a> ' . $admin_link . '</li>';
                if(!empty($submenu['children'])) {
                    $tag .= '<li>';
                    $tag .= render_menu($submenu, $show_admin_links);
                    $tag .= '</li>';
                }
            }
            $tag .= '</ul>';
        }
		
		return $tag;
	}
	
?>