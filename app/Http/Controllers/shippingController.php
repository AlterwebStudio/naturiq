<?php

namespace App\Http\Controllers;

use App\Client;
use App\Order;
use App\Payment;
use App\Shipping;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class shippingController extends Controller
{

	/**
	 * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
	 */
	public function index()
	{
		$shippings = Shipping::orderBy('order','asc')->get();
		$payments = Payment::orderBy('order','asc')->get();

		return view('eshop.shipping')
			->with('shippings', $shippings)
			->with('payments', $payments);
	}

	/**
	 * @param Request $request
	 * @return \Illuminate\Http\RedirectResponse
	 */
	public function store(Request $request)
	{

		$request->validate([
			'shipping_id' => 'required',
			'payment_id' => 'required'
		]);

		if(Client::exists())
		{
		    // Set Client as regular user / not temporary
			$client = (new Client)->get();
            $client->temp = '0';
            $client->save();

            // Update Order
            $order = (new Order)->get();
			$order->shipping_id = $request->shipping_id;
			$order->shipping_price = Shipping::findOrFail($request->shipping_id)->price;

			$order->payment_id = $request->payment_id;
			$order->payment_price = Payment::findOrFail($request->payment_id)->price;

			$order->save();

			// Store the order in the session
			session([
			    'order_id'=>$order->id
            ]);

			return redirect(route('eshop.confirmation'));
		}

	}

}
