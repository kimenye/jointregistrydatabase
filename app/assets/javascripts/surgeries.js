$(function() {
	jQuery('.datepicker').datetimepicker({timepicker: false, format:'d/m/Y'});

	$('.implant_select').change(function() {
		var val = $(this).val();
		console.log("Selected value ", val);
	});

	$('.get_sizes').click(function() {

		$.getJSON('/get_sizes?implant_id=1', function(data) {
	        $.each(data.dimensions, function(idx, dimension) {
	        	$('table.sizes tbody').append('<tr><td>' + dimension.dimension_type + '</</td><td></td></tr>')
	        });
		});
	})
});