$(document).ready(function(){

	$('.tabs li').live('click',function(){
		var content_id = $(this).attr('content-id');
		$('.contents li').hide();

		$('.tabs li .tab_connector').removeClass('disp_imp');
		$('.tabs li .tab_connector').hide();

		$('#'+content_id).show();
		$('#'+content_id+'_connector').show();
	})

})