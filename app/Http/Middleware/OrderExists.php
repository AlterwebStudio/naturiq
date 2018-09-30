<?php

namespace App\Http\Middleware;

use Closure;
use App\Order;
use Illuminate\Support\MessageBag;
use Gloudemans\Shoppingcart\Facades\Cart;
use App\Http\Controllers\orderController;

class OrderExists
{
	/**
	 * Handle an incoming request.
	 *
	 * @param  \Illuminate\Http\Request  $request
	 * @param  \Closure  $next
	 * @return mixed
	 */
	public function handle($request, Closure $next)
	{

		if(Cart::content()->count() == 0 or Order::exists() === false) {

		    if( Order::exists() === false ) {
		        orderController::generate_temp();
		        return redirect()->back();
            }

			$msgs[] = 'Košík neobsahuje žiaden tovar :( Môžete to napraviť v kategórií E-shop.';
			$msgs[] = '<a href="'.route('eshop.cart').'" class="btn btn-sm btn-danger mt-3">späť do košíka</a> <a href="'.route('eshop').'" class="btn btn-sm btn-danger mt-3">prejsť na E-shop</a>';

			$errors = new MessageBag($msgs);
			return redirect(route('cart'))->withErrors($errors);
		}

		return $next($request);
	}
}
