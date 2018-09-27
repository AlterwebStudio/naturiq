<?php

namespace App\Http\Controllers;

use App\Client;
use Illuminate\Http\Request;

class clientController extends Controller
{


	/**
	 * @param Request $request
	 * @return bool
	 */
	public function register(Request $request)
	{

		// Validate personal data fields
		$request->validate([
			'client.name' => 'required|min:5',
			'client.email' => 'required|email',
			'client.phone' => 'required|numeric',
			'client.street' => 'required',
			'client.zip' => 'required',
			'client.city' => 'required',
		]);

		// Validate delivery address fields if were submitted
		if($request->address) {
			$request->validate([
				'address.street' => 'required',
				'address.zip' => 'required',
				'address.city' => 'required',
				'address.country' => 'required',
			]);
		}

		// Validate company fields if were submitted
		if($request->company) {
			$request->validate([
				'company.name' => 'required',
				'company.ico' => 'required|min:8|max:8',
				'company.dic' => 'required|min:10',
			]);
		}

		// User is logged in so update his profile
		if($request->user()) {

			$this->update($request);

		} else {

			// Generate client with aditional connections
			$client = new Client;
			$client->generate($request);
		}

		return true;
	}


	/**
	 * @desc Update user profile or temporary client data
	 * @param Request $request
	 * @return bool
	 */
	private function update(Request $request)
	{
		$client = new Client;
		$client = $client->get();

		if($request->company) $client->company()->update($request->company);
		else $client->company()->update([
			'name'=>'',
			'ico'=>'',
			'dic'=>'',
			'icdph'=>'',
		]);

		if($request->address) $client->address()->update($request->address);
		else $client->address()->update([
			'street'=>'',
			'zip'=>'',
			'city'=>'',
			'country'=>'',
		]);

		$client->update($request->input('client'));

		return true;
	}}
