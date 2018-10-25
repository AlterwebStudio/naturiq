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
	 * Generate Temporary Client and Order if it does not exist yet
	 *
	 * Every Visitor has to own at least temporary account to
	 * accomplish the Order. Client is automaticaly moved
	 * from Temp to Real after Order is successfuly sent
	 * or is deleted if Temp status will not change
	 * for more than 24 hours.
	 */
	public function __construct()
	{
		if(Client::exists() === false) clientController::generate_temp();
		if(Order::exists() === false) orderController::generate_temp();
	}


	/**
	 * Show Shopping Cart Content to the User
	 *
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
	 * Buy Product - Add it to the Cart
	 *
	 * @desc Add Product to the Cart
	 * @param $request
	 * @return mixed
	 */
	public function buy(Request $request)
	{

		$product = Product::find($request->variant_id);
		$quantity = (isset($request->quantity)) ? $request->quantity : 1;

		$this->addItemToCart(
			$product->id,
			$product->parent->name,
			$quantity,
			$product->price,
			[
				'weight' => $product->weight,
				'image' => $product->parent->image
			]
		);

		return view('eshop.cart')->with([
		    'message'=>'Tovar bol pridaný do vášho košíka',
            'client'=>(new Client)->get()
        ]);

	}


	/**
	 * Add Single Item to the Shopping Cart
	 *
	 * @param $id
	 * @param $name
	 * @param $quantity
	 * @param $price
	 * @param null $options
	 * @return \Gloudemans\Shoppingcart\CartItem
	 */
	public function addItemToCart($id, $name, $quantity, $price, $options=null)
	{
		return Cart::add(
			$id,
			$name,
			$quantity,
			$price,
			$options
		)->associate('App\Product');
	}

}
