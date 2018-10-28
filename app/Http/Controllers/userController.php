<?php

namespace App\Http\Controllers;

use App\Client;
use App\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\MessageBag;

class userController extends Controller
{

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
		$credentials['approved'] = '1';

		if (Auth::guard()->attempt($credentials))
		{
		    // If temporary Client created Order before the login,
            // assign Order to the Client to continue with it
		    if(Order::exists()) {
		        $order = (new Order)->get();
		        $order->client_id = Auth::user()->id;
		        $order->save();
            }

			return redirect()->route('login');
		}
		else
		{
		    $error = new MessageBag(['E-mailová adresa, alebo heslo nebolo zadané správne, alebo vaše konto nebolo zatiaľ schválené administrátorom.']);
			return redirect()->back()
				->withErrors($error);
		}
	}

}
