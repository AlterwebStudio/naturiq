$(document).ready(function() {

	/*
	===========================
	########  #######     ########  #######  ########
	   ##    ##     ##       ##    ##     ## ##     ##
	   ##    ##     ##       ##    ##     ## ##     ##
	   ##    ##     ##       ##    ##     ## ########
	   ##    ##     ##       ##    ##     ## ##
	   ##    ##     ##       ##    ##     ## ##
	   ##     #######        ##     #######  ##
	===========================
	*/


	$('#to_top').on("click tap", function(){
		//or to scroll to the element with the ID "#someID":
		TweenMax.to($(window), 1, {scrollTo:"#site_root"});
	})


	// ########     ###    ######## #### ##    ##  ######
	// ##     ##   ## ##      ##     ##  ###   ## ##    ##
	// ##     ##  ##   ##     ##     ##  ####  ## ##
	// ########  ##     ##    ##     ##  ## ## ## ##   ####
	// ##   ##   #########    ##     ##  ##  #### ##    ##
	// ##    ##  ##     ##    ##     ##  ##   ### ##    ##
	// ##     ## ##     ##    ##    #### ##    ##  ######

	$('.rating').each( function(){
		var activeStars = $(this).attr("data-stars");
		var totalStars = $(this).children(".star").length;

		var inactiveClass = "fa-star-o";
		var activeClass = "fa-star";


		for (i = 0; i < activeStars; i++) {
			$(this).children(".star").eq(i).removeClass(inactiveClass).addClass(activeClass);
		}
	})



		/*
		===========================

		########   #######   #######  ########  ######  ######## ########     ###    ########
		##     ## ##     ## ##     ##    ##    ##    ##    ##    ##     ##   ## ##   ##     ##
		##     ## ##     ## ##     ##    ##    ##          ##    ##     ##  ##   ##  ##     ##
		########  ##     ## ##     ##    ##     ######     ##    ########  ##     ## ########
		##     ## ##     ## ##     ##    ##          ##    ##    ##   ##   ######### ##
		##     ## ##     ## ##     ##    ##    ##    ##    ##    ##    ##  ##     ## ##
		########   #######   #######     ##     ######     ##    ##     ## ##     ## ##

		===========================
		*/

		// AKTIVOVANIE TOOLTIPOV
		$('[data-toggle="tooltip"]').tooltip();


		/*
		 ######  ##     ##  ######
		##    ## ##     ## ##    ##
		##       ##     ## ##
		 ######  ##     ## ##   ####
		      ##  ##   ##  ##    ##
		##    ##   ## ##   ##    ##
		 ######     ###     ######
		*/
			$('img.svg').each(function(){
			    var $img = jQuery(this);
			    var imgID = $img.attr('id');
			    var imgClass = $img.attr('class');
			    var imgURL = $img.attr('src');



			    jQuery.get(imgURL, function(data) {
			        // Get the SVG tag, ignore the rest
			        var $svg = jQuery(data).find('svg');

			        // Add replaced image's ID to the new SVG
			        if(typeof imgID !== 'undefined') {
			            $svg = $svg.attr('id', imgID);
			        }
			        // Add replaced image's classes to the new SVG
			        if(typeof imgClass !== 'undefined') {
			            $svg = $svg.attr('class', imgClass+' replaced-svg');
			        }

			        // Remove any invalid XML tags as per http://validator.w3.org
			        $svg = $svg.removeAttr('xmlns:a');

			        // Replace image with new SVG
			        $img.replaceWith($svg);

			    }, 'xml');
			});






		// $(window).scroll(function(){
		// 	console.log($(document).scrollTop());
		// })

		// MODAL
		// -----------

		// $('#age_modal').modal();
    // $('#age_modal').on('hidden.bs.modal', function (e) {
    //   document.cookie = "age_confirmed=1";
    // });


		/*
		===========================
		POZNAMKA
		===========================
		*/


}); ///END DOCUMENT.READY
