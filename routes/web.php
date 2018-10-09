<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Homepage
Route::get('/', 'pageController@home')
    ->name('home');

// Our story
Route::get('nas-pribeh', function () {
    return view('about-us');
})->name('about');

// Stores
Route::get('predajne', 'storesController@index')
    ->name('stores');

// Contact
Route::get('kontakt', 'pageController@contact')
    ->name('contact');

// Contact Form Request
Route::post('kontakt', 'pageController@form')
    ->name('contact');

// Newsletter
Route::post('newsletter/subscribe', 'newsletterController@subscribe')->name('newsletter_subscribe');
Route::get('newsletter/unsubscribe={email}', 'newsletterController@unsubscribe')->name('newsletter_unsubscribe');

// Recipes
Route::get('recepty/{tag?}', 'receptController@index')
    ->name('recipes');

// Recipe Detail
Route::get('recepty/{slug}/{id}', 'receptController@show')
    ->where('slug', '[a-zA-Z0-9-]+')
    ->where('id', '[0-9]+')
    ->name('recipe');


/** E-SHOP ROUTING **/

Route::group(['prefix'=>'eshop'], function () {



    /** CATEGORIES / LISTING PRODUCTS **/

    // Default page - list featured products
    Route::get('/', 'categoryController@featured')->name('eshop');

    // Main category definition
    Route::get('{category}/{category_id}', 'categoryController@list')
        ->where('category', '[a-zA-Z0-9-]+')
        ->where('category_id', '[0-9-]+')
        ->name('category');

    // Featured products
    Route::get('oblubene-produkty', 'categoryController@featured')
        ->name('featured');



    /** PRODUCT DETAIL **/

    // Product detail
    Route::get('{category}/{product_slug}/{product_id}', 'productController@show')
        ->where('category','[a-zA-Z0-9-]+')
        ->where('product','[a-zA-Z0-9-]+')
        ->where('product_id','[0-9-]+')
        ->name('product_detail');



	/** 1. SHOPPING CART - CHECKOUT **/

	// Display Cart
	Route::get('cart', 'cartController@index')
        ->middleware('verify.client')
		->name('cart');

	// Add item to Cart
	Route::post('cart', 'cartController@addToCart');

	// Remove Item from the Cart
	Route::get('cart/remove/{rowId}', function ($rowId) {
		Cart::remove($rowId);
        $client = (new App\Client)->get();
        return view('eshop.cart', compact('client'));
	})->name('cart.remove_item');

	// Update Cart Item Quantity
	Route::post('cart/update/{rowId}', function ($rowId) {
		Cart::update($rowId,request('quantity'));
		return redirect()->back();
	})->name('cart.update_quantity');

	// Empty Cart
	Route::get('cart/empty', function () {
		Cart::destroy();
		return view('eshop.cart');
	});



    /** COUPONS **/

	// Activate Discount Coupon
	Route::post('cart/coupon/activate', 'CouponController@activate')
		->name('cart.activate_coupon');

	// Remove Discount Coupon
	Route::get('cart/coupon/remove', 'CouponController@remove')
		->name('cart.remove_coupon');



    /** REGISTRATION DURING CHECKOUT **/

	// Execute Client Registration Form
	Route::post('cart/register', 'clientController@register')
		->name('cart.register');

	// Execute Client Registration Form
	Route::get('cart/register', function() {
		return redirect(route('cart'));
	});



	/** 2. SHIPPING AND PAYMENT METHODS **/

	// Remove Discount Coupon
	Route::get('doprava-a-platba', 'shippingController@index')
		->middleware(['verify.client','verify.cart'])
		->name('eshop.shipping_payment');

	// Store selected methods
	Route::post('doprava-a-platba', 'shippingController@store')
		->middleware(['verify.client','verify.cart']);



	/** 3. CONFIRMATION AND PAYMENT **/

	// View Order and Client Data
	Route::get('sumarizacia-objednavky', 'confirmationController@index')
		->middleware(['verify.client','verify.order'])
		->name('eshop.confirmation');

	// Submit the Order and generate Payment method Gateway if was requested
	Route::post('sumarizacia-objednavky', 'confirmationController@store')
		->middleware(['verify.client','verify.order']);



	/** 4. GREETINGS PAGE **/

	Route::get('dakujeme-za-objednavku', function() {
		return view('eshop.greetings');
	})->name('eshop.greetings');



	/** SEARCH PRODUCTS **/

	// Search products and recipes
	Route::post('vyhladavanie', 'searchController@search')
		->name('search');



	/** REGISTRATION | PROFILE | LOGIN | FORGOTTEN PASSWORD | LOGOUT **/

    /** REGISTRATION **/

    // Registration form
	Route::get('registracia-zakaznika', function() {
		if(Auth::check()) return redirect()->route('login');
		else return view('eshop.register');
	})->name('register');

	// Registration form
	Route::get('registracia-velkoodberatela', function() {
		if(Auth::check()) return redirect()->route('login');
		else return view('eshop.register_seller');
	})->name('register.seller');

	// Submit registration form
	Route::post('registracia-zakaznika', 'registerController@store');

	// Submit Seller registration form
	Route::post('registracia-velkoodberatela', 'registerController@store_seller');



    /** EDITING USER PROFILE **/

	// User profile
	Route::get('profil-uzivatela', function () {
	    $client = (new App\Client)->get();
        return view('eshop.profile', compact('client'));
    })->name('eshop.profile');

	// Update user profile
	Route::post('profil-uzivatela', 'profileController@store');



    /** LOGIN **/

	// Login User form
	Route::get('prihlasenie-uzivatela', function () {
        $client = (new App\Client)->get();
		return view('eshop.login', compact('client'));
	})->name('login');

	// Login User
	Route::post('prihlasenie-uzivatela', 'userController@authenticate');



    /** FORGOTTEN PASSWORD **/

	// Forgotten password
	Route::get('zabudnute-heslo', function () {

        if(Auth::check()) return back()->with('error','Asi ste sa pomýlili. Funkciu vygenerovania nového hesla väčšinou používajú neprihlásení užívatelia.');
		return view('eshop.forgotten_password');
	})->name('eshop.forgotten_password');

	// Confirm generated password
	Route::get('confirm-password/{password}', 'clientController@confirm_password')
        ->where('password','[a-zA-Z0-9-$\/.]+');

	// Reset Client Password
	Route::post('zabudnute-heslo', 'clientController@reset_password');



    /** LOGOUT **/

	// Logout User
	Route::get('odhlasenie', function () {
		Auth::logout();
		return redirect()->route('login');
	})->name('eshop.logout');


});

// Static Page
Route::get('{slug}', 'pageController@index');