$(function() {
	jQuery('.datepicker').datetimepicker({timepicker: false, format:'d/m/Y'});

	$('.implant_select').change(function() {
		var val = $(this).val();
		console.log("Selected value ", val);
	});

	function getOptions(dimension) {
		var result = "";
		$.each(dimension.implant_sizes, function(idx, size) {
			result = result + "<option>" + size.measurement + "</option>"
		})
		return result;
	}

	$('.get_sizes').click(function() {
		var implant_id = $('#implant_implant_id').val();
		$.getJSON("/get_sizes?implant_id=" + implant_id, function(data) {
			$('table.sizes tbody').html("");
	        $.each(data.dimensions, function(idx, dimension) {
	        	
	        	$('table.sizes tbody').append('<tr><td>' + dimension.dimension_type + '</</td><td><select name=dimension['+ data.dimensions.indexOf(dimension) +']>' + getOptions(dimension) + '</select></td></tr>')
	        });
		});
	})

	$('#patient_procedure_patient_procedure_id').change(function(){
		var procedureType = $(this).find('option:selected').data("procedure-type");
		if (procedureType == "Hip") {
			$('.approach.hide').removeClass('hide');
		} else {
			$('.approach').addClass('hide');
		}

        $('.to-be-hidden').hide();
        $('#' + procedureType).show();
    });
});