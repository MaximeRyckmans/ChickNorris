/**
 * 
 */

$( document ).ready(function() {
	activateCalendar();
});

/**
 * ****************************************************
 * 						Validation
 * ****************************************************
 */

$("#form-validate").validate({
	rules: {
		form_name: {
			required: true
		},
		form_firstname: {
			required: true
		},
		form_address: {
			required: true
		},
		form_zip: {
			required: true
		},
		form_city: {
			required: true
		},
		form_phone: {
			required: true
		},
		form_email: {
			required: true
		},
		form_occasion: {
			required: true
		},
		form_date: {
			required: true
		},
		form_time: {
			required: true
		},
		form_confirm: {
			required: true
		},
		form_info: {
			required: true
		}
	}
});