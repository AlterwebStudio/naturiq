<!-- Navigation -->
<nav class="navbar navbar-expand-lg fixed-top shadow-sm">
	<div class="container-fluid">
		<a class="navbar-brand" href="{{ route('home') }}">
			<img src="{{ asset('images/logo.svg') }}" alt="">
		</a>



		<ul class="navbar-nav mr-auto d-none d-lg-flex social">
			@if (is_set(setting('site.facebook')))
			<li>
				<a href="{{ setting('site.facebook') }}" class="nav-link mx-1">
					<i class="fab fa-facebook-f"></i>
				</a>
			</li>
			@endif

			@if (is_set(setting('site.pinterest')))
			<li>
				<a class="nav-link mx-1" href="{{ setting('site.pinterest') }}">
					<i class="fab fa-pinterest"></i>
				</a>
			</li>
			@endif

			@if (is_set(setting('site.instagram')))
			<li>
				<a class="nav-link" href="{{ setting('site.instagram') }}"  target="_blank">
  				<i class="fab fa-instagram"></i>
  			</a>
			</li>
			@endif
		</ul>


		<div id="navbarResponsive" class="ml-auto d-lg-flex">


			<ul class="navbar-nav d-none d-lg-flex">
				<li class="nav-item active">
					<a class="nav-link" href="{{ route('home') }}">úvod</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="{{ route('about') }}">náš príbeh</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="{{ route('stores') }}">predajne</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="{{ route('recipes') }}">recepty</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="{{ route('contact') }}">kontakt</a>
				</li>
				<li class="nav-item">
					<a class="btn btn-orange" href="{{ route('eshop') }}">e-shop</a>
				</li>
			</ul>

			<ul class="navbar-nav icons">
				<li>
					<a class="nav-link offcanvas-trigger ml-auto" data-target="search-overlay" href="#">
						<span class="fa fa-search"></span>
					</a>
				</li>

				<li>
					<a href="{{ route('login') }}" class="nav-link">
						<i class="fas fa-user"></i>
					</a>
				</li>


				<li>
					<a href="{{ route('cart') }}" class="nav-link numbered-index" data-number="{{ Cart::count() }}">
						<i class="fas fa-shopping-bag"></i>
					</a>
				</li>

				<li class="d-lg-none d-flex">
					<a class="nav-link offcanvas-trigger " data-target="mobile-menu" href="#">
						<i class="fa fa-bars"></i>
					</a>
				</li>
			</ul>

		</div>



	</div>
</nav>
