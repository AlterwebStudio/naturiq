<?php

/*
|--------------------------------------------------------------------------
| Admin Routes
|--------------------------------------------------------------------------
|
| Here is where you can register admin routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Admin
Voyager::routes();
Route::group(['middleware' => 'admin'], function () {
//    Route::get('orders', 'OrdersController@index');
    Route::get('orders/{order}', ['uses' => 'OrdersController@show', 'as' => 'voyager.orders.show']);
    Route::post('orders/{order}', ['uses' => 'OrdersController@update']);
});