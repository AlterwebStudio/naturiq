<?php

namespace App\Http\Controllers;

use App\Client;
use TCG\Voyager\Facades\Voyager;

class ClientsController extends Controller
{


    /**
     * List of Clients in Voyager Admin
     * @return $this
     */
    public function index()
    {
        // GET THE DataType based on the slug
        $dataType = Voyager::model('DataType')->where('slug', '=', 'orders')->first();
        $clients = Client::where('temp','0')->orderBy('name');

        return Voyager::view('voyager::clients.index')->with(compact('dataType','clients'));
    }


}
