$(document).ready(function(){
	new_insurance()
	add_insurance()
	update_insurance()
	delete_insurance()
})

// all functions

function new_insurance() {
	$('.new_insurance').live('click',function(){
		$('#new_insurance').show()
		return false
	})
}

function add_insurance() {
	$('.add_insurance').live('change',function(){
		var plan_type = $('#plan_type').val()
		$('#new_insurance').hide()
		$.ajax({
			type: 'POST',
			url: '/insurances',
			data: { insurance: { plan_id: plan_type } },
			cache: false,
			success: function(response){
				//
			}
		})
	})
}

function update_insurance() {
	
	$('#insurance_contents input').live('keydown',function(e){
		if (e.which == 9 || e.which == 13) {
			var that = $(this)
			send_insurance_update_request(that)
		}
	})

	$('#insurance_contents input').live('blur',function(e){
		var that = $(this)
		send_insurance_update_request(that)
	})
}

function delete_insurance() {
	
	$('.delete_insurance').live('click', function(){
		var insurance_id = $(this).closest('li').attr('ins-id')

		$.ajax({
			type: 'DELETE',
			url: '/insurances/'+insurance_id,
			cache: false,
			success: function(response) {
				// removing insurance elements on deleting it
				$('#insurance_tab_'+insurance_id+', #insurance_'+insurance_id).remove()
				reset_insurance_contents_height() //resetting the insurance contents heights
			}
		})

		return false
	})

}

function send_insurance_update_request(element) {
	var insurance_id = element.closest('li').attr('content-id')

	$('#insurance_contents .best_in_place').bind("ajax:success", function(){
		$.ajax({
			type: 'GET',
			url: '/insurances/'+insurance_id,
			cache: false,
			success: function(response) {
				$('#insurance_contents .best_in_place').unbind("ajax:success")
			}
		})
	})
}