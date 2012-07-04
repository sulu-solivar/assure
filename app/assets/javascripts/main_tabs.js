// tabs for main tabs
$('#main_tabs a').click(function(e){
	e.preventDefault()
	$(this).tab('show')
})