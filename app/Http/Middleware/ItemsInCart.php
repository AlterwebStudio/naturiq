<?php

namespace App\Http\Middleware;

use Closure;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Support\MessageBag;

class ItemsInCart
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

		if(Cart::content()->count() == 0) {

			$msgs[] = 'Váš košík neobsahuje žiaden tovar. Vráťte sa prosím späť na E-shop a vložte do košíka niektorý z našich produktov.';
			$msgs[] = '<a href="'.route('login').'" class="btn btn-sm btn-danger mt-3">prihlásiť sa</a> <a href="'.route('eshop').'" class="btn btn-sm btn-danger mt-3">späť na E-shop</a>';

			$errors = new MessageBag($msgs);
			return redirect()->route('cart')->withErrors($errors);
		}

		return $next($request);
	}
}
