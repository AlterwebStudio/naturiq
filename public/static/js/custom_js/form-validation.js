// CONTACT Form
			// Contact Form send
			$('.validate-form button[type=submit]').on('click', function(e)
			{
			e.preventDefault();
			var form_id = "#"+$(this).closest('form').attr('id');
      //console.log(form_id);

			var senderFile = $(form_id).data("sender");
			var valid = 0;
			var invalid = 0;
			var invalid_response = [];


			$(form_id).find('input.required, select.required, textarea.required').each(function(index, element)
			{

				// TOTO SKONTROLUJE CI su inputy v schovanej casti formularu - ak ano tak ich ignorujeme a nekontrolujeme / nevalidujeme
				if($(this).parent('.collapse').not('.show').length){
					//$(this).prop("disabled",true);
					return
				}


				if($(this).is('textarea') || $(this).is('input[type=text]') || $(this).is('input[type=tel]') || $(this).is('input[type=eml]') || $(this).is('select')){

				var $element = $(element);
				// Ak je pole prazdne, alebo sa jeho hodnota rovna tomu. co je uvedene v placeholdri
				if( ($(this).val() == "") || ($(this).val() == $(this).attr("placeholder"))){
					$(this).css({'border-color':'rgba(230,30,0,1)' });
					invalid_response.push({id: $(this).prop('id'), response: $(this).data('invalid-response')});
					//console.log($(this).attr('id'));
					invalid ++;
				}

			// Ak je pole riadne vyplnene
			else if( ($(this).val() != "") && ($(this).val() != $(this).attr("placeholder")) ){
				$(this).css({'border-color':''});

				// AK je to telefon, skontroluj ci sa tam nachádza cislo
				if($(this).attr("type") === "tel"){
					const telVal = $(this).val();
					const match = telVal.match(/(\+)*(\d{3,4}\s?\d{3}\s?\d{3}\s?\d{0,3})/g );
					//console.log(match);

					if(match === null){
						invalid_response.push({id: $(this).prop('id'), response: $(this).data('invalid-response')});
						$(this).css({'border-color':'rgba(230,30,0,1)' });
						invalid ++;
						return;
					}
				}

				// AK je pole email, skontroluj, ci sa tam nachádza cislo
				else if($(this).attr("type") === "eml"){
					const emlVal = $(this).val();
					const match = emlVal.match(/.+\@.+\.\w+/g );
					//console.log(match);

					if(match === null){
						invalid_response.push({id: $(this).prop('id'), response: $(this).data('invalid-response')});
						$(this).css({'border-color':'rgba(230,30,0,1)' });
						invalid ++;
						return;
					}
				}
				valid++;
			}

			}

			else if ($(this).is('input[type=checkbox]')){

				if( !$(this).is(':checked') ){
					$(this).css({'border-color':'rgba(230,30,0,1)' });
					invalid_response.push({id: $(this).prop('id'), response: $(this).data('invalid-response')});
					invalid ++;
				}

			}



			//console.log(invalid_response);
			})





			// AK JE VSETKO VPORIADKU SKONTAKTUJ

			//ak je nieco v neporiadku vypis error
			if(invalid >= 1){
				// console.log(senderFile);
				$(form_id).find(".input_msg").empty();
				$.each(invalid_response, function(index, value) {
					//$(form_id).find(".form_msg").append("<div class='p-2 mb-1 text-danger text-center'>"+value+"</div>");
					$(form_id).find(".input_msg[data-id='"+value.id+"']").append("<div class='text-danger'>"+value.response+"</div>");
				})
				return false;
			}
			//AK JE VSETKO OKEJ A ZAROVEN JE ZADANY AJAX SENDER TAK POSLI DATA AJAXOM
			else if (senderFile) {
				//disablne vsekty inputy a textareay, ktore su schovane v collapse aby sa neposielali do GET / POSTU
				$('.collapse').not('.show').find('input, textarea').prop('disabled', true);
				console.log('mam sender');
				//var url = "inc/ajax_form_send.php";
				$.ajax({
				       type: "POST",
				       url: "/inc/mail/"+senderFile+".php",
				       data: $(form_id).serialize(),
				       success: function(data){
				         $(form_id).fadeOut('slow', function(){$(form_id).html(data)}).fadeIn('slow');
				       }
				    });

				}
				// AK JE VSETKO VPORIADKU ALE NENI ZADANY AJAX SENDER TAK POSLI NORMALNE POST/GET
				else{
					//disablne vsekty inputy a textareay, ktore su schovane v collapse aby sa neposielali do GET / POSTU
					$('.collapse').not('.show').find('input, textarea').prop('disabled', true);
					console.log('nemam sender odosielam form');
					$(form_id).submit();
				}

				//return false;

			});
