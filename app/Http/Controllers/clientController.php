<?php

namespace App\Http\Controllers;

use App\Order;
use Auth;
use App\Client;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

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
			'client.email' => 'required|email', //|unique:clients,email
			'client.phone' => 'required|min:10|max:14',
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

		if(Client::exists()) {

            // User is logged in so update his profile
			$this->update($request);

		}

		return redirect()->route('eshop.shipping_payment');
	}


    /**
     * Generate temporary Client with no profile details
     * @return bool
     */
    public static function generate_temp()
    {

        $client = new Client;

        $client->address_id = DB::table('addresses')->insertGetId([]);
        $client->company_id = DB::table('companies')->insertGetId([]);

        $client->save();

        // Store the Client in the Session
        if($client->id) {
            session([
                'client_id' => $client->id
            ]);
            if(session()->has('client_id')) return true;
        }

        if(Order::exists()) {
            $order = (new Order)->get();
            $order->client_id = $client->id;
            $order->save();
        }

        return false;

    }


	/**
	 * @desc Update user profile or temporary client data
	 * @param Request $request
	 * @return bool
	 */
	private function update(Request $request)
	{
		$client = (new Client)->get();

        if($request->address) {
            $address = $request->address;
            $address['use'] = '1';
        } else $address['use'] = '0';

        $client->address()->update($address);

        if($request->company) {
            $company = $request->company;
            $company['use'] = '1';
        } else $company['use'] = '0';

		$client->company()->update($company);

		$client->update($request->input('client'));

		return true;
	}}
