		$(".counter_field").on("change", function(){
			if($(this).val() < 1 || $(this).val().match(/\D+/g)){
				$(this).val(1);
			}
		});

		$(".counter .btn-minus").on("click tap", function(e)
		{
			e.preventDefault();
			var counter_field = $(this).closest(".counter").find(".counter_field");
			var counter_field_value = counter_field.val();
			if(counter_field_value == 1){

				return
			}
			else{
				counter_field_value --;
				counter_field.val(counter_field_value);
			}


		});

		$(".counter .btn-plus").on("click tap", function(e)
		{
			e.preventDefault();
			var counter_field = $(this).closest(".counter").find(".counter_field");
			var counter_field_value = counter_field.val();
			counter_field_value ++;
			counter_field.val(counter_field_value);
		});
