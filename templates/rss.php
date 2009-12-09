<?php echo '<?xml version="1.0" encoding="UTF-8"?>' ?>
<rss version="0.92">
	<channel>
		<title>Reino da Garotada de Poá</title>
		<link>http://reinodagarotada.org.br</link>
		<description>Reino da Garotada de Poá</description>
		<lastBuildDate><?php echo date('r'); ?></lastBuildDate>
		<docs>http://backend.userland.com/rss092</docs>
		<language>pt</language>
		<?php echo $content; ?>
	</channel>
</rss>