$(document).ready(function(){
	reset_insurance_contents_height()
})

function reset_insurance_contents_height () {
	var tabs_height = $('#insurance_tabs').height()
	var new_content_height = tabs_height - 22 // (padding + border = 22)
	$('#insurance_contents li').css({ 'min-height' : new_content_height+'px' })
}