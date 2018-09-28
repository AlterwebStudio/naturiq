<?php

namespace App\Http\Middleware;

use Closure;
use App\Order;
use Illuminate\Support\MessageBag;
use Gloudemans\Shoppingcart\Facades\Cart;

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

			$msgs[] = 'Nebol vytvorený záznam o objednávke. Pokračujte na 2. kroku objednávky - DOPRAVA A PLATBA.';
			$msgs[] = '<a href="/eshop/cart" class="btn btn-sm btn-danger mt-3">späť do košíka</a> <a href="/eshop/doprava-a-platba" class="btn btn-sm btn-danger mt-3">prejsť na dopravu a platbu</a>';

			$errors = new MessageBag($msgs);
			return redirect(route('cart'))->withErrors($errors);
		}

		return $next($request);
	}
}
