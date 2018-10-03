<?php

namespace App\Http\Controllers;

use App\City;
use App\Store;
use Illuminate\Http\Request;

class storesController extends Controller
{

    public function index()
    {
        $cities = City::all();
        return view('stores', compact('cities'));
    }

}
