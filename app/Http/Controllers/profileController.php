<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Client;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class profileController extends Controller
{

	public function index()
	{
	    //
	}

	/**
	 * @param Request $request
	 * @return \Illuminate\Http\RedirectResponse
	 */
	public function store(Request $request)
	{

	    $request->validate([
	        'password' => 'required|confirmed|min:6'
        ]);

		if(Auth::check())
		{

            $client = (new Client)->get();

            if(Hash::check($request->current_password, $client->password)) {

                $password = $request->password;
                $client->password = bcrypt($password);
                $client->save();

                return redirect()->back()
                    ->with('message', 'Údaje boli aktualizované');
            }
            else return back()->with('error','Vaše súčasné heslo sa nezhoduje so zadaným.');

		}
		return redirect()->route('login')->with('error','Údaje sa nepodarilo aktualizovať. Nie ste prihlásený.');
	}

}
