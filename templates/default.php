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
				<a href="#"><h1>Reino da Garotada</h1></a>
				<ul id="menu">
					<li>
						<a href="#">Institucional</a>
						<ul class="sub">
							<li><a href="#">Histórico</a></li>
							<li><a href="#">Missão</a></li>
							<li><a href="#">Inovação</a></li>
							<li><a href="#">Prêmios</a></li>
							<li><a href="#">Dados</a></li>
							<li><a href="#">Diretoria</a></li>
							<li><a href="#">Fontes / Recursos</a></li>
						</ul>
					</li>
					<li>
						<a href="#">Programas</a>
						<ul class="sub">
							<li><a href="#">Creche 0/6 anos</a></li>
							<li><a href="#">Centro de Juventude</a></li>
							<li><a href="#">Oficinas Escola 14/17 anos</a></li>
							<li><a href="#">Projeto Tear</a></li>
							<li><a href="#">Integração / Comunidade</a></li>
							<li><a href="#">Avaliação do Programa</a></li>
							<li><a href="#">Critérios de Seleção</a></li>
						</ul>
					</li>
					<li>
						<a href="#">Novidades</a>
						<ul class="sub">
							<li><a href="#">Boletim</a></li>
							<li><a href="#">Novas do Reino</a></li>
						</ul>
					</li>
					<li><a href="#">Fale Conosco</a></li>
					<li><a href="#">Como ajudar?</a></li>
				</ul>
			<div id="search">
				<input type="text" name="textsearch" id="textsearch" value="O que está procurando?" class="textsearch" />
				<input type="image" name="search" id="search" src="css/images/buttonsearch.png"  class="submit" />
			</div> 
			</div>
			<div id="general">	
				<div id="barra_lateral" style="float: left">
					<div id="submenu">
						<div class="rbtop"><div></div></div>
							<h2>Institucional</h2>
							<ul>
								<li><a href="#">Histórico</a></li>
								<li><a href="#">Missão</a></li>
								<li><a href="#">Inovação</a></li>
								<li><a href="#">Prêmios</a></li>
								<li><a href="#">Dados</a></li>
								<li><a href="#">Diretoria</a></li>
								<li><a href="#">Fontes / Recursos</a></li>
							</ul>
						<div class="rbbot"><div></div></div>
					</div>
					<div id="collaborate">
							<a href="#"><h2>Colabore</h2></a>
							<p class="text1">A procura por vagas no Reino da Garotada de Poá é enorme. A fila de espera chega a 700 crianças e adolescentes, ou seja, <b>seria preciso dobrar a nossa capacidade</b> para quetodos possam ter acesso ao nosso atendimento.</p>
							<p class="text2">Colabore e dê um futuro melhor para essas crianças:</p>
							<a class="gocollaborate" href="#">EU QUERO COLABORAR!</a>
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
				<div id="content" style="float: left; position: relative; left: 20px; top:0;">
					<?php echo render_breadcrumb(set_breadcrumb()); ?>
					<?php echo $content; ?>
				</div>
			</div>
			<div id="footer">
				<ul class="links">
					<li><a href="#">voltar para o topo</a></li>
					<li><a href="#">como ajudar?</a></li>
					<li><a href="#">termos de uso</a></li>
					<li><a href="#">política de privacidade</a></li>
					<li><a href="#">contato</a></li>
					<li><a href="#" class="last">rss</a></li>
				</ul>
				<p class="address">Rua Padre Eustáquio, 347 &nbsp;-&nbsp; Vila Archimedes &nbsp;-&nbsp; Poá/SP - Cep: 08562-400<br />
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Telefones: (11) 4638-2466 - Fax: (11) 4638-3444</p>
				<p class="copy">Reino da Garotada de Poá - Todos os direitos reservados 2002-2009</p>
			</div>
		</div>
	</body>
</html>
