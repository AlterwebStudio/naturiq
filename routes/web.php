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
	Route::get('cart', function () {
		return view('eshop.cart');
	})->name('cart');

	// Add item to Cart
	Route::post('cart', 'cartController@addToCart');

	// Remove Item from the Cart
	Route::get('cart/remove/{rowId}', function ($rowId) {
		Cart::remove($rowId);
		return view('eshop.cart');
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

	// Activate Discount Coupon
	Route::post('cart/coupon/activate', 'CouponController@activate')
		->name('cart.activate_coupon');

	// Remove Discount Coupon
	Route::get('cart/coupon/remove', 'CouponController@remove')
		->name('cart.remove_coupon');

	// Execute Client Registration Form
	Route::post('cart/register', 'cartController@register')
		->name('cart.register');



	/** 2. SHIPPING AND PAYMENT METHODS **/

	// Remove Discount Coupon
	Route::get('doprava-a-platba', 'shippingController@index')
		->name('eshop.shipping_payment');



	/** 3. CONFIRMATION AND PAYMENT **/



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

});



// REGISTRACIA ZAKAZNIKA
Route::get('registracia', function() {
	if(Auth::check()) return redirect('/dodacie-udaje');
	else return view('eshop.register');
});
Route::post('registracia', 'registerController@store');

// DODACIE UDAJE
Route::resource('dodacie-udaje', 'deliveryController')
	->only('index','store');

// DOPRAVA A PLATBA
Route::resource('doprava-a-platba', 'shippingController')
	->only('index','store');

// SUMARIZACIA
Route::resource('sumarizacia', 'confirmationController')
	->only('index','store');

// PROFIL UZIVATELA
Route::resource('profil', 'profileController')
	->only('index','store');

// PRIHLASENIE UZIVATELA
Route::get('prihlasenie', function () {
	return view('eshop.login');
})->name('login');

Route::post('prihlasenie', 'userController@authenticate');

// ODHLASENIE UZIVATELA
Route::get('odhlasenie', function () {
	Auth::logout();
	return redirect('prihlasenie');
});