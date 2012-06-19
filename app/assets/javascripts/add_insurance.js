$(document).ready(function(){
	new_insurance()
	add_insurance()
})

function new_insurance() {
	$('.new_insurance').click(function(){
		$('#new_insurance').show()
		return false
	})
}

function add_insurance () {
	$('.add_insurance').live('click',function(){
		var plan_type = $('#plan_type').val()
		$('#new_insurance').hide()
		$.ajax({
			type: 'POST',
			url: '/insurances',
			data: { insurance: { plan_id: plan_type } },
			cache: false,
			success: function(response){
				if (response != "")
					$('#insurances').html('success');
				else
					$('#insurances').html('failed');
			}
		})
	})
}