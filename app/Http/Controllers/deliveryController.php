<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Client;
use Illuminate\Support\Facades\Auth;

class deliveryController extends Controller
{

	/**
	 * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
	 */
	public function index()
	{
		if(Auth::check()) {
			$client_id = Auth::user()->id;
			$client_data = Client::find($client_id);
			return view('eshop.delivery')->with('client',$client_data);
		}
		return view('eshop.register');
	}

	/**
	 * @param Request $request
	 * @return \Illuminate\Http\RedirectResponse
	 */
	public function store(Request $request)
	{

		$request->validate([
			'name' => 'required|max:64',
			'street' => 'required|max:64',
			'zip' => 'required|max:8',
			'city' => 'required|max:32',
			'phone' => 'required|max:16',
			'approve.conditions' => 'accepted'
		]);

		if(Auth::check())
		{
			$client_id = Auth::user()->id;
			$client = Client::find($client_id);

			$client->company()->update($request->company);
			$client->address()->update($request->address);
			$client->update($request->except('company','address','approve'));

			return redirect('doprava-a-platba');
		}
	}

}
