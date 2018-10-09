<?php

namespace App\Http\Controllers;

use \App\Order;
use Illuminate\Http\Request;
use TCG\Voyager\Facades\Voyager;

class OrdersController extends Controller
{


    /**
     * @return $this
     */
    public function index()
    {
        // GET THE DataType based on the slug
        $dataType = Voyager::model('DataType')->where('slug', '=', 'orders')->first();
        $orders = Order::where('status_id','>',1)->where('temp','0');

        return Voyager::view('voyager::orders.index')->with(compact('dataType','orders'));
    }


    /**
     * @param Request $request
     * @param $order_id
     * @return \Illuminate\Http\RedirectResponse
     */
    public function update(Request $request, $order_id)
    {

        $order = Order::find($order_id);
        $order->status_id = $request->status_id;
        $order->save();

        if($request->notify_client == 'yes')
        $this->notify_client($order->client->id, $order->id);

        return redirect()->back()->with(['message' => "Stav objednávky bol zmenený!", 'alert-type' => 'success']);

    }

	/**
	 * Notify Admin about Registration of Seller by Mail
	 * @param $client_id
	 * @param $order_id
	 */
	public static function notify_client($client_id,$order_id)
	{
		$client = (new \App\Client)->find($client_id);
		$client->notify( new \App\Notifications\OrderStatusChanged($order_id) );
	}


    /**
     * @param Request $request
     * @return $this
     */
    public function show(Request $request)
    {
        $order = Order::find($request->order);
        return Voyager::view('voyager::orders.detail')->with(compact('order'));
    }

}
