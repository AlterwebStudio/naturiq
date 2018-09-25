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

		<nav aria-label="breadcrumb" class="breadcrumbs">
			<div class="container">
				<div class="row">
					<ol class="breadcrumb">
						<li class="breadcrumb-item"><a href="index.php">Domov</a></li>
						<li class="breadcrumb-item active">E-shop</li>
					</ol>
				</div>
			</div>
		</nav>

		<section class="py-3 alt-bg-200 filter-pane">
			<!-- Product row -->
			<div class="container">
				<div class="row align-items-center">
					<div class="col">
						<h3><i class="fas fa-filter"></i> Filter</h3>
					</div>
					<div class="col text-right">
						<button class="close-btn" type="button" data-toggle="collapse" data-target="#filterPane" aria-expanded="true">
							<i class="fas fa-times"></i>
						</button>
					</div>

				</div>
			</div>
			<div id="filterPane" class="container collapse show">
				<div class="row product-categories py-4">
					<div class="col-lg col-6 product-categories__icon">
						<a href="products.php"><div class="icon">
								<img src="images/icons/.svg" alt="">
							</div>
							Kategoria 1</a>
					</div>

					<div class="col-lg col-6 product-categories__icon">
						<a href="products.php"><div class="icon">
								<img src="images/icons/.svg" alt="">
							</div>
							Kategoria 2</a>
					</div>

					<div class="col-lg col-6 product-categories__icon">
						<a href="products.php"><div class="icon">
								<img src="images/icons/.svg" alt="">
							</div>
							Kategoria 3</a>
					</div>


					<div class="col-lg col-6 product-categories__icon">
						<a href="products.php"><div class="icon">
								<img src="images/icons/.svg" alt="">
							</div>
							Kategoria 4</a>
					</div>

					<div class="col-lg col-6 product-categories__icon">
						<a href="products.php"><div class="icon">
								<img src="images/icons/.svg" alt="">
							</div>
							Kategoria 5</a>
					</div>

					<div class="col-lg col-6 product-categories__icon">
						<a href="products.php"><div class="icon">
								<img src="images/icons/.svg" alt="">
							</div>
							Kategoria 6</a>
					</div>

					<div class="col-lg col-6 product-categories__icon">
						<a href="products.php"><div class="icon">
								<img src="images/icons/.svg" alt="">
							</div>
							Kategoria 7</a>
					</div>

					<div class="col-lg col-6 product-categories__icon">
						<a href="products.php"><div class="icon">
								<img src="images/icons/.svg" alt="">
							</div>
							Kategoria 8</a>
					</div>

				</div>
			</div>
		</section>


		<section>
			<div class="container py-5">
				<div class="row">
					<?php
						for ($i=0; $i < 5; $i++) {
							include('inc/partials/product.php');
						}
					?>
				</div>
			</div>

			<!-- AKCIOVÝ BANNER  -->
			<section class="py-4">
				<div class="container">
					<div class="row">
						<div class="col-12">

									<?php require_once('inc/partials/shop-banner.php'); ?>

						</div>
					</div>
				</div>
			</section>

			<div class="container py-5">
				<div class="row">
					<?php
						for ($i=0; $i < 5; $i++) {
							include('inc/partials/product.php');
						}
					?>
				</div>
			</div>
		</section>


		<?php
			require_once('inc/partials/pagination.php');
		?>


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
