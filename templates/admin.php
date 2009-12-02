<!DOCTYPE html PUBLIC
	"-//W3C//DTD XHTML 1.0 Transitional//EN"
	"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="pt-br" lang="pt-br">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
		<title><?php echo $title; ?></title>
		<?php echo $head_scripts; ?>
		<link rel="stylesheet" type="text/css" href="css/admin.css" />
		<link rel="stylesheet" type="text/css" href="css/forms.css" />
	</head>
	<body>
		<h1>Área Administrativa - http://reinodagarotada.org.br</h1>
		<div id="opcoes_administrativas">
			<h3>Post</h3>
			<ul>
				<li><a href="index.php?r=post/create">Criar Post</a></li>
				<li><a href="index.php?r=post/list">Ver posts criados</a></li>
				<li><a href="index.php?r=categoria/create">Administrar categorias</a></li>
				<li><a href="index.php?r=comentario/list">Administrar comentarios</a></li>
			</ul>
			<h3>Eventos</h3>
			<ul>
				<li><a href="index.php?r=eventos/create">Cadastrar Evento</a></li>
				<li><a href="index.php?r=eventos/list">Listar Eventos</a></li>
			</ul>
			<h3>Usuarios</h3>
			<ul>
				<li><a href="index.php?r=usuarios/create">Criar usuario</a></li>
				<li><a href="index.php?r=usuarios/list">Administrar usuarios</a></li>
				<li><a href="#">Gerenciar permissoes de usuarios</a></li>
			</ul>
		</div>
		<div id="conteudo_admin">
			<?php echo $content; ?>
		</div>
	</body>
</html>
