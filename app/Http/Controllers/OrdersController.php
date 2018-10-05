<?php

namespace App\Http\Controllers;

use \App\Order;
use Auth;
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

//        dd(auth()->guard('admin')->user());

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

        return redirect()->back()->with(['message' => "Stav objednávky bol zmenený!", 'alert-type' => 'success']);

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
