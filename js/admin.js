$('document').ready(function() {
	$('.apagar').click(function() {
		if(!confirm('Tem certeza que deseja apagar esse item?')) {
			return false;
		}
		return true;
	});
});