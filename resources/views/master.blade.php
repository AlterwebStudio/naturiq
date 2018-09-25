
@include ('inc/header')


<body ng-app="myApp" class="homepage">

<div id="site_wraper" ng-controller="main_page">

    <!-- Search overlay -->
    @include ('inc.search_overlay')

    <!-- Mobilne menu -->
	@include ('inc.mobile_menu') 

    <div id="page-wraper">

        @include ('inc.nav_panel')

        @yield ('content')

        @include ('inc.footer')

    </div>

</div>

@include ('inc.footer_scripts')
