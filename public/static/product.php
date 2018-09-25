<?php
require_once('inc/header.php');
?>

<body ng-app="myApp" class="homepage">

	<div id="site_wraper" ng-controller="main_page">

		<!-- Search overlay -->
		<?php require_once('inc/search_overlay.php') ?>
		<!-- Mobilne menu -->
		<?php require_once('inc/mobile_menu.php') ?>

		<div id="page-wraper">
			<?php require_once('inc/nav_panel.php'); ?>

			<!--
			######   #######  ##    ## ######## ######## ##    ## ########     ######  ########    ###    ########  ########
	   ##    ## ##     ## ###   ##    ##    ##       ###   ##    ##       ##    ##    ##      ## ##   ##     ##    ##
	   ##       ##     ## ####  ##    ##    ##       ####  ##    ##       ##          ##     ##   ##  ##     ##    ##
	   ##       ##     ## ## ## ##    ##    ######   ## ## ##    ##        ######     ##    ##     ## ########     ##
	   ##       ##     ## ##  ####    ##    ##       ##  ####    ##             ##    ##    ######### ##   ##      ##
	   ##    ## ##     ## ##   ###    ##    ##       ##   ###    ##       ##    ##    ##    ##     ## ##    ##     ##
	    ######   #######  ##    ##    ##    ######## ##    ##    ##        ######     ##    ##     ## ##     ##    ##
		-->

		<!-- BREADCRUMBS -->
		<nav aria-label="breadcrumb" class="breadcrumbs">
			<div class="container">
				<div class="row">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="index.php">Domov</a></li>
						<li class="breadcrumb-item"><a href="products.php">E-shop</a></li>
						<li class="breadcrumb-item active">Product</li>
					</ol>
				</div>
			</div>
		</nav>


		<!-- PRODUCT -->
		<section class="product-page py-5">
			<div class="container">
				<div class="row">
					<div class="col-lg-5">

						<!-- HLAVNA SLIDESHOW PRODUKTU -->
						<div class="product-page__main-slideshow">
							<!-- ODZNAKY LAVA STRANA / -->
						  <div class="product__badges_left">
						    <div class="badge bio">Premium Bio</div>
						    <div class="badge raw">Raw</div>
						    <div class="badge new">Just arrived</div>
						    <div class="badge sale">-15%</div>
						  </div>


						  <!-- ODZNAKY PRAVA STRANA / -->
						  <div class="product__badges_right">
						    <div class="badge"><img src="images/badges/eu_bio.png" /></div>
						    <div class="badge"><img src="images/badges/gluten_free.png" /></div>
						    <div class="badge"><img src="images/badges/raw.png" /></div>
						  </div>

							<div class="row">
								<div class="col-2 d-none d-lg-flex align-items-center">
						      <div class="directional-arrow prev">
						        <img class="svg" src="images/arrow_slideshow_left.svg" alt="">
						      </div>
						    </div>
								<div class="col-10 mx-auto col-lg-8 slideshow">

									<?php
									for ($i=0; $i < 4; $i++):
									?>
									<div class="slide">
			              <img src="images/produkty/velky.png" alt="">
			            </div>
									<?php
									endfor;
									 ?>
								</div>
								<div class="col-2 d-none d-lg-flex align-items-center">
						      <div class="directional-arrow next">
						        <img class="svg" src="images/arrow_slideshow_right.svg" alt="">
						      </div>
						    </div>
							</div>
						</div>

						<!-- NAV SLIDESHOW - SPODNA SLIDESHOW KTORA OVLADA TU HLAVNU -->
						<div class="product-page__nav-slideshow  mb-5 mb-lg-0">
							<?php
							for ($i=0; $i < 4; $i++):
							?>
								<div class="slide">
									<img src="images/produkty/1.png" alt="">
								</div>
							<?php
							endfor;
							 ?>
						</div>

					</div>
					<div class="col-lg-6 ml-auto">

						<a href="products.php">Müesli - original</a>
						<h1>
							Muesli zázvor, arónia, chia
							<span class="line"></span>
						</h1>

						<span class="label">
							Zloženie
						</span>

						<p>
							Ovsené vločky Jumbo (22%), ovsené vločky jemné (15%), zázvor kandizovaný (12%) /koreň zázvoru, cukor/, VLAŠSKÉ ORECHY (11%), arónia (11%), ovsené otruby (11%), chia (7%), ľanové semienko hnedé, konopné semienko lúpané.
						</p>

						<p>
							Všetky použité ingrediencie pochádzajú z ekologického poľnohospodárstva. Výrobok obsahuje LEPOK.
						</p>

						<span class="label">
							Gramáž
						</span>

						<form id="prodcut" action="#" method="post">

							<div>
								<div class="btn-group">
									<label for="option1" class="btn">
										<input id="option1" type="radio" name="add_product" data-display-value="250g" data-regular-price="5.45 €" data-sale-price="3.45 €" value="250" checked>
										<span>250g</span>
									</label>

									<label for="option2" class="btn">
										<input id="option2" type="radio" name="add_product" data-display-value="500g" data-regular-price="10.15 €" value="500">
										<span>500g</span>
									</label>

									<label for="option3" class="btn">
										<input id="option3" type="radio" name="add_product" data-display-value="750g" data-regular-price="20.35 €" data-sale-price="15.25 €" value="750">
										<span>750g</span>
									</label>

									<label for="option4" class="btn">
										<input id="option4" type="radio" name="add_product" data-display-value="1000g" data-regular-price="30.45 €" data-sale-price="27.25 €" value="1000">
										<span>1000g</span>
									</label>
								</div>
							</div>

							<span class="label">
								Cena
							</span>

							<div class="product__price">
								<span class="sale-price"></span>
								<span class="regular-price"></span>
							</div>

								<div class="row">
									<div class="col-lg-4 mb-3 mb-lg-0">
										<div class="input-group input-group-sm counter">
											<div class="input-group-prepend">
												<button class="btn btn-sm btn-minus">
													-
												</button>
											</div>
											<input name="product_count" value="1" type="text" class="form-control form-control-sm text-center counter_field" placeholder="Počet">
											<div class="input-group-append">
												<button class="btn btn-sm btn-plus">
													+
												</button>
											</div>
										</div>
									</div>


									<div class="col-lg-5">
											<button class="btn btn-orange btn-sm w-100" type="submit">do košíka</button>
									</div>
								</div>





						</form>



					</div>
				</div>

				<div class="row pt-5">

					<div class="col-12">
						<ul class="nav nav-tabs tab-menu" id="myTab" role="tablist">
						  <li class="nav-item">
						    <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab" aria-controls="home" aria-selected="true">POPIS PRODUKTU</a>
						  </li>
						  <li class="nav-item">
						    <a class="nav-link" id="profile-tab" data-toggle="tab" href="#profile" role="tab" aria-controls="profile" aria-selected="false">NUTRIČNÉ HODNOTY</a>
						  </li>
						  <li class="nav-item">
						    <a class="nav-link" id="contact-tab" data-toggle="tab" href="#contact" role="tab" aria-controls="contact" aria-selected="false">V RECEPTOCH</a>
						  </li>
						</ul>
					</div>


					<div class="col-12">
						<div class="tab-content" id="myTabContent">
						  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
								<p>
									<span>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eligendi perferendis sit quaerat tempora aperiam illum quas qui aspernatur deleniti porro cum, quasi unde eius nesciunt nam, nobis, ipsa adipisci accusantium?</span>
									<span>Possimus saepe fuga fugit minima id eaque molestias deserunt vitae adipisci nesciunt, nemo, numquam, tempore natus. Nisi, nobis voluptates assumenda at officia iusto, veniam fugiat doloremque delectus distinctio enim qui?</span>
									<span>Autem reiciendis iure nemo doloremque tempore obcaecati nulla molestiae architecto maiores dolore debitis fuga tenetur quis aliquid expedita voluptas, placeat, voluptatum repellat laborum ullam voluptates! Voluptate architecto, obcaecati sunt delectus.</span>
								</p>
							</div>
						  <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
								<p>
									<span>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Odio aut voluptates, consequuntur nesciunt sed cumque. Ipsa veritatis, laboriosam ratione culpa eos maiores. Culpa quaerat quia architecto, assumenda cupiditate officia sit.</span>
									<span>Cumque mollitia accusamus error labore voluptatem quidem officiis veniam nemo cum porro, deleniti, eius sequi laudantium inventore iure nulla omnis possimus commodi voluptates. Unde deleniti vero exercitationem cupiditate adipisci temporibus!</span>
									<span>Dolores sint, veniam vero voluptates consequatur expedita similique, iste excepturi alias perspiciatis necessitatibus, nesciunt quasi? Minus maxime molestiae quod incidunt, suscipit, in! Beatae quae perferendis ipsam, sequi deserunt fugiat obcaecati?</span>
									<span>Dolores delectus, deserunt illo amet et, harum adipisci. Tempore veniam ullam, distinctio non repellendus nihil temporibus deleniti cupiditate accusamus et error quae itaque voluptate, consequatur reiciendis praesentium repudiandae consequuntur exercitationem!</span>
								</p>
							</div>
						  <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">
								<p>
									<span>Lorem ipsum dolor sit amet, consectetur adipisicing elit. A eos, mollitia quibusdam vitae rerum officiis, libero animi? Temporibus, ratione, debitis! Fugiat modi perspiciatis, provident quos ea ex at? Optio, porro.</span>
									<span>Itaque perspiciatis, quas harum at adipisci odit. Hic nesciunt, incidunt fugit dicta delectus mollitia veniam in magni, consequatur! Quo nesciunt itaque, et eius ratione exercitationem aut quae debitis doloribus modi.</span>
									<span>Laborum, dolorum delectus cumque iure eveniet optio non deleniti quod. Pariatur, ipsam, fuga quasi tempore mollitia perspiciatis expedita at dignissimos animi officia omnis molestias aliquam maiores alias cupiditate earum facilis!</span>
								</p>
						  </div>
						</div>
					</div>

				</div>
			</div>
		</section>




		<!-- INI TIEZ KUPILI - PRODUKTY SLIDESHOW  -->
		<section class="pt-4 pb-5 alt-bg-100">
			<div class="container">
				<div class="row align-items-center mb-3 section-heading">
					<div class="col">
						<h2>Iní tiež kúpili
							<span class="line"></span>

						</h2>
					</div>
					<div class="col text-right">
						<a href="#">
					Všetky produkty
				</a>
					</div>
				</div>
			</div>
			<!-- slideshow  -->
			<?php include('inc/partials/slideshows/product-slideshow.php') ?>
		</section>




			<!--

			 	 ######   #######  ##    ## ######## ######## ##    ## ########    ######## ##    ## ########
		    ##    ## ##     ## ###   ##    ##    ##       ###   ##    ##       ##       ###   ## ##     ##
		    ##       ##     ## ####  ##    ##    ##       ####  ##    ##       ##       ####  ## ##     ##
		    ##       ##     ## ## ## ##    ##    ######   ## ## ##    ##       ######   ## ## ## ##     ##
		    ##       ##     ## ##  ####    ##    ##       ##  ####    ##       ##       ##  #### ##     ##
		    ##    ## ##     ## ##   ###    ##    ##       ##   ###    ##       ##       ##   ### ##     ##
		     ######   #######  ##    ##    ##    ######## ##    ##    ##       ######## ##    ## ########

			-->

			<?php
				require_once('inc/footer.php');
			?>


		</div>
		<!-- PAGE WRAPER -->
	</div>
	<!-- SITE WRAPER -->

	<?php
require_once('inc/footer_scripts.php');
?>


	<!--

 ######   ######  ########  #### ########  ########  ######
##    ## ##    ## ##     ##  ##  ##     ##    ##    ##    ##
##       ##       ##     ##  ##  ##     ##    ##    ##
 ######  ##       ########   ##  ########     ##     ######
      ## ##       ##   ##    ##  ##           ##          ##
##    ## ##    ## ##    ##   ##  ##           ##    ##    ##
 ######   ######  ##     ## #### ##           ##     ######

 -->

 <script type="text/javascript">
 	 $(document).ready(function(){
		 $('.product-slideshow_container').each(function() {
 			const slideShow = $(this).find('.product-slideshow');

 			slideShow.slick({
 				fade: false,
 				dots: true,
 				speed: 250,
 				cssEase: "ease-in-out",
 				lazyLoad: 'progressive',
 				arrows: true,
 				infinite: true,
 				dotsClass: 'paging',
 				draggable: true,
 				cssEase: 'ease-in-out',
 				autoplay: true,
 				autoplaySpeed: 6000,
 				pauseOnHover: true,
 				//pauseOnFocus: true,
 				prevArrow: $(this).find('.prev'),
 				nextArrow: $(this).find('.next'),
 				slidesToShow: 4,
 				slidesToScroll: 4,
 				responsive: [{
 						breakpoint: 992,
 						settings: {
 							slidesToShow: 3,
 							slidesToScroll: 3,
 							infinite: true,
 							dots: true
 						}
 					},
 					{
 						breakpoint: 768,
 						settings: {
 							slidesToShow: 2,
 							slidesToScroll: 2,
							dots: false,
 						}
 					},
 					{
 						breakpoint: 526,
 						settings: {
 							slidesToShow: 1,
 							slidesToScroll: 1,
							dots: false,
 						}
 					}
 				],
 			})

			$('.product-page__main-slideshow .slideshow').slick({
			slidesToShow: 1,
			slidesToScroll: 1,
			arrows: true,
			fade: true,
			asNavFor: '.product-page__nav-slideshow',
			prevArrow: $('.product-page__main-slideshow .prev'),
			nextArrow: $('.product-page__main-slideshow .next'),
		});

		$('.product-page__nav-slideshow').slick({
			slidesToShow: 4,
			slidesToScroll: 1,
			asNavFor: '.product-page__main-slideshow .slideshow',
			dots: false,
			arrows: false,
			//centerMode: true,
			focusOnSelect: true,
			responsive: [{
					breakpoint: 992,
					settings: {
						slidesToShow: 4,
						slidesToScroll: 1,
					}
				},
				{
					breakpoint: 768,
					settings: {
						slidesToShow: 4,
						slidesToScroll: 1,
						dots: false,
					}
				},
				{
					breakpoint: 526,
					settings: {
						slidesToShow: 4,
						slidesToScroll: 1,
						dots: false,

					}
				}
			]
		});

 		});
	 });
 </script>
