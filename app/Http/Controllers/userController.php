<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class userController extends Controller
{
	/**
	 * Create a new controller instance.
	 *
	 * @return void
	 */
	public function __construct()
	{
		//$this->middleware('auth');
	}

	/**
	 * Handle an authentication attempt.
	 *
	 * @param  \Illuminate\Http\Request $request
	 *
	 * @return Response
	 */
	public function authenticate(Request $request)
	{
		$credentials = $request->only('email', 'password');

		if (Auth::attempt($credentials))
		{
			return redirect()->back();
		}
		else
		{
			return redirect()->back()
				->with('warning', 'E-mailová adresa, ktorú ste zadali sa nezhoduje s heslom zadaným pri registrácií');
		}
	}

}
