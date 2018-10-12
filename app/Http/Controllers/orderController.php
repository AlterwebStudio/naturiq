<?php

namespace App\Http\Controllers;

use App\Client;
use App\Order;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class orderController extends Controller
{

    /**
     * Generate empty temporary Order
     * @return bool
     */
    public static function generate_temp()
    {

    	// At least temporary Client has to exist
        if(Client::exists()) {

        	// Generate new Order and store in DB
            $order = new Order;
            $order->client_id = Client::id();
            $order->save();

            // Store the Order into the Session
            if ($order->id) {
                session([
                    'order_id' => $order->id
                ]);
                if (session()->has('order_id')) return true;
            }
        }

        return false;

    }


	/**
	 * Show Client Order Detail
	 * @param Request $request
	 * @return \Illuminate\Contracts\View\Factory|\Illuminate\Http\RedirectResponse|\Illuminate\View\View
	 */
	public function show(Request $request)
	{
		$order = Order::where('number',$request->number)->first();
		if(Auth::user()->id == $order->client_id) {
			return view('eshop.order', compact('order'));
		} else return redirect()->back()->with('error','Nemáte oprávnenie na zobrazenie cudzej objednávky');
	}


	public function reorder(Request $request)
	{
		$order = Order::where('number',$request->number)->first();
		foreach($order->items->content as $item)
		{
			(new cartController)->addItemToCart(
				$item->id,
				$item->name,
				$item->qty,
				$item->price,
				$item->options->toArray()
			);
		}
		return redirect()->route('cart')->with('message','Položky predchádzajúcej objednávky boli pridané do vášho aktuálneho košíka');

	}
    
}
