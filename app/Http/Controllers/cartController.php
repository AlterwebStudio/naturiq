<?php

namespace App\Http\Controllers;

use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Http\Request;
use App\Product;

class cartController extends Controller
{

	/**
	 * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
	 */
	public function index()
	{
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

		$clientController = new clientController;
		$clientController->register($request);

		return redirect(route('eshop.shipping_payment'))->withInput();
	}

}
