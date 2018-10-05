<?php

namespace App\Http\Controllers;

use App\Client;
use Illuminate\Http\Request;
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
        $dataType = Voyager::model('DataType')->where('slug', '=', 'clients')->first();
        $clients = Client::where('temp','0')->orderBy('name')->get();

        return Voyager::view('voyager::clients.index')->with(compact('dataType','clients'));
    }


    /**
     * Show Client Detail
     * @param Request $request
     * @return $this
     */
    public function show(Request $request)
    {
        $client = Client::find($request->client);
        return Voyager::view('voyager::clients.detail')->with(compact('client'));
    }


}
