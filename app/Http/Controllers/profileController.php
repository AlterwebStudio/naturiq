<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Client;
use Illuminate\Support\Facades\Auth;

class profileController extends Controller
{

	/**
	 * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
	 */
	public function index()
	{
		if(Auth::check()) {
			$client_id = Auth::user()->id;
			$client_data = Client::find($client_id);
			return view('eshop.profile')->with('client',$client_data);
		} else {
			return view('eshop.login')->with('message','Nie ste prihlásený');
		}
	}

	/**
	 * @param Request $request
	 * @return \Illuminate\Http\RedirectResponse
	 */
	public function store(Request $request)
	{

		if(Auth::check()) {
			$client_id = Auth::user()->id;

			Client::find($client_id)->company()->update($request->company);
			Client::find($client_id)->address()->update($request->address);
			Client::find($client_id)->update($request->except('company','address','approve'));

			return redirect()->back()
				->withInput()
				->with('message','Údaje boli aktualizované');

		}
	}

}
