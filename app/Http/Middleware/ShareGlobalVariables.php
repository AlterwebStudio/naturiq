<?php

namespace App\Http\Middleware;

use Closure;

class ShareGlobalVariables
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
		$benefits = \App\Benefit::orderBy('order')->get();
    	view()->share('benefits',$benefits);
        return $next($request);
    }
}
