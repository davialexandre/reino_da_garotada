<?php
	
	/**
	 * Renderiza uma elemento do tipo input. Os elementos podem ser:
	 *  - text
	 *  - password
	 *  - submit
	 *  - checkbox
	 *  - radio
	 *  - file
	 *
	 * Qualquer outro atributo deve ser informado na propriedade <i>attributes</i>,
	 * em um vetor, onde as chaves sao os nomes dos atributos e os valores sao os
	 * valores dos atributos.
	 * 
	 *  @param array $element
	 *  	O vetor com as configurações do elemento, no formato:
	 *  	<code>
	 *  	array(
	 *  		'label' => 'Label: ',
	 *  		'attributes' => array(
	 *				'value' => 'valor',
	 *				'id' => 'id',
	 *				'class' => 'class',
	 *				...
	 *			 )
	 *		)
	 *		</code>
	 *  @param string $name
	 *  	O valor do atributo name desse objeto
	 *
	 *  @return string
	 *  	A tag HTML do elemento informado
	 */
	function render_input_element($element, $name) {
		$label = $attributes = '';
		
		if(!isset($element['attributes']['id'])) {
			$element['attributes']['id'] = $name;
		}
		if(isset($element['label'])) {
			$label = render_label($element['label'], $element['attributes']['id']);
		}
		if(isset($element['attributes'])) {
			$attributes = join_tag_attributes($element['attributes']);			
		}
		return $label.'<input type="'.$element['type'].'" name="'.$name.'" '.$attributes .' />';
	}
	
	
	/**
	 * Renderiza um fieldset juntamente com seus elementos internos.
	 * Um fieldset é um elemento sem um type definido.
	 *
	 * @param array $element
	 *   O vetor com as configurações do fieldset, no seguinte formato:
	 *   <code>
	 *   array(
	 *		'label' = 'Texto que será utilizado na tag legend',
	 *		... // outros elementos internos
	 *	 )
	 *	 </code>
	 * @return string
	 *   A tag HTML do fieldset informado, juntamente com seus elementos internos
	 */
	function render_fieldset_element($element) {
		$tag = '<fieldset>';
		$tag .= " <legend>{$element['label']}</legend>";
		foreach($element as $child_name => $child_element) {
			if(is_array($child_element)) {
				$tag .= render_form_element($child_element, $child_name);	
			}
		}
		$tag .= '</fieldset>';
		return $tag;
	}
	
	
	/**
	 * Renderiza uma lista do tipo dropdown juntamente com os seus elementos internos
	 *
	 * Utilize a propriedade <i>prompt</i> para indicar um item inicial, que sera
	 * selecionado caso nenhum item seja indicado na propriedade <i>selected</i>.
	 *
	 * A propriedade selected e utilizada para indicar a qual item da lista deve estar 
	 * selecionado. Utilize o value do item para indicar.
	 *
	 * O itens <i>options</i> contem a lista com os itens disponiveis
	 *
	 * @param array $element
	 *   O vetor com as configuraçoes da lista, no formato:
	 *   <code>
	 *   array(
	 *		'label' => 'Label: ',
	 *		'selected' => '3',
	 *		'prompt' => '- Selecione -',
	 *		'options' => array('SP','RJ','MG','TO'),
	 *	 )
	 *	 </code>
	 *
	 * @param string $name
	 *   O valor do atributo name desse objeto
	 *
	 *  @return string
	 *   A tag HTML do elemento informado  
	 */
	function render_dropdownlist_element($element, $name) {
		$label = $attributes = '';
		
		if(!isset($element['attributes']['id'])) {
			$element['attributes']['id'] = $name;
		}
		if(isset($element['label'])) {
			$label = render_label($element['label'], $element['attributes']['id']);
		}
		$attributes = join_tag_attributes($element['attributes']);
		$tag = '<select name="'.$name.'" '.$attributes.'>';
		if(isset($element['prompt'])) {
			$selected = '';
			if(!isset($element['selected']) || $element['selected'] == '') {
				$element['selected'] = null;
				$selected = 'selected="selected"';
			}
			$tag .= '<option value="" '.$selected.'>'.$element['prompt'].'</option>';
		}
		
		foreach($element['options'] as $value => $option) {
			$selected = '';
			if(isset($element['selected']) && $element['selected'] == $value) {
				$selected = 'selected = "selected"';
			}
			$tag .= '<option value="'.$value.'" '. $selected .'>'.$option.'</option>';
		}
		$tag .= '</select>';
		
		return $label.$tag;
	}
	
	function render_listbox_element($element, $name) {
		$label = $attributes = '';
		
		if(!isset($element['attributes']['id'])) {
			$element['attributes']['id'] = $name;
		}
		
		if(isset($element['label'])) {
			$label = render_label($element['label'], $element['attributes']['id']);
		}
		
		if(isset($element['multiple']) && $element['multiple'] == true) {
			$name .= '[]';
			$element['attributes']['multiple'] = 'multiple';
		}
		
		if(!isset($element['attributes']['size'])) {
			$element['attributes']['size'] = 4;
		}
		
		$attributes = join_tag_attributes($element['attributes']);
		
		$tag = '<select name="'.$name.'" '.$attributes.'>';
		
		if(!isset($element['selected'])) {
			$element['selected'] = '';
		}
		
		$element['selected'] = explode(',', $element['selected']);
		
		foreach($element['options'] as $value => $option) {
			$selected = '';
			if(in_array($value, $element['selected'])) {
				$selected = 'selected = "selected"';
			}
			$tag .= '<option value="'.$value.'" '.$selected.'>'.$option.'</option>';
		}
		
		$tag .= '</select>';
		
		return $label.$tag;
	}
	
	
	/**
	 * Renderiza uma lista de inputs do tipo radio
	 *
	 * Caso seja necessário iniciar um item da lista selecionado, utilize a
	 * propriedade <i>selected</i>, informando a chave do item que deve estar
	 * selecionado.
	 *
	 * Os itens disponiveis devem ser indicados na propriedade <i>options</i>,
	 * utilizando um vetor os as chaves serao o value do radio, e as valores serao
	 * os labels.
	 * 
	 * @param array $element
	 *   O vetor com as configuraçoes do elemento a ser renderizado, no formato:
	 *   <code>
	 *   array(
	 *		'label' => 'Label: '
	 *		'selected' => 'm',
	 *		'options' => array(
	 *			'm'	=> 'Masculino',
	 *			'f' => 'Feminino',
	 *		)
	 *	 )
	 *   </code>
	 *
	 *   @param string $name
	 *     O valor do atributo name, que sera compartilhado por todos os radios
	 *   @return string
	 *     A tag HTML do elemento informado
	 */
	function render_radiolist_element($element, $name) {
		$tag = '';
		foreach($element['options'] as $key => $radio) {
			$radio_element = array(
				'type' => 'radio',
				'label' => $radio,
				'attributes' => array(
					'value' => $key,
					'id' => $radio,
				)
			);
			if(isset($element['selected']) && $element['selected'] == $key) {
				$radio_element['attributes']['checked'] = 'checked';
			}
			$tag .= render_input_element($radio_element, $name);
		}
		
		return $tag;
	}
	
	
	/**
	 * Renderiza um elemento do tipo textarea.
	 *
	 * As duas principais propriedades do textarea são: <i>cols</i> e <i>rows</i>,
	 * que indicam, respectivamente, o tamanho do elemento em colunas e linhas.
	 * Caso tais propriedades nao sejam informadas, serao utilizados os seguintes
	 * valores:
	 *  - cols = 60
	 *  - rows = 3
	 *
	 * Qualquer outro atributo deve ser informado na propriedade <i>attributes</i>,
	 * em um vetor, onde as chaves sao os nomes dos atributos e os valores sao os
	 * valores dos atributos.
	 *
	 * O texto do elemento pode ser setado atraves da propriedade <i>texto</i>.
	 *
	 * @param array $element
	 *   O vetor com a configuraçao do elemente a ser renderizado, no seguinte formato:
	 *
	 *   <code>
	 *   array(
	 *	    'label' => 'Label: ',
	 *	    'cols' => 100,
	 *	    'rows' => 10,
	 *	    'texto' => 'Lorem ipsum dolor sit amet...',
	 *	    'attributes' => array('class' => 'textarea'),
	 *   )
	 *   </code>
	 *
	 * @param string $name
	 *   O valor do atributo name do elemento informado.
	 *   
	 * @return string
	 *   A tag HTML do elemento informado
	 */
	function render_textarea_element($element, $name) {
		$label = $attributes = '';
		if(!isset($element['cols'])) $element['cols'] = 60;
		if(!isset($element['rows'])) $element['rows'] = 3;
		if(!isset($element['texto'])) $element['texto'] = '';
		if(!isset($element['attributes']['id'])) {
			$element['attributes']['id'] = $name;
		}
		if(isset($element['label'])) $label = render_label($element['label'], $name);
		if(isset($element['attributes'])) {
			$attributes = join_tag_attributes($element['attributes']);			
		}
		$tag = '<textarea name="'.$name.'" cols="'.$element['cols'].'" rows="'.$element['rows'].'" '.$attributes.'>'.$element['texto'].'</textarea>';
		
		return $label.$tag;
	}
	
	
	/**
	 * Renderiza uma elemento do formulário, utilizando a função específica.
	 *
	 * Esta função utiliza a propriedade <i>type</i> do elemento para delegar
	 * a tarefa de renderizaçao para a funçao especifica.
	 *
	 * @param array $element
	 *   Um vetor com a configuraçao do elemento
	 *
	 * @param string $name
	 *   A propriedade name do elemento informado
     *
     * @return string
     *  A tag HTML do elemento informado, juntamento com seus elementos filhos,
     *  caso existam
	 */
	function render_form_element($element, $name) {
		if(isset($element['type'])) {
			if(isset($element['has_error']) && $element['has_error']) {
				$class = '';
				if(isset($element['attributes']['class'])) {
					$class = isset($element['attributes']['class']);
				}
				$element['attributes']['class'] = 'erro '.$class;
			}
			switch($element['type']) {
				case 'dropdownlist':
					return render_dropdownlist_element($element, $name);
				case 'listbox':
					return render_listbox_element($element, $name);
				case 'radiolist':
					return render_radiolist_element($element, $name);
				case 'textarea':
					return render_textarea_element($element, $name);
				case 'text':
				case 'password':
				case 'checkbox':
				case 'submit':
				case 'radio':
				case 'file':
				case 'hidden':
					return render_input_element($element, $name);
			}
		} else {
			return render_fieldset_element($element, $name);
		}
	}
	
	
	/**
	 * Renderiza um formulario.
	 *
	 * Renderiza o HTML de um formulario de acordo com o vetor de configuraçao
	 * informado. O vetor de configuraçao de um formulario deve seguir o seguinte formato:
	 *
	 * <code>
	 * $form = array(
	 *		'method' => 'post',
	 *		'name' => 'form1',
	 *		'identificacao' => array(
	 *			'label' => 'Identificaçao do Usuario',
	 *			'nome' => array(
	 *				'label' => 'Nome: ',
	 *				'type' => 'text',
	 *			),
	 *			'senha' => array(
	 *				'label' => 'Senha: ',
	 *				'type' => 'password',
	 *			),
	 *      ),
	 *      'enderecamento' => array(
	 *			'label' => 'Endereçamento',
	 *			'endereco' => array(
	 *				'label' => 'Endereço: ',
	 *				'type' => 'text',
	 *			),
	 *			'estado' => array(
	 *				'label' => 'Estado: ',
	 *				'type' => 'dropdownlist',
	 *				'prompt' => ' - Selecione - ',
	 *				'options' => array('SP','RJ','ES','MG','TO','PA','PR','BA','PE','RS','MA'),
	 *          )
	 *      ),
	 *      'perfil' => array(
	 *      	'label' => 'Perfil',
	 *      	'foto' => array(
	 *      		'label' => 'Foto: ',
	 *      		'type' => 'file',
	 *      	),
	 *      	'descricao' => array(
	 *      		'label' => 'Descriçao: ',
	 *      		'type' => 'textarea',
	 *      		'texto' => 'Escreva aqui uma breve descriçao sobre voce:',
	 *      	),
	 *      )
	 *      'submit' => array(
	 *      	'type' => 'submit',
	 *      	'attributes' => array(
	 *				'value' => 'Enviar',
	 *			)
	 *		)
	 *	)
	 * </code>
	 *
	 * No exemplo acima, temos um formulário com três fieldsets (identificacao,
	 * enderecamento e perfil), cada qual com um conjunto específico de campos.
	 *
	 * Para criar um fieldset, basta criar um elemento sem a propriedade <i>type</i>.
	 *
	 * A chave de cada elemento sera utilizada como valor na propriedade name.
	 * Portanto, evite colocar a mesma chave para mais de um elemento.
	 *
	 * As propriedades <i>method</i> e <i>action</i> sao necessarias e, caso nao sejam
	 * informadas terao, por padrao, os respectivos valores <i>'post'</i> e <i>''</i>(a pagina atual).
	 *
	 * @param array $form
	 *   O vetor com a configuraçao do formulario a ser exibido
	 *
	 * @return string
	 *   A tag HTML do formulario informado, renderizado juntamento com todos os
	 *   seus elementos.
	 */
	function render_form($form) {
		if(!isset($form['method'])) $form['method'] = 'post';
		if(!isset($form['action'])) $form['action'] = '';
		$tag = '<form method="'.$form['method'].'" action="'.$form['action'].'">';
		foreach($form as $name => $element) {
			if(is_array($element)) {
				$tag .= render_form_element($element, $name);
			}
		}
		$tag.= '</form>';
		return $tag;
	}
	
	/**
	 * Renderiza um label para um elemento informado.
	 *
	 * @param string $label
	 *   O texto que será exibido no label
	 *
	 * @param string $for
	 *   O id do elemento para o qual o label deverá apontar
	 *
	 * @return string
	 *  A tag HTML do label informado.
	 */
	function render_label($label, $for) {
		return '<label for="'.$for.'">'.$label.'</label>';
	}
	
	
	/**
	 * Função auxilar que retorna uma string com todos os atributos de um elemento.
	 *
	 * Concatena todos os atributos de um elemento, em uma string no formato:
	 *
	 * <pre>
	 * atributo1="valor1" atributo2="valor2" ... atributo5="valor5"
	 * </pre>
	 *
	 * @param array $attributes
	 *   Um vetor com os atributos de um elemento, onde as chaves sao os nomes
	 *   dos atributos, e os valores representam os valores deles.
	 *
	 * @return string
	 *  Uma string com todos os atributos formatos e concatenados
	 */
	function join_tag_attributes($attributes) {
		$joined_attributes = '';
		
		if(is_array($attributes)) {
			foreach($attributes as $atributo => $valor) {
				$joined_attributes .= $atributo . '="' . $valor . '" ';
			}
		}
		
		return $joined_attributes;
	}
	
	
	/**
	 *  Preenche um vetor de configuraçao de formulario com os valores
	 *  submetidos do formulario, via post.
	 *
	 *  Nessa função, o formulário deve ser passado como referência, para que seus
	 *  valores possam ser devidamente preenchidos.
	 *  
	 *  @param array $form
	 *    O vetor com a configuraçao do formulario a ser exibido
	 *    
	 *  @param array $form_data
	 *   Um vetor contendo os valores que serao utilizados para preencher o formulario.
	 *   Caso nao seja informado, $_POST sera utilizado.
	 *
	 */
	function fill_form(&$form, $form_data = null) {
		$form_data = $form_data ? $form_data : $_POST;
		foreach($form as $name => &$element) {
			if(is_array($element)) {
				if(isset($element['type'])) {
				   if(key_exists($name, $form_data)) {
						switch($element['type']) {
							case 'text':
							case 'password':
								$element['attributes']['value'] = $form_data[$name];
								break;
							case 'radiolist':
							case 'dropdownlist':
							case 'listbox':
								$element['selected'] = is_array($form_data[$name]) ? implode(',', $form_data[$name]) : $form_data[$name];
								break;
							case 'checkbox':
								if($form_data[$name]) $element['attributes']['checked'] = 'checked';
								break;
							case 'textarea':
								$element['texto'] = $form_data[$name];
								break;
						}
				   } else {
						if($element['type'] == 'checkbox') {
							unset($element['attributes']['checked']);
						}
				   }
				} else {
					fill_form($element, $form_data);
				}	
			}
		}
	}
	
	/**
	 * Valida os dados de um campo de acordo com as regras especificadas na
	 * propriedade <i>rules</i>.
	 *
	 * <i>Rules</i> e um vetor, onde cada item representa uma regra de validaçao
	 * especifica.
	 * 
     */
	function validate_form(&$form) {
		static $valido = true;
		foreach($form as $name => &$element) {
			if(is_array($element)) {
				if(isset($element['type'])) {
					if(isset($element['rules'])) {
						list($element['has_error'], $element['error_message']) = validate_element($element);
						$valido = $valido && !$element['has_error'];
					}
				} else {
					validate_form($element);
				}
			}
		}
		return $valido;
	}
	
	function validate_element($element) {
		$value = get_element_value($element);
		$valido = false;
		foreach($element['rules'] as $rule) {
			switch($rule['type']) {
				case 'required':
					$valido = validate_required_rule($value);
					break;
				case 'regex':
					$valido = validate_regex_rule($value, $rule['regex']);
					break;
				case 'type':
					$valido = validate_type_rule($value, $rule['data_type']);
					break;
				case 'email':
					$valido = validate_email_rule($value);
					break;
			}
			
			if(!$valido) {
				return array(true, $rule['message']);
			}
		}
		
		return null;
	}
	
	function validate_required_rule($value) {
		return ($value !== false) && strlen($value);
	}
	
	function validate_regex_rule($value, $regex) {
		if($value) return preg_match($regex, $value);
		return true;
	}
	
	function validate_type_rule($value, $type) {
		if($value) {	
			switch($type) {
				case 'number':
					return is_numeric($value);
				case 'text':
					return is_string($value);
			}
		} else {
			return true;
		}
	}
	
	function validate_email_rule($value) {
		if($value) return filter_var($value, FILTER_VALIDATE_EMAIL);
		return true;
	}
	
	function get_element_value($element) {
		$value = '';
		switch($element['type']) {
			case 'text':
			case 'password':
			case 'file':
			case 'hidden':
				$value = isset($element['attributes']['value']) ? trim($element['attributes']['value']) : null;
				break;
			case 'checkbox':
				$value = isset($element['attributes']['checked']) ? 1 : 0;
				break;
			case 'radiolist':
			case 'dropdownlist':
			case 'listbox':
				$value = isset($element['selected']) && $element['selected'] != '' ? trim($element['selected']) : null;
				break;
			case 'textarea':
				$value = isset($element['texto']) ? trim($element['texto']) : null;
				break;
		}
		
		return $value;
	}
	
	function form_error_summary($form) {
		static $erros = array();
		
		foreach($form as $name => $element) {
			if(is_array($element)) {
				if(isset($element['has_error']) && $element['has_error']) {
					$erros[$element['label']] = $element['error_message'];
				} else {
					form_error_summary($element);
				}
			}
		}
		
		$error_summary = '';
		
		if(!empty($erros)) {
			$error_summary = '<div class="error_summary">';
			$error_summary .= '<p>Foram encontrados os seguintes erros no formulário: </p>';
			$error_summary .= '<ul>';
			foreach($erros as $elemento => $erro) {
				$error_summary .= "<li>$elemento $erro</li>";
			}
			$error_summary .= '</ul></div>';
		}
		
		return $error_summary;
	}
	
	function form_to_simple_array($form) {
		static $form_array = array();
		
		foreach($form as $name => $element) {
			if(is_array($element)) {
				if(isset($element['type']) && $element['type'] != 'submit') {
					$form_array[$name] = get_element_value($element);
				} else {
					form_to_simple_array($element);
				}
			}
		}
		
		return $form_array;
	}
?>