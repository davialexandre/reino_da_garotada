-- phpMyAdmin SQL Dump
-- version 3.3.3
-- http://www.phpmyadmin.net
--
-- Servidor: mysql01-farm26.kinghost.net
-- Tempo de Geração: Nov 10, 2011 as 01:26 AM
-- Versão do Servidor: 5.5.8
-- Versão do PHP: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Banco de Dados: `davialexandre08`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

CREATE TABLE IF NOT EXISTS `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `descricao` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`id`, `nome`, `descricao`) VALUES
(1, 'noticias', 'Notícias diversas'),
(2, 'eventos', 'Notícias sobre os eventos que acontecem no Reino da Garotada'),
(3, 'projetos', 'Notícias sobre os projetos desenvolvidos no Reino da Garotada'),
(4, 'pagina', 'Uma página simples'),
(5, 'boletim', 'Boletim do Reino');

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria_post`
--

CREATE TABLE IF NOT EXISTS `categoria_post` (
  `id_post` int(11) NOT NULL,
  `id_categoria` int(11) NOT NULL,
  PRIMARY KEY (`id_post`,`id_categoria`),
  KEY `fk_CategoriaPost_1` (`id_post`),
  KEY `fk_CategoriaPost_2` (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `categoria_post`
--

INSERT INTO `categoria_post` (`id_post`, `id_categoria`) VALUES
(47, 4),
(48, 4),
(49, 4),
(50, 4),
(51, 4),
(52, 4),
(53, 4),
(55, 4),
(56, 4),
(57, 4),
(58, 4),
(59, 4),
(60, 4),
(61, 4),
(62, 4),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 4),
(69, 5),
(70, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `comentario`
--

CREATE TABLE IF NOT EXISTS `comentario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `texto` text COLLATE utf8_unicode_ci NOT NULL,
  `nome_autor` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `email_autor` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `data_criacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `id_post` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_Comentario_1` (`id_post`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `comentario`
--

INSERT INTO `comentario` (`id`, `titulo`, `texto`, `nome_autor`, `email_autor`, `data_criacao`, `id_post`) VALUES
(1, '', 'dasdsadasdsa', 'davi', 'davi@davialexandre.com.br', '2010-04-17 14:32:01', 67);

-- --------------------------------------------------------

--
-- Estrutura da tabela `eventos`
--

CREATE TABLE IF NOT EXISTS `eventos` (
  `id` int(20) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(50) NOT NULL DEFAULT '',
  `data` date NOT NULL,
  `evento` varchar(70) NOT NULL,
  `data_criacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `eventos`
--

INSERT INTO `eventos` (`id`, `titulo`, `data`, `evento`, `data_criacao`) VALUES
(1, 'Bazar de Natal', '2009-12-05', 'Venha participar do nosso Bazar e ajudar nossas crianças!', '2009-12-08 01:09:37'),
(2, 'Missa de Encerramento', '2009-12-10', 'Um momento de agradecimento pelo ano que se encerra.', '2009-12-08 01:10:48'),
(3, 'Festa de Natal das Crianças', '2009-12-16', 'O último grande evento desse ano, dedica as nossas crianças.', '2009-12-08 01:11:48'),
(4, 'Festa Junina', '2009-06-13', 'Venha participar da nossa tradicional Festa Junina! Traga sua família.', '2009-12-08 23:25:23'),
(5, 'Festa das Crianças', '2009-10-12', 'Uma linda festa para as nossas crianças', '2009-12-08 23:34:19');

-- --------------------------------------------------------

--
-- Estrutura da tabela `item_menu`
--

CREATE TABLE IF NOT EXISTS `item_menu` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `endereco` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `descricao` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `item_superior` int(11) DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_ItemMenu_1` (`item_superior`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=54 ;

--
-- Extraindo dados da tabela `item_menu`
--

INSERT INTO `item_menu` (`id`, `titulo`, `endereco`, `descricao`, `item_superior`) VALUES
(30, 'Institucional', 'index.php?r=institucional/index', '', NULL),
(31, 'Histórico', 'index.php?r=institucional/historico', '', 30),
(32, 'Missão', 'index.php?r=institucional/missao', '', 30),
(33, 'Programas', 'index.php?r=programas/index', '', NULL),
(34, 'Creche 0 a 6 anos', 'index.php?r=programas/creche', '', 33),
(35, 'Geração de Renda', 'index.php?r=programas/geracao_renda', '', 33),
(37, 'Inovação', 'index.php?r=institucional/inovacao', '', 30),
(38, 'Prêmios', 'index.php?r=institucional/premios', '', 30),
(39, 'Dados', 'index.php?r=institucional/dados', '', 30),
(40, 'Diretoria', 'index.php?r=institucional/diretoria', '', 30),
(41, 'Fontes de Recursos', 'index.php?r=institucional/fontes', '', 30),
(42, 'Centro da Juventude', 'index.php?r=programas/centro_juventude', '', 33),
(43, 'Oficina Escola', 'index.php?r=programas/oficina_escola', '', 33),
(44, 'Projeto Tear', 'index.php?r=programas/projeto_tear', '', 33),
(45, 'Integração Comunidade', 'index.php?r=programas/integracao_comunidade', '', 33),
(46, 'Avaliação do Programa', 'index.php?r=programas/avaliacao', '', 33),
(47, 'Critérios de Seleção', 'index.php?r=programas/criterios_selecao', '', 33),
(48, 'Novidades', 'index.php?r=novidades/index', '', NULL),
(49, 'Boletim', 'index.php?r=novidades/boletim', '', 48),
(50, 'Novas do Reino', 'index.php?r=novidades/novas', '', 48),
(51, 'Fale Conosco', 'index.php?r=site/fale_conosco', '', NULL),
(52, 'Como Ajudar?', 'index.php?r=site/colabore', '', NULL),
(53, 'Eventos', 'index.php?r=novidades/eventos', 'Os eventos que acontecem aqui no nosso Reino.', 48);

-- --------------------------------------------------------

--
-- Estrutura da tabela `permissao`
--

CREATE TABLE IF NOT EXISTS `permissao` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `descricao` varchar(50) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `permissao`
--

INSERT INTO `permissao` (`id`, `descricao`) VALUES
(1, 'editar post');

-- --------------------------------------------------------

--
-- Estrutura da tabela `permissao_usuario`
--

CREATE TABLE IF NOT EXISTS `permissao_usuario` (
  `id_permissao` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  PRIMARY KEY (`id_permissao`,`id_usuario`),
  KEY `fk_PermissaoUsuario_1` (`id_permissao`),
  KEY `fk_PermissaoUsuario_2` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Extraindo dados da tabela `permissao_usuario`
--

INSERT INTO `permissao_usuario` (`id_permissao`, `id_usuario`) VALUES
(1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `post`
--

CREATE TABLE IF NOT EXISTS `post` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `chamada` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `corpo` longtext COLLATE utf8_unicode_ci NOT NULL,
  `data_criacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ultima_atualizacao` timestamp NULL DEFAULT NULL,
  `id_autor` int(11) NOT NULL,
  `publicado` tinyint(1) NOT NULL DEFAULT '0',
  `destacado` tinyint(1) DEFAULT NULL,
  `habilitar_comentarios` tinyint(1) DEFAULT '1',
  `mostrar_comentarios` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_Post_1` (`id_autor`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=71 ;

--
-- Extraindo dados da tabela `post`
--

INSERT INTO `post` (`id`, `titulo`, `chamada`, `corpo`, `data_criacao`, `ultima_atualizacao`, `id_autor`, `publicado`, `destacado`, `habilitar_comentarios`, `mostrar_comentarios`) VALUES
(47, 'Histórico', '', '<p><img align="left" alt="" height="129" hspace="10" src="/reinodagarotada/arquivos/images/fachada.jpg" vspace="10" width="200" />O Reino da Garotada de Po&aacute; &eacute; uma associa&ccedil;&atilde;o civil, sem fins lucrativos, fundada em 30 de janeiro de 1944 pelo padre holand&ecirc;s Simon Switzar.</p><p>Durante 40 anos funcionou exclusivamente como internato atendendo crian&ccedil;as &oacute;rf&atilde;s e/ou abandonadas. Nesse per&iacute;odo passou pela primeira mudan&ccedil;a de orfanato tradicional, para atendimento em pequenos n&uacute;cleos, chamados de casas-lares.</p><p>Em 12 de outubro de 1983 devido &agrave;s mudan&ccedil;as sociais ocorridas na cidade, foi inaugurada a Creche para crian&ccedil;as de 0 a 6 anos de idade posteriormente o Centro de Juventude para crian&ccedil;as de 7 a 13 anos de idade e as Oficinas Escola para adolescentes de 14 a 17 anos, os dois &uacute;ltimos com a&ccedil;&otilde;es complementares &agrave; escola. O internato foi totalmente extinto em 1993, data em que a entidade passou a priorizar o trabalho educativo para crian&ccedil;as e adolescentes de fam&iacute;lias de baixa renda da cidade de Po&aacute; e regi&atilde;o.</p>', '2009-12-02 03:03:23', '2009-12-09 02:40:46', 1, 1, 0, 0, 0),
(48, 'Missão', '', '<p>\r\n	<strong>Objetivos</strong> <br />\r\n	O Reino da Garotada de Po&aacute; &eacute; uma associa&ccedil;&atilde;o civil, sem fins lucrativos, de dura&ccedil;&atilde;o por tempo indeterminado, que presta servi&ccedil;os gratuitos, permanentes e sem qualquer discrimina&ccedil;&atilde;o de clientela.</p>\r\n<p>\r\n	<strong>Miss&atilde;o</strong> <br />\r\n	Promover a inclus&atilde;o social, proporcionando assist&ecirc;ncia e forma&ccedil;&atilde;o para crian&ccedil;as, jovens e fam&iacute;lias de baixa renda.&nbsp;</p>\r\n<p>\r\n	<strong>&Aacute;reas de Atua&ccedil;&atilde;o:</strong><br />\r\n	Creche, Centro de Juventude, Oficinas Escola e Gera&ccedil;&atilde;o de Renda</p>', '2009-12-02 03:06:36', '2009-12-02 03:13:00', 1, 1, 0, 0, 0),
(49, 'Inovação', '', '<p>\r\n	&Eacute; uma preocupa&ccedil;&atilde;o da entidade a adequa&ccedil;&atilde;o dos programas &agrave;s necessidades atuais da comunidade. A transforma&ccedil;&atilde;o da assist&ecirc;ncia social em programas s&oacute;cio-educativos, onde a parceria escola/fam&iacute;lia/comunidade se estabele&ccedil;a no dia-a-dia, todos como agentes co-respons&aacute;veis pela educa&ccedil;&atilde;o, &eacute; uma meta que se pretende atingir de forma plenamente satisfat&oacute;ria. Com objetivo de melhorar a qualidade do trabalho os educadores participam de cursos de capacita&ccedil;&atilde;o profissional (reciclagem) oferecidos pela entidade.</p>\r\n<p>\r\n	A implanta&ccedil;&atilde;o do laborat&oacute;rio de inform&aacute;tica e outras atividades que sejam atraentes para os alunos faz parte desse processo de mudan&ccedil;a.&nbsp;</p>', '2009-12-02 03:14:35', NULL, 1, 1, 0, 0, 0),
(50, 'Prêmios', '', '<p>\r\n	O Reino da Garotada de Po&aacute; recebeu nos anos de 1998, 2001, 2004 e 2006 o Pr&ecirc;mio Bem Eficiente, outorgado anualmente para as 50 Entidades Beneficentes mais bem administradas do pa&iacute;s.</p>\r\n<p>\r\n	O Pr&ecirc;mio , na sua 10&ordf; edi&ccedil;&atilde;o, concebido pelo professor Stephan Kanitz, da Kanitz&amp;Associados, recebe o apoio das empresas Accor, Banco Dibens, Firmenich, Grupo Solvay e Interm&eacute;dica Sistema de Sa&uacute;de.&nbsp;</p>\r\n<p>\r\n	O objetivo dessa pr&ecirc;mia&ccedil;&atilde;o &eacute; prestar um justo reconhecimento &agrave;s entidades que alcan&ccedil;aram a excel&ecirc;ncia no desempenho profissional fazendo o bem, dentro de uma estrutura profissional, operando com custos baixos, com transpar&ecirc;ncia e supervis&atilde;o externa. O Pr&ecirc;mio Bem Eficiente&reg; visa exclusivamente o reconhecimento p&uacute;blico de um trabalho bem feito.</p>\r\n<p>\r\n	A lista das 50 vencedoras est&aacute; dispon&iacute;vel no site www.melhores.com.br, onde tamb&eacute;m &eacute; poss&iacute;vel conhecer a rela&ccedil;&atilde;o de outras entidades Vencedoras.</p>\r\n<p>\r\n	Nesta edi&ccedil;&atilde;o especial de 2006, o Reino da Garotada de Po&aacute; concorreu com todas as entidades que j&aacute; venceram a premia&ccedil;&atilde;o em anos anteriores e foi avaliado segundo seus resultados organizacionais, financeiros, operacionais, sua transpar&ecirc;ncia e impacto social.</p>\r\n<p>\r\n	Cada uma das entidades foi analisada segundo 42 crit&eacute;rios de avalia&ccedil;&atilde;o, pelos padr&otilde;es internacionais, na &aacute;rea de benefic&ecirc;ncia.</p>\r\n<p>\r\n	A filantropia no Brasil ainda &eacute; uma atividade incipiente e que precisa ser estimulada para que possamos resolver os problemas sociais.</p>\r\n<p>\r\n	Muitos empres&aacute;rios e doadores acabam n&atilde;o disponibilizando recursos por n&atilde;o conhecerem ou n&atilde;o confiarem na efici&ecirc;ncia das entidades brasileiras.</p>\r\n<p style="text-align: center; ">\r\n	<img align="middle" alt="" height="225" src="/reinodagarotada/arquivos/images/Massa_premio_2006.jpg" vspace="10" width="300" /></p>\r\n<p style="text-align: center; ">\r\n	<img align="middle" alt="" height="225" src="/reinodagarotada/arquivos/images/turma_premio_2006.jpg" width="300" /></p>', '2009-12-02 03:17:01', NULL, 1, 1, 0, 0, 0),
(51, 'Dados da Instituição', '', '<p>\r\n	<strong>REINO DA GAROTADA DE PO&Aacute;</strong></p>\r\n<p>\r\n	RUA PADRE EUST&Aacute;QUIO, 347 - VILA ARCHIMEDES - PO&Aacute;/SP<br />\r\n	CEP: 08562-400<br />\r\n	TEL. (55 11) 4638-2466 - FAX (55 11) 4638-3444<br />\r\n	E-mail: <a href="mailto:reino@reinodagarotada.org.br">reino@reinodagarotada.org.br</a><br />\r\n	Site: <a href="http://www.reinodagarotada.org.br">http://www.reinodagarotada.org.br</a></p>\r\n<p>\r\n	Utilidade P&uacute;blica: Decreto Federal 70.380 de 10/04/72<br />\r\n	Decreto Estadual: 49.404 de 29/03/68<br />\r\n	Lei Municipal 478 de 12/02/57<br />\r\n	Conselho Nacional de Assist&ecirc;ncia Social 36.699/50-70 de 09/02/51 <br />\r\n	CNPJ: 55.026.231/0001-66<br />\r\n	Inscri&ccedil;&atilde;o Estadual: Isento&nbsp;</p>', '2009-12-02 03:19:15', '2009-12-05 19:12:00', 1, 1, 0, 0, 0),
(52, 'Relação de Diretores e Conselheiros', '', '<p>\r\n	<strong>CONSELHO DE ADMINISTRA&Ccedil;&Atilde;O<br />\r\n	<span class="Apple-style-span" style="font-weight: normal; ">Thomas Ricardo Auerbach &ndash; Presidente&nbsp;<br />\r\n	Maurice Max &ndash; Vice Presidente<br />\r\n	Ichiro Ota &ndash; Conselheiro<br />\r\n	Marinho Mendes &ndash; Conselheiro<br />\r\n	Jos&eacute; Massa &ndash; Conselheiro</span></strong></p>\r\n<p>\r\n	<strong>DIRETORIA<br />\r\n	<span class="Apple-style-span" style="font-weight: normal; ">Sra. Herm&iacute;nia de Oliveira Moraes &ndash; Presidente<br />\r\n	Dr. Marco Aur&eacute;lio Alves Feitosa &ndash; Vice Presidente&nbsp;<br />\r\n	Sr. Fermin Puerta Filho &ndash; Diretor Financeiro<br />\r\n	Dra. Daisy Hebling Alen &ndash; Diretora Secret&aacute;ria</span></strong></p>\r\n<p>\r\n	<strong>CONSELHO FISCAL<br />\r\n	<span class="Apple-style-span" style="font-weight: normal; ">Ariovaldo Manoel Vieira<br />\r\n	Gilberto Martins de Oliveira<br />\r\n	Nivaldo Martin Castro<br />\r\n	Ruy Souza do Amaral &ndash; Suplente</span></strong></p>\r\n<p>\r\n	<strong>CONSELHO CONSULTIVO<br />\r\n	<span class="Apple-style-span" style="font-weight: normal; ">Donald Joseph A. de Camargo<br />\r\n	Durval de Noronha Goya Junior<br />\r\n	Fernando Ulhoa Levy<br />\r\n	Gerd Sjolie<br />\r\n	Gino Pereira dos Reis<br />\r\n	L&uacute;cia Lacerda Corr&ecirc;a<br />\r\n	Marcial Ribeiro dos Santos Filho<br />\r\n	Roberto Dreyfuss</span></strong></p>\r\n<p>\r\n	<strong>COORDENA&Ccedil;&Atilde;O GERAL<br />\r\n	<span class="Apple-style-span" style="font-weight: normal; ">Rosely Lopes Lordello</span></strong></p>', '2009-12-02 03:21:45', NULL, 1, 1, 0, 0, 0),
(53, 'Fontes de Recursos', '', '<p>\r\n	Os recursos utilizados no atendimento &agrave;s crian&ccedil;as, adolescentes e fam&iacute;lias, pagamento de funcion&aacute;rios, na compra de materiais, alimentos e reformas, s&atilde;o obtidos da seguinte forma:</p>\r\n<ul>\r\n	<li>\r\n		Conv&ecirc;nios com o Governo&nbsp;</li>\r\n	<li>\r\n		Doa&ccedil;&atilde;o de pessoas f&iacute;sicas e jur&iacute;dicas&nbsp;</li>\r\n	<li>\r\n		Conv&ecirc;nios com Funda&ccedil;&otilde;es e Associa&ccedil;&otilde;es&nbsp;</li>\r\n	<li>\r\n		Realiza&ccedil;&atilde;o de eventos (festas e bazares)</li>\r\n</ul>\r\n<p>\r\n	Anualmente o Reino da Garotada de Po&aacute; recebe auditoria da empresa KPMG - Auditores Independentes para a avalia&ccedil;&atilde;o de todo processo cont&aacute;bil da entidade. Oferecendo assim, maior transpar&ecirc;ncia aos seus colaboradores e parceiros.</p>', '2009-12-02 03:23:28', NULL, 1, 1, 0, 0, 0),
(55, 'Centro da Juventude', '', '<p>\r\n	&Eacute; um programa de complementa&ccedil;&atilde;o escolar que atende crian&ccedil;as de 7 a 13 anos matriculadas na rede p&uacute;blica de ensino &frac12; per&iacute;odo. S&atilde;o desenvolvidas atividades que contribuam para a perman&ecirc;ncia e o sucesso na escola.&nbsp;<br />\r\n	O objetivo principal do programa &eacute; o desenvolvimento integral da crian&ccedil;a, favorecendo o acesso ao conhecimento, o est&iacute;mulo ao potencial criativo e a forma&ccedil;&atilde;o da consci&ecirc;ncia cr&iacute;tica da realidade. As atividades, programadas de forma l&uacute;dica, est&atilde;o em estreita rela&ccedil;&atilde;o com a fam&iacute;lia, escola e a comunidade. Tudo isso visando formar um cidad&atilde;o consciente de seus direitos e deveres, com boa auto-estima e que possa acompanhar e estar inserido na evolu&ccedil;&atilde;o dos acontecimentos que permeiam a sociedade moderna.<br />\r\n	As crian&ccedil;as s&atilde;o dividas por faixa et&aacute;ria e participam das seguintes oficinas de arte-educa&ccedil;&atilde;o:&nbsp;</p>\r\n<ul>\r\n	<li>\r\n		&nbsp;Artes Pl&aacute;sticas</li>\r\n	<li>\r\n		Recrea&ccedil;&atilde;o e Lazer</li>\r\n	<li>\r\n		Esporte</li>\r\n	<li>\r\n		Artes C&ecirc;nicas</li>\r\n	<li>\r\n		M&uacute;sica</li>\r\n	<li>\r\n		Artes R&iacute;tmicas</li>\r\n	<li>\r\n		M&uacute;sica</li>\r\n	<li>\r\n		Inform&aacute;tica</li>\r\n	<li>\r\n		Orienta&ccedil;&atilde;o de Estudos.</li>\r\n</ul>', '2009-12-06 23:39:46', '2009-12-06 23:40:29', 1, 1, 0, 0, 0),
(56, 'Oficina Escola', '', '<p>\r\n	Oferece cursos de capacita&ccedil;&atilde;o, em conv&ecirc;nio com o Senai, nos programas, PIPM (Programa de Inicia&ccedil;&atilde;o Profissional do Menor) e PCFP (Programa Comunit&aacute;rio de Forma&ccedil;&atilde;o Profissional). O aluno tem a possibilidade de desenvolver seu potencial, testar suas aptid&otilde;es, al&eacute;m de complementar os conte&uacute;dos escolares. S&atilde;o oferecidos 7 cursos, nos per&iacute;odos matutino e vespertino, que est&atilde;o divididos entre m&oacute;dulos b&aacute;sico e espec&iacute;fico, funcionando de maneira integrada, com uma carga hor&aacute;ria total de 800 horas. Al&eacute;m do desenvolvimento de habilidades, a oficina-escola tamb&eacute;m investe na forma&ccedil;&atilde;o global dos alunos. No m&oacute;dulo b&aacute;sico, assim denominado, os alunos s&atilde;o estimulados a desenvolver as capacidades b&aacute;sicas indispens&aacute;veis &agrave;s exig6encias do mercado de trabalho e do mundo moderno.<br />\r\n	S&atilde;o desenvolvidas tamb&eacute;m atividades esportivas, de recrea&ccedil;&atilde;o e lazer, educa&ccedil;&atilde;o ambiental, educa&ccedil;&atilde;o para o trabalho e outros assuntos de interesses pr&oacute;prios dessa faixa et&aacute;ria.<br />\r\n	Todas as atividades visaram o crescimento educacional e o favorecimento do sucesso escolar, transmitindo informa&ccedil;&otilde;es e possibilitando viv&ecirc;ncias, discutindo quest&otilde;es ligadas &agrave; cidadania e &eacute;tica, oferecendo apoio social, afetivo e intelectual.<br />\r\n	Cursos Oferecidos: </p>\r\n<ul>\r\n	<li>\r\n		Mec&acirc;nica Geral</li>\r\n	<li>\r\n		Inform&aacute;tica</li>\r\n	<li>\r\n		Instala&ccedil;&otilde;es El&eacute;tricas</li>\r\n	<li>\r\n		Panifica&ccedil;&atilde;o e Confeitaria</li>\r\n	<li>\r\n		Corte e Costura</li>\r\n	<li>\r\n		Marcenaria</li>\r\n	<li>\r\n		Tape&ccedil;aria de M&oacute;veis.</li>\r\n</ul>', '2009-12-06 23:42:12', '2009-12-06 23:42:53', 1, 1, 0, 0, 0),
(57, 'Geração de Renda', '', '<p>\r\n	Tem como objetivo atender anualmente 20 fam&iacute;lias de baixa renda cujos filhos freq&uuml;entam regularmente os programas da entidade, oferecendo apoio s&oacute;cio-educativo para que possam iniciar um projeto pessoal, melhorando assim suas condi&ccedil;&otilde;es de vida, proporcionando a manuten&ccedil;&atilde;o e o fortalecimento do vinculo familiar.<br />\r\n	O projeto tem a dura&ccedil;&atilde;o de um ano, e oferece cursos de capacita&ccedil;&atilde;o profissional nas &aacute;reas de panifica&ccedil;&atilde;o e confeitaria, tear artesanal e corte e costura. Al&eacute;m dessas atividades, s&atilde;o trabalhadas quest&otilde;es referentes &agrave; higiene e sa&uacute;de, orienta&ccedil;&atilde;o para o trabalho, vida em fam&iacute;lia, cuidados pessoais, educa&ccedil;&atilde;o dos filhos e conte&uacute;dos pertinentes ao projeto de gera&ccedil;&atilde;o de renda escolhido.</p>', '2009-12-06 23:44:35', NULL, 1, 1, 0, 0, 0),
(58, 'Projeto Tear', '', '<p>\r\n	O Reino da Garotada de Po&aacute; inaugurou em mar&ccedil;o de 2007, mais um projeto que promove gera&ccedil;&atilde;o de renda e melhoria das condi&ccedil;&otilde;es de vida de fam&iacute;lias em situa&ccedil;&atilde;o de exclus&atilde;o e vulnerabilidade social. A nova iniciativa oferece capacita&ccedil;&atilde;o em tecelagem artesanal durante o per&iacute;odo de um ano para 30 adultos, chefes de fam&iacute;lia de Po&aacute; e regi&atilde;o - pais e m&atilde;es de crian&ccedil;as e adolescentes da institui&ccedil;&atilde;o, beneficiando indiretamente 150 pessoas.<br />\r\n	O programa come&ccedil;ou suas atividades como projeto piloto ainda em 2006, obtendo &oacute;tima participa&ccedil;&atilde;o da comunidade.&nbsp;<br />\r\n	O objetivo desse projeto &eacute; reduzir a situa&ccedil;&atilde;o de risco social e promover a inclus&atilde;o s&oacute;cio-econ&ocirc;mica das fam&iacute;lias, contribuindo para a empregabilidade, empreendedorismo e exerc&iacute;cio da cidadania, ou seja, as fam&iacute;lias em situa&ccedil;&atilde;o de risco ter&atilde;o a chance de se capacitar profissionalmente, obtendo renda e acesso a bens e servi&ccedil;os, o que dever&aacute; impactar diretamente na qualidade de vida dessas fam&iacute;lias.<br />\r\n	As pessoas que vivem em situa&ccedil;&atilde;o cr&iacute;tica ter&atilde;o a possibilidade de sair da margem e exercer a cidadania, participando, como m&atilde;o de obra qualificada de um significativo elo da cadeia produtiva do setor t&ecirc;xtil da regi&atilde;o<br />\r\n	O projeto tamb&eacute;m desenvolver&aacute; atividades s&oacute;cio-educativas para troca de informa&ccedil;&otilde;es relacionadas &agrave; gera&ccedil;&atilde;o de renda.</p>', '2009-12-06 23:46:51', NULL, 1, 1, 0, 0, 0),
(59, 'Integração com a Comunidade', '', '<p>\r\n	Po&aacute; &eacute; uma cidade dormit&oacute;rio, e tem recebido muitos novos habitantes que se afastam da capital, buscando melhores condi&ccedil;&otilde;es de habita&ccedil;&atilde;o e conseq&uuml;entemente de educa&ccedil;&atilde;o e sa&uacute;de para a fam&iacute;lia.<br />\r\n	O Reino da Garotada de Po&aacute; procura estar sintonizado com a comunidade e esse &eacute; o principal motivo das mudan&ccedil;as ocorridas durante os 59 anos de exist&ecirc;ncia da entidade.<br />\r\n	Atendendo uma parcela significativa da popula&ccedil;&atilde;o, o Reino tem buscado uma parceria com a comunidade, a escola e as fam&iacute;lias para o desenvolvimento de seu trabalho.</p>\r\n<p>\r\n	Comunidade:</p>\r\n<ul>\r\n	<li>\r\n		Estimula&ccedil;&atilde;o da participa&ccedil;&atilde;o da comunidade nas atividades da entidade</li>\r\n	<li>\r\n		Participa&ccedil;&atilde;o da entidade em festas e eventos da cidade</li>\r\n	<li>\r\n		Participa&ccedil;&atilde;o da entidade no Conselho Mun. Assist. Social</li>\r\n	<li>\r\n		Utiliza&ccedil;&atilde;o e interc&acirc;mbio com os servi&ccedil;os p&uacute;blicos do munic&iacute;pio.</li>\r\n</ul>\r\n<p>\r\n	Escola:</p>\r\n<ul>\r\n	<li>\r\n		Busca do estreitamento de la&ccedil;os com as escolas que atendem as crian&ccedil;as que participam dos programas da entidade</li>\r\n	<li>\r\n		Convite por parte da entidade e participa&ccedil;&atilde;o das escolas em curso de forma&ccedil;&atilde;o de educadores</li>\r\n	<li>\r\n		Acompanhamento do desenvolvimento das crian&ccedil;as nas atividades escolares</li>\r\n</ul>\r\n<p>\r\n	Fam&iacute;lia:</p>\r\n<ul>\r\n	<li>\r\n		Est&iacute;mulo &agrave; participa&ccedil;&atilde;o das fam&iacute;lias de maneira informal, para que sintam a entidade como um espa&ccedil;o educativo agrad&aacute;vel.</li>\r\n	<li>\r\n		Orienta&ccedil;&atilde;o das fam&iacute;lias em suas necessidades. Ex.: encontros, conversas, participa&ccedil;&atilde;o nas atividades.</li>\r\n</ul>', '2009-12-06 23:49:21', '2009-12-06 23:49:46', 1, 1, 0, 0, 0),
(60, 'Avaliação do Programa', '', '<p>Todas as atividades s&atilde;o acompanhadas de perto pelo coordenador de cada setor, que semanalmente avalia as atividades desenvolvidas com os educadores (instrutores e/ou monitores).</p><p>As crian&ccedil;as e adolescentes tamb&eacute;m participam desse processo e fornecem o feed back (formal e informal) para que as atividades sejam reformuladas e/ou o atendimento melhorado.<br />\r\nS&atilde;o realizadas reuni&otilde;es mensais com todos os coordenadores, para troca de informa&ccedil;&otilde;es e ajustes necess&aacute;rios. As fam&iacute;lias e a escola tamb&eacute;m fornecem informa&ccedil;&otilde;es e subs&iacute;dios para uma avalia&ccedil;&atilde;o mais completa dos programas.</p>', '2009-12-06 23:50:37', '2009-12-09 02:40:34', 1, 1, 0, 0, 0),
(61, 'Critérios de Seleção', '', '<ul>\r\n	<li>\r\n		Renda familiar mensal (prioridade para crian&ccedil;as e adolescentes de fam&iacute;lia com baixa renda);</li>\r\n	<li>\r\n		A crian&ccedil;a deve estar matriculada e freq&uuml;entando escola p&uacute;blica;</li>\r\n	<li>\r\n		Apresenta&ccedil;&atilde;o de comprovante de trabalho dos pais.</li>\r\n</ul>\r\n<p>H&aacute; um per&iacute;odo de inscri&ccedil;&otilde;es e ap&oacute;s o estudo de caso, levando-se em considera&ccedil;&atilde;o os itens acima descritos, &eacute; realizada uma triagem para a matr&iacute;cula.</p><p>Para as Oficinas Escola, al&eacute;m dos itens acima, &eacute; realizada uma prova de sele&ccedil;&atilde;o com conhecimentos de matem&aacute;tica e portugu&ecirc;s em n&iacute;vel de 4a. s&eacute;rie.</p>', '2009-12-06 23:51:48', '2009-12-09 02:38:27', 1, 1, 0, 0, 0),
(62, 'Creche de 0 a 6 anos', '', '<p>O programa de educa&ccedil;&atilde;o infantil oferecido pela Creche atende crian&ccedil;as de 0 a 6 anos per&iacute;odo integral (8 horas) e oferece 4 refei&ccedil;&otilde;es di&aacute;rias. Tem como objetivo uma proposta educacional que contribui para a melhoria da qualidade de vida da crian&ccedil;a, estimulando o desenvolvimento pleno de seu potencial criativo e sua autonomia.<br />\r\nPara que as crian&ccedil;as receba forma&ccedil;&atilde;o integral s&atilde;o desenvolvidas diversas atividades como m&uacute;sica, artes pl&aacute;sticas, recrea&ccedil;&atilde;o e lazer, teatro e passeios.&nbsp;<br />\r\nA integra&ccedil;&atilde;o com as fam&iacute;lias tamb&eacute;m tem um aspecto importante .</p>', '2009-12-07 00:00:01', '2009-12-09 02:40:12', 1, 1, 0, 0, 0),
(63, 'Reino da Garotada inaugura o Ponto de Cultura Memórias do Olhar', 'O novo espaço em Poá integra o Programa Cultura Viva, do MINC', '<p>&ldquo;Quem sabe eu possa me tornar, no futuro, um Fernando Meireles&rdquo;. Essa frase &eacute; de uma das inscritas na primeira turma do curso de v&iacute;deo do Ponto de Cultura Mem&oacute;rias do Olhar, que o Reino da Garotada de Po&aacute;, SP, est&aacute; inaugurando em mar&ccedil;o. Pelo n&iacute;vel de expectativa da jovem candidata a cineasta, j&aacute; se percebe o quanto a implanta&ccedil;&atilde;o do novo espa&ccedil;o poder&aacute; impulsionar a hist&oacute;ria de vida dos participantes dos cursos oferecidos pela institui&ccedil;&atilde;o nas &aacute;reas de fotografia e v&iacute;deo.&nbsp;</p><p>Aos 64 anos de atua&ccedil;&atilde;o em programas sociais e educacionais dirigidos a crian&ccedil;as e jovens em situa&ccedil;&atilde;o de exclus&atilde;o no munic&iacute;pio da regi&atilde;o grande leste de S&atilde;o Paulo, o Reino da Garotada come&ccedil;a mais um desafio, que &eacute; agregar a cultura digital e a comunica&ccedil;&atilde;o em rede aos seus programas de capacita&ccedil;&atilde;o nas &aacute;reas de marcenaria, tape&ccedil;aria de m&oacute;veis, mec&acirc;nica, instala&ccedil;&otilde;es el&eacute;tricas, corte-costura, padaria, tear e inform&aacute;tica, j&aacute; implantados e bastante procurados pela comunidade.&nbsp;<br />\r\nA cultura digital vem se transformando em instrumento de inclus&atilde;o e valoriza&ccedil;&atilde;o da cidadania. Por todo o pa&iacute;s, o Minist&eacute;rio da Cultura est&aacute; implantando Pontos de Cultura, abrindo espa&ccedil;os para a converg&ecirc;ncia de id&eacute;ias, valoriza&ccedil;&atilde;o da cidadania, encontros art&iacute;sticos e culturais. O projeto do Reino, em funcionamento a partir de 10 de mar&ccedil;o, segue essa filosofia, com base no aprendizado e desenvolvimento das linguagens da fotografia e do v&iacute;deo. A proposta do Ponto de Cultura Mem&oacute;rias do Olhar come&ccedil;a com a oferta de cursos nestas duas artes, nos per&iacute;odos da manh&atilde; e da tarde, de segunda a quinta. Na sexta ser&atilde;o promovidos encontros de todas as turmas dos cursos, com exibi&ccedil;&atilde;o de filmes, realiza&ccedil;&atilde;o de palestras, eventos que tamb&eacute;m ser&atilde;o abertos para a comunidade.&nbsp;<br />\r\nO Ponto de Cultura do Reino pretende interagir com as outras atividades da institui&ccedil;&atilde;o, especialmente com as a&ccedil;&otilde;es do &ldquo;Jardim Liter&aacute;rio&rdquo;, biblioteca da institui&ccedil;&atilde;o, que come&ccedil;ar&aacute; um acervo, a partir de doa&ccedil;&otilde;es, voltado para fotografia, v&iacute;deo, cinema, cybercultura e disciplinas relacionadas a estas linguagens.&nbsp;<br />\r\nA mem&oacute;ria &eacute; um tema bastante significativo para o Reino da Garotada de Po&aacute;. Primeiro, pela necessidade de preservar a sua hist&oacute;ria de quase sete d&eacute;cadas, dos prim&oacute;rdios &ndash; quando atuava como um orfanato fundado pelo padre holand&ecirc;s Simon Switzar, que recebia inclusive crian&ccedil;as de origem ind&iacute;gena &ndash; aos dias atuais com o atendimento a quase mil crian&ccedil;as, jovens e adultos, implantando programas sociais diversificados, como a Creche e o Projeto Tear, de gera&ccedil;&atilde;o de renda, patrocinado pela UPS. Segundo, pela tradi&ccedil;&atilde;o deixada por seu pr&oacute;prio fundador, que sempre manteve arquivos de fotografias, muitas das quais de ineg&aacute;vel valor art&iacute;stico. Parte deste acervo integrou a exposi&ccedil;&atilde;o &ldquo;Po&aacute;, Sonhos e Mem&oacute;ria&rdquo;, que circulou nas escolas p&uacute;blicas da regi&atilde;o, na pr&oacute;pria institui&ccedil;&atilde;o e esteve em cartaz na CAIXA Cultural da Pra&ccedil;a da S&eacute;, em S&atilde;o Paulo. A exposi&ccedil;&atilde;o foi o resultado de projeto patrocinado pela Funda&ccedil;&atilde;o Vitae e apoio da Arcor.<br />\r\nSituado numa extensa &aacute;rea, a apenas cinco minutos da esta&ccedil;&atilde;o de trem de Po&aacute;, em breve o Reino tamb&eacute;m ter&aacute; uma nova quadra de esportes. Atualmente abriga uma unidade do Projeto Guri.<br />\r\nMais informa&ccedil;&otilde;es:<br />\r\nComunica&ccedil;&atilde;o do Reino da Garotada de Po&aacute;&nbsp;<br />\r\nPriscila &ndash; 4638-2466</p>', '2009-12-07 01:42:22', '2009-12-09 02:39:32', 1, 1, 1, 1, 1),
(64, 'UMA HISTÓRIA DE SUCESSO', 'Flávio Mendes, ex-aluno da Oficina de Instalações Elétricas', '<p>&ldquo;Estudei na Oficina Escola do Reino da Garotada, no Programa de Inicia&ccedil;&atilde;o Profissional ao Menor - Senai, no curso de instala&ccedil;&otilde;es el&eacute;tricas, em 1997. Na &eacute;poca, eu era apenas mais um jovem buscando uma qualifica&ccedil;&atilde;o profissional para competir no mercado. Nunca faltava &agrave;s aulas e participava de todas as tarefas. Me formei, trabalhei na &aacute;rea e continuei os estudos, sempre seguindo as orienta&ccedil;&otilde;es da minha fam&iacute;lia.<br />\r\nAtualmente trabalho como Engenheiro de obras em pr&eacute;dios residenciais e obras de infra-estrutura na RMSP. Dou aulas na Escola Senai Roberto Simonsen, unidade Br&aacute;s, nos cursos de eletricidade, nas disciplinas Efici&ecirc;ncia Energ&eacute;tica, Instala&ccedil;&otilde;es El&eacute;tricas, Comandos Eletroeletr&ocirc;nicos, e na &aacute;rea de Seguran&ccedil;a do Trabalho sobre NR10 &ndash; Seguran&ccedil;a em Instala&ccedil;&otilde;es e Servi&ccedil;os com Eletricidade.<br />\r\nAtuo tamb&eacute;m como respons&aacute;vel t&eacute;cnico em projeto de implanta&ccedil;&atilde;o da NR 10 em todas as Unidades Consumidoras da Sabesp em S&atilde;o Paulo, e ministro treinamento de NR 10 na ISA-CTEEP &ndash; Companhia de Energia El&eacute;trica Paulista.<br />\r\nSou grato ao Reino da Garotada pela parceria com a Escola SENAI, pois foi onde iniciei minha trajet&oacute;ria profissional, e hoje posso repassar o conhecimento adquirido. Algum dia terei a oportunidade de ministrar aulas na institui&ccedil;&atilde;o e poderei relatar aos alunos do Reino o meu exemplo de vida, para conscientiz&aacute;-los da chance que est&atilde;o tendo, e que se aproveitarem, poder&atilde;o ter um futuro pr&oacute;spero.</p>', '2009-12-07 01:48:39', '2009-12-09 02:39:58', 1, 1, 0, 1, 1),
(65, 'Crianças da creche visitam o Zôo', 'No dia 30 de junho as crianças do Jardim da Creche foram passear no Zoológico de São Paulo.', '<p>No dia 30 de junho as crian&ccedil;as do Jardim da Creche foram passear no Zool&oacute;gico de S&atilde;o Paulo.</p><p>A Perez Im&oacute;veis ofereceu o &ocirc;nibus e o lanche, colaborando para proporcionar esses momentos de alegria as nossas crian&ccedil;as.</p><p style="text-align: center; "><img align="middle" alt="" height="300" src="/reinodagarotada/arquivos/images/Zoologico.jpg" width="400" /></p>', '2009-12-07 01:56:54', '2009-12-09 02:39:21', 1, 1, 1, 1, 1),
(66, 'Exposição Memória e Meio Ambiente', 'Mostra apresentou vídeo e fotografias dos alunos do Ponto de Cultura Memórias do Olhar.', '<p>\r\n	Inaugurada no dia 14 de agosto, a mostra apresentou v&iacute;deo e fotografias dos alunos do Ponto de Cultura Mem&oacute;rias do Olhar.</p>\r\n<p>\r\n	A exposi&ccedil;&atilde;o trouxe fotos antigas ao lado de imagens atuais, produzidas pelos participantes do Ponto, chamando aten&ccedil;&atilde;o para a necessidade de preserva&ccedil;&atilde;o do meio ambiente. Uma s&eacute;rie de atividades complementou a programa&ccedil;&atilde;o.</p>\r\n<p style="text-align: center; ">\r\n	<img align="absMiddle" alt="" height="300" src="/reinodagarotada/arquivos/images/Exposicao_memoria_boletim.jpg" width="400" /></p>\r\n<p style="text-align: center; ">\r\n	<img align="middle" alt="" height="300" src="/reinodagarotada/arquivos/images/Exposicao_memoria_boletim_2.jpg" width="400" /></p>', '2009-12-07 01:59:24', '2009-12-07 02:18:48', 1, 1, 0, 1, 1),
(67, 'Escritor Flávio Paiva visita o Jardim Literário', 'O Jardim Literário recebeu, pela primeira vez, a visita de um escritor', '<p>O Jardim Liter&aacute;rio recebeu, pela primeira vez, a visita de um escritor, o cearense Fl&aacute;vio Paiva. Autor de livros como &ldquo;A Festa do Saci&rdquo;, ele respondeu in&uacute;meras perguntas das crian&ccedil;as, num agrad&aacute;vel encontro de incentivo &agrave; leitura no Reino. Fl&aacute;vio tamb&eacute;m escreveu um artigo para o Di&aacute;rio do Nordeste relatando suas impress&otilde;es sobre a institui&ccedil;&atilde;o.</p>', '2009-12-07 02:00:47', '2009-12-09 02:39:48', 1, 1, 0, 1, 1),
(68, 'Como Ajudar?', '', '<p><strong>Futuro amigo colaborador:</strong></p><p>No munic&iacute;pio de Po&aacute; e Regi&atilde;o existem muitas fam&iacute;lias carentes e, por isso, a procura por vagas no Reino da Garotada de Po&aacute; &eacute; enorme.</p><p>A fila de espera chega a 700 crian&ccedil;as e adolescentes, ou seja, seria preciso dobrar a nossa capacidade para que mais crian&ccedil;as e adolescentes possam ter acesso ao nosso atendimento.</p><p>Um sonho poss&iacute;vel que depende de pessoas como voc&ecirc;, conscientes e dispostas a exercer sua cidadania e a colaborar com uma sociedade menos violenta e mais justa.</p><p>Dados da Entidade que voc&ecirc; vai precisar para realizar a transfer&ecirc;ncia banc&aacute;ria.:</p><p>Entidade: Reino da Garotada de Po&aacute;<br />\r\nCNPJ: 55.026.231/0001-66</p><p>Bancos:</p>\r\n<table align="center" border="0" cellpadding="1" cellspacing="1" style="height: 314px; width: 417px;">\r\n	<tbody>\r\n		<tr>\r\n			<td>\r\n				<img alt="" height="60" src="/reinodagarotada/arquivos/images/Logo_banespa.gif" width="61" /></td>\r\n			<td>\r\n				Ag&ecirc;ncia: 0353 Conta corrente: 13001141-0</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<img alt="" height="56" src="/reinodagarotada/arquivos/images/Logo_bb.jpg" width="55" /></td>\r\n			<td>\r\n				Ag&ecirc;ncia: 2466-X Conta corrente: 7432-2&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<img alt="" height="60" src="/reinodagarotada/arquivos/images/Logo_Bradesco.jpg" width="61" /></td>\r\n			<td>\r\n				Ag&ecirc;ncia: 407-3 Conta corrente: 79157-1</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<img alt="" height="60" src="/reinodagarotada/arquivos/images/Logo_Caixa.jpg" width="61" /></td>\r\n			<td>\r\n				Ag&ecirc;ncia: 0244-5 Conta corrente: 04001478-7&nbsp;</td>\r\n		</tr>\r\n		<tr>\r\n			<td>\r\n				<img alt="" height="60" src="/reinodagarotada/arquivos/images/logo_itau.gif" width="61" /></td>\r\n			<td>\r\n				Ag&ecirc;ncia: 1480 Conta corrente: 03927-8</td>\r\n		</tr>\r\n	</tbody>\r\n</table>\r\n<p>Al&eacute;m do dep&oacute;sito banc&aacute;rio, voc&ecirc; tamb&eacute;m pode utilizar o UOL PagSeguro e realizar sua doa&ccedil;&atilde;o utilizando cart&atilde;o de cr&eacute;dito ou boleto:</p><p style="text-align: center;"><a href="http://pagseguro.uol.com.br" target="_blank"><img align="middle" alt="" height="42" src="/reinodagarotada/arquivos/images/sprite_flags.gif" style="border: 0pt none ;" width="207" /><br />\r\n</a></p>', '2009-12-09 04:11:11', '2009-12-09 12:59:29', 1, 1, 0, 0, 0),
(69, 'Boletim Informativo n. 93', '', '<p><strong>FELIPE ALVES DOS SANTOS - UMA HIST&Oacute;RIA DE SUCESSO</strong><br />\r\n<em>Das oficinas do Reino para as crian&ccedil;as de Angola.</em>&nbsp;&nbsp; <br />\r\n&nbsp;&nbsp;&nbsp; <br />\r\nO que faz um jovem de 21 anos abrir m&atilde;o de seus planos pessoais para sonhar em ajudar o pr&oacute;ximo, enfrentando as dificuldades de um pa&iacute;s devastado por 30 anos de guerra civil? Aconteceu com Felipe Alves dos Santos, que este ano embarcou para Angola e ajudou na constru&ccedil;&atilde;o de salas de aula para crian&ccedil;as &oacute;rf&atilde;s. Pesou na decis&atilde;o o fato de Felipe pertencer a uma fam&iacute;lia que cultua valores religiosos e tamb&eacute;m de ter passado boa parte de sua adolesc&ecirc;ncia no Reino da Garotada, aprendendo um novo of&iacute;cio nas Oficinas-Escola, compartilhando a&ccedil;&otilde;es solid&aacute;rias e exercendo sua cidadania.<br />\r\nFelipe come&ccedil;ou no curso de Instala&ccedil;&otilde;es El&eacute;tricas, estudou inform&aacute;tica, tape&ccedil;aria e, como ele mesmo diz, descobriu a marcenaria. Identificado com o trabalho, ele ganhou experi&ecirc;ncia.&nbsp; Foi um passo para tornar-se monitor, e por indica&ccedil;&atilde;o de seus professores no Reino, conseguir emprego em outras institui&ccedil;&otilde;es, passando o of&iacute;cio que aprendeu para outros jovens. &ldquo;Sempre desejei trabalhar em obra social&rdquo;, afirma. Interessado em se aprimorar, por meio da parceria do Reino com o Senai, ele conseguiu bolsas para fazer v&aacute;rios cursos, tendo aulas de design, desenho t&eacute;cnico, marchetaria e aprendendo a usar o software AutoCad.<br />\r\nAt&eacute; que em 2008, ele se lan&ccedil;ou a um novo desafio. Junto ao INAC (Instituto Nacional da Crian&ccedil;a), &oacute;rg&atilde;o do governo de Angola, conseguiu o visto para entrar no pa&iacute;s com um grupo de pessoas para ajudar a construir salas de aula na cidade de Bi&eacute;, em Kuito, cen&aacute;rio principal da guerra, distante a 1.200 km de Luanda, capital do pa&iacute;s africano. &ldquo;As vezes as pessoas me perguntam porque estou ajudando Angola e n&atilde;o fico no Brasil, onde tamb&eacute;m h&aacute; muita necessidade&rdquo;, observa ele, &ldquo;o problema &eacute; que l&aacute; tudo foi destru&iacute;do, as pessoas, a maioria s&atilde;o crian&ccedil;as &oacute;rf&atilde;s da guerra, n&atilde;o tem nem para quem pedir, ao passo que aqui h&aacute; mais ajuda&rdquo;.<br />\r\nAl&eacute;m da conviv&ecirc;ncia com situa&ccedil;&otilde;es de extrema pobreza, Felipe teve que enfrentar a toda sorte de problemas &ndash; da comida, &agrave; base de &oacute;leo de palmeira, que deixou todos doentes nos primeiros dias, ao custo de vida, baseado na paridade com o d&oacute;lar americano, e at&eacute; mesmo a mal&aacute;ria que o afetou. Para viajar, o grupo de volunt&aacute;rios, do qual Felipe faz parte, teve que arcar com as despesas.<br />\r\nMesmo com todas as dificuldades, Felipe prepara-se para voltar em 2010. Sonha conseguir atender 1000 crian&ccedil;as, num projeto que deve durar 5 anos. &rdquo;Se uma pessoa como o Padre Simon Switzar, fundador do Reino, nos deu o exemplo, vindo do outro lado do mundo para ajudar no Brasil, acho que tamb&eacute;m posso colaborar em outro pa&iacute;s&rdquo;, afirma. &ldquo;Fui muito bem instru&iacute;do no Reino, n&atilde;o s&oacute; nas aulas, como nas orienta&ccedil;&otilde;es de vida e sempre tive muito apoio&rdquo;, relembra. &ldquo;Tudo que fiz aqui &eacute; o que sou&rdquo;, define Felipe, um jovem que nos mostra que o sucesso estar a servi&ccedil;o do bem.<br />\r\n<br />\r\n<strong>MOTIVO DE MUITO ORGULHO</strong><br />\r\n<br />\r\n<strong>- Festa de P&aacute;scoa no Reino</strong><br />\r\n<br />\r\nComemorar a P&aacute;scoa &eacute; sempre uma grande alegria no Reino. As crian&ccedil;as vibraram com os ovos de chocolate distribu&iacute;dos pelo &ldquo;coelhinho&rdquo;, num clima de alegria contagiante. Em dose dupla, a festa aconteceu no dia 07/04 na Creche e em 08/04 no Centro de Juventude. Este ano servimos um almo&ccedil;o especial com direito a sorvetes doados pela sorveteria Nevasca. A institui&ccedil;&atilde;o agradece a todos que contribu&iacute;ram para a realiza&ccedil;&atilde;o da festa, em especial ao Dr. Luiz Carlos Andrezani. Sem esse apoio, n&atilde;o seria poss&iacute;vel concretizar nosso evento, t&atilde;o aguardado pelas crian&ccedil;as.<br />\r\n<br />\r\n<strong>- Coral e Mem&oacute;rias do Olhar no anivers&aacute;rio da cidade</strong><br />\r\n<br />\r\nConvidados pela Secretaria de Cultura de Po&aacute;, o Coral do Reino e o Ponto de Cultura Mem&oacute;rias do Olhar participaram da programa&ccedil;&atilde;o de comemora&ccedil;&atilde;o dos 60 anos de emancipa&ccedil;&atilde;o de Po&aacute;. No dia 20 de mar&ccedil;o, na Pra&ccedil;a do Rel&oacute;gio, as crian&ccedil;as mostraram repert&oacute;rio que incluiu o hino da cidade, numa apresenta&ccedil;&atilde;o bastante apreciada pelo p&uacute;blico.<br />\r\nOs alunos do Ponto de Cultura ofereceram uma oficina de fotografia e, no dia 23 de mar&ccedil;o, exibiram produ&ccedil;&otilde;es pr&oacute;prias no Audit&oacute;rio Taiguara, incluindo o v&iacute;deo document&aacute;rio &ldquo;Mem&oacute;rias&rdquo;, em duas sess&otilde;es de cinema, prestigiadas por um p&uacute;blico diversificado &ndash; dos jovens das Oficinas do Reino aos adultos que compareceram &agrave; noite. Tamb&eacute;m foram exibidos filmes do Festival do Minuto, em parceria com o Ponto. A participa&ccedil;&atilde;o do Reino nas comemora&ccedil;&otilde;es foi divulgada na imprensa local.<br />\r\n<br />\r\n<strong>NOVIDADES</strong><br />\r\n<br />\r\n<strong>- Oficina de Tear promove gera&ccedil;&atilde;o de renda.</strong><br />\r\n<br />\r\nUm projeto que come&ccedil;ou a partir do patroc&iacute;nio da UPS Supply Chain, o Tear artesanal do Reino vem abrindo caminhos para adultos e jovens ingressarem numa nova atividade, que une habilidade e est&eacute;tica, promovendo gera&ccedil;&atilde;o de renda para as fam&iacute;lias da comunidade de Po&aacute;, como demonstram as belas pe&ccedil;as produzidas.<br />\r\nExpostos no pr&oacute;prio Reino e em eventos especiais, produtos como bolsas, tapetes, jogos americanos, cachec&oacute;is e outros mostram a criatividade dos alunos e o bom desempenho alcan&ccedil;ado.<br />\r\nA Oficina conta com 40 alunos, que recebem encomendas e se preparam dia a dia para ampliar sua produ&ccedil;&atilde;o.<br />\r\n<br />\r\n<strong>NOSSO MUITO OBRIGADO !<br />\r\n<br />\r\n- Ch&aacute; bingo ganhou refor&ccedil;o dos jovens.</strong><br />\r\n<br />\r\nRealizado sempre com a colabora&ccedil;&atilde;o de volunt&aacute;rios, o nosso Ch&aacute; Bingo de 25 de abril, desta vez, contou com o refor&ccedil;o dos jovens aprendizes em rotinas de varejo do Supermercado Veran e tamb&eacute;m do Banco do Brasil. Para a realiza&ccedil;&atilde;o desse evento, tivemos o apoio de diversas empresas, que ofereceram produtos para as rodadas, muito animadas pelas torcidas de cada mesa. Agradecemos a&nbsp; todos por esta parceria.<br />\r\n<br />\r\n<strong>- Agradecimentos</strong><br />\r\n<br />\r\nSomos imensamente gratos a todos os colaboradores, empresas, funcion&aacute;rios, amigos que colaboram com o nosso trabalho, sempre nos apoiando, com muita dedica&ccedil;&atilde;o e carinho.<br />\r\nEm 2009, vamos precisar mais do que nunca, do apoio de nossos amigos, que em todos esses anos nos ajudaram a continuar nossa miss&atilde;o.<br />\r\n<br />\r\n<strong>Colaboradores:</strong><br />\r\n<br />\r\n- Supermercado Semar de Suzano;<br />\r\n- Supermercado Estrela de Po&aacute;;<br />\r\n- Supermercado Veran;<br />\r\n- Panificadora Chip&acute;s;<br />\r\n- Cristais Luvidarte;<br />\r\n- Suzy Flores;<br />\r\n- Comovo;<br />\r\n- &Oacute;tica Ind&aacute;ia de Po&aacute;;<br />\r\n- Hamburg&atilde;o Loca&ccedil;&otilde;es;<br />\r\n- TropFrut;<br />\r\n- Cacau Show;<br />\r\n- UPS Suply Chain;<br />\r\n- Fratelli Festas;<br />\r\n- Amigos e colaboradores do Reino;<br />\r\n- Supermercado Nagumo;<br />\r\n- Copa Hortifruti;<br />\r\n- Plastiveta descart&aacute;veis;<br />\r\n- Berseba Av&iacute;cola;<br />\r\n- Oficina escola do Reino;<br />\r\n- Oficina de Tear do Reino;<br />\r\n&nbsp;</p>', '2009-12-09 13:15:58', NULL, 1, 1, 0, 0, 0),
(70, 'Boletim Informativo n. 94', '', '<p><strong>UMA HIST&Oacute;RIA DE SUCESSO</strong><br />\r\n<em>Fl&aacute;vio Mendes, ex-aluno da Oficina de Instala&ccedil;&otilde;es El&eacute;tricas&nbsp;&nbsp;&nbsp; </em><br />\r\n&nbsp;&nbsp;&nbsp; <br />\r\n&ldquo;Estudei na Oficina Escola do Reino da Garotada, no Programa de Inicia&ccedil;&atilde;o Profissional ao Menor - Senai, no curso de instala&ccedil;&otilde;es el&eacute;tricas, em 1997. Na &eacute;poca, eu era apenas mais um jovem buscando uma qualifica&ccedil;&atilde;o profissional para competir no mercado. Nunca faltava &agrave;s aulas e participava de todas as tarefas. Me formei, trabalhei na &aacute;rea e continuei os estudos, sempre seguindo as orienta&ccedil;&otilde;es da minha fam&iacute;lia.<br />\r\nAtualmente trabalho como Engenheiro de obras em pr&eacute;dios residenciais e obras de infra-estrutura na RMSP. Dou aulas na Escola Senai Roberto Simonsen, unidade Br&aacute;s, nos cursos de eletricidade, nas disciplinas Efici&ecirc;ncia Energ&eacute;tica, Instala&ccedil;&otilde;es El&eacute;tricas, Comandos Eletroeletr&ocirc;nicos, e na &aacute;rea de Seguran&ccedil;a do Trabalho sobre NR10 &ndash; Seguran&ccedil;a em Instala&ccedil;&otilde;es e Servi&ccedil;os com Eletricidade.<br />\r\nAtuo tamb&eacute;m como respons&aacute;vel t&eacute;cnico em projeto de implanta&ccedil;&atilde;o da NR 10 em todas as Unidades Consumidoras da Sabesp em S&atilde;o Paulo, e ministro treinamento de NR 10 na ISA-CTEEP &ndash; Companhia de Energia El&eacute;trica Paulista.<br />\r\n<br />\r\nSou grato ao Reino da Garotada pela parceria com a Escola SENAI, pois foi onde iniciei minha trajet&oacute;ria profissional, e hoje posso repassar o conhecimento adquirido. Algum dia terei a oportunidade de ministrar aulas na institui&ccedil;&atilde;o e poderei relatar aos alunos do Reino o meu exemplo de vida, para conscientiz&aacute;-los da chance que est&atilde;o tendo, e que se aproveitarem, poder&atilde;o ter um futuro pr&oacute;spero.<br />\r\n<br />\r\n<br />\r\n<strong>MOTIVO DE MUITO ORGULHO<br />\r\n<br />\r\n- Escritor Fl&aacute;vio Paiva visita o Jardim Liter&aacute;rio</strong><br />\r\n<br />\r\nO Jardim Liter&aacute;rio recebeu, pela primeira vez, a visita de um escritor, o cearense Fl&aacute;vio Paiva. Autor de livros como &ldquo;A Festa do Saci&rdquo;, ele respondeu in&uacute;meras perguntas das crian&ccedil;as, num agrad&aacute;vel encontro de incentivo &agrave; leitura no Reino. Fl&aacute;vio tamb&eacute;m escreveu um artigo para o Di&aacute;rio do Nordeste relatando suas impress&otilde;es sobre a institui&ccedil;&atilde;o.<br />\r\n<br />\r\n<strong>- Cineclube promove sess&otilde;es especiais</strong><br />\r\n<br />\r\nAs atividades do Cineclube, iniciativa surgida a partir da instala&ccedil;&atilde;o do Ponto de Cultura Mem&oacute;rias do Olhar, proporcionam acesso ao cinema &agrave; comunidade do Reino e aos visitantes, como na sess&atilde;o especial para os idosos do Lar M&atilde;e Mariana. Os filmes exibidos s&atilde;o document&aacute;rios brasileiros do nosso acervo e produ&ccedil;&otilde;es dos alunos do Ponto.<br />\r\n<br />\r\n<strong>- Exposi&ccedil;&atilde;o Mem&oacute;ria e Meio Ambiente</strong><br />\r\n<br />\r\nInaugurada no dia 14 de agosto, a mostra apresentou v&iacute;deo e fotografias dos alunos do Ponto de Cultura Mem&oacute;rias do Olhar.<br />\r\n<br />\r\nA exposi&ccedil;&atilde;o trouxe fotos antigas ao lado de imagens atuais, produzidas pelos participantes do Ponto, chamando aten&ccedil;&atilde;o para a necessidade de preserva&ccedil;&atilde;o do meio ambiente. Uma s&eacute;rie de atividades complementou a programa&ccedil;&atilde;o.<br />\r\n<br />\r\n<br />\r\n<strong>NOVIDADES</strong><br />\r\n<br />\r\n<strong>- Agenda<br />\r\n<br />\r\n- Festa da primavera - 19 de Setembro</strong><br />\r\n<br />\r\nEstamos preparando a primeira Festa da Primavera. Trata-se de mais um evento de confraterniza&ccedil;&atilde;o, que al&eacute;m de proporcionar lazer aos visitantes na esta&ccedil;&atilde;o das flores, tamb&eacute;m contribuir&aacute; para arrecadar recursos para nossos programas sociais. Compare&ccedil;a e divulgue!<br />\r\n<br />\r\n<strong>- Ch&aacute; / Bingo - 24 de Outubro</strong><br />\r\n<br />\r\nO nosso tradicional encontro para um gostoso ch&aacute;, acompanhado de quitutes da panifica&ccedil;&atilde;o, com muitos presentes diferenciados, acontecer&aacute; no dia 24 de outubro. Venha e participe das animadas rodadas com sua fam&iacute;lia e amigos!<br />\r\n<br />\r\n<strong>- Bazar de Natal- 05 de Dezembro</strong><br />\r\n<br />\r\nAnote na agenda e n&atilde;o perca o nosso concorrido Bazar de Natal. O evento acontece no comecinho de dezembro, &oacute;timo momento para organizar as compras de fim de ano e ajudar as obras do Reino da Garotada.<br />\r\n<br />\r\n<strong>- Campanha da Sacolinha do Amor</strong><br />\r\n<br />\r\nJ&aacute; iniciamos a tradicional campanha da &ldquo;Sacolinha do Amor&rdquo;. A Campanha busca padrinhos de Natal para as crian&ccedil;as atendidas na institui&ccedil;&atilde;o. Sua colabora&ccedil;&atilde;o &eacute; muito importante para transformar a festa num grande momento de fraternidade e solidariedade. Participe! Vamos fazer um Natal ainda mais Feliz!&nbsp; Todos que desejarem colaborar, fazendo doa&ccedil;&otilde;es de cal&ccedil;ados roupas e brinquedos, podem ligar para 4638-2466 e falar com Priscila ou Tamy.<br />\r\n<br />\r\n<strong>NOSSO MUITO OBRIGADO !<br />\r\n<br />\r\n- Arraial Solid&aacute;rio.</strong><br />\r\n<br />\r\nAno ap&oacute;s ano, o nosso Arraial Solid&aacute;rio fica mais animado, atraindo muitos colaboradores da comunidade de Po&aacute; e arredores. A festa aconteceu no &uacute;ltimo dia 6 de junho. Agradecemos a todos que colaboraram para o seu sucesso, multiplicando resultados e crescendo em solidariedade.<br />\r\n<strong><br />\r\n- Crian&ccedil;as da creche visitam o Z&ocirc;o.</strong><br />\r\n<br />\r\nNo dia 30 de junho as crian&ccedil;as do Jardim da Creche foram passear no Zool&oacute;gico de S&atilde;o Paulo.<br />\r\nA Perez Im&oacute;veis ofereceu o &ocirc;nibus e o lanche, colaborando para proporcionar esses momentos de alegria as nossas crian&ccedil;as.<br />\r\n<br />\r\n<strong>Palavras de refex&atilde;o</strong><br />\r\n<br />\r\nEstamos chegando ao final do ano. Num mundo em que os valores de solidariedade se perdem na pressa do dia a dia, na corrida pela sobreviv&ecirc;ncia, o Reino da Garotada busca preservar a fraternidade entre as pessoas, oferecendo em nossos programas, al&eacute;m do conhecimento, momentos de reflex&atilde;o espiritual e de humanismo. Para isso, tamb&eacute;m contamos com a valiosa colabora&ccedil;&atilde;o das Irm&atilde;s Mission&aacute;rias Catequistas do Sagrado Cora&ccedil;&atilde;o, a quem agradecemos especialmente.<br />\r\n<strong><br />\r\nNota de Falecimento.</strong><br />\r\n<br />\r\nFoi com profundo pesar que tomamos o conhecimento da not&iacute;cia do falecimento do querido Elcio, das &Oacute;ticas Indai&aacute;, no dia 17 de agosto. Em nome de toda a comunidade do Reino da Garotada de Po&aacute;, expressamos nossas condol&ecirc;ncias &agrave; fam&iacute;lia e &agrave; empresa. Perdemos um grande amigo, profissional exemplar, que compartilhou bons momentos conosco. Sua amizade permanecer&aacute; para sempre em nossa mem&oacute;ria.</p>', '2009-12-09 13:17:26', NULL, 1, 1, 0, 0, 0);

-- --------------------------------------------------------

--
-- Estrutura da tabela `route_alias`
--

CREATE TABLE IF NOT EXISTS `route_alias` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `route` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `alias` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=22 ;

--
-- Extraindo dados da tabela `route_alias`
--

INSERT INTO `route_alias` (`id`, `route`, `alias`) VALUES
(3, 'post/view/47', 'institucional/historico'),
(4, 'post/view/48', 'institucional/missao'),
(5, 'post/view/49', 'institucional/inovacao'),
(6, 'post/view/50', 'institucional/premios'),
(7, 'post/view/51', 'institucional/dados'),
(8, 'post/view/52', 'institucional/diretoria'),
(9, 'post/view/53', 'institucional/fontes'),
(12, 'post/view/57', 'programas/geracao_renda'),
(13, 'post/view/55', 'programas/centro_juventude'),
(14, 'post/view/56', 'programas/oficina_escola'),
(15, 'post/view/58', 'programas/projeto_tear'),
(16, 'post/view/59', 'programas/integracao_comunidade'),
(17, 'post/view/60', 'programas/avaliacao'),
(18, 'post/view/61', 'programas/criterios_selecao'),
(19, 'post/view/62', 'programas/creche'),
(21, 'post/view/68', 'site/colabore');

-- --------------------------------------------------------

--
-- Estrutura da tabela `usuario`
--

CREATE TABLE IF NOT EXISTS `usuario` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `login` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(80) COLLATE utf8_unicode_ci NOT NULL,
  `senha` char(40) COLLATE utf8_unicode_ci NOT NULL,
  `data_criacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_ultimo_acesso` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `usuario`
--

INSERT INTO `usuario` (`id`, `nome`, `login`, `email`, `senha`, `data_criacao`, `data_ultimo_acesso`) VALUES
(1, 'Administrador', 'admin', 'admin@reinodagarotada.org.br', '779a923d69b2e072747b11975ba86949de167037', '0000-00-00 00:00:00', '2010-04-17 14:34:08');

--
-- Restrições para as tabelas dumpadas
--

--
-- Restrições para a tabela `categoria_post`
--
ALTER TABLE `categoria_post`
  ADD CONSTRAINT `fk_CategoriaPost_1` FOREIGN KEY (`id_post`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_CategoriaPost_2` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para a tabela `comentario`
--
ALTER TABLE `comentario`
  ADD CONSTRAINT `fk_Comentario_1` FOREIGN KEY (`id_post`) REFERENCES `post` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para a tabela `item_menu`
--
ALTER TABLE `item_menu`
  ADD CONSTRAINT `fk_ItemMenu_1` FOREIGN KEY (`item_superior`) REFERENCES `item_menu` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Restrições para a tabela `permissao_usuario`
--
ALTER TABLE `permissao_usuario`
  ADD CONSTRAINT `fk_PermissaoUsuario_1` FOREIGN KEY (`id_permissao`) REFERENCES `permissao` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_PermissaoUsuario_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Restrições para a tabela `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `fk_Post_1` FOREIGN KEY (`id_autor`) REFERENCES `usuario` (`id`) ON UPDATE CASCADE;
