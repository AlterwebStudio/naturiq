<?php

namespace App\Http\Controllers;

use App\Mail\ResetPasswordNotification;
use App\Order;
use Auth;
use App\Client;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;

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
        if ($request->address) {
            $request->validate([
                'address.street' => 'required',
                'address.zip' => 'required',
                'address.city' => 'required',
                'address.country' => 'required',
            ]);
        }

        // Validate company fields if were submitted
        if ($request->company) {
            $request->validate([
                'company.name' => 'required',
                'company.ico' => 'required|min:8|max:8',
                'company.dic' => 'required|min:10',
            ]);
        }

        if (Client::exists()) {

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
        if ($client->id) {
            session([
                'client_id' => $client->id
            ]);
            if (session()->has('client_id')) return true;
        }

        if (Order::exists()) {
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

        if ($request->address) {
            $address = $request->address;
            $address['use'] = '1';
        } else $address['use'] = '0';

        $client->address()->update($address);

        if ($request->company) {
            $company = $request->company;
            $company['use'] = '1';
        } else $company['use'] = '0';

        $client->company()->update($company);

        $client->update($request->input('client'));

        return true;
    }


    /**
     * Reset Client Password and send
     * generated to the client's E-mail address
     * @param Request $request
     * @return \Illuminate\Http\RedirectResponse
     */
    public function reset_password(Request $request)
    {
        $request->validate([
            'email' => 'required|email'
        ]);

        if(Client::exists()) $client = (new Client)->get();
        else $client = Client::where('email', $request->email)->where('temp','0')->first();

        if($client)
        {
            $password = str_random(8);
            $password_hash = Hash::make($password);

            $credentials['login'] = $client->email;
            $credentials['password'] = $password;
            $credentials['password_hash'] = $password_hash;

            $client->password_reset = $password_hash;
            $client->save(); // Store the hashed password in db to compare it with confirmation link

            Mail::to($client->email)->send( new ResetPasswordNotification($credentials) ); // Send mail to the Client
            return back()->with('message','Potvrdzovací e-mail bol práve odoslaný na e-mailovú adresu<br/><b>'.$client->email.'</b>');

        }
        else return back()->with('error','Zadaná e-mailová adresa v našom systéme nefiguruje.');

    }

    /**
     * Confirm generated password
     * Compare hashed password stored in db during reseting with
     * that one came in GET request from confirmation button link in Mail
     * @param $password_hash
     * @return \Illuminate\Http\RedirectResponse
     */
    public function confirm_password($password_hash)
    {
        $client = Client::where('password_reset',$password_hash)->first();
        if($client) {
            $client->password = $password_hash;
            $client->password_reset = '';
            $client->save();
            return redirect()->route('login')->with('message','Vaše heslo bolo zmenené. Môžete sa prihlásiť použitím nových údajov.');
        }
        return back()->with('error','Heslo sa nepodarilo zmeniť. Kontrolné reťazce sa nezhodujú.');
    }

}
