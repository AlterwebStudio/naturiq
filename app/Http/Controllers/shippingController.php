<?php

namespace App\Http\Controllers;

use App\Client;
use App\Order;
use App\Payment;
use App\Shipping;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\MessageBag;

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

		if(Client::exists() and Order::exists())
		{

		    // Set Temporary Client as regular user
			$client = (new Client)->get();
            $client->temp = '0';
            $client->save();

            // Store shipping and payment method choices in DB
            $order = (new Order)->get();

            // Shipping definitions
            $shipping = Shipping::findOrFail($request->shipping_id);
			$order->shipping_id = $request->shipping_id;
			$order->shipping_price = $shipping->price;
			session(['shipping_id'=>$shipping->id]);

			// Payment definitions
            $payment = Payment::findOrFail($request->payment_id);
			$order->payment_id = $request->payment_id;
			$order->payment_price = $payment->price;
            session(['payment_id'=>$payment->id]);

            // Save changes in DB
			$order->save();

			// Destroy Others Shopping Cart Instance
			Cart::instance('others')->destroy();


			// Store shipping in Shopping Cart
            Cart::instance('others')->add(
                $shipping->id,
                $shipping->name,
                1,
                $shipping->price,
                [
                    'desc' => $shipping->description,
                    'image' => ''
                ]
            )->associate('App\Shipping');

            // Store payment in Shopping Cart
            Cart::instance('others')->add(
                $payment->id,
                $payment->name,
                1,
                $payment->price,
                [
                    'desc' => $payment->description,
                    'image' => ''
                ]
            )->associate('App\Payment');


			// Store Order ID in session
            // In case the row was just created
			session([
			    'order_id'=>$order->id
            ]);


			return redirect()->route('eshop.confirmation');
		}

		$error = new MessageBag(['Neexistuje ID užívateľa, alebo objednávky. V procese objednávky nie je možné pokračovať. Kontaktujte prosím administrátora.']);
		return back()->withErrors($error);

	}

}
