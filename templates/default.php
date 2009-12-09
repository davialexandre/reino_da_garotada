<!DOCTYPE html PUBLIC
	"-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pt-br" lang="pt-br">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<title><?php echo $title; ?></title>
		<?php echo $head_scripts; ?>
		<link rel="stylesheet" type="text/css" href="css/style.css" />
		<link rel="stylesheet" type="text/css" href="css/forms.css" />
	</head>
	<body>
		<div id="wrapper">
			<div id="header">
				<a href="index.php"><h1>Reino da Garotada</h1></a>
				<?php echo render_menu(get_menu()); ?>
			<div id="search">
				<form id="search-theme-form" method="get" action="http://www.google.com/custom">
				    <input type="text" id="textsearch" value="O que está procurando?" name="q" class="textsearch"/>
					<input type="image" name="search" id="search" src="css/images/buttonsearch.png"  class="submit" />
				    <input type="hidden" value="reinodagarotada.org.br" name="domains"/>
					<input type="hidden" id="ss1" value="reinodagarotada.org.br" name="sitesearch"/>
				    <input type="hidden" value="GALT:#008000;GL:1;DIV:#336699;VLC:663399;AH:center;BGC:FFFFFF;LBGC:36546c;ALC:000000;LC:000000;T:0000FF;GFNT:0000FF;GIMP:0000FF;LH:47;LW:236;L:http://davialexandre.com.br/uninove/reinodagarotada/css/images/logo.png;S:http://reinodagarotada.org.br;FORID:1" name="cof"/>
				    <input type="hidden" value="pt" name="hl"/>
				</form>
			</div> 
			</div>
			<div id="general">	
				<div id="barra_lateral" style="float: left">
					<?php $request_route = implode('/',array_slice(explode('/', $_REQUEST['r']), 0, 2)); ?>
					<?php $submenu = render_menu(get_parent_item(get_menu(), 'index.php?r='.$request_route), false); ?>
					<?php if($submenu): ?>
					<div id="submenu">
						<div class="rbtop"><div></div></div>
							<?php echo $submenu; ?>
						<div class="rbbot"><div></div></div>
					</div>
					<?php endif; ?>
					<div id="collaborate">
							<a href="#"><h2>Colabore</h2></a>
							<p class="text1">A procura por vagas no Reino da Garotada de Poá é enorme. A fila de espera chega a 700 crianças e adolescentes, ou seja, <b>seria preciso dobrar a nossa capacidade</b> para quetodos possam ter acesso ao nosso atendimento.</p>
							<p class="text2">Colabore e dê um futuro melhor para essas crianças:</p>
							<a class="gocollaborate" href="index.php?r=site/colabore">EU QUERO COLABORAR!</a>
					</div>
					<div id="newsletter">
						<a href="#"><h2>Newsletter</h2></a>
						<p class="text">Assine nossa newsletter para manter-se informado de tudo o que acontece no <b>Reino da Garotada.</b></p>
						<p class="sign">Para assinar, informe seu e-mail:</p>
						<div class="sendemail">
							<input type="text" name="textemail" id="textemail"  class="textemail" />
							<input type="image" name="newsletter" id="newsletter" src="css/images/buttonsend.png"  class="send" />
						</div>
					</div>	
				</div>
				<div id="content">
					<div class="rbtop1"><div></div></div>
					<?php echo render_breadcrumb(set_breadcrumb()); ?>
					<?php echo $content; ?>
					<div class="rbbot1"><div></div></div>
				</div>
			</div>
			<div id="footer">
				<ul class="links">
					<li><a href="#">voltar para o topo</a></li>
					<li><a href="index.php?r=site/colabore">como ajudar?</a></li>
					<li><a href="index.php?r=site/termos">termos de uso</a></li>
					<li><a href="index.php?r=site/fale_conosco">contato</a></li>
					<li><a href="index.php?r=site/rss" class="last">rss</a></li>
				</ul>
				<p class="address">Rua Padre Eustáquio, 347 &nbsp;-&nbsp; Vila Archimedes &nbsp;-&nbsp; Poá/SP - Cep: 08562-400<br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Telefones: (11) 4638-2466 - Fax: (11) 4638-3444</p>
				<p class="copy">Reino da Garotada de Poá - Todos os direitos reservados 2002-2009</p>
			</div>
		</div>
	</body>
	<script type="text/javascript">
	// <![CDATA[
		window.onload = function() {
			var textsearch = document.getElementById('textsearch');
			textsearch.onfocus = function() {
				this.value = '';
			}
			textsearch.onblur = function() {
				if(this.value == '') {
					this.value = 'O que está procurando?';
				}
			}
		}
	// ]]>
	</script>
</html>
