<?php

namespace App\Http\Controllers;

use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Http\Request;
use App\Client;
use App\Product;

class cartController extends Controller
{

	/**
	 * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
	 */
	public function index()
	{
//		session()->forget('client_id');
		return view('eshop.cart');
	}


	/**
	 * @desc Add Product to the Cart
	 * @param $request
	 * @return mixed
	 */
	public function addToCart(Request $request)
	{

		$product = Product::find($request->variant_id);
		$quantity = (isset($request->quantity)) ? $request->quantity : 1;

		Cart::add(
			$product->id,
			$product->name,
			$quantity,
			$product->price,
			[
				'weight' => $product->weight,
				'image' => $product->parent->image
			]
		)->associate('App\Product');

		return view('eshop.cart')->with('message','Tovar bol pridaný do vášho košíka');

	}

	/**
	 * @param Request $request
	 * @return \Illuminate\Http\RedirectResponse
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
				'address.ico' => 'required|min:8|max:8',
				'address.dic' => 'required|min:10',
			]);
		}

		// Update logged user profile info
		if($request->user()) {
			$client = new Client;
			$client = $client->get();

			if($request->company) $client->company()->update($request->company);
			else $client->company()->update(['name'=>'']);

			$client->address()->update($request->address);

			$client->update($request->except('company','address','approve'));
		}

		// Generate client with aditional connections
		$client = new Client;
		$client->generate($request);

		return redirect(route('eshop.shipping_payment'))->withInput();
	}

}
