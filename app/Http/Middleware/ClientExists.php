<?php

namespace App\Http\Middleware;

use Closure;
use App\Client;
use Illuminate\Support\MessageBag;

class ClientExists
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

		if(Client::exists() === false) {

			$msgs[] = 'Relácia vášho prihlásenia, resp. existencie dočasného konta vypršala.';
			$msgs[] = '<a href="/eshop/prihlasenie-uzivatela" class="btn btn-sm btn-danger mt-3">prihlásiť sa</a> <a href="/eshop" class="btn btn-sm btn-danger mt-3">späť na e-shop</a>';

			$errors = new MessageBag($msgs);
			return redirect(route('cart'))->withErrors($errors);
		}

        return $next($request);
    }
}
