<?php

namespace App\Http\Controllers;

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

		$order = new Order;

		$request->validate([
			'shipping_id' => 'required',
			'payment_id' => 'required'
		]);

		if(Auth::check())
		{
			$client_id = Auth::user()->id;
			$order->updateOrCreate(
				['client_id' => $client_id, 'status_id' => 0],
				[
					'shipping_id' => $request->shipping_id,
					'shipping_price' => Shipping::find($request->payment_id)->price,
					'payment_id' => $request->payment_id,
					'payment_price' => Payment::find($request->payment_id)->price,
				]
			);

			return redirect('/sumarizacia');
		}

	}

}
