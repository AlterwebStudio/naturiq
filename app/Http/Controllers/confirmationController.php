<?php

namespace App\Http\Controllers;

use App\Order;
use Illuminate\Http\Request;

class confirmationController extends Controller
{

	/**
	 * @return \Illuminate\Contracts\View\Factory|\Illuminate\View\View
	 */
	public function index()
	{
		$params = [];

		$Order = new Order;
		$order = $Order->get();

		if(is_null($order)) $params['warning'] = 'Objednávka neexistuje, <a href="/prihlasenie">prihláste sa prosím</a>.';

		$params['order'] = $order;
		$params['shipping'] = $order->shipping;
		$params['payment'] = $order->payment;
		$params['total'] = $order->total();

		return view('eshop.confirmation')->with($params);
	}

}
