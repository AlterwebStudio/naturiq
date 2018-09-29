<?php

namespace App\Http\Controllers;

use App\Client;
use App\Order;
use Illuminate\Http\Request;

class orderController extends Controller
{

    /**
     * Generate temporary Client with no profile details
     * @return bool
     */
    public static function generate_temp()
    {

        if(Client::exists()) {

            $order = new Order;
            $order->client_id = Client::id();
            $order->save();

            // Store the Client in the Session
            if ($order->id) {
                session([
                    'order_id' => $order->id
                ]);
                if (session()->has('order_id')) return true;
            }
        }

        return false;

    }
    
}
