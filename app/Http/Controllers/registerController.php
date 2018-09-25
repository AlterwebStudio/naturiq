<?php

namespace App\Http\Controllers;

use App\Http\Requests\RegistrationRequest;
use Illuminate\Support\Facades\DB;

class registerController extends Controller
{

	/**
	 * @param RegistrationRequest $request
	 * @return \Illuminate\Http\RedirectResponse
	 */
	public function store(RegistrationRequest $request)
	{

		$company_id = DB::table('companies')->insertGetId([
			'name' => $request->company['name'],
			'ico' => $request->company['ico'],
			'dic' => $request->company['dic'],
			'icdph' => $request->company['icdph'],
		]);

		$address_id = DB::table('addresses')->insertGetId([
			'name' => $request->address['name'],
			'street' => $request->address['street'],
			'zip' => $request->address['zip'],
			'city' => $request->address['city'],
			'country_id' => 1,
		]);

		DB::table('clients')->insert([
			'address_id' => $address_id,
			'company_id' => $company_id,
			'name' => $request->name,
			'street' => $request->street,
			'zip' => $request->zip,
			'city' => $request->city,
			'email' => $request->email,
			'phone' => $request->phone,
			'country_id' => 1,
			'password' => bcrypt($request->newPassword),
		]);

		return redirect()->back()
			->with('message','OK');
	}

}
