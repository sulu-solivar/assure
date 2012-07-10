// request after bluring from the inplace edit inputs and selects
$('.dashboard_profile li input, .dashboard_profile li select').live('blur',function(e){
	send_request();
});

// request after selecting the jquery calender
$('#ui-datepicker-div .ui-datepicker-calendar a').live('click',function(e){
	send_request();
});

// request in case of typing 'tab = 9' or 'enter = 13'
$('.dashboard_profile li input, .dashboard_profile li select').live('keydown',function(e){
	if (e.which == 9 || e.which == 13) {
		send_request();
	}
});

// 
function send_request(){
	$.ajax({
		type: 'GET',
		url: '/',
		cache: false,
		success: function(response) {
			// alert('sent request');
		}
	});
}