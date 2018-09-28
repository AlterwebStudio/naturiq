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

Route::group(['prefix' => 'admin'], function () {
	Voyager::routes();
});

Route::get('/', function () {
    return view('home');
});



/** E-SHOP ROUTING **/

Route::group(['prefix'=>'eshop'], function () {

	// Default page - list featured products
	Route::get('/', 'categoryController@featured')->name('eshop');



	/** 1. SHOPPING CART **/

	// Display Cart
	Route::get('kosik', 'cartController@index')
		->name('cart');

	// Add item to Cart
	Route::post('kosik', 'cartController@addToCart');

	// Remove Item from the Cart
	Route::get('kosik/remove/{rowId}', function ($rowId) {
		Cart::remove($rowId);
		return view('eshop.cart');
	})->name('cart.remove_item');

	// Update Cart Item Quantity
	Route::post('kosik/update/{rowId}', function ($rowId) {
		Cart::update($rowId,request('quantity'));
		return redirect()->back();
	})->name('cart.update_quantity');

	// Empty Cart
	Route::get('kosik/empty', function () {
		Cart::destroy();
		return view('eshop.cart');
	});


	// Activate Discount Coupon
	Route::post('cart/coupon/activate', 'CouponController@activate')
		->name('cart.activate_coupon');

	// Remove Discount Coupon
	Route::get('cart/coupon/remove', 'CouponController@remove')
		->name('cart.remove_coupon');


	// Execute Client Registration Form
	Route::post('cart/register', 'cartController@register')
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



	/** CATEGORIES / LISTING PRODUCTS **/

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



	/** LOGIN / LOGOUT / REGISTRATION / AUTHORIZATION **/

	// Registration form
	Route::get('registracia-zakaznika', function() {
		if(Auth::check()) return redirect('/dodacie-udaje');
		else return view('eshop.register');
	});

	// Submit registration form
	Route::post('registracia', 'registerController@store');


	// Update User profile
	Route::resource('profil', 'profileController')
		->only('index','store');


	// Login User form
	Route::get('prihlasenie-uzivatela', function () {
		return view('eshop.login');
	})->name('login');

	// Login User
	Route::post('prihlasenie', 'userController@authenticate');


	// Forgotten password
	Route::get('zabudnute-heslo', function () {
	//	return view('eshop.login');
	})->name('login.forgotten_password');


	// Logout User
	Route::get('odhlasenie', function () {
		Auth::logout();
		return redirect('prihlasenie');
	})->name('eshop.logout');

});