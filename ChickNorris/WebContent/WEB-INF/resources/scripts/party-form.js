/**
 * 
 */

$('#calendar').datepicker({
	inline: true,
	firstDay: 1,
	showOtherMonths: true,
	dayNamesMin: ['Zo', 'Ma', 'Di', 'Wo', 'Do', 'Vr', 'Za']
});

$('#form_date').datepicker();
$('#form_time').timepicker();