<?php

namespace App\Http\Controllers;

use App\Recept;
use Illuminate\Http\Request;

class receptController extends Controller
{

    public function index($tag=null)
    {

        if($tag) {
            $recepts = Recept::paginate(8);
        } else {
            $recepts = Recept::paginate(8);
        }

        return view('recipes',compact('recepts'));
    }

}
