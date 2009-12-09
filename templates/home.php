<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
  <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
	<title>Reino da Garotada de Póa</title>
	<link rel="stylesheet" type="text/css" href="css/style.css" />
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
		<div id="content">
		  <?php echo $content; ?>
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
