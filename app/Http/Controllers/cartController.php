<?php

namespace App\Http\Controllers;

use App\Client;
use App\Order;
use Gloudemans\Shoppingcart\Facades\Cart;
use Illuminate\Http\Request;
use App\Product;
use Illuminate\Support\MessageBag;

class cartController extends Controller
{

    /**
     * @param int $recursive
     * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
     */
	public function index($recursive=0)
	{

	    if(Client::exists()) {

            $client = (new Client)->get();
            return view('eshop.cart', compact('client'));

        } elseif($recursive <= 1) {

	        $recursive++;
            clientController::generate_temp();
            return $this->index($recursive);

        } else {

	        $error = new MessageBag(['Systém nedokázal vygenerovať záznam o zákazníkovi. Kontaktujte nás, prosím.']);
	        return back()->withErrors($error);
        }
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

		if(Client::exists() === false) clientController::generate_temp();
		if(Order::exists() === false) orderController::generate_temp();

		return view('eshop.cart')->with([
		    'message'=>'Tovar bol pridaný do vášho košíka',
            'client'=>(new Client)->get()
        ]);

	}

}
