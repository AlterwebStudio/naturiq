<?php

namespace App\Http\Middleware;

use Closure;
use App\Order;
use App\Client;
use Illuminate\Support\MessageBag;

class VerifyDataAccess
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

		$Order = new Order;
		$order = $Order->get();

		$Client = new Client;
		$client = $Client->get();

		if(!$order or !$client) {

			if(!$order) $msgs[] = 'K vášmu kontu nemáme momentálne priradenú žiadnu objednávku. Začnite prosím v kategórií E-shop.';
			if(!$client) $msgs[] = 'Relácia vášho prihlásenia, resp. existencie dočasného konta vypršala. Začnite prosím v kategórií E-shop.';

			$msgs[] = '<a href="/eshop/prihlasenie-uzivatela" class="btn btn-sm btn-danger mt-3">prihlásiť sa</a> <a href="/eshop" class="btn btn-sm btn-danger mt-3">späť na e-shop</a>';

			$errors = new MessageBag($msgs);
			return redirect(route('cart'))->withErrors($errors);
		}

        return $next($request);
    }
}
