<?php

namespace App\Http\Controllers;

use App\Address;
use App\Client;
use App\Company;
use App\Http\Requests\RegistrationRequest;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class registerController extends Controller
{

	/**
     * Store standard User
	 * @param Request $request
	 * @return \Illuminate\Http\RedirectResponse
	 */
	public function store(Request $request)
	{

        // Validate personal data fields
        $request->validate([
            'client.name' => 'required|min:5',
            'client.email' => 'required|email|unique:clients,email',
            'client.phone' => 'required|min:10|max:14',
            'client.street' => 'required',
            'client.zip' => 'required',
            'client.city' => 'required',
            'password' => 'required|confirmed|min:6',
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

        // Create Address
        $address = new Address;
        $address->street = $request->address['street'];
        $address->zip = $request->address['zip'];
        $address->city = $request->address['city'];
        $address->country = $request->address['country'];
        $address->save();

        // Create Company
		$company = new Company;
        $company->name = $request->company['name'];
        $company->ico = $request->company['ico'];
        $company->dic = $request->company['dic'];
        $company->icdph = $request->company['icdph'];
        $company->save();

        // Create Client
		$client = new Client;
        $client->address_id = $address->id;
        $client->company_id = $company->id;
        $client->name = $request->client['name'];
        $client->street = $request->client['street'];
        $client->zip = $request->client['zip'];
        $client->city = $request->client['city'];
        $client->email = $request->client['email'];
        $client->phone = $request->client['phone'];
        $client->country = $request->client['country'];
        $client->password = bcrypt($request->password);
        $client->type = '1'; // Default User
        $client->temp = '0';
        $client->approved = '1'; // Allowed to Log In
        $client->save();

		return redirect()->route('login')
			->with('message','Registrácia prebehla úspešne.<br/>Teraz sa môžete prihlásíť');
	}



	/**
     * Store Seller
	 * @param Request $request
	 * @return \Illuminate\Http\RedirectResponse
	 */
	public function store_seller(Request $request)
	{

        // Validate personal data fields
        $request->validate([
            'company.name' => 'required',
            'company.ico' => 'required|min:8|max:8',
            'company.dic' => 'required|min:10',
            'client.email' => 'required|email|unique:clients,email',
            'client.phone' => 'required|min:10|max:14',
            'client.street' => 'required',
            'client.zip' => 'required',
            'client.city' => 'required',
            'password' => 'required|confirmed|min:6',
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

        // Create Address
        $address = new Address;
        $address->street = $request->address['street'];
        $address->zip = $request->address['zip'];
        $address->city = $request->address['city'];
        $address->country = $request->address['country'];
        $address->save();

        // Create Company
		$company = new Company;
        $company->name = $request->company['name'];
        $company->ico = $request->company['ico'];
        $company->dic = $request->company['dic'];
        $company->icdph = $request->company['icdph'];
        $company->save();

        // Create Client
		$client = new Client;
        $client->address_id = $address->id;
        $client->company_id = $company->id;
//        $client->name = $request->company['name'];
        $client->street = $request->client['street'];
        $client->zip = $request->client['zip'];
        $client->city = $request->client['city'];
        $client->email = $request->client['email'];
        $client->phone = $request->client['phone'];
        $client->country = $request->client['country'];
        $client->password = bcrypt($request->password);
        $client->type = '2'; // Seller
        $client->temp = '0';
        $client->save();

		return redirect()->route('login')
			->with('message','Registrácia prebehla úspešne.<br/>Uživateľské kontá so žiadosťou o pridelenie štatútu veľkoodberateľa musia pre aktiváciou prejsť manuálnym schválením našimi administrátormi.<br/>O úspešnom schválení účtu vás budeme kontaktovať e-mailom v priebehu najbližších pracovných dní.');
	}

}
